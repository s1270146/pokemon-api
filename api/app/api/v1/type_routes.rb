require 'sinatra'
require 'sinatra/namespace'
require 'json'

class TypeRoutes < Sinatra::Base
  register Sinatra::Namespace
  namespace '/api/v1' do
    get '/type' do
      types = [
        {id:1, name: 'test1'},
        {id:2, name: 'test2'}
      ]
      types.to_json
    end
  end
end