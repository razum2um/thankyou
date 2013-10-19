# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  height = $(window).height()
  width = $(window).width()
  $('.fullscreen').css({'background': "url(http://placekitten.com/g/#{width}/#{height})"})

  # https://api.vkontakte.ru/method/users.get?uid=#{id}&fields=photo
  # http://graph.facebook.com/#{id}/picture?type=square
  # https://profiles.google.com/s2/photos/profile/#{id}
  # twitter?

  # http://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q=%D0%B1%D0%BB%D0%B0%D0%B3%D0%BE%D0%B4%D0%B0%D1%80%D1%8E&imgsz=huge&safe=active&as_rights=cc_noncommercial&as_sitesearch=flickr.com
  #base_url = 'http://ajax.googleapis.com/ajax/services/search/images'
  #base_url = '/images'
  #imageQueryParams =
  #  'v': '1.0'
  #  'rsz': 8 # per page
  #  'imgsz': 'huge'
  #  'safe': 'active'
  #  'as_rights': 'cc_noncommercial'
  #  'as_sitesearch': 'flickr.com'
  #  'callback': 'on_google_images'


  $('#card_message').keyup ->
    $this = $(@)
    $.get "/images?q=#{$this.val()}", (data) ->
      return unless data?.responseData?.results?.length > 0
      $gallery = $('.gallery')
      $gallery.empty()
      $.each data.responseData.results, (i, result) ->
        $img = $('<img>')
        $img.attr({'src': result.tbUrl, 'height': result.tbHeight, 'width': result.tbWidth})
        $img.appendTo($gallery)

