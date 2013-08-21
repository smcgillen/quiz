# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  email               :string(255)
#  password_digest     :string(255)
#  location            :text
#  longitude           :float            default(0.0)
#  latitude            :float            default(0.0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :location, :email, :password_confirmation, :password

  has_many :exams, :dependent => :destroy, :order => "created_at DESC"
  has_many :attempts, :inverse_of => :user, :dependent => :destroy, :order => "created_at DESC"

  #Paperclip avatar
  attr_accessible :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates :avatar, presence: true

  delegate :avatar, :to => :user, :prefix => true, :allow_nil => true

  def user_avatar
    user.avatar if user
  end

private
  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
        self.latitude = result.latitude #set latitude and longitude to our model before we save, whenever they enter an address
        self.longitude = result.longitude
      end
    end
end
