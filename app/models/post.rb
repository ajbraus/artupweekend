class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :body, :title
  acts_as_voteable
  validates :title, presence: true

  def short_body
    if self.body.size >=200
      self.body.slice(0..200) + "..."
    else
      self.body
    end
  end
end
