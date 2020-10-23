# Event.create!([
#   {title: "Basketball Tournament Help", user_id: 1, description: "clean-up and registration", address: "123 Place Street", attendee_limit: 20},
#   {title: "Lakefront Clean-up", user_id: 2, description: "pick up loose trash on beaches and lakefront trail", address: "42 Michigan Avenue", attendee_limit: 150},
#   {title: "Flu-Shot Aide", user_id: 2, description: "help with registration", address: "23 W Taylor Street", attendee_limit: 8}
# ])

# Tag.create!([
#   {name: "environment"},
#   {name: "sports"},
#   {name: "health"},
#   {name: "youth"}
# ])

# EventUser.create!([
#   {user_id: 1, event_id: 2},
#   {user_id: 1, event_id: 3},
#   {user_id: 2, event_id: 1}
# ])

# EventTag.create!([
#   {event_id: 1, tag_id: 2}, 
#   {event_id: 1, tag_id: 4}, 
#   {event_id: 2, tag_id: 1}, 
#   {event_id: 3, tag_id: 3}, 
# ])