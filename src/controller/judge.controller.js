const judgeService = require("../service/judge.service")

class JudgeController {

  async createJudge(ctx, next) {
    const { request, response } = ctx
    const { id } = ctx.state
    const { commentId, selfId, judgeContent} = request.body
    try {
      const [ result ] = await judgeService.getCommentById(commentId)
      if (result.length > 0) {
        await judgeService.createJudge(id, commentId, judgeContent)
        response.body = {
          code: 200,
          message: "评论成功！"
        }
      } else {
        response.body = {
          code: 200,
          message: "该动态不存在！"
        }
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }

  async rejudge(ctx, next) {


    try {
      const { request, response } = ctx
      const { commentId, judgeContent } = request.body
      const { id } = request.params
      const [ result ] = await judgeService.getCommentById(commentId)
      if (result.length > 0) {
        const [ result ] = await judgeService.getJudgeById(id)
        if (result.length > 0) {
          const res = await judgeService.createRejudge(commentId, ctx.state.id, id, judgeContent)
          response.body = {
            code: 200,
            message: "评论成功！"
          }
        }
      } else {
        response.body = {
          code: 200,
          message: "暂无动态！"
        }
      }
    } catch (error) {
      ctx.app.emit("error",error,ctx)
    }
  }

  async modifyJudge(ctx,next) {
    const { request, response } = ctx
    const { id, judgeContent } = request.body

    try {
      const [ result ] =  await judgeService.getJudgeById(id)
      if (result.length > 0) {
        const res = await judgeService.modifyJudge(id, judgeContent)
        response.body = {
          code: 200,
          message: "修改成功！"
        }
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }


  async deleteJudge(ctx, next) {
    const { request, response } = ctx
    const { id } = request.body
    try {
      const res = await judgeService.deleteJudge(id)
      response.body = {
        code: 200,
        message: "删除成功！"
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }

  async getJudge(ctx, next) {
    const { commentId } = ctx.request.query
    try {
      const [result] = await judgeService.getJudge(commentId)
      ctx.response.body = {
        code: 200,
        data: result
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }
  

  
}


module.exports = new JudgeController()