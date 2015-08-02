require 'nokogiri'
require 'open-uri'
require 'uri'

# Get the URL
puts 'Who you gonna scrape?'
target = gets.chomp

# Open the page
doc = Nokogiri::HTML(open("#{target}"))

# Gets h2 and the next element
doc.xpath('//div[@id="main-content"]//h2').each do |header|
  h = header.content.chomp

  # Removes "Agenda for" and stuff in parentheses at the end
  datestr = h.sub(/^Agenda\ for\ /, '').sub(/\ *\([a-zA-Z0-9 ]*\)$/, '').chomp

  # Turns the date string into datetime
  date = DateTime.parse(datestr)
  puts date.strftime('%v')

  # Gets the contents of each following list item and spits them out
  list = header.next_element.children
  list.each do |item|
    puts item.content.chomp
  end
end