$(document).on "turbolinks:load", ->
  $.each $('.field_with_errors'), (index, value) ->
    tag = value.children[0]
    $(tag).addClass 'is-invalid'
    $(tag).parent().replaceWith(tag)