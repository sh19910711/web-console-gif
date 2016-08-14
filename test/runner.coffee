Nightmare = require('nightmare')

module.exports = class Runner extends Nightmare
  constructor: (@name, @url, opts = {})->
    super(Object.assign(opts, waitTimeout: 100000))
    @
      .viewport 640, 480
      .goto @url
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
    @.screenshot __dirname + '/../tmp/' + @name + "_" + @cntText() + '.png'
