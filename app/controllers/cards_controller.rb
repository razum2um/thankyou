class CardsController < InheritedResources::Base
  protected
  def resource_params
    [params.require(:card).permit(:greeting, :message, :public)]
  end
end
