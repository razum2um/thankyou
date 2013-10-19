class Card < ActiveRecord::Base
  belongs_to :user
  validates :greeting, :message, presence: true
end
