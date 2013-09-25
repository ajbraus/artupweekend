class Prize < ActiveRecord::Base
  belongs_to :event
  attr_accessible :title, :event_id
  validates :title, presence: true
end
