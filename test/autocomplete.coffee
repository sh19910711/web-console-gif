Runner = require('./runner')

new Runner('autocomplete', 'http://localhost:19292', show: true)
  .wait '#console'
  .capture()

  .mousedown '#console'
  .capture()

  .keyTab()
  .typeWithCapture '#console', 'tes'
  .keyTab()
  .keyEnter()
  .keyEnter()

  .keyTab()
  .typeWithCapture '#console', 'Ra'
  .keyTab()
  .keyTab()
  .keyTab()
  .keyEnter()
  .typeWithCapture '#console', '.ro'
  .keyTab()
  .keyEnter()

  .typeWithCapture '#console', 'Web'
  .keyTab()
  .typeWithCapture '#console', '::'
  .keyTab()
  .typeWithCapture '#console', 'M'
  .keyTab()
  .typeWithCapture '#console', '.m'
  .keyTab()
  .typeWithCapture '#console', 'ount'
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
