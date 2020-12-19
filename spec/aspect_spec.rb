require 'preference'
require 'aspect'



RSpec.describe Aspect do
  it 'construct' do
    Aspect.new(name:'mind',l:'i',r:'e',link:'www.google.com')
  end
end
