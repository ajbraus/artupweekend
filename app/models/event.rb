class Event < ActiveRecord::Base
  attr_accessible :img_url, :location, :name, :starts_at, :subdomain
  has_many :attendees, through: :attendees
  has_one :organizer, through: :users
  validates :location, :name, :subdomain, :starts_at, :img_url, presence: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  def start_date
  	self.starts_at.strftime "%b %e"
  end

  def end_date
    (self.starts_at + 2.days).strftime "%b %e"
  end

  def date_range
    self.start_date + " - " + self.end_date
  end
end
