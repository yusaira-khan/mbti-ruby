$LOAD_PATH.unshift(File.dirname(__FILE__)) +'/src'
require 'sinatra'
require 'preference'
require 'aspect'
require 'trait'
require 'optparse'
require 'sanitizer'
require 'personality'

get '/' do
erb :index
end
get '/table' do
  # matches "GET /table?i=foo&n=bar&t=baz&j=fop"
  l=params.fetch_values('i', 'n', 't', 'j')
  fl = l.map(&Kernel.method(:sanitize_per))
  person = Personality.new
  @traits = person.quick_erb!(fl)
  erb :table
end
