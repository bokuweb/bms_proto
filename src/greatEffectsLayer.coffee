GreatEffect = require './greatEffect'

GreatEffectLayer = cc.Layer.extend
  ctor : (@_res)->
    @_super()
    @_effects = []
    @_index = 0

  init : (num)->
    for i in [0...num]
      params =
        width  : @_res.width
        height : @_res.height
        row    : @_res.row
        colum  : @_res.colum
        delay  : @_res.delay
      effect = new GreatEffect @_res.src, params
      effect.y = -effect.y
      @_effects.push effect
      effect.retain()
    return

  run : (x, y)->
    @_effects[@_index].x = x
    @_effects[@_index].y = y
    @addChild @_effects[@_index]
    @_effects[@_index].run()
    @_index += 1

module.exports = GreatEffectLayer
