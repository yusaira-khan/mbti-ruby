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
