class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :user
  has_many :event_tags
  has_many :tags, through: :event_tags 

  validates :title, presence:true, uniqueness:true
  validates :description, length: { in: 5..250 }
  validates :address, presence:true
  validates :event_start, presence: true
  validates :duration, numericality: true

  def openings
    @event_users = EventUser.all
    
    count = 0
    @event_users.map do |event_user|
      if event_user.event_id == id 
        count += 1
      end
    end
    attendee_limit - count
  end
  
end
