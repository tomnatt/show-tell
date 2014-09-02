class StatsController < ApplicationController
  def speakers
    speakers = Speaker.all
    @speaker_stats = speakers.to_json
  end
end
