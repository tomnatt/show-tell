class Talk < ActiveRecord::Base
  has_and_belongs_to_many :speakers
end
