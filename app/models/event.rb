class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :user
  has_many :event_tags
  has_many :tags, through: :event_tags 

  validates :title, presence:true, uniqueness:true
  validates :description, length: { in: 5..250 }
  validates :address, presence:true

  def openings
    @event_users = EventUser.all
    i = 0
    @event_users.map do |event_user|
      if event_user.event_id == event_id 
        i += 1
      end
    end
    i
  end
  
end
