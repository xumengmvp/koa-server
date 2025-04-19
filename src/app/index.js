const fs = require("fs")
const path = require("path")

const Koa = require("koa")
const koaBodyParser = require("koa-bodyparser")
const handleError = require("./handle.error")

const app = new Koa()

app.use(koaBodyParser())

const files = fs.readdirSync(path.resolve(__dirname ,"../router"))

files.forEach((file) => {
  const router = require(path.resolve(__dirname, `../router/${file}`))
  app.use(router.routes())
  app.use(router.allowedMethods())
})

app.on("error", handleError)


module.exports = app

