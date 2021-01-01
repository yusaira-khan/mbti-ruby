$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'preference'
require 'personality'
require 'aspect'
require 'trait'
require 'optparse'
require 'sanitizer'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on('-l','--list_as_intj i,n,t,j',Array) do |l|
    options[:l] = l
  end
end.parse!

if options.has_key?(:l)
  l = options[:l]
  unless l.length == 4
    raise "given #{l.length} not 4"
  end
  fl = l.map(&Kernel.method(:sanitize_per))
  per = Personality.new
  puts per.quick!(fl)
end
