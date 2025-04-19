const fs = require("fs")
const path = require("path")
const jwt = require("jsonwebtoken")

async function authToken(ctx, next) {
  try {
    const { authorization } = ctx.header
    const token = authorization.replace("Bearer ", "")
    const publicKey = fs.readFileSync(path.resolve(__dirname, "../keys/public.key"))
    const res = jwt.verify(token, publicKey, {
      algorithms: "RS256"
    })
    ctx.state = res // 中间件传递
    await next()
  } catch (error) {
    ctx.status = 401 // token失效无访问权限
    return ctx.app.emit("error", error, ctx)
  }
}

module.exports = {
  authToken
}