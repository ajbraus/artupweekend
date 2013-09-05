class Rsvp < ActiveRecord::Base
  attr_accessible :event_id, :guest_id

  belongs_to :guest, class_name: "User"
  belongs_to :event

  validates :guest_id, presence: true
  validates :event_id, presence: true
end
