class Prize < ActiveRecord::Base
  belongs_to :event
  attr_accessible :title
  validates :title, presence: true
end
