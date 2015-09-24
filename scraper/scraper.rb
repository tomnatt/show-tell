require 'nokogiri'
require 'open-uri'
require 'uri'
require 'yaml'

def create_talk_yaml(target_url, output_filename)
  # Open the page
  doc = Nokogiri::HTML(open("#{target_url}"))

  output = []

  # Gets h2 and the next element
  doc.xpath('//div[@id="main-content"]//h2').each do |header|
    h = header.content.chomp

    # Removes "Agenda for" and stuff in parentheses at the end
    datestr = h.sub(/\AAgenda\ for\ /, '').sub(/\ *\([a-zA-Z0-9 ]*\)\z/, '').chomp

    # Turns the date string into datetime
    date = DateTime.parse(datestr)

    # Gets the contents of each following list item and spits them out
    list = header.next_element.children
    list.each do |item|
      talk_details = item.content.chomp.split('(')
      talk_name = talk_details[0].gsub(/[[:space:]]+\z/, '')
      # speakers = talk_details[1].sub(/\)/, '').split(', ')

      output << {
        'title' => talk_name,
        'date' => date.strftime("%Y-%m-%d")
      }
    end
  end

  output_file = File.join(Dir.pwd, 'db/wiki_data', output_filename)
  File.open(output_file, 'w') { |f| f.write(output.to_yaml) }
end

show_tell_pages = [
                    # ['https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+2013', 'talks-2013.yml'],
                    ['https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+2014', 'talks-2014.yml'],
                    ['https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+agenda', 'talks-2015.yml'],
                  ]

show_tell_pages.each do |year|
  puts "#{year[1]}"
  create_talk_yaml(year[0], year[1])
end