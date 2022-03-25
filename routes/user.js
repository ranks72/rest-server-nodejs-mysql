const express = require("express");
const route = express.Router();


const userController = require("../controllers/user");
const authUser = require("../middleware/auth");
const uploadSingleImage = require("../middleware/multer");


route.post("/register", userController.register);
route.post("/login", userController.login);
route.put("/update", authUser.authenticationUser, userController.updateUser);


module.exports = route;