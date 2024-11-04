# test_connection.rb

require_relative 'config/database'

begin
  # テストクエリを実行します。たとえば、データベースのバージョンを取得してみましょう。
  version = DB.fetch('SELECT version()').first
  puts "Successfully connected to the database. Version: #{version[:version]}"
rescue Sequel::DatabaseError => e
  puts "Failed to connect to the database. Error: #{e.message}"
end