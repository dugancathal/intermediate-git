require 'sinatra'
require 'json'

$pings = []

post '/pings' do
  $pings << {created_at: Time.now}
  {pong: true}.to_json
end

get '/pings' do
  $pings.to_json
end
