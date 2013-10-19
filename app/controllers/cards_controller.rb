class CardsController < InheritedResources::Base
  protected
  def resource_params
    return [{}] if action_name == 'new'
    [params.require(:card).permit(:greeting, :message, :public)]
  end
end
