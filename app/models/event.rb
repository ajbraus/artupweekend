class Event < ActiveRecord::Base
  attr_accessible :img_url, :location, :name, :starts_at, :subdomain, :campaign_url, :video_url
  
  has_many :rsvps, dependent: :destroy
  has_many :guests, through: :rsvps, source: :guest

  has_many :volunteers, dependent: :destroy
  has_many :teammates, through: :volunteers, source: :teammate
  has_many :organizers, through: :volunteers, source: :teammate, conditions: { organizer: true }

  has_many :sponsors
  has_many :prizes

  validates :location, :name, presence: true
  
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
