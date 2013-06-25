Object = require('../models/object')
fs = require('fs')

exports.upload_form = (req, res) ->
  res.render("upload")

exports.add_new = (req, res) ->
  console.log "Receive: ", req.files.path
  obj = new Object.model()
  obj.data = {path: req.files.file.path}
  obj.save (err) ->
    # encode the name
    # save the filename to database
    res.json({id: obj.id})

exports.get_one = (req, res) ->
  Object.model.findById req.params.id, (err, item) =>
    console.log item.get_path

    if item.get_path isnt null
      res.sendfile(item.get_path)
    else
      res.json({code: 1, message: "Resources not found."})