require 'sinatra/base'
require 'sinatra/namespace'
require 'json'

require_relative '../../../config/database'

class PokemonRoutes < Sinatra::Base
  register Sinatra::Namespace
  namespace '/api/v1' do
    get '/pokemon' do
      content_type :json
      pokemons = DB[:pokemon].select(:pokemon_no, :pokemon_name, :img_url).all
      pokemons.to_json
    end
    get '/pokemon/:id' do
      content_type :json
      id = params[:id]

      pokemon = DB[:pokemon].where(pokemon_no: id).first
      if pokemon.nil?
        status 404
        return { error: "Pokemon not found" }.to_json
      end

      pokemon_descriptions = DB[:pokemon_descriptions].where(pokemon_no: id).all
      descriptions = pokemon_descriptions.map { |desc| desc[:description] }

      pokemon_properties = DB[:pokemon_properties].where(pokemon_no: id).all
      properties_ids = pokemon_properties.map { |prop| prop[:property_id]}
      properties = DB[:properties].where(property_id: properties_ids).all

      pokemon_types = DB[:pokemon_types].where(pokemon_no: id).all
      types_ids = pokemon_types.map { |type| type[:type_id]}
      types = DB[:types].where(type_id: types_ids).all

      response = pokemon.to_hash.merge(
        descriptions: descriptions,
        properties: properties,
        types: types
      )
      response.to_json
    end
  end
end