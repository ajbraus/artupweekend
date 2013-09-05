class Volunteer < ActiveRecord::Base
  attr_accessible :event_id, :teammate_id, :organizer

  belongs_to :teammate, class_name: "User"
  belongs_to :event

  validates :teammate_id, presence: true
  validates :event_id, presence: true
end
