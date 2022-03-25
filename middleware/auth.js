const jwt = require('jsonwebtoken');
const db = require('../config/connection');

const middlewareUsers = {
   authenticationUser : (req, res, next) => {
      try {
         let token = req.header("Authorization");

         if(!token) return res.status(500).json({status : false, message : "Not Authorization"});

         jwt.verify(token, 'RAHASIA', (err, user) => {
            if(err) return res.status(500).json({status : false, message : "Not Authorization"});

            req.user = user;
            next();
         });
      } catch (error) {
         console.log(error);
      }
   }
};

module.exports = middlewareUsers;