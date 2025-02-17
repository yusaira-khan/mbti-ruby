require 'preference'
require 'aspect'

RSpec.describe Aspect do
  let(:i) { Preference.new(initial: 'i', name: 'In') }
  let(:e) { Preference.new(initial: 'e', name: 'Ex') }
  it 'construction opposites and left right' do
    a = Aspect.new(name: 'mind', l: i, r: e, link: 'www.google.com')
    expect(a.left).to eq(i)
    expect(a.right).to eq(e)
  end
  it 'percentage dominant' do
    i.opposite = e
    e.opposite = i
    a = Aspect.new(name: 'mind', l: i, r: e, link: 'www.google.com')
    i.sync_percent! 10
    expect(a.dominant).to eq(e)
  end
end

RSpec.describe AspectsRepository do
  it 'function' do
    # arrange
    MockPref = Struct.new(:collection)
    i = Preference.new(initial: 'i', name: 'In')
    e = Preference.new(initial: 'e', name: 'Ex')
    collection = { 'i' => i, 'e' => e }
    mock = MockPref.new(collection)
    row = { 'name' => 'mind', 'left' => 'i', 'right' => 'e', 'link' => '' }

    # act
    method = create_row_converter_with_preference mock
    aspect_hash = method.call(row)

    # assert
    aspect_key = aspect_hash[0]
    aspect = aspect_hash[1]
    expect(aspect.left).to eq(i)
    expect(aspect.right).to eq(e)
    expect(aspect_key).to eq('mind')
  end
  it 'construction' do
    p = PreferencesRepository.new
    a = AspectsRepository.new p
    expect(a.collection['mind'].name).to eq('mind')
  end
end
