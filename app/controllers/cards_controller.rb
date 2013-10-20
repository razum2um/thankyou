class CardsController < InheritedResources::Base
  skip_before_filter :authenticate_user!, :only => [:new]

  def create
    @card = build_resource
    @card.author = current_user
    create!
  end

  protected

  def resource_params
    return [{}] if action_name == 'new'
    [params.require(:card).permit(:message, :public)]
  end
end
