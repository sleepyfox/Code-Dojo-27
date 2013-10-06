should = require('chai').should()

# Weights and Measures
EMPTY = 0
ONE_PINT = 20
HALF_PINT = 10
ONE_OZ = 1
QUAFF = 4

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
  drink: -> @_drink ONE_OZ
  quaff: -> @_drink QUAFF
  down_in_one: -> @_drink @volume

class PintGlass extends Glass
  constructor: ->
    super ONE_PINT

class Half_Pint_Glass extends Glass
  constructor: ->
    super HALF_PINT


describe 'An empty pint glass', ->
  glass = new PintGlass 

  it 'should contain no liquid', ->
    glass.volume.should.equal EMPTY

  it 'when drunk from should return no liquid', ->
    glass.drink().should.equal EMPTY

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal EMPTY

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal EMPTY


describe 'A full pint glass', ->
  glass = new PintGlass
  beforeEach ->
    glass.fill()

  it 'should contain 20 fluid ounces', ->
    glass.volume.should.equal ONE_PINT

  it 'should when drunk from return 1 fluid ounce and contain 19 fluid ounces', ->
    glass.drink().should.equal ONE_OZ
    glass.volume.should.equal ONE_PINT - ONE_OZ

  it 'should when quaffed from return 4oz and contain 16oz', ->
    glass.fill()
    glass.quaff().should.equal QUAFF
    glass.volume.should.equal ONE_PINT - QUAFF

  it 'should when downed-in-one return 20oz and then be empty', ->
    glass.fill()
    glass.down_in_one().should.equal ONE_PINT
    glass.volume.should.equal EMPTY


describe 'A nearly empty pint glass', ->
  glass = new PintGlass
  beforeEach ->
    glass.volume = QUAFF - ONE_OZ

  it 'should contain 3oz', ->
    glass.volume.should.equal QUAFF - ONE_OZ

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal QUAFF - ONE_OZ
    glass.volume.should.equal EMPTY

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal QUAFF - ONE_OZ
    glass.volume.should.equal EMPTY


describe 'An empty half-pint glass', ->
  glass = new Half_Pint_Glass

  it 'should contain no liquid', ->
    glass.volume.should.equal EMPTY

  it 'when drunk from should return no liquid', ->
    glass.volume.should.equal EMPTY
    glass.drink().should.equal EMPTY

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal EMPTY

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal EMPTY


describe 'A full half-pint glass', ->
  glass = new Half_Pint_Glass
  beforeEach ->
    glass.fill()
  
  it 'should contain ten fluid ounces of liquid', ->
    glass.volume.should.equal HALF_PINT

  it 'should when drunk from return 1 fluid ounce and contain 9 fluid ounces', ->
    glass.drink().should.equal ONE_OZ
    glass.volume.should.equal HALF_PINT - ONE_OZ

  it 'should when quaffed from return 4oz and contain 6oz', ->
    glass.quaff().should.equal QUAFF
    glass.volume.should.equal HALF_PINT - QUAFF

  it 'should when downed-in-one return 10oz and then be empty', ->
    glass.down_in_one().should.equal HALF_PINT
    glass.volume.should.equal EMPTY

describe 'A nearly empty half-pint Glass', ->
  glass = new Half_Pint_Glass
  beforeEach ->
    glass.volume = QUAFF - ONE_OZ

  it 'should contain 3oz', ->
    glass.volume.should.equal QUAFF - ONE_OZ

  it 'when drunk from should return 1oz and contain 3oz', ->
    glass.drink().should.equal ONE_OZ
    glass.volume.should.equal 2 * ONE_OZ

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal QUAFF - ONE_OZ
    glass.volume.should.equal EMPTY

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal QUAFF - ONE_OZ
    glass.volume.should.equal EMPTY
 