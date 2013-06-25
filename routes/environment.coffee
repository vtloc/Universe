Object = require('../models/object')

exports.html_preview = (req, res) ->
  id = req.params.id
  Object.model.findById id, (err, item) =>
    html = item.data.html
    res.render('layout', {content: html})

exports.html_edit = (req, res) ->
  res.render('html_edit')

exports.text_view = (req, res) ->
  id = req.params.id
  Object.model.findById id, (err, item) =>
    res.writeHead(200)
    res.write(item.data.text)
    res.end()

exports.graphics_view = (req, res) ->
  res.end()

exports.graph_view = (req, res) ->
  res.end()

exports.calendar_view = (req, res) ->
  res.end()

exports.grid_view = (req, res) ->
  res.end()

exports.board_view = (req, res) ->
  res.end()

exports.mobile_view = (req, res) ->
  res.end()

exports.backbone_editor = (req, res) ->
  res.end()
