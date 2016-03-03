# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.flashMsg = (msg, statusClass) ->
  htmlMsg = decodeHTMLEntities(msg)
  $('#alert').append('<div class=\'alert alert-' + statusClass + '\'>' + htmlMsg + '</div>').slideDown(500, ->
  ).delay(3000).slideUp 500
  setTimeout (->
    $('#alert').empty ''
    return
  ), 4000
  return

decodeHTMLEntities = (text) ->
  entities = [
    [
      'apos'
      '\''
    ]
    [
      'amp'
      '&'
    ]
    [
      'lt'
      '<'
    ]
    [
      'gt'
      '>'
    ]
  ]
  i = 0
  max = entities.length
  while i < max
    text = text.replace(new RegExp('&' + entities[i][0] + ';', 'g'), entities[i][1])
    ++i
  text

window.highlightElement = (element, status) ->
  if status == "danger"
    $(element).addClass(status);
    $("#new_item").addClass("has-error");
    $(".has-error .btn").toggleClass("btn-danger");
  else if status == "success"
    $(element).hide().addClass("success").fadeIn(1000)
    setTimeout (->
      $('.success').removeClass("success")
      return
    ), 4000