const config = require('config.json');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const db = require('_helpers/db');

module.exports = {
    authenticate,
    getAll,
    getByUsername,
    getById,
    create,
    update,
    delete: _delete
};

async function authenticate({ username, password }) {
    const user = await db.User.scope('withPassword').findOne({ where: { username } });

    if (!user)
        throw 'Username salah';
    if (!(await bcrypt.compare(password, user.password)))
        throw 'Password salah';
    // authentication successful
    const Token = jwt.sign({ sub: user.id }, config.secret, { expiresIn: '7d' });
    const Username = user.username;
    const Login_type = user.login_type;
    return { Username, Login_type, Token };
}

async function getAll() {
    return await db.User.findAll();
}

async function getById(id) {
    return await getUser(id);
}

async function getByUsername(username) {
    return await getUsername(username);
}

async function create(params) {
    // validate
    if (await db.User.findOne({ where: { username: params.username } })) {
        throw 'Username "' + params.username + '" is already taken';
    }

    // hash password
    if (params.password) {
        params.hash = await bcrypt.hash(params.password, 10);
        params.password = params.hash;
    }

    // save user
    await db.User.create(params);
}

async function update(username, params) {
    const user = await getUsername(username);

    // validate
    const usernameChanged = params.username && user.username !== params.username;
    if (usernameChanged && await db.User.findOne({ where: { username: params.username } })) {
        throw 'Username "' + params.username + '" Telah ada yang menggunakan';
    }

    // hash password if it was entered
    if (params.password) {
        params.hash = await bcrypt.hash(params.password, 10);
    }

    // copy params to user and save
    Object.assign(user, params);
    await user.save();

    return omitHash(user.get());
}

async function _delete(username) {
    const user = await getUsername(username);
    await user.destroy();
}

// helper functions

async function getUser(id) {
    const user = await db.User.findByPk(id);
    if (!user) throw 'User not found';
    return user;
}

async function getUsername(username){
    const user = await db.User.findOne({
        where: {
            username: username, 
        },
    })
    if (!user) throw 'User not found';
    return user;
}

function omitHash(user) {
    const { password, ...userWithoutPassword } = user;
    return userWithoutPassword;
}