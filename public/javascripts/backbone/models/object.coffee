define ['jquery', 'backbone', 'underscore'], ($, Backbone, _) ->
  ObjectModel = Backbone.Model.extend(
    #ensure attributes for this survey
    defaults:
      fragments: {}
      links: []

    urlRoot: '/objects'
    #url to get (or fetch()) data

    initialize: ->
  )

  ObjectModel