should = require('chai').should()

Glass = require './glass'
Measures = require './measures'

describe 'An empty pint glass', ->
  glass = new Glass.Pint_Glass 

  it 'should contain no liquid', ->
    glass.volume.should.equal Measures.empty

  it 'when drunk from should return no liquid', ->
    glass.drink().should.equal Measures.empty

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal Measures.empty

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal Measures.empty


describe 'A full pint glass', ->
  glass = new Glass.Pint_Glass
  beforeEach ->
    glass.fill()

  it 'should contain 20 fluid ounces', ->
    glass.volume.should.equal Measures.one_pint

  it 'should when drunk from return 1 fluid ounce and contain 19 fluid ounces', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal Measures.one_pint - Measures.one_fl_oz

  it 'should when quaffed from return 4oz and contain 16oz', ->
    glass.fill()
    glass.quaff().should.equal 4 * Measures.one_fl_oz
    glass.volume.should.equal Measures.one_pint - 4 * Measures.one_fl_oz

  it 'should when downed-in-one return 20oz and then be empty', ->
    glass.fill()
    glass.down_in_one().should.equal Measures.one_pint
    glass.volume.should.equal Measures.empty


describe 'A nearly empty pint glass', ->
  glass = new Glass.Pint_Glass
  beforeEach ->
    glass.volume = 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'should contain 3oz', ->
    glass.volume.should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty


describe 'An empty half-pint glass', ->
  glass = new Glass.Half_Pint_Glass

  it 'should contain no liquid', ->
    glass.volume.should.equal Measures.empty

  it 'when drunk from should return no liquid', ->
    glass.volume.should.equal Measures.empty
    glass.drink().should.equal Measures.empty

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal Measures.empty

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal Measures.empty


describe 'A full half-pint glass', ->
  glass = new Glass.Half_Pint_Glass
  beforeEach ->
    glass.fill()
  
  it 'should contain ten fluid ounces of liquid', ->
    glass.volume.should.equal Measures.half_pint

  it 'should when drunk from return 1 fluid ounce and contain 9 fluid ounces', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal Measures.half_pint - Measures.one_fl_oz

  it 'should when quaffed from return 4oz and contain 6oz', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz
    glass.volume.should.equal Measures.half_pint - 4 * Measures.one_fl_oz

  it 'should when downed-in-one return 10oz and then be empty', ->
    glass.down_in_one().should.equal Measures.half_pint
    glass.volume.should.equal Measures.empty

describe 'A nearly empty half-pint Glass', ->
  glass = new Glass.Half_Pint_Glass
  beforeEach ->
    glass.volume = 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'should contain 3oz', ->
    glass.volume.should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'when drunk from should return 1oz and contain 3oz', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal 2 * Measures.one_fl_oz

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty
 
describe 'An empty jug', ->
  glass = new Glass.Jug

  it 'should contain no liquid', ->
    glass.volume.should.equal Measures.empty

  it 'when drunk from should return no liquid', ->
    glass.volume.should.equal Measures.empty
    glass.drink().should.equal Measures.empty

  it 'when quaffed from should return no liquid', ->
    glass.quaff().should.equal Measures.empty

  it 'when downed-in-one should return no liquid', ->
    glass.down_in_one().should.equal Measures.empty


describe 'A full three-pint jug', ->
  glass = new Glass.Jug
  beforeEach ->
    glass.fill()
  
  it 'should contain three pints of liquid', ->
    glass.volume.should.equal Measures.three_pints

  it 'should when drunk from return 1 fluid ounce and contain 59 fluid ounces', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal Measures.three_pints - Measures.one_fl_oz

  it 'should when quaffed from return 4oz and contain 56oz', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz
    glass.volume.should.equal Measures.three_pints - 4 * Measures.one_fl_oz

  it 'should when downed-in-one return 60oz and then be empty', ->
    glass.down_in_one().should.equal Measures.three_pints
    glass.volume.should.equal Measures.empty

describe 'A nearly empty three-pint jug', ->
  glass = new Glass.Jug
  beforeEach ->
    glass.volume = 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'should contain 3oz', ->
    glass.volume.should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'when drunk from should return 1oz and contain 3oz', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal 2 * Measures.one_fl_oz

  it 'when quaffed from should only return 3oz, and should then be empty', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty

  it 'when downed-in-one should return 3oz and should then be empty', ->
    glass.down_in_one().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty