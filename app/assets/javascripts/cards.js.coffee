# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  height = $(window).height()
  width = $(window).width()

  setBackground = (url) ->
    $('.fullscreen').css
      'background': "url(#{url}) center no-repeat"
      'background-size': 'cover'

  # https://api.vkontakte.ru/method/users.get?uid=#{id}&fields=photo
  # http://graph.facebook.com/#{id}/picture?type=square
  # https://profiles.google.com/s2/photos/profile/#{id}
  # twitter?

  $('#card_message').keyup ->
    $this = $(@)
    $.get "/images?q=#{$this.val()}", (data) ->
      return unless (results = data?.responseData?.results)?.length > 0
      $gallery = $('.gallery')
      maxWidth = Math.floor(($gallery.width() + 20) / 9) # +2 margin * 10
      maxHeight = Math.floor($gallery.height() - 20)
      $gallery.empty()
      $.each results, (i, result) ->
        $img = $('<img>')
        $img.attr
          'src': result.tbUrl
          'height': result.tbHeight
          'width': result.tbWidth
          'data-img-url': result.url
          'data-img-width': result.width
          'data-img-height': result.height
          'data-tb-url': result.tbUrl
          'data-tb-width': result.tbWidth
          'data-tb-height': result.tbHeight
        $img.css
          'max-width': maxWidth
          'max-height': maxHeight
        $img.appendTo($gallery)

  $('.gallery').on 'click', 'img', ->
    $this = $(@)
    $this.addClass('active')
    # fill in form
    setBackground($this.data('img-url'))

  # initial
  $('#card_message').keyup()
  setBackground("http://placekitten.com/g/#{width}/#{height}")
