require 'dotenv'
Dotenv.load

require 'sequel'

db_user = ENV['DB_USER']
db_password = ENV['DB_PASSWORD']
db_host = ENV['DB_HOST']
db_name = ENV['DB_NAME']

DB = Sequel.connect("postgres://#{db_user}:#{db_password}@#{db_host}/#{db_name}")