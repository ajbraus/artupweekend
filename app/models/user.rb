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

  has_many :rsvps, foreign_key: "guest_id", dependent: :destroy
  has_many :plans, through: :rsvps, source: :event

  has_many :volunteers, foreign_key: "teammate_id", dependent: :destroy
  has_many :volunteered_events, through: :volunteers, source: :event

  has_many :commitments, foreign_key: "committed_user_id", dependent: :destroy
  has_many :committed_tos, through: :commitments, source: :commitment
  
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

  def rsvp!(event)
    rsvp = self.rsvps.create(event_id: event.id)
  end

  def volunteer!(event, leader)
    volunteer = self.volunteers.create(event_id: event.id, organizer: leader)
  end

  def is_organizer?
    return Volunteer.where(organizer: true, teammate_id: self.id).any?
  end
end
