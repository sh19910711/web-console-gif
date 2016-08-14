Runner = require('./runner')

new Runner 'suggest', 'http://localhost:19292'
  .wait '#console'
  .capture()

  .mousedown '#console'
  .capture()

  .typeWithCapture '#console', 'WebConsole::'
  .typeWithCapture '#console', 'Middle'
  .keyTab()
  .typeWithCapture '#console', '.mount_point'
  .keyEnter()
  .capture()
  .capture()
  .capture()

  .end()
  .then (res)-> console.log(res)
  .catch (err)-> console.error(err)
