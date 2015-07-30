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

  # Removes "Agenda for" - need to remove any locations next
  date = h.sub(/^Agenda\ for\ /, '')
  puts date
end
