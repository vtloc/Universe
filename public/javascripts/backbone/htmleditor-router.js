// Generated by CoffeeScript 1.4.0
(function() {

  define(['jquery', 'underscore', 'backbone', 'views/html/editor'], function($, _, Backbone, HTMLCodeEditor) {
    var AppRouter, initialize;
    AppRouter = Backbone.Router.extend({
      routes: {
        ':id': 'showCodeEditor'
      },
      el_root: function() {
        $('#content').html(' ');
        $('#content').append('<div id="content_child"></div>');
        return $('#content_child');
      }
    });
    initialize = function() {
      var app_router;
      app_router = new AppRouter;
      app_router.on('route:showCodeEditor', function(id) {
        var view;
        console.log("HERE");
        view = new HTMLCodeEditor({
          el: app_router.el_root,
          id: id
        });
        return view.render();
      });
      return Backbone.history.start();
    };
    return {
      initialize: initialize
    };
  });

}).call(this);