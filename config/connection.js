var mysql2 = require("mysql2");

var connection = mysql2.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "ideamart",
    connectionLimit: 10000,
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("database connected");
});

module.exports = connection;