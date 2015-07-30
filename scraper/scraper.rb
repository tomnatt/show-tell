require 'nokogiri'
require 'open-uri'
require 'uri'

# Get the URL
puts 'Who you gonna scrape?'
target = gets.chomp

# Open the page
doc = Nokogiri::HTML(open("#{target}"))

# Gets dates and spits them out
doc.xpath('//div[@id="main-content"]//h2').each do |header|
  h = header.content

  # Removes "Agenda for" and stuff in parentheses at the end
  date = h.sub(/^Agenda\ for\ /, '').sub(/\ *\([a-zA-Z0-9 ]*\)$/, '').chomp
  puts date
end
