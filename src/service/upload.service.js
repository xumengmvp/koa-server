const connection = require("../app/database")

class UploadService {
  async create(user_id,originalname, mimetype, filename, path, size) {
    const sql = "insert into avatar(user_id, originalname, mimetype, filename, path, size) values(?,?,?,?,?,?);"
    return await connection.execute(sql, [user_id,originalname, mimetype, filename, path, size])
  }

  async getAvatar(id) {
    const sql = "select * from avatar where user_id = ? order by create_time desc"
    return await connection.execute(sql, [id])
  }

  async updateAvatar(id, path) {
    const sql = "update account set avatar = ? where id = ?;"
    return await connection.execute(sql, [path, id])
  }
}

module.exports = new UploadService()