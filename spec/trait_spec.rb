require 'trait'
require 'preference'

delta=0.0000001
RSpec.describe Trait do
  it 'construct from intials' do


    t = Trait.new(initials: 'enfp', role_name: 'Me', relevant_prefs:[:e,:n,:f,:p])

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

    #act
    t = Trait.new(initials: 'abcd', role_name: '', relevant_prefs: [i,i,i,i])

    #assert
    expect(t.fraction).to  be_within(delta).of(0.9**4)
  end
  it 'Full Construction' do
    #arrange
    p = PreferencesRepository.new

    #act
    t = TraitsRepository.new p

    #assert
    expect(t.collection['infp'].initials).to eq('infp')
    expect(t.collection['infp'].role_name).to eq('Mediator')
  end

end
