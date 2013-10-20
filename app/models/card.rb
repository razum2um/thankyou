class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, class_name: 'User'
  validates :message, :author, presence: true
end
