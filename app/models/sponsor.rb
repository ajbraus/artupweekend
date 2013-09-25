class Sponsor < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :url, :email, :event_id, :logo

  has_attached_file :logo,
         :styles => { 
            :medium => "100x100#",
            },
         :storage => :s3,
         :s3_credentials => { :access_key_id => ENV['S3_ACCESS_KEY'], :secret_access_key => ENV['S3_SECRET_KEY'], :bucket => "bankmybiz"},
         :path => "sponsor_logos/:id/avatar.:extension",
         :default_url => "https://s3.amazonaws.com/artupweekend/default_logo.png"

  validates :logo,   :attachment_presence => true,
                     :attachment_content_type => { :content_type => [ 'image/png', 'image/jpg', 'image/gif', 'image/jpeg' ] }

end
