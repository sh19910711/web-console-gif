Runner = require('./runner')

new Runner 'autocomplete', 'http://localhost:19292'
  .wait '#console'
  .capture()

  .mousedown '#console'
  .capture()

  .keyTab()
  .typeWithCapture '#console', 'tes'
  .keyTab()
  .keyEnter()
  .keyEnter()

  .capture()
  .capture()
  .capture()

  .end()
  .then (res)->
    console.log(res)
  .catch (err)->
    console.error(err)
