define ['jquery', 'backbone', 'underscore',
  'models/object',
], ($, Backbone, _, Object) ->

  HTMLCodeEditor = Backbone.View.extend(
    initialize: (options) ->
      console.log "HTMLCodeEditor: initialize with ", options
      this.id = options.id

      this.$el.html("<textarea id='code' style='width:100%;height: 500px'></textarea> <button id='save_btn' class='btn'>Save</button> ")

      this.model = new Object({id: this.id})
      this.model.fetch()
      this.model.on "change", () =>
        console.log "HTMLCodeEditor: model=", this.model.get("data")
        $("#code").val(this.model.get("data").html)

    events:
      'click #save_btn': 'save'

    save: ->
      content = this.$el.find("#code").val()
      console.log "HTMLCodeEditor: ", content
      this.model.get("data").html = content
      this.model.save()

    updateObject: ->

    render: ->

      this
  )

  HTMLCodeEditor