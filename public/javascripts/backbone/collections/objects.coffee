define ['jquery', 'backbone', 'underscore', 'models/object'], ($, Backbone, _, Object) ->
  ObjectsCollection = Backbone.Collection.extend(
    model: Object

    #url to get (or fetch()) data
    url: () =>
      this.url

    initialize: (options) ->
      this.url = "/objects"

    #prase data, call after fetch() done
    parse: (response) ->
      console.log 'Response is', response
      response

  )

  ObjectsCollection