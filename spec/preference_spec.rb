require 'preference'
require 'csv'

RSpec.describe PreferencesCollection do
  let(:p) { PreferencesCollection.new }
  it 'validate csv read' do
    expect(p.collection['i'].name).to eq('Introverted')
  end
end


RSpec.describe Preference do
  let(:intro) { Preference.new(name: 'Intro', initial: 'i') }
  let(:extro) { Preference.new(name: 'Extro', initial: 'e') }
  it 'synced%' do
    intro.opposite = extro
    intro.sync_percent 10
    expect(intro.display_percent).to eq('10.00%')
    expect(extro.display_percent).to eq('90.00%')
  end
  it 'adjusted %' do
    intro.opposite = extro
    intro.sync_percent 10
    expect(intro.display_adjusted_percent).to eq('10.40%')
    expect(extro.display_adjusted_percent).to eq('89.60%')
  end
  it 'formating' do
    intro.opposite = extro
    intro.sync_percent 10
    expect(intro.as_formatted_text).to eq('Intro(I): 10.40%')
    expect(extro.as_formatted_text).to eq('Extro(E): 89.60%')
  end
end
