class Event < ActiveRecord::Base
  attr_accessible :img_url, :location, :name, :starts_at
  has_many :attendees, through: :attendees
  has_one :organizer, through: :users
  validates :location, :name, :starts_at, :img_url, presence: true
end
