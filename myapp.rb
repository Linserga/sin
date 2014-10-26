require 'sinatra'
require 'mongoid'

configure do
  Mongoid.load!("./mongoid.yml")
end

class State
  include Mongoid::Document
 
  field :title,   type: String  
end

get '/memory' do
	State.create(title: `free -m`)
	`free -m`
end

get '/disk' do
	State.create(title: `df -h`)
	`df -h `
end

get '/state' do
	  
end
