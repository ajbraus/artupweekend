class Event < ActiveRecord::Base
  attr_accessible :img_url, :location, :name, :starts_at, :subdomain
  has_many :attendees, through: :attendees
  has_one :organizer, through: :users
  validates :location, :name, :subdomain, :starts_at, :img_url, presence: true

  def start_date
  	self.starts_at.strftime "%b %e"
  end
end
