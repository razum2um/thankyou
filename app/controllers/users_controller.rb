class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @for_me = Card.where(user_id: @user.id)
    @by_me  = Card.where(author_id: @user.id)
  end
end
