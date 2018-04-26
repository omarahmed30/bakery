require "sinatra"
require "sinatra/reloader"
require 'sendgrid-ruby'
include SendGrid



get '/' do
    
erb :index
end

get '/cookies' do
    "Hello World"

    erb :cookies
end

get '/cupcakes' do

    erb :cucakes
end

get '/muffins' do

    erb :muffins
end

get '/catlog' do

    erb :catlog
end