require 'CGI'
require 'json'
require 'sinatra'
require 'sinatra/content_for'
require 'pry-remote'

get '/' do
	erb :index
end

get '/:og_encoded_string' do
	begin
		@og_params = JSON.load(params[:og_encoded_string])
		erb :graph
	rescue JSON::ParserError
		'Invalid JSON!'
	end
end

def h(html)
	CGI.escapeHTML html
end
