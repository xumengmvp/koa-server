const KoaRouter = require("koa-router")

const verify = require("../middleware/verify.middleware")

const userController = require("../controller/user.controller")

const auth = require("../middleware/auth.middleware")

const router = new KoaRouter({prefix: "/api"})

// 用户注册
router.post("/register", 
  verify.verifyUserPwd, 
  verify.duplicateUser, 
  userController.register
)

// 用户登录
router.post("/login", 
  verify.isUserNull, 
  userController.login)

// 获取用户列表
router.get("/user",
  auth.authToken,
  userController.getUserList)
 


module.exports = router