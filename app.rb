require 'rubygems'
require 'sinatra'
require 'mongo'
require 'json'

DB = Mongo::Connection.new.db("thepostbin", :pool_size => 5,  
  :timeout => 5)  

get '/' do
  haml :index
end

get '/posts' do
  haml :'posts/index'
end