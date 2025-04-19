const connection = require("../app/database")


class JudgeService {
  async createJudge(userId, commentId, judgeContent) {
    const sql = "insert into judge(user_id, comment_id, judge_content) values (?,?,?)"
    return await connection.execute(sql, [userId, commentId, judgeContent])
  }

  async getCommentById(commentId) {
    const sql = "select * from comment where id = ?"
    return await connection.execute(sql, [commentId])
  }

  async getJudgeById(judgeId) {
    const sql = "select * from judge where id = ?;"
    return connection.execute(sql,[judgeId])
  }

  async createRejudge(commentId, userId, selfId, judgeContent) {
    const sql = "insert into judge(comment_id, user_id, self_id, judge_content) values (?,?,?,?);"
    return await connection.execute(sql, [commentId, userId, selfId, judgeContent])
  }

  async modifyJudge(judgeId, judgeContent) {
    const sql = "update judge set judge_content = ? where id = ?;"
    return await connection.execute(sql, [judgeContent, judgeId])
  }

  async deleteJudge(judgeId) {
    const sql = "delete from judge where id =?;"
    return await connection.execute(sql, [judgeId])
  }

  async getJudge(commentId) {
    const sql = `
      select 
        j.id id,
        j.self_id,
        j.judge_content content,
        JSON_OBJECT("id", u.id, "user", u.user, "role", u.role) user,
        j.create_time,
        j.update_time
        from judge j
        left join account u on u.id = j.user_id
      where comment_id = ?
    `
    return connection.execute(sql, [commentId])
  }
}


module.exports = new JudgeService()