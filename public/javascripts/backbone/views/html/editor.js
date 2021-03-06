// Generated by CoffeeScript 1.4.0
(function() {

  define(['jquery', 'backbone', 'underscore', 'models/object', 'collections/objects'], function($, Backbone, _, Object, ObjectCollection) {
    var HTMLCodeEditor, objects;
    objects = new ObjectCollection();
    HTMLCodeEditor = Backbone.View.extend({
      initialize: function(options) {
        console.log("HTMLCodeEditor: initialize with ", options);
        this.selectedObjectDiv = null;
        objects.fetch();
        return this.listenTo(objects, "sync", this.reloadObjectList);
      },
      reloadObjectList: function() {
        var id,
          _this = this;
        $("#list").empty();
        objects.each(function(item) {
          var id, text;
          id = item.get("id");
          text = item.get("data").text ? item.get("data").text : item.get("id");
          return $("#list").append("<li class='object' id='" + id + "'>" + text + "</li>");
        });
        if (this.model === null) {
          this.switch_object(new Object({
            id: objects.at(0).get("id")
          }));
          id = this.model.get("id");
          this.selectedObjectDiv = $("li\#" + id);
          return this.selectedObjectDiv.addClass("active");
        }
      },
      updateSelectedObject: function() {
        var id;
        console.log("HTMLCodeEditor: model=", this.get("data"));
        id = this.get("id");
        $("#preview_link").attr("href", "http://127.0.0.1:3000/html_preview/" + id);
        $("#preview_link").text("http://127.0.0.1:3000/html_preview/" + id);
        if (this.get("data").html != null) {
          return $("#code").val(this.get("data").html);
        } else if (this.get("data").text != null) {
          return $("#code").val(this.get("data").text);
        } else {
          return $("#code").val("");
        }
      },
      events: {
        'click #save_btn': 'save',
        'click .object': 'select_object',
        'click #add_btn': 'add',
        'click #delete_btn': 'delete_current'
      },
      delete_current: function() {
        var index;
        index = objects.indexOf(this.model);
        if (index > 0) {
          index = index(-1);
        }
        objects.remove(this.model);
        this.model.destroy();
        this.reloadObjectList();
        return this.switch_object(objects.at(index));
      },
      switch_object: function(obj) {
        console.log("switch_object: ", obj);
        this.model = obj;
        this.model.fetch();
        return this.model.on("change", this.updateSelectedObject);
      },
      select_object: function(ev) {
        if (this.selectedObjectDiv !== null) {
          this.selectedObjectDiv.removeClass("active");
        }
        this.selectedObjectDiv = $(ev.target);
        this.selectedObjectDiv.addClass("active");
        return this.switch_object(new Object({
          id: $(ev.target).attr("id")
        }));
      },
      save: function() {
        var content;
        content = this.$el.find("#code").val();
        console.log("HTMLCodeEditor: ", content);
        this.model.get("data").html = content;
        return this.model.save();
      },
      add: function() {
        this.model = new Object({
          data: {
            html: "<h1>DEMO</h1>",
            text: "HELLO",
            path: ""
          }
        });
        this.model.save();
        objects.fetch();
        return this.model.on("change", this.updateSelectedObject);
      },
      render: function() {
        return this;
      }
    });
    return HTMLCodeEditor;
  });

}).call(this);
