require.config
  paths:
    jquery: 'libs/jquery-1.10.1.min',
    underscore: 'libs/underscore-min',
    backbone: 'libs/backbone-min'
    backboneui: 'libs/backbone-ui-min'
    laconic: 'libs/laconic'
    moment: 'libs/moment'
    text: 'libs/text'

  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    backboneui:
      deps: ['jquery', 'laconic', 'backbone', 'moment']
      exports: 'Backbone.UI'

require ['htmleditor-app'], (App) ->
  console.log "HERE"
  App.initialize()