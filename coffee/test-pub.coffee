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

  it 'should contain 20 fl oz', ->
    glass.volume.should.equal Measures.one_pint

  it 'should when drunk from return 1 fl oz and contain 19 fl oz', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal Measures.one_pint - Measures.one_fl_oz

  it 'should when quaffed from return 4 fl oz and contain 16 fl oz', ->
    glass.fill()
    glass.quaff().should.equal 4 * Measures.one_fl_oz
    glass.volume.should.equal Measures.one_pint - 4 * Measures.one_fl_oz

  it 'should when downed-in-one return 20 fl oz and then be empty', ->
    glass.fill()
    glass.down_in_one().should.equal Measures.one_pint
    glass.volume.should.equal Measures.empty


describe 'A nearly empty pint glass', ->
  glass = new Glass.Pint_Glass
  beforeEach -> # Glass contains 3 fl oz
    glass.fill()
    glass.quaff() for [1..4]
    glass.drink()

  it 'should contain 3 fl oz', ->
    glass.volume.should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'when quaffed from should only return 3 fl oz, and should then be empty', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty

  it 'when downed-in-one should return 3 fl oz and should then be empty', ->
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

  it 'should when drunk from return 1 fl oz and contain 9 fl oz', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal Measures.half_pint - Measures.one_fl_oz

  it 'should when quaffed from return 4 fl oz and contain 6 fl oz', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz
    glass.volume.should.equal Measures.half_pint - 4 * Measures.one_fl_oz

  it 'should when downed-in-one return 10 fl oz and then be empty', ->
    glass.down_in_one().should.equal Measures.half_pint
    glass.volume.should.equal Measures.empty


describe 'A nearly empty half-pint Glass', ->
  glass = new Glass.Half_Pint_Glass
  beforeEach -> # Glass contains 3 fl oz
    glass.fill()
    glass.quaff()
    glass.drink() for [1..3]

  it 'should contain 3 fl oz', ->
    glass.volume.should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'when drunk from should return 1 fl oz and contain 3 fl oz', ->
    glass.drink().should.equal Measures.one_fl_oz
    glass.volume.should.equal 2 * Measures.one_fl_oz

  it 'when quaffed from should only return 3 fl oz, and should then be empty', ->
    glass.quaff().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty

  it 'when downed-in-one should return 3 fl oz and should then be empty', ->
    glass.down_in_one().should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz
    glass.volume.should.equal Measures.empty


describe 'An empty jug', ->
  glass = new Glass.Jug

  it 'should contain no liquid', ->
    glass.volume.should.equal Measures.empty

describe 'A full three-pint jug', ->
  jug = new Glass.Jug
  beforeEach ->
    jug.fill()

  it 'should contain three pints of liquid', ->
    jug.volume.should.equal Measures.three_pints

  it 'should when used to fill up a pint glass leave two pints in the jug', ->
    pint = new Glass.Pint_Glass
    jug.fill_up(pint)
    jug.volume.should.equal 2 * Measures.one_pint
    pint.volume.should.equal Measures.one_pint

  it 'should when used to fill up a half pint glass leave 50 fl oz in the jug', ->
    half_pint = new Glass.Half_Pint_Glass
    jug.fill_up(half_pint)
    jug.volume.should.equal 50 * Measures.one_fl_oz
    half_pint.volume.should.equal Measures.half_pint


describe 'A nearly empty three-pint jug', ->
  jug = new Glass.Jug
  beforeEach -> # Glass contains 3 fl oz
    jug.fill()
    jug.quaff() for [1..14]
    jug.drink()

  it 'should contain 3 fl oz', ->
    jug.volume.should.equal 4 * Measures.one_fl_oz - Measures.one_fl_oz

  it 'should when used to fill up a pint glass', ->
    pint = new Glass.Pint_Glass
    jug.fill_up(pint)
    jug.volume.should.equal Measures.empty
    pint.volume.should.equal 3 * Measures.one_fl_oz

  it 'should when used to fill up a half pint glass', ->
    half_pint = new Glass.Half_Pint_Glass
    jug.fill_up(half_pint)
    jug.volume.should.equal Measures.empty
    half_pint.volume.should.equal 3 * Measures.one_fl_oz
