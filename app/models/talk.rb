class Talk < ActiveRecord::Base
  has_and_belongs_to_many :speakers

  scope :by_year, -> (year) { where("cast(strftime('%Y', talks.date) as int) = ?", year) }
end
