class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :content, :user_id
  acts_as_voteable
  validates :content, presence: true

  def nice_created_at
    self.created_at.strftime "%b %e, %l:%M%P"
  end
end
