# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  height = $(window).height()
  width = $(window).width()
  $('.fullscreen').css({'background': "url(http://placekitten.com/g/#{width}/#{height})"})
