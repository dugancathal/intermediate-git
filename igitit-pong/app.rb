require 'sinatra'
require 'json'

get '/ping' do
  {pong: true}.to_json
end

