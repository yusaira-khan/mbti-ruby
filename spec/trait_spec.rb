require 'trait'
require 'preference'

MockPrefsC = Struct.new(:collection)
RSpec.describe Trait do
  it 'construct from intials' do
    #arrange
    collection = {'e'=>:e, 'n'=>:n, 'f'=>:f, 'p'=>:p}
    mock = MockPrefsC.new(collection)

    #act
    t = Trait.new(initials: 'enfp', role_name: 'Me', prefs: mock)

    #assert
    expect(t.initials).to eq('enfp')
    expect(t.role_name).to eq('Me')
    expect(t.mind).to eq(:e)
    expect(t.energy).to eq(:n)
    expect(t.nature).to eq(:f)
    expect(t.tactics).to eq(:p)
    expect(t.link).to eq('https://www.16personalities.com/enfp-personality')
  end
  it 'Fraction' do
    #arrange
    MockPrefFrac = Struct.new(:adjust_frac)
    i = MockPrefFrac.new(0.9)
    c = {'i': i}
    mock = MockPrefsC.new(c)

    #act
    t = Trait.new(initials: 'iiii', role_name: '', prefs: mock)

    #assert
    expect(t.fraction).to eq(0.9**4)
  end

end
