class Speaker < ActiveRecord::Base
  has_and_belongs_to_many :talks

  def self.find_by_name_or_unknown(name)
    speaker = Speaker.find_by(name: name)
    return Speaker.find_by(name: 'Unknown person') if speaker.blank?
    speaker
  end
end
