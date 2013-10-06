should = require('chai').should()

EMPTY = 0
ONE_PINT = 20

class PintGlass
  constructor: ->
    @volume = EMPTY
  fill: -> 
    @volume = ONE_PINT
  _drink: (amount) ->
    if amount > @volume
      left_over = @volume
      @volume = EMPTY
      left_over
    else
      @volume = @volume - amount
      amount
  drink: -> @_drink 1 
  quaff: -> @_drink 4
  down_in_one: -> @_drink @volume

class Half_Pint_Glass
  constructor: ->
    @volume = EMPTY
  fill: ->
    @volume = 10
  _drink: (amount) ->
    if amount > @volume
      left_over = @volume
      @volume = EMPTY
      left_over
    else
      @volume = @volume - amount
      amount
  drink: -> @_drink 1 
  quaff: -> @_drink 4
  down_in_one: -> @_drink @volume

describe 'An empty Pint Glass', ->
  glass = new PintGlass 

  it 'should contain no liquid', ->
    glass.volume.should.equal EMPTY

  it 'when drunk from should return no liquid', ->
    glass.drink().should.equal EMPTY

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal EMPTY

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal EMPTY

describe 'A full Pint Glass', ->
  glass = new PintGlass
  beforeEach ->
    glass.fill()

  it 'should contain 20 fluid ounces', ->
    glass.volume.should.equal ONE_PINT

  it 'should when drunk from return 1 fluid ounce and contain 19 fluid ounces', ->
    glass.drink().should.equal 1
    glass.volume.should.equal 19

  it 'should when quaffed from return 4oz and contain 16oz', ->
    glass.fill()
    glass.quaff().should.equal 4
    glass.volume.should.equal 16

  it 'should when downed-in-one return 20oz and then be empty', ->
    glass.fill()
    glass.down_in_one().should.equal ONE_PINT
    glass.volume.should.equal EMPTY

describe 'A nearly empty Pint Glass', ->
  glass = new PintGlass
  beforeEach ->
    glass.volume = 3

  it 'should contain 3oz', ->
    glass.volume.should.equal 3

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal 3
    glass.volume.should.equal EMPTY

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal 3
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
  it 'should contain ten fluid ounces of liquid', ->
    glass = new Half_Pint_Glass
    glass.fill()
    glass.volume.should.equal 10

  it 'should when drunk from return 1 fluid ounce and contain 9 fluid ounces', ->
    glass = new Half_Pint_Glass
    glass.fill()
    glass.drink().should.equal 1
    glass.volume.should.equal 9

  it 'should when quaffed from return 4oz and contain 6oz', ->
    glass = new Half_Pint_Glass
    glass.fill()
    glass.quaff().should.equal 4
    glass.volume.should.equal 6

  it 'should when downed-in-one return 10oz and then be empty', ->
    glass = new Half_Pint_Glass
    glass.fill()
    glass.down_in_one().should.equal 10
    glass.volume.should.equal EMPTY
