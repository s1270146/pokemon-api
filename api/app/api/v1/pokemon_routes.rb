require 'sinatra/base'
require 'sinatra/namespace'
require 'json'

class PokemonRoutes < Sinatra::Base
  register Sinatra::Namespace
  namespace '/api/v1' do
    get '/pokemon' do
      pokemons = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' }
      ]
      if params['max'] then
        puts params['max']
      end
      pokemons.to_json
    end
    get '/pokemon/:id' do
      puts params[:id]
    end
  end
end