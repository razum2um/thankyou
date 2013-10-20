class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :registerable,
  # :recoverable, :rememberable,
  devise :omniauthable, :trackable

  has_many :user_tokens

  def has_social?(social)
    providers.include?(social.to_s)
  end

  def providers
    @providers ||= user_tokens.pluck(:provider)
  end

  def to_s
    name
  end
end
