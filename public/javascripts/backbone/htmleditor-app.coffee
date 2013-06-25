#This is boilerplate page, copy it to create new file
define ['jquery', 'backbone', 'underscore', 'htmleditor-router'], ($, Backbone, _, Router) ->
  initialize = ->
    console.log "HERE"
    Router.initialize()

  {initialize: initialize}