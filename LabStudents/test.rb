require 'yaml'
require 'mysql2'

puts '--------------------------------'
puts 'Тест подключения к БД:'

db_conf = YAML.load_file('./LAB3/db_config/config.yaml').transform_keys(&:to_sym)
client = Mysql2::Client.new(db_conf)
results = client.query("SELECT * FROM student")
results.each { |row| puts row }