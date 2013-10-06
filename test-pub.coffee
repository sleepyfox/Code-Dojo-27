should = require('chai').should()

class Glass
  constructor: ->
    @volume = 0
  fill: -> 
    @volume = 20
  drink: -> 0

describe 'An empty glass', ->
  it 'should contain no liquid', ->
    my_glass = new Glass 
    my_glass.volume.should.equal 0

  it 'when drunk from should return no liquid', ->
    my_glass = new Glass 
    my_glass.drink().should.equal 0

describe 'A full glass', ->
  it 'should contain 20 fluid ounces', ->
    my_glass = new Glass
    my_glass.fill()
    my_glass.volume.should.equal 20