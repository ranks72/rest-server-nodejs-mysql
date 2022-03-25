const express = require("express");
const route = express.Router();


const categoryController = require("../controllers/category");
const authUser = require("../middleware/auth");

route.post("/createCategory", authUser.authenticationUser, categoryController.createCategory);
route.put("/updateCategory", authUser.authenticationUser, categoryController.updateCategory);


module.exports = route;