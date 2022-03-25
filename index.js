require('dotenv').config();

const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const userRoutes = require('./routes/user');
const categoryRoutes = require('./routes/category');
const subcategoryRoutes = require('./routes/sub_category');

const app = express();
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/api/v1/user", userRoutes);
app.use("/api/v1/category", categoryRoutes);
app.use("/api/v1/subcategory", subcategoryRoutes);
app.use('/uploads/profile_picture', express.static('uploads/profile_picture'));
const port = process.env.NODE_ENV === 'production' ? (process.env.PORT || 80) : 4000;
app.listen(port, () => console.log('Server listening on port ' + port));