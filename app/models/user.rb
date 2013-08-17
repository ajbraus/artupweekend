class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

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
  has_many :event_applications
  
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true, email: true

  after_create :send_welcome

  def send_welcome
    Notifier.welcome(self)
  end

  def first_name
    self.name.split(' ')[0]
  end
end
