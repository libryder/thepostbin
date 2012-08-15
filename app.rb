require 'rubygems'
require 'sinatra'
require 'mongo'
require 'mongo_mapper'
require 'json'
require 'haml'
require 'rack-flash'
require 'sinatra/logger'
require "sinatra/reloader"
require "uri"

class User
  include MongoMapper::Document

  key :name, String, :required => true
  key :email, String, :required => true
  key :password, String, :required => true

  many :posts
end

class Post
  include MongoMapper::EmbeddedDocument

  key :text, String, :required => true
  key :completed, Boolean
end

class ThePostBin < Sinatra::Base
  configure :production do
    db = URI.parse(ENV['MONGOHQ_URL'])
    db_name = db.path.gsub(/^\//, '')
    MongoMapper.connection = Mongo::Connection.new(db.host, db.port)
    MongoMapper.database = 'db_name'
  end

  # configure do
  #   MongoMapper.database = 'thepostbin'
  # end

  configure :development do
    MongoMapper.database = 'thepostbin'
    register Sinatra::Reloader
  end

  enable  :sessions, :logging
  use Rack::Flash
  set :haml, :format => :html5

  get '/' do

    @title = "ThePostBin - Home"

    if user_id = session[:user_id]
      @user = User.find(user_id)
    end
    haml :index
  end

  get '/posts' do
    haml :'posts/index'
  end

  # USERS

  post '/users/signup' do
    user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/users/login' do 
    auth = false

    if user = User.find_by_email(params[:email])
      if user.password = params[:password]
        auth = true
      end
    end
    
    if auth
      session[:user_id] = user.id
      flash[:message] = "Logged in!"
    else
      flash[:message] = "Your attempt to authenticate was a failure."
    end

    redirect '/'
  end

  get '/users/logout' do
    flash[:message] = "You have been logged out. Cya."
    session[:user_id] = nil
    redirect '/'
  end
end