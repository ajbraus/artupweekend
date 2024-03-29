class Event < ActiveRecord::Base
  attr_accessible :img_url, :location, :name, :starts_at, :subdomain, :campaign_url, :video_url, :website_url, :tickets_url, :facebook_page_url, :twitter_handle, :description
  
  has_many :rsvps, dependent: :destroy
  has_many :guests, through: :rsvps, source: :guest

  has_many :volunteers, dependent: :destroy
  has_many :teammates, through: :volunteers, source: :teammate
  has_many :organizers, through: :volunteers, source: :teammate, conditions: { "volunteers.organizer" => true }

  has_many :sponsors
  has_many :prizes

  validates :name, presence: true
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  def start_date
  	if starts_at.present?
      self.starts_at.strftime "%b %e"
    else
      "TBD"
    end
  end

  def end_date
    (self.starts_at + 2.days).strftime "%b %e"
  end

  def date_range
    if starts_at.present?
      self.start_date + " - " + self.end_date
    else 
      "TBD"
    end
  end
end
