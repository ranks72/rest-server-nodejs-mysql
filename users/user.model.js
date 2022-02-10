const { DataTypes } = require('sequelize');

module.exports = model;

function model(sequelize) {
    const attributes = {
        first_name: { type: DataTypes.STRING, allowNull: false },
        last_name: { type: DataTypes.STRING, allowNull: false },
        phone: { type: DataTypes.STRING, allowNull: true },
        email: { type: DataTypes.STRING, allowNull: true },
        password: { type: DataTypes.STRING, allowNull: false },
        username: { type: DataTypes.TEXT, allowNull: false },
        login_type: { type: DataTypes.STRING, allowNull: false },
        //hash: { type: DataTypes.STRING, allowNull: false }
    };

    const options = {
        defaultScope: {
            // exclude hash by default
            attributes: { exclude: ['password'] }
        },
        scopes: {
            // include hash with this scope
            withPassword: { attributes: {}, }
        }
    };

    return sequelize.define('users', attributes, options);
}