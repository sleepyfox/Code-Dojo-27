should = require('chai').should()

Glass = require './glass'

describe 'An empty pint glass', ->
  glass = new Glass.Pint_Glass 

  it 'should contain no liquid', ->
    glass.volume.should.equal Glass.EMPTY

  it 'when drunk from should return no liquid', ->
    glass.drink().should.equal Glass.EMPTY

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal Glass.EMPTY

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal Glass.EMPTY


describe 'A full pint glass', ->
  glass = new Glass.Pint_Glass
  beforeEach ->
    glass.fill()

  it 'should contain 20 fluid ounces', ->
    glass.volume.should.equal Glass.ONE_PINT

  it 'should when drunk from return 1 fluid ounce and contain 19 fluid ounces', ->
    glass.drink().should.equal Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.ONE_PINT - Glass.ONE_FL_OZ

  it 'should when quaffed from return 4oz and contain 16oz', ->
    glass.fill()
    glass.quaff().should.equal Glass.QUAFF
    glass.volume.should.equal Glass.ONE_PINT - Glass.QUAFF

  it 'should when downed-in-one return 20oz and then be empty', ->
    glass.fill()
    glass.down_in_one().should.equal Glass.ONE_PINT
    glass.volume.should.equal Glass.EMPTY


describe 'A nearly empty pint glass', ->
  glass = new Glass.Pint_Glass
  beforeEach ->
    glass.volume = Glass.QUAFF - Glass.ONE_FL_OZ

  it 'should contain 3oz', ->
    glass.volume.should.equal Glass.QUAFF - Glass.ONE_FL_OZ

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal Glass.QUAFF - Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.EMPTY

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal Glass.QUAFF - Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.EMPTY


describe 'An empty half-pint glass', ->
  glass = new Glass.Half_Pint_Glass

  it 'should contain no liquid', ->
    glass.volume.should.equal Glass.EMPTY

  it 'when drunk from should return no liquid', ->
    glass.volume.should.equal Glass.EMPTY
    glass.drink().should.equal Glass.EMPTY

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal Glass.EMPTY

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal Glass.EMPTY


describe 'A full half-pint glass', ->
  glass = new Glass.Half_Pint_Glass
  beforeEach ->
    glass.fill()
  
  it 'should contain ten fluid ounces of liquid', ->
    glass.volume.should.equal Glass.HALF_PINT

  it 'should when drunk from return 1 fluid ounce and contain 9 fluid ounces', ->
    glass.drink().should.equal Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.HALF_PINT - Glass.ONE_FL_OZ

  it 'should when quaffed from return 4oz and contain 6oz', ->
    glass.quaff().should.equal Glass.QUAFF
    glass.volume.should.equal Glass.HALF_PINT - Glass.QUAFF

  it 'should when downed-in-one return 10oz and then be empty', ->
    glass.down_in_one().should.equal Glass.HALF_PINT
    glass.volume.should.equal Glass.EMPTY

describe 'A nearly empty half-pint Glass', ->
  glass = new Glass.Half_Pint_Glass
  beforeEach ->
    glass.volume = Glass.QUAFF - Glass.ONE_FL_OZ

  it 'should contain 3oz', ->
    glass.volume.should.equal Glass.QUAFF - Glass.ONE_FL_OZ

  it 'when drunk from should return 1oz and contain 3oz', ->
    glass.drink().should.equal Glass.ONE_FL_OZ
    glass.volume.should.equal 2 * Glass.ONE_FL_OZ

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal Glass.QUAFF - Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.EMPTY

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal Glass.QUAFF - Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.EMPTY
 
describe 'An empty jug', ->
  glass = new Glass.Jug

  it 'should contain no liquid', ->
    glass.volume.should.equal Glass.EMPTY

  it 'when drunk from should return no liquid', ->
    glass.volume.should.equal Glass.EMPTY
    glass.drink().should.equal Glass.EMPTY

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal Glass.EMPTY

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal Glass.EMPTY


describe 'A full three-pint jug', ->
  glass = new Glass.Jug
  beforeEach ->
    glass.fill()
  
  it 'should contain three pints of liquid', ->
    glass.volume.should.equal Glass.THREE_PINTS

  it 'should when drunk from return 1 fluid ounce and contain 59 fluid ounces', ->
    glass.drink().should.equal Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.THREE_PINTS - Glass.ONE_FL_OZ

  it 'should when quaffed from return 4oz and contain 56oz', ->
    glass.quaff().should.equal Glass.QUAFF
    glass.volume.should.equal Glass.THREE_PINTS - Glass.QUAFF

  it 'should when downed-in-one return 60oz and then be empty', ->
    glass.down_in_one().should.equal Glass.THREE_PINTS
    glass.volume.should.equal Glass.EMPTY

describe 'A nearly empty three-pint jug', ->
  glass = new Glass.Jug
  beforeEach ->
    glass.volume = Glass.QUAFF - Glass.ONE_FL_OZ

  it 'should contain 3oz', ->
    glass.volume.should.equal Glass.QUAFF - Glass.ONE_FL_OZ

  it 'when drunk from should return 1oz and contain 3oz', ->
    glass.drink().should.equal Glass.ONE_FL_OZ
    glass.volume.should.equal 2 * Glass.ONE_FL_OZ

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal Glass.QUAFF - Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.EMPTY

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal Glass.QUAFF - Glass.ONE_FL_OZ
    glass.volume.should.equal Glass.EMPTY
 