class EventApplication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :contributions, :goals, :heard_of_us, :where, :who, :why, :venue
  validates :contributions, :goals, :heard_of_us, :where, :who, :why, presence: true
end
