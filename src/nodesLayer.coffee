FallObjsLayer = require './fallObjsLayer'
Node          = require './node'

NodesLayer = FallObjsLayer.extend

  ctor : (@_timer)->
    @_super()
    @_index    = 0
    @_nodes    = []
    @_genTime  = []

  #
  # create and pool nodes
  #
  # @param  res   - resouce data
  # @param  bpms  - BPM change list
  # @param  nodes - node parameter
  # @return node generation time Array
  #
  init : (skin, bpms, nodes)->
    time = 0
    @_nodes.length = 0
    @_genTime.length = 0

    for v, i in nodes
      node = new Node skin.nodeImage.src, @_timer
      node.timing = v.timing
      @_appendFallParams node, bpms, time, skin.fallDist
      @_genTime.push time
      time = @_getGenTime node, skin.fallDist
      @_nodes.push node
    @_genTime

  #
  # start node update
  #
  start : -> @scheduleUpdate()

  #
  # add note to game scene
  #
  update : ->
    return unless @_genTime[@_index]?
    return unless @_genTime[@_index] <= @_timer.get()
    @addChild @_nodes[@_index]
    @_nodes[@_index].start()
    @_index++

  _calcSpeed : (bpm, fallDistance) ->
    @_super bpm, fallDistance

  _appendFallParams : (obj, bpms, time, fallDistance)->
    @_super obj, bpms, time, fallDistance
  #
  # get time when node y coordinate will be 0px
  # to generate next node
  #
  _getGenTime : (obj, fallDist)->
    for v, i in obj.dstY when v > 0
      return ~~(obj.bpm.timing[i] - (v / @_calcSpeed(obj.bpm.val[i], fallDist)))
    return 0

module.exports = NodesLayer
