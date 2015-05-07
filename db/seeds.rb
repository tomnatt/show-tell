# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

speaker_list = [
  'Tom N',
  'Phil',
  'Liam',
  'Kelv',
  'Dan',
  'Miles',
  'Charlotte',
  'Iris',
  'Ross',
  'Tom T',
  'Rich',
  'Chris',
  'Justin',
  'Paul',
  'Rhian',
  'Hanna'
]

speaker_list.each do |name|
  Speaker.create(name: name)
end
