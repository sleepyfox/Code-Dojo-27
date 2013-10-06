should = require('chai').should()

class Glass
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


describe 'An empty glass', ->
  it 'should contain no liquid', ->
    my_glass = new Glass 
    my_glass.volume.should.equal 0

  it 'when drunk from should return no liquid', ->
    my_glass = new Glass 
    my_glass.drink().should.equal 0

  it 'when quaffed from should return no liquid', ->
    my_glass = new Glass
    my_glass.quaff().should.equal 0

describe 'A full glass', ->
  it 'should contain 20 fluid ounces', ->
    my_glass = new Glass
    my_glass.fill()
    my_glass.volume.should.equal 20

  it 'should when drunk from return 1 fluid ounce and contain 19 fluid ounces', ->
    my_glass = new Glass
    my_glass.fill()
    my_glass.drink().should.equal 1
    my_glass.volume.should.equal 19

  it 'should when quaffed from return 4oz and contain 16oz', ->
    my_glass = new Glass
    my_glass.fill()
    my_glass.quaff().should.equal 4
    my_glass.volume.should.equal 16

