function handleError(error, ctx) {
  ctx.body = {
    code: 500,
    message: error.message
  }
}

module.exports = handleError