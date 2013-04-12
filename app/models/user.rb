class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  acts_as_voter
  has_karma(:posts, as: :user)
  has_many :posts
  has_many :comments
  belongs_to :event
  validates :name, :username, presence: true
end
