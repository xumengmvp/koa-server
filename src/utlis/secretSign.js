const fs = require("fs")
const path = require("path")

const crypto = require("crypto")
const jwt = require("jsonwebtoken")

// 读取私钥，发布token
const privateKey = fs.readFileSync(path.resolve(__dirname, "../keys/private.key"), {encoding: "utf-8"})

// SHA-256 密码加密
function sendSHA256(data) {
  return crypto.createHash("sha256").update(data).digest("hex")
}

// 生成 token
function sendToken(data) {
  return jwt.sign(data, privateKey,{
    expiresIn: 60 * 30,
    algorithm: "RS256"
  })
}

module.exports = {
  sendSHA256,
  sendToken
}