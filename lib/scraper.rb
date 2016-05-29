require 'open-uri'

module Scraper
  def self.scrape_all_talks
    show_tell_pages = [
      'https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+2013',
      'https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+2014',
      'https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+2015',
      'https://wiki.bath.ac.uk/display/webservices/Show+and+Tell+agenda'
    ]

    show_tell_pages.each do |page|
      create_talk(page)
    end
  end

  def self.create_talk(target_url)
    # Open the page
    doc = Nokogiri::HTML(open(target_url))

    # Gets h2 and the next element
    doc.xpath('//div[@id="main-content"]//h2').each do |header|
      h = header.content.chomp

      # Removes "Agenda for" and stuff in parentheses at the end
      date_str = h.sub(/\AAgenda\ for\ /, '').sub(/\ *\([a-zA-Z0-9 ]*\)\z/, '').chomp

      # Turns the date string into datetime
      date = DateTime.parse(date_str).in_time_zone

      # Skip on if this is a talk from The Future
      next if date > DateTime.current

      # Gets the contents of each following list item and spits them out
      list = header.next_element.children
      list.each do |item|
        talk_details = item.content.chomp.split('(')
        talk_name = talk_details[0].gsub(/[[:space:]]+\z/, '')

        # Find list of speakers and convert to corresponding objects
        speaker_names = talk_details[1].sub(/\).*/, '').split(', ').map { |s| s.downcase.tr(' ', '_') }
        speakers = []
        speaker_names.each do |name|
          speakers << Speaker.find_by_name_or_unknown(name)
        end

        # Create the Talk object
        talk = Talk.new
        talk.title = talk_name
        talk.date = date
        talk.speakers = speakers
        talk.save!
      end
    end
  end
end
