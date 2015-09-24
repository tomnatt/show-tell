# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# load all the talks files
Dir[File.join(Rails.root, 'db', 'wiki_data', '*.yml')].each do |seed_file|
  config = YAML::load_file(seed_file)
  Talk.create!(config)
end