Runner = require('./runner')

new Runner 'suggest', 'http://localhost:19292'
  .wait '#console'
  .capture()

  .mousedown '#console'
  .capture()

  .typeWithCapture '#console', 'WebConsole::Middleware.mount_point'
  .keyEnter()
  .capture()
  .capture()
  .capture()

  .end()
  .then (res)-> console.log(res)
  .catch (err)-> console.error(err)
