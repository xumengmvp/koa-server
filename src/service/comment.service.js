const connection = require("../app/database")

class Comment {
  async sendComment(id, title, content) {
    const sql = "insert into comment(user_id, title, content) values (?,?,?);"
    return await connection.execute(sql, [id, title, content])
  }

  async getComment(id) {
    const sql = `
      select 
      m.id,
      m.title,
      m.content,
      JSON_OBJECT("id", u.id, "role", u.role, "user",u.user) user,
      IF(COUNT(l.id),JSON_ARRAYAGG(JSON_OBJECT("id", l.id, "name", l.name )),null) label,
      (select IF(COUNT(j.id), JSON_ARRAYAGG(JSON_OBJECT("id", j.id, "judgeContent", j.judge_content, "selfId", j.self_id, "user", 
      JSON_OBJECT("id", au.id, "name", au.user, "role", au.role)
      )), NULL) from judge j left join account au on j.user_id = au.id where j.comment_id = m.id ) judge,
      (select JSON_ARRAYAGG(CONCAT("/api/",path)) from picture where comment_id = m.id) picture,
      (select 
        count(*) 
      from judge j where j.comment_id = m.id) totalJudge,
      (select 
        count(*) 
      from rlabel r where r.comment_id = m.id) totalLabel
      from comment m
      left join account u on m.user_id = u.id 
      left join rlabel r on m.id = r.comment_id
      left join label l on r.label_id = l.id
      where m.id = ?
      group by m.id
    `
    return await connection.execute(sql, [id])
  }

  async getCommentList(currentPage, pageSize) {
    const sql = `select 
      m.id,
      m.title,
      m.content,
      JSON_OBJECT("id", u.id, "role", u.role, "user",u.user) user,
      IF(COUNT(l.id),JSON_ARRAYAGG(JSON_OBJECT("id", l.id, "name", l.name )),null) label,
      (select IF(COUNT(j.id), JSON_ARRAYAGG(JSON_OBJECT("id", j.id, "judgeContent", j.judge_content, "selfId", j.self_id, "user", 
      JSON_OBJECT("id", au.id, "name", au.user, "role", au.role)
      )), NULL) from judge j left join account au on j.user_id = au.id where j.comment_id = m.id ) judge,
      (select JSON_ARRAYAGG(CONCAT("/api/",path)) from picture where comment_id = m.id) picture,
      (select 
        count(*) 
      from judge j where j.comment_id = m.id) totalJudge,
      (select 
        count(*) 
      from rlabel r where r.comment_id = m.id) totalLabel
      from comment m
      left join account u on m.user_id = u.id 
      left join rlabel r on m.id = r.comment_id
      left join label l on r.label_id = l.id
      group by m.id
      limit ? offset ?;`
    return connection.execute(sql, [String(pageSize), String((currentPage - 1 ) * pageSize)])
  }

  async getCommentListTotal() {
    const sql = "select * from comment"
    return await connection.execute(sql)
  }

  async getUserIdByCommentId(commentId) {
    const sql = "select * from comment where id = ?;"
    return await connection.execute(sql, [commentId])
  }

  async modifyComment(id, title, content) {
    const sql = "update comment set title = ?,content = ? where id = ?;"
    return await connection.execute(sql, [title, content, id])
  }

  async deleteComment(id) {
    const sql = "delete from comment where id = ?;"
    return connection.execute(sql, [id])
  }

  async uploadPicture(commentId, userId, originalname, mimetype, filename, path, size) {
    const sql = "insert into picture(comment_id, user_id, originalname, mimetype, filename, path, size) values (?,?,?,?,?,?,?);"
    return await connection.execute(sql, [commentId, userId, originalname, mimetype, filename, path, size])
  }

  async getFileInfoByFilename(filename) {
    const sql = "select * from picture where filename = ?;"
    return await connection.execute(sql, [filename])
  }
}


module.exports = new Comment()