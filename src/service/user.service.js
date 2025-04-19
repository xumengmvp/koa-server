const connection = require("../app/database")


class UserService {
  async register (user, password) {
    const sql = "insert into account(user, `password`) values (?,?);"
    return await connection.execute(sql, [user, password])
  }
  async isExist(user) {
    const sql = "select * from account where user = ?;"
    return await connection.execute(sql, [user])
  }
  async login(user, password) {
    const sql = "select * from account where user = ? and password = ?;"
    return await connection.execute(sql, [user, password])
  }
  async getUserList(currentPage, pageSize) {
    const sql  = "select * from account limit ? offset ?;"
    return await connection.execute(sql, [String(pageSize), String((currentPage - 1) * pageSize)])
  }
  async getTotalUserList() {
    const sql = "select count(*) as total from account;"
    return await connection.execute(sql)
  }
}


module.exports = new UserService()