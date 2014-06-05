# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update = ->
  alert "1st coffee"
  $.get '/stories/feed.json', null, (data, status, jqXHR) ->
    $('.postfeed').append(" coffee hi ")
    alert /stories.json
    msgsSorted = _.sortBy data, (micropost) ->
      new Date(micropost.created_at).getTime() # get mposts sorted by creation time ascending
    alert " coffee msgsort"

    # refreshing mposts list
    $('.postfeed').empty()
    for m in msgsSorted
      d = moment(m.created_at)
      $('ol').append("hi")
      $('.postfeed').append('<li>' + "hi" +
      '<span class="created_at">' + d.format('hh:mm') + '</span>' +
      m.content +
      '</li>')

    setTimeout update, 750 # polling at least every 750 ms but don't overlap between requests

#update() 