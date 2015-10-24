require "etsiest/version"
require "sinatra/base"
require "etsy"
require "pry"

Etsy.api_key = ENV['ETSY_KEY']

module Etsiest
  class App < Sinatra::Base
    set :logging, true


    get "/search" do
    	data = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'psychadelic')
    	
		erb :tweEtsy, locals: { data: data.result }
	end

   
    run! if app_file == $0
	end


end
