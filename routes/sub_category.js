const express = require("express");
const route = express.Router();


const subcategoryController = require("../controllers/sub_category");
const authUser = require("../middleware/auth");

route.post("/createSubcategory", authUser.authenticationUser, subcategoryController.createSubcategory);
route.put("/updateSubcategory", authUser.authenticationUser, subcategoryController.updateSubcategory);


module.exports = route;