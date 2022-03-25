const db = require("../config/connection");

const questionControllers = {

    createQuestion: async(req, res) => {
        try {
            const {} = req.body;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');
            var sql = `INSERT INTO sub_cat(sub_cat, createdAt, updatedAt)
                    VALUES("${sub_cat}", "${dateTimeNow}", "${dateTimeNow}")`;

            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: err.message });

                res.status(200).json({
                    status: true,
                    message: "Create Sub Category Success"
                });
            });
        } catch (error) {
            return res.status(500).json({ msg: error.message });
        }
    },

    //belum diedit lagi
    updateQuestion: async(req, res) => {
        try {
            const { id, question } = req.body;
            var sql = `SELECT question FROM questions WHERE id = "${id}"`;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');

            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: err.message });

                if (req.file == undefined) {
                    var sql = `UPDATE sub_cat SET sub_cat="${sub_cat}", createdAt="${dateTimeNow}", updatedAt="${dateTimeNow}" WHERE id="${id}"`;
                    db.query(sql, (err, result) => {
                        if (err) return res.status(500).json({ status: false, message: err.message });

                        res.status(200).json({
                            status: true,
                            message: "Update Sub Category Success"
                        });
                    });
                } else {
                    var sql = `UPDATE sub_cat SET sub_cat="${sub_cat}", createdAt="${dateTimeNow}", updatedAt="${dateTimeNow}" WHERE id="${id}"`;
                    db.query(sql, (err, result) => {
                        if (err) return res.status(500).json({ status: false, message: err.message });
                        res.status(200).json({
                            status: true,
                            message: "Update Sub Category Success"
                        });
                    });
                }
            });
        } catch (error) {
            return res.status(500).json({ status: false, message: error.message });
        }
    },

    selectMenuQuestion1: async(req, res) => {
        try {
            const { question } = req.body
            var sql = `Select question from questions left join sub_cat on sub_cat.id= questions.sub_cat_id where questions.sub_cat_id= 1`;
            var dateTimeNow = new Date().toISOString().slice(0, 19).replace('T', ' ');
            db.query(sql, (err, result) => {
                if (err) return res.status(500).json({ status: false, message: err.message });
            });
        } catch (error) {

        }
    }
}

module.exports = subcategoryControllers;