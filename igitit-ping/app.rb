require 'sinatra'
require 'json'

get '/ping' do
  {ping: true}.to_json
end

