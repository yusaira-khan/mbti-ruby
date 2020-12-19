require 'preference'
require 'aspect'



RSpec.describe Aspect do
  let(:i) {Preference.new(initial:'i', name:'In')}
  let(:e) {Preference.new(initial:'e', name:'Ex')}
  it 'construction opposites and left right' do
    a = Aspect.new(name: 'mind', l: i, r: e, link: 'www.google.com')
    expect(i.opposite).to eq(e)
    expect(e.opposite).to eq(i)
    expect(a.left).to eq(i)
    expect(a.right).to eq(e)
  end
  it 'percentage dominant' do
    a = Aspect.new(name: 'mind', l: i, r: e, link: 'www.google.com')
    i.sync_percent 10
    expect(a.dominant).to eq(e)
  end
end
