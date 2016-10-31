# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Load user files unless we already have users
if Speaker.count == 0
  data = YAML.load_file(File.join(Rails.root, 'db', 'raw_data', 'speakers.yml'))
  Speaker.create!(data)
end
