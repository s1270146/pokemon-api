require 'sinatra/base'
require 'sinatra/namespace'
require 'json'

class PropertyRoutes < Sinatra::Base
  register Sinatra::Namespace
  namespace '/api/v1' do
    get '/property' do
      properties = [
        { id: 1, name: 'かいりき'},
        { id: 2, name: 'てきど'}
      ]
      properties.to_json
    end
  end
end