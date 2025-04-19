const KoaRouter = require("koa-router")

const multer = require("koa-multer")

const uploadController = require("../controller/upload.controller")

const upload  = multer({
  dest: "./uploads/avatar"
})

const auth = require("../middleware/auth.middleware")


const router = new KoaRouter({prefix: "/api"})

router.post("/upload/avatar", auth.authToken, upload.single("avatar"), uploadController.saveAvatar)
router.get("/avatar/:id", uploadController.getAvatar )

module.exports  = router