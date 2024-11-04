require 'sinatra/base'
require 'sinatra/namespace'
require 'json'

require_relative '../../../config/database'

class PropertyRoutes < Sinatra::Base
  register Sinatra::Namespace
  namespace '/api/v1' do
    get '/property' do
      content_type :json
      properties = DB[:properties].all
      properties.to_json
    end
  end
end