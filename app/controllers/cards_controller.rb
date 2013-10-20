class CardsController < InheritedResources::Base
  skip_before_filter :authenticate_user!, :only => [:new]

  protected

  def resource_params
    return [{}] if action_name == 'new'
    [params.require(:card).permit(:greeting, :message, :public)]
  end
end
