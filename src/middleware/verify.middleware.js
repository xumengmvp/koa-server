const userService = require("../service/user.service")

async function verifyUserPwd(ctx, next) {
  const { user, password } = ctx.request.body
  if(user && user.trim() && password && password.trim()) {
    if(user.length >= 6 && user.length <= 10 && password.length >= 6 && password.length <= 10) {
      await next()
    } else {
      ctx.body = {
        code: 500,
        message: "账户和密码最少6位, 最多10位!"
      }
    }
  } else {
    ctx.body = {
      code: 500,
      message: "账号名或密码不为空!"
    }
  }
}

async function duplicateUser(ctx, next) {
  try {
    const { user, password } = ctx.request.body
    const res = await userService.isExist(user)
    if (res[0].length > 0) {
      ctx.body = {
        code: 500,
        message: "该用户已存在!"
      }
    } else {
      await next()
    }
  } catch (error) {
    return ctx.app.emit("error", error, ctx)
  }
}

async function isUserNull(ctx, next) {
  const { user, password} = ctx.request.body
  if (user && password) {
    await next()
  } else {
    ctx.body = {
      code: 500,
      message: "缺失账户名或密码"
    }
  }
}


module.exports = {
  verifyUserPwd,
  duplicateUser,
  isUserNull
}