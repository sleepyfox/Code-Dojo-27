should = require('chai').should()

describe 'An empty glass', ->
  it 'should contain no liquid', ->
    class Glass
      constructor: ->
      volume: 0

    my_glass = new Glass 
    my_glass.volume.should.equal 0

  it 'when drunk from should return no liquid', ->
    class Glass
      constructor: ->
      volume: 0
      drink: -> 0

    my_glass = new Glass 
    my_glass.drink().should.equal 0
