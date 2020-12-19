require 'trait'
require 'preference'

RSpec.describe Trait do
  it 'construct from intials' do
    #arrange
    collection = {'e'=>:e, 'n'=>:n, 'f'=>:f, 'p'=>:p}
    MockPref2 = Struct.new(:collection)
    mock = MockPref2.new(collection)

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
end
