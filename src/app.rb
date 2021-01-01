require 'sinatra'
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'preference'
require 'aspect'
require 'trait'
require 'optparse'
require 'sanitizer'
require 'personality'

get '/' do
  'Hello world!'
end
get '/table' do
  # matches "GET /table?i=foo&n=bar&t=baz&j=fop"
  l=params.fetch_values('i', 'n', 't', 'j')
  per = Personality.new
  fl = l.map(&Kernel.method(:sanitize_per))
  per = Personality.new
  per.quick_htm!(fl)
end
