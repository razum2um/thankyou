class CardsController < InheritedResources::Base
  skip_before_filter :authenticate_user!, only: [:new]
  load_and_authorize_resource except: [:new, :create]

  def create
    @card = build_resource
    @card.author = current_user
    @card.save
    create!
  end

  protected

  def resource_params
    return [{}] if action_name == 'new'
    [params.require(:card).permit(
      :message, :public,
      :img_url, :img_width, :img_height,
      :tb_url, :tb_width, :tb_height,
      :background_position_x, :background_position_y
    )]
  end
end
