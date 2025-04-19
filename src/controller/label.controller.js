const labelService = require("../service/label.service")

class LabelController {
  async create(ctx, next) {
    const { name } = ctx.request.body
    try {
      const res =  await labelService.create(name)
      ctx.response.body = {
        code: 200,
        message: "添加成功！"
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }


  async addCommentLabels(ctx, next) {
    try {
      const labelIdArray = []
      const { request, response } = ctx
      const { commentId, labels } = request.body
      for (const label of labels) {
        const [ result ] = await labelService.getLabelIdByName(label)
        if (result.length > 0) {
          labelIdArray.push(result[0].id)
        } else {
          const [ result ] = await labelService.create(label)
          labelIdArray.push(result.insertId)
        }
      }
      for (const labelId of labelIdArray) {
        const flag = await labelService.isExistRelative(commentId, labelId)
        if (!flag) {
          const res = await labelService.createCommentLabel(commentId, labelId)
        }
      }
      response.body = {
        code: 200,
        message: "添加成功！"
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }


  async getLabelList(ctx, next) {
    try {
      const { pageSize, currentPage } = ctx.request.query
      const [ result ] = await labelService.getLabelList(currentPage, pageSize)
      const [res] = await labelService.getLabelListTotal()
      ctx.response.body = {
        code: 200,
        data: result,
        total: res.length
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }
}


module.exports = new LabelController()