Nightmare = require('nightmare')

class Runner extends Nightmare
  constructor: (@name)->
    super()
    @cnt = 0

  typeWithCapture: (target, text)->
    text.split('').forEach (c)=>
      @type target, c
      @capture()
    @

  cntText: ->
    ("000" + (@cnt++)).slice(-3)

  keyTab: ->
    @
      .evaluate ->
        REPLConsole.currentSession.onKeyDown
          keyCode: 9
          preventDefault: ->
          stopPropagation: ->
      .wait 100
      .capture()

  keyEnter: ->
    @
      .evaluate ->
        REPLConsole.currentSession.onKeyDown
          keyCode: 13
          preventDefault: ->
          stopPropagation: ->
      .capture()

  capture: ->
    @
      .screenshot __dirname + '/../tmp/' + @name + "_" + @cntText() + '.png'

new Runner('autocomplete')
  .viewport 640, 480
  .goto 'http://localhost:19292'
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
