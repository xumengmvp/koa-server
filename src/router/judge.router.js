const KoaRouter = require("koa-router")

const auth = require("../middleware/auth.middleware")
const judgeController = require("../controller/judge.controller")

const router = new KoaRouter({prefix: "/api"})

router.get("/judge", auth.authToken, judgeController.getJudge)
router.post("/judge", auth.authToken, judgeController.createJudge)
router.post("/judge/:id", auth.authToken, judgeController.rejudge)
router.patch("/judge", auth.authToken, judgeController.modifyJudge)
router.delete("/judge", auth.authToken, judgeController.deleteJudge)

module.exports = router