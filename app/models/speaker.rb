class Speaker < ActiveRecord::Base
  has_and_belongs_to_many :talks

  def self.find_by_name_or_unknown(name)
    speaker = Speaker.find_by(name: name)
    logger.info { "Name: #{name}" } if speaker.blank?
    return Speaker.find_by(name: 'Unknown person') if speaker.blank?
    speaker
  end

  def self.all_by_year(year)
    # can use "extract" in where if we move away from sqlite
    Speaker.joins(:talks)
           .where("cast(strftime('%Y', talks.date) as int) = ?", year)
           .distinct
  end
end
