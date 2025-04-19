const KoaRouter = require("koa-router")

const multer = require("koa-multer")

const upload = multer({
  dest: "./uploads/picture"
})

const auth = require("../middleware/auth.middleware")
const commentController = require("../controller/comment.controller")

const router = new KoaRouter({prefix: "/api"})

router.post("/comment", auth.authToken, commentController.sendComment)
router.get("/comment/:id", auth.authToken, commentController.getComment)
router.get("/comment",auth.authToken, commentController.getCommentList)
router.patch("/comment", auth.authToken, commentController.modifyComment)
router.delete("/comment", auth.authToken, commentController.deleteComment)

router.post("/upload/picture/:id", auth.authToken, upload.array("picture", 9), commentController.uploadPicture)
router.get("/uploads/picture/:filename", commentController.getPicture)


module.exports = router