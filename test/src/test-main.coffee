GreatEffectTest    = require './test-greatEffect'
keyEffectLayerTest = require './test-keyEffectLayer'
ParserTest         = require './test-parser'
TimerTest          = require './test-timer'
NoteTest           = require './test-note'
NumeralLayerTest   = require './test-numeralLayer'
StatsLayerTest     = require './test-statsLayer'
PlaytimeLayerTest  = require './test-playtimeLayer'
JudgementLayerTest = require './test-judgementLayer'
BmpLayerTest       = require './test-bmpLayer'

window.onload = ->
  cc.game.onStart = ->
    cc.view.enableRetina off
    cc.view.adjustViewPort on
    policy = new cc.ResolutionPolicy cc.ContainerStrategy.ORIGINAL_CONTAINER, cc.ContentStrategy.SHOW_ALL
    cc.view.setDesignResolutionSize 800, 600, policy
    cc.director.setContentScaleFactor 2

    # cocos2d-JS Lite can't execute initWithSpriteFrameName
    #bmpLayerTest = new BmpLayerTest()
    judgmentLayerTest = new JudgementLayerTest()
    playtimeLayerTest = new PlaytimeLayerTest()
    statsLayerTest = new StatsLayerTest()
    numeralLayerTest = new NumeralLayerTest()
    keyEffectLayerTest = new keyEffectLayerTest()
    greatEffectTest = new GreatEffectTest()
    parserTest = new ParserTest()
    timerTest  = new TimerTest()
    noteTest   = new NoteTest()

    #bmpLayerTest.start()
    judgmentLayerTest.start()
    playtimeLayerTest.start()
    statsLayerTest.start()
    numeralLayerTest.start()
    keyEffectLayerTest.start()
    greatEffectTest.start()
    parserTest.start()
    timerTest.start()
    noteTest.start()

    if window.mochaPhantomJS
      mochaPhantomJS.run()
    else
      mocha.run()


  cc.game.run 'gameCanvas'
