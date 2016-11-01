class StatsController < ApplicationController
  def speakers_count
    @speakers = Speaker.all.sort_by { |s| s.talks.count }.reverse
    @total_talks = Talk.all.count
  end

  def by_year
    @year = year_params['year']
    redirect_to root_path unless @year =~ /\d{4}/

    @speakers = []
    Speaker.all_by_year(@year).each do |speaker|
      @speakers << {
        speaker: speaker,
        talks: speaker.talks.by_year(@year)
      }
    end

    @speakers = @speakers.sort_by { |s| s[:talks].count }.reverse
    @total_talks = Talk.by_year(@year).count
  end

  def by_speaker
    redirect_to root_path unless speaker_params[:speaker] =~ /\d+/
    @speaker = Speaker.find(speaker_params[:speaker])
    @talks = @speaker.talks.order(date: :desc)
  end

  def by_speaker_year
    @year = year_params['year']
    redirect_to root_path unless @year =~ /\d{4}/
    redirect_to root_path unless speaker_params[:speaker] =~ /\d+/

    @speaker = Speaker.find(speaker_params[:speaker])
    @talks = @speaker.talks.by_year(@year).order(date: :desc)
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

  def speaker_params
    params.permit(:speaker)
  end

  def year_params
    params.permit(:year)
  end
end
