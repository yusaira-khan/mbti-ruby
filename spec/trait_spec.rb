require 'trait'
require 'preference'

delta=0.0000001
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
    c = {'a'=> i,'b'=> i, 'c'=> i, 'd'=> i}
    mock2 = MockPrefsC.new(c)

    #act
    t = Trait.new(initials: 'abcd', role_name: '', prefs: mock2)

    #assert
    expect(t.fraction).to  be_within(delta).of(0.9**4)
  end
  it 'Full Construction' do
    p = PreferencesCollection.new
    t = TraitsList.new p
    expect(t.collection['infp'].initials).to eq('infp')
    expect(t.collection['infp'].role_name).to eq('Mediator')
  end

end
