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
  it 'synced %' do
    intro.opposite = extro
    intro.sync_percent 10
    expect(intro.display_percent).to eq('10.0%')
    expect(extro.display_percent).to eq('90.0%')
    expect(intro.as_formatted_text).to eq('Intro(I): 10.0%')
  end
end
