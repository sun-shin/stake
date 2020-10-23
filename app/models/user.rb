class User < ApplicationRecord
  has_secure_password
  
  has_many :event_users
  has_many :events
  has_many :attending_events, :through => :event_users, :source => :event
  

  validates :email, presence: true, uniqueness: true
end
