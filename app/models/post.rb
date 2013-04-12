class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :body, :title, :tag_list
  acts_as_taggable
  acts_as_voteable
  validates :title, :tag_list, presence: true

  def short_body
    if self.body.size >=200
      self.body.slice(0..200) + "..."
    else
      self.body
    end
  end

  def nice_created_at
    self.created_at.strftime "%b %e, %l:%M%P"
  end
end
