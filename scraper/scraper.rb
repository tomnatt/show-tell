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
  h = header.content.chomp

  # Removes "Agenda for" and stuff in parentheses at the end
  datestr = h.sub(/^Agenda\ for\ /, '').sub(/\ *\([a-zA-Z0-9 ]*\)$/, '').chomp

  # Turns the date string into datetime
  date = DateTime.parse(datestr)
  puts date.strftime('%v')
end

# # Splits up each talk - coming back to this later

# doc.xpath('//div[@id="main-content"]//ul/li').each do |item|
#   x = item.content.chomp
#   speaker = x.gsub(/\(([a-zA-Z])\)$/, '\1')
#   puts speaker
# end
