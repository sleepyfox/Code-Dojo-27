EMPTY = 0
ONE_FL_OZ = 1
QUAFF = 4 * ONE_FL_OZ
ONE_PINT = 20 * ONE_FL_OZ
HALF_PINT = 0.5 * ONE_PINT
THREE_PINTS = 3 * ONE_PINT

class Glass
  constructor: (@size, @volume = 0) ->
  fill: -> 
    @volume = @size
  _drink: (amount) ->
    if amount > @volume
      left_over = @volume
      @volume = EMPTY
      left_over
    else
      @volume = @volume - amount
      amount
  drink: -> @_drink ONE_FL_OZ
  quaff: -> @_drink QUAFF
  down_in_one: -> @_drink @volume

class Pint_Glass extends Glass
  constructor: ->
    super ONE_PINT

class Half_Pint_Glass extends Glass
  constructor: ->
    super HALF_PINT

class Jug extends Glass
  constructor: ->
    super THREE_PINTS

module.exports = 
  EMPTY: EMPTY
  ONE_FL_OZ: ONE_FL_OZ
  QUAFF: QUAFF
  ONE_PINT: ONE_PINT
  HALF_PINT: HALF_PINT
  THREE_PINTS: THREE_PINTS
  Pint_Glass: Pint_Glass
  Half_Pint_Glass: Half_Pint_Glass
  Jug: Jug


