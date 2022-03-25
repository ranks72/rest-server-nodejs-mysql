const db = require("../config/connection");

const categoryControllers = {

    createCategory: async(req, res) => {
        try {
            const { category } = req.body;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');
            var sql = `INSERT INTO category(category, createdAt, updatedAt)
                    VALUES("${category}", "${dateTimeNow}", "${dateTimeNow}")`;

            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: err.message });

                res.status(200).json({
                    status: true,
                    message: "Create Category Success"
                });
            });
        } catch (error) {
            return res.status(500).json({ msg: error.message });
        }
    },

    updateCategory: async(req, res) => {
        try {
            const { id, category } = req.body;
            var sql = `SELECT * FROM category WHERE id = "${id}"`;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');

            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: err.message });

                if (req.file == undefined) {
                    var sql = `UPDATE category SET category="${category}", createdAt="${dateTimeNow}", updatedAt="${dateTimeNow}" WHERE id="${id}"`;
                    db.query(sql, (err, result) => {
                        if (err) return res.status(500).json({ status: false, message: err.message });

                        res.status(200).json({
                            status: true,
                            message: "Update Category Success"
                        });
                    });
                } else {
                    var sql = `UPDATE category SET category="${category}", createdAt="${dateTimeNow}", updatedAt="${dateTimeNow}" WHERE id="${id}"`;
                    db.query(sql, (err, result) => {
                        if (err) return res.status(500).json({ status: false, message: err.message });
                        res.status(200).json({
                            status: true,
                            message: "Update Category Success"
                        });
                    });
                }
            });
        } catch (error) {
            return res.status(500).json({ status: false, message: error.message });
        }
    }
}

module.exports = categoryControllers;