class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :user
  has_many :event_tags
  has_many :tags, through: :event_tags 

  validates :title, presence:true, uniqueness:true
  validates :description, length: { in: 5..250 }
  validates :address, presence:true
  
end
