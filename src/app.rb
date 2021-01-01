require 'sinatra'
get '/' do
  # matches "GET /posts?i=foo&author=bar"
  title = params['title']
    author = params['author']
  'Hello world!'

end
