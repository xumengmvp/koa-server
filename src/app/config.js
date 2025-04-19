const env = require("dotenv")

env.config()


module.exports = {
  MYSQL_HOST,
  MYSQL_PORT,
  MYSQL_USER,
  MYSQL_PASSWORD,
  MYSQL_DATABASE
} = process.env