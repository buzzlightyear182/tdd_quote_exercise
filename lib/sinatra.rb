require 'sinatra'
require 'json'
require_relative 'quote'

get '/' do
	erb :index
end

post '/quotes' do
	@json = JSON.parse(request.body.read)
	vehicle = @json["quote"]["vehicle"]

	@quote = Quote.new vehicle
	@quote.from = @json["quote"]["from"]
	@quote.to = @json["quote"]["to"]

	puts @quote.price
end