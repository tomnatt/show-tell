class Speaker < ActiveRecord::Base
  has_and_belongs_to_many :talks

  def self.find_by_name_or_unknown(name)
    speaker = Speaker.find(name: name)
    if speaker.blank?
      speaker = Speaker.find(name: 'Unknown person')
    end
  end
end
