require 'nokogiri'
require 'open-uri'
require 'uri'
require 'yaml'

# Get the URL
puts 'Who you gonna scrape?'
target = gets.chomp

# Open the page
doc = Nokogiri::HTML(open("#{target}"))

output = ''

# Gets h2 and the next element
doc.xpath('//div[@id="main-content"]//h2').each do |header|
  h = header.content.chomp

  # Removes "Agenda for" and stuff in parentheses at the end
  datestr = h.sub(/^Agenda\ for\ /, '').sub(/\ *\([a-zA-Z0-9 ]*\)$/, '').chomp

  # Turns the date string into datetime
  date = DateTime.parse(datestr)

  # Gets the contents of each following list item and spits them out
  list = header.next_element.children
  list.each do |item|
    talk_details = item.content.chomp.split('(')
    talk_name = talk_details[0].gsub(/[[:space:]]+$/, '')
    # speakers = talk_details[1].sub(/\)/, '').split(', ')

    output += '- title: ' + talk_name
    output += "\n  date: " + date.strftime('%Y-%m-%d') + "\n\n"
  end
end

output_file = File.join(Dir.pwd, '../db/wiki_data/talks.yml')
File.open(output_file, 'w+') { |f| f.write(output) }

puts 'Done!'
