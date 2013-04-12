class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :content, :user_id
  acts_as_voteable
  validates :content, presence: true
end
