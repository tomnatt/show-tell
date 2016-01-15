# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Load user files
data = YAML.load_file(File.join(Rails.root, 'db', 'raw_data', 'speakers.yml'))
Speaker.create!(data)

# Load all the talks files
Dir[File.join(Rails.root, 'db', 'raw_data', 'wiki', '*.yml')].each do |seed_file|
  data = YAML.load_file(seed_file)
  Talk.create!(data)
end
