require 'sinatra'
require 'sinatra/namespace'
require 'json'

require_relative '../../../config/database'

class TypeRoutes < Sinatra::Base
  register Sinatra::Namespace
  namespace '/api/v1' do
    get '/type' do
      content_type :json
      types = DB[:types].all
      types.to_json
    end
  end
end