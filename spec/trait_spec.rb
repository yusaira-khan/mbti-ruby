require 'trait'
require 'preference'

RSpec.describe Trait do
  it 'construct from intials' do
    t = Trait.new(initials: 'enfp', role_name: 'Me')
    expect(t.mind).to eq('e')
    #expect(t.energy).to eq('n')
    #expect(t.nature).to eq('f')
    #expect(t.tactics).to eq('p')
    #expect(t.initials).to eq('enfp')
    #expect(t.role_name).to eq('Me')
    #expect(t.link).to eq('Me')
  end
end
