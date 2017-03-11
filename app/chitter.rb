ENV["RACK_ENV"] ||= 'development'
#env = ENV['RACK_ENV'] || 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/peep'
require './app/models/user'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super_secret'
  use Rack::MethodOverride



# Start the server if ruby file executed directly
run! if app_file == $0

end
