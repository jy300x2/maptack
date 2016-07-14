class Map < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode
end
