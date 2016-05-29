class StatsController < ApplicationController
  def speakers_count
    @speakers = Speaker.all.sort_by { |s| s.talks.count }.reverse
  end

  def speakers
    speakers_data = Speaker.all
    # sort by name
    # speakers_data.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    speakers_data.order!(:name)

    @speakers = []
    @speakers_count = []

    speakers_data.each do |s|
      @speakers << s.name
      @speakers_count << s.talks
    end
  end
end
