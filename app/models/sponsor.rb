class Sponsor < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :url, :email
end
