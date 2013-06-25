// Generated by CoffeeScript 1.4.0
(function() {

  define(['jquery', 'backbone', 'underscore'], function($, Backbone, _) {
    var ObjectModel;
    ObjectModel = Backbone.Model.extend({
      defaults: {
        data: {
          html: '',
          text: '',
          path: ''
        },
        links: []
      },
      urlRoot: '/objects',
      initialize: function() {
        if (!(this.data != null)) {
          this.data = this.defaults.data;
        }
        if (!(this.links != null)) {
          return this.links = this.defaults.links;
        }
      }
    });
    return ObjectModel;
  });

}).call(this);
