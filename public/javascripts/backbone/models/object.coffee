define ['jquery', 'backbone', 'underscore'], ($, Backbone, _) ->
  ObjectModel = Backbone.Model.extend(
    #ensure attributes for this survey
    defaults:
      data:
        html: ''
        text: ''
        path: ''
      links: []

    urlRoot: '/objects'
    #url to get (or fetch()) data

    initialize: ->
      if not this.data?
        this.data = this.defaults.data
      if not this.links?
        this.links = this.defaults.links
  )

  ObjectModel