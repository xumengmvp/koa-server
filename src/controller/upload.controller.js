const fs = require("fs")

const uploadService = require("../service/upload.service")


class UploadController {
  async saveAvatar(ctx, next) {
    const { 
      originalname,
      mimetype,
      filename,
      path,
      size
    } = ctx.req.file


    const { id } = ctx.state

    try {
      const res = await uploadService.create(id,originalname, mimetype, filename, path, size)

      await uploadService.updateAvatar(id, `/api/avatar/${id}`)

      ctx.response.body = {
        code: 200,
        message: "上传成功！"
      }
    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }

  async getAvatar(ctx, next) {
    const { id } = ctx.request.params
    try {
      const [result] = await uploadService.getAvatar(id)
      ctx.response.set("content-type", result[0].mimetype)
      const file = fs.readFileSync(`./${result[0].path}`)
      ctx.response.body = file

    } catch (error) {
      ctx.app.emit("error", error, ctx)
    }
  }
}



module.exports = new UploadController()