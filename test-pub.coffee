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
      @volume -= 4
      4


describe 'An empty PintGlass', ->
  glass = new PintGlass 

  it 'should contain no liquid', ->
    glass.volume.should.equal 0

  it 'when drunk from should return no liquid', ->
    glass.drink().should.equal 0

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal 0

describe 'A full PintGlass', ->
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

