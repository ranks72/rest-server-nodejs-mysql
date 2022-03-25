const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: 'uploads/profile_picture',
    filename: function(req, file, cb) {
        cb(null, Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage }).single('profile_picture');

module.exports = upload;