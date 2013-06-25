define ['jquery', 'underscore', 'backbone', \
        'views/html/editor'],
($, _, Backbone, HTMLCodeEditor) ->

  AppRouter = Backbone.Router.extend(
    routes:
      #define some url routes
      '': 'showCodeEditor'

    #Some cases, Backbone events will be fired mutiple times when switch between two view. To avoid this, we should
    #append one child to root element and set this is 'el' property of any BackboneView.
    el_root: -> $('#content')

  )

  initialize = ->
    app_router = new AppRouter;

    app_router.on 'route:showCodeEditor', ()->
      console.log "HERE"
      view = new HTMLCodeEditor(el: app_router.el_root)
      view.render()

    Backbone.history.start()

  initialize: initialize