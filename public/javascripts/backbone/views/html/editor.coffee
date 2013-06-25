define ['jquery', 'backbone', 'underscore',
  'models/object', 'collections/objects'
], ($, Backbone, _,
    Object, ObjectCollection) ->

  objects = new ObjectCollection()

  HTMLCodeEditor = Backbone.View.extend(
    initialize: (options) ->
      console.log "HTMLCodeEditor: initialize with ", options

      this.selectedObjectDiv = null

      objects.fetch()
      this.listenTo objects, "sync", this.reloadObjectList

    reloadObjectList: ->
      $("#list").empty()

      objects.each (item) =>
        id = item.get("id")
        text = if item.get("data").text then item.get("data").text else item.get("id")
        $("#list").append("<li class='object' id='#{id}'>#{text}</li>")

      if this.model is null
        this.switch_object(new Object({id: objects.at(0).get("id")}))

        id = this.model.get("id")
        this.selectedObjectDiv = $("li\##{id}")
        this.selectedObjectDiv.addClass("active")

    updateSelectedObject: ->
      console.log "HTMLCodeEditor: model=", this.get("data")

      id = this.get("id")
      $("#preview_link").attr("href", "http://127.0.0.1:3000/html_preview/#{id}")
      $("#preview_link").text("http://127.0.0.1:3000/html_preview/#{id}")

      if this.get("data").html?
        $("#code").val(this.get("data").html)
      else if this.get("data").text?
        $("#code").val(this.get("data").text)
      else
        $("#code").val("")

    events:
      'click #save_btn': 'save'
      'click .object': 'select_object'
      'click #add_btn' : 'add'
      'click #delete_btn' : 'delete_current'

    delete_current: ->
      index = objects.indexOf(this.model)
      index = index -1 if( index > 0)

      objects.remove(this.model)
      this.model.destroy()
      this.reloadObjectList()
      this.switch_object(objects.at(index))

    switch_object: (obj)->
      console.log "switch_object: ", obj
      this.model = obj
      this.model.fetch()
      this.model.on "change", this.updateSelectedObject

    select_object: (ev) ->
      this.selectedObjectDiv.removeClass("active") if this.selectedObjectDiv isnt null

      this.selectedObjectDiv = $(ev.target)
      this.selectedObjectDiv.addClass("active")

      this.switch_object(new Object({id: $(ev.target).attr("id")}))

    save: ->
      content = this.$el.find("#code").val()
      console.log "HTMLCodeEditor: ", content
      this.model.get("data").html = content
      this.model.save()

    add: ->
      this.model = new Object({
        data:
          html: "<h1>DEMO</h1>"
          text: "HELLO"
          path: ""
      })
      this.model.save()
      objects.fetch()
      this.model.on "change", this.updateSelectedObject


    render: ->

      this
  )

  HTMLCodeEditor