const db = require("../config/connection");
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const fs = require('fs-extra');
//const path = require('path');

const userControllers = {

    register: async(req, res) => {
        try {
            const { first_name, last_name, username, password } = req.body;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');
            const passwordHash = await bcrypt.hash(password, 10);
            const user = await db.query(`SELECT * FROM users WHERE username= "${username}"`, [username]);
            if (user.rows.length !== 0) {
                res.status(409).json({
                    error: "Sorry! An account with that username already exists!",
                });
            }
            var sql = `INSERT INTO users(first_name, last_name, username, password, createdAt, updatedAt)
                    VALUES("${first_name}", "${last_name}", "${user}", "${passwordHash}", "${dateTimeNow}", "${dateTimeNow}")`;

            db.query(sql, (err, result) => {
                if (err) {
                    return res.status(500).json({ status: false, message: err.message });
                } else {
                    res.status(200).json({
                        status: true,
                        message: "Register Success"
                    });
                }
            });
        } catch (error) {
            return res.status(500).json({ msg: error.message });
        }
    },

    login: async(req, res) => {
        try {
            const { username, password } = req.body;

            var sql = `SELECT * FROM users WHERE username = "${username}"`;

            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: "Server Error" });

                if (result.length == 0) return res.status(500).json({ status: false, message: "Sorry Your Username not found" });

                bcrypt.compare(password, result[0]['password'])
                    .then((isTrue) => {
                        if (!isTrue) return res.status(500).json({ status: false, message: "Your Password Wrong" });
                        const token = jwt.sign({ id: result[0]['id'] }, "RAHASIA", { expiresIn: '1d' });
                        return res.status(200).json({
                            status: true,
                            message: "Login Success",
                            id: result[0]['id'],
                            first_name: result[0]['first_name'],
                            last_name: result[0]['last_name'],
                            username: result[0]['username'],
                            login_type: result[0][`login_type`],
                            token: token
                        });
                    })
            });

        } catch (error) {
            return res.status(500).json({ status: false, message: error.message });
        }
    },
    //lupa password


    //
    updateUser: async(req, res) => {
        try {
            // const {profile_picture} = req.file.path;
            // const {id} = req.body;
            const { id, first_name, last_name, phone, email, password, username, job_desc } = req.body;
            var sql = `SELECT * FROM users WHERE id = "${id}"`;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');

            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: err.message });
                //console.log(result[0]['profile_picture'])

                if (req.file == undefined) {
                    var sql = `UPDATE users SET first_name="${first_name}", last_name="${last_name}", phone="${phone}", email="${email}", password="${password}",username="${username}",
                         job_desc="${job_desc}", createdAt ="${dateTimeNow}", updatedAt ="${dateTimeNow}" WHERE id="${id}"`;
                    db.query(sql, (err, result) => {
                        if (err) return res.status(500).json({ status: false, message: err.message });

                        res.status(200).json({
                            status: true,
                            message: "Update User Success"
                        });
                    });
                }
            });

        } catch (error) {
            return res.status(500).json({ status: false, message: error.message });
        }
    }
}

module.exports = userControllers;