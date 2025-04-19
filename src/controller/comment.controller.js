const fs = require("fs")

const commentService = require("../service/comment.service")

class CommentController {
  
  async sendComment(ctx, next) {
    const { id, user, role } = ctx.state
    const { title, content } = ctx.request.body
    try {
      if (id && title && content) {
        const res = await commentService.sendComment(id, title, content)
        ctx.response.body = {
          code: 200,
          message: "发布成功！"
        }
      }
    } catch (error) {
      return ctx.app.emit("error", ctx, error)
    }
  }

  async getComment(ctx, next) {
    const { response } = ctx
    const { id }  = ctx.request.params
    try {
      const res = await commentService.getComment(id)
      response.body = {
        code: 200,
        data: res[0]
      }
    } catch (error) {
      return ctx.app.emit("error", error, ctx)
    }
  }

  async getCommentList(ctx, next) {
    const { response } = ctx
    const {pageSize, currentPage} = ctx.request.query
    try {
      const res = await commentService.getCommentList(currentPage, pageSize)
      const [ result ] = await commentService.getCommentListTotal()
      response.body = {
        code: 200,
        data: res[0],
        total: result.length
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }

  async modifyComment(ctx, next) {
    const { request, response } = ctx
    const { id, title, content } = ctx.request.body
    const userId = ctx.state.id
    try {
      const [ result ] = await commentService.getUserIdByCommentId(id)
      if (result.length > 0 && result[0].user_id === userId) {
        const res = await commentService.modifyComment(id, title, content)
        response.body = {
          code: 200,
          message: "修改成功！"
        }
      } else {
        response.body = {
          code: 200,
          message: "暂无动态！"
        }
      }
    } catch (error) {
      return ctx.app.emit("error", error, ctx)
    }
  }

  async deleteComment(ctx, next) {
    const { request, response } = ctx
    const { id } = ctx.request.body
    try {
      const [result] = await commentService.getUserIdByCommentId(id)
      if (result.length > 0 && result[0].user_id === ctx.state.id) {
        const res = await commentService.deleteComment(id)
        response.body = {
          code: 200,
          message: "删除成功！"
        }
      } else {
        response.body = {
          code: 200,
          message: "暂无动态！"
        }
      }

    } catch (error) {
      return ctx.app.emit("error", error, ctx)
    }
  }


  async uploadPicture(ctx, next) {
    const { id } = ctx.request.params
    for(const pic of ctx.req.files) {
      const { 
        originalname,
        mimetype,
        filename,
        path,
        size
      } = pic
      await commentService.uploadPicture(id, ctx.state.id, originalname, mimetype, filename, path, size)
    }
    ctx.response.body = {
      code: 200,
      message: "上传成功！"
    }
  }
  
  async getPicture(ctx, next) {
    const { filename } = ctx.request.params
    const [ result ] = await commentService.getFileInfoByFilename(filename)
    ctx.response.set("content-type", result[0].mimetype)
    const file = fs.readFileSync(`./uploads/picture/${filename}`)
    ctx.response.body = file
  }
}

module.exports = new CommentController()