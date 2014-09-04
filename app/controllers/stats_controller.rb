class StatsController < ApplicationController
  def speakers
    speakers_data = Speaker.all
    @speakers = Array.new
    @speakers_count = Array.new

    speakers_data.each do |s|
      @speakers << s.name
      @speakers_count << s.talks
    end
  end
end
