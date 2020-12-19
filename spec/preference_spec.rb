require 'preference'
require 'csv'

RSpec.describe PreferencesList do
  it 'constructor empty' do
    p = PreferencesList.new
  end
  it 'can read csv now' do
    table = CSV.parse(File.read('./data/preference.csv'), headers: true)
    expect(table[0]['name']).to eq('Introverted')
    expect(table[0]['initial']).to eq('i')
    expect(table[0]['aspect']).to eq('mind')
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
