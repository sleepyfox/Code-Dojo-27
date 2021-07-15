Measures = require './measures'

class Glass
  constructor: (@size, @volume = 0) ->
  fill: -> 
    @volume = @size
  _drink: (amount) ->
    if amount > @volume
      left_over = @volume
      @volume = Measures.empty
      left_over
    else
      @volume = @volume - amount
      amount
  drink: -> @_drink Measures.one_fl_oz
  quaff: -> @_drink 4 * Measures.one_fl_oz
  down_in_one: -> @_drink @volume

class Pint_Glass extends Glass
  constructor: ->
    super Measures.one_pint

class Half_Pint_Glass extends Glass
  constructor: ->
    super Measures.half_pint

class Jug extends Glass
  constructor: ->
    super Measures.three_pints

module.exports = 
  Pint_Glass: Pint_Glass
  Half_Pint_Glass: Half_Pint_Glass
  Jug: Jug