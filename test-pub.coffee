should = require('chai').should()

class PintGlass
  constructor: ->
    @volume = 0
  fill: -> 
    @volume = 20
  drink: -> 
    if @volume is 0
      0
    else # return volume drunk
      @volume--
      1
  quaff: ->
    if @volume is 0
      0
    else
      if @volume < 4
        left_over = @volume
        @volume = 0
        left_over
      else
        @volume -= 4
        4


describe 'An empty Pint Glass', ->
  glass = new PintGlass 

  it 'should contain no liquid', ->
    glass.volume.should.equal 0

  it 'when drunk from should return no liquid', ->
    glass.drink().should.equal 0

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal 0

describe 'A full Pint Glass', ->
  glass = new PintGlass
  glass.fill()

  it 'should contain 20 fluid ounces', ->
    glass.volume.should.equal 20

  it 'should when drunk from return 1 fluid ounce and contain 19 fluid ounces', ->
    glass.drink().should.equal 1
    glass.volume.should.equal 19

  it 'should when quaffed from return 4oz and contain 16oz', ->
    glass.fill()
    glass.quaff().should.equal 4
    glass.volume.should.equal 16

describe 'A nearly empty Pint Glass', ->
  it 'should contain 3oz', ->
    glass = new PintGlass
    glass.volume = 3
    glass.volume.should.equal 3

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass = new PintGlass
    glass.volume = 3
    glass.quaff().should.equal 3
    glass.volume.should.equal 0


