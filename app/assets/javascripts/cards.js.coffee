# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  _height = $(window).height()
  _width = $(window).width()
  $fullscreen = $('.fullscreen')
  $gallery = $('#gallery')
  $preload = $('#preload')

  setBackground = (url, width, height) ->
    bg_width = _width
    bg_height = height * (_width / width)

    $fullscreen.css
      'background-image': "url(#{url})"
      'background-repeat': 'no-repeat'
      'background-size': "#{bg_width}px #{bg_height}px"
    #$fullscreen.animate
    #  'background-size': "#{ratio}% #{ratio}%"
    #, 1000
    $fullscreen.backgroundDraggable
      width: bg_width
      height: bg_height

    $fullscreen.on 'moved', (e, coords) ->
      $('#card_background_position_x').val(coords.x)
      $('#card_background_position_y').val(coords.y)

  # https://api.vkontakte.ru/method/users.get?uid=#{id}&fields=photo
  # http://graph.facebook.com/#{id}/picture?type=square
  # https://profiles.google.com/s2/photos/profile/#{id}
  # twitter?

  $('#card_message').keyup ->
    $this = $(@)
    $.get "/images?q=#{$this.val()}", (data) ->
      return unless (results = data?.responseData?.results)?.length > 0
      maxWidth = Math.floor(($gallery.width() + 20) / 8) # +2 margin * 10
      maxWidth = 130 if maxWidth > 130
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

        $preloadImg = $('<img>')
        $preloadImg.attr
          'src': result.url
        $preloadImg.appendTo($preload)


  $gallery.on 'click', 'img', ->
    $this = $(@)
    $this.addClass('active')

    # fill in form
    $('#card_img_url').val($this.data('img-url'))
    $('#card_img_width').val($this.data('img-width'))
    $('#card_img_height').val($this.data('img-height'))

    $('#card_tb_url').val($this.data('tb-url'))
    $('#card_tb_width').val($this.data('tb-width'))
    $('#card_tb_height').val($this.data('tb-height'))

    setBackground($this.data('img-url'), $this.data('img-width'), $this.data('img-height'))


  # initial
  $('#card_message').focus().keyup()
  setBackground("http://placekitten.com/g/#{_width}/#{_height}", _width, _height)
