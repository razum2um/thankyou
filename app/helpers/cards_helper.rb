module CardsHelper
  def card_style(card)
    style = ""
    style << "background-image: url(#{card.img_url});"
    style << "background-size: #{card.img_width}px #{card.img_height}px;"
    style << "background-position: #{card.background_position_x}px #{card.background_position_y}px;"
    style << "background-repeat: no-repeat no-repeat;"
    style
  end
end
