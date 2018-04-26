require "sinatra"
require "sinatra/reloader"
require 'sendgrid-ruby'
include SendGrid



get '/' do
    
erb :index
end

get '/cookies' do

    erb :cookies
end

get '/cupcake' do

    erb :cupcake
end

get '/muffins' do

    erb :muffins
end

get '/catlog' do

    erb :catlog
end






post "/catlog" do 
    description = " <h2> Cookies $5.99/ Dozen  <br>  Muffins $6.99/ Dozen <br> Cakes $59.99 / Pound </h2>"
    puts params.inspect
    from = Email.new(email:'oahmed103140@gmail.com')
    to = Email.new(email:params[:email])
    subject = params[:name]
    content = Content.new(type: 'text/html', value: description )
    mail = Mail.new(from, subject, to, content )
    
    sg = SendGrid::API.new(api_key:ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    # puts response.parsed_body
    puts response.headers
    erb :index
    end