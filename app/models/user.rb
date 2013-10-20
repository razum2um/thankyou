class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :registerable,
  # :recoverable, :rememberable,
  devise :omniauthable, :trackable

  has_many :user_tokens

  def to_s
    name
  end
end
