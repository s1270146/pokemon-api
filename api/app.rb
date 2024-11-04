require 'sinatra'
require 'json'
require_relative 'app/api/v1/pokemon_routes'
require_relative 'app/api/v1/property_routes'
require_relative 'app/api/v1/type_routes'

class App < Sinatra::Base
    get '/' do
      'This is Unofficial Pokemon API'
    end

    use PokemonRoutes
    use PropertyRoutes
    use TypeRoutes

    not_found do  
      content_type :json
      { error: 'Not Found' }.to_json
    end
end