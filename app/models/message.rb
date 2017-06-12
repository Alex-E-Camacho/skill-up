class Message < ApplicationRecord
  belongs_to :apprenticeship
  belongs_to :user
  validates_presence_of :body, :apprenticeship_id, :user_id


  # def message_time
  # created_at.strftime(“%m/%d/%y at %l:%M %p”)
  # end
end
