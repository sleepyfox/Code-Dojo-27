should = require('chai').should()

EMPTY = 0
ONE_PINT = 20

class PintGlass
  constructor: ->
    @volume = EMPTY
  fill: -> 
    @volume = ONE_PINT
  drink: -> 
    if @volume is EMPTY
      EMPTY
    else # return volume drunk
      @volume--
      1
  quaff: ->
    if @volume is EMPTY
      EMPTY
    else
      if @volume < 4
        left_over = @volume
        @volume = EMPTY
        left_over
      else
        @volume -= 4
        4
  down_in_one: ->
    left_over = @volume
    @volume = EMPTY
    left_over


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
  glass.volume = 3

  it 'should contain 3oz', ->
    glass.volume.should.equal 3

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal 3
    glass.volume.should.equal EMPTY


