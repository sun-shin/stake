class EventTag < ApplicationRecord
  belongs_to :tag
  belongs_to :event

  validates_uniqueness_of :tag_id, :scope => :event_id, message: "already exists in this event"
end
