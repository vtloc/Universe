Object = require('../models/object')

exports.mongoose2backbone = (model) ->
  {
    id: model._id
    data: model.data
    links: model.links
  }

exports.init = (req, res) ->
  newObj = new Object.model()
  newObj.data = {
    html:"hello"
    text:"demo"
  }
  newObj.links = []
  newObj.save (err) =>
    res.json({id:newObj._id})

exports.get_all = (req, res) ->
  Object.model.find {}, (err, items) =>
    result = []

    for i in items
      result.push (exports.mongoose2backbone(i))

    res.json(result)

exports.get_one = (req, res) ->
  Object.model.findById req.params.id, (err, item) =>
    res.json(exports.mongoose2backbone(item))

exports.add_new = (req, res) ->
  newObj = new Object.model()
  newObj.data = req.data
  newObj.links = req.links
  newObj.save (err) ->
    result = {id: newObj._id}
    res.json(result)

exports.update = (req, res) ->
  result = {}
  Object.model.update req.body, (err) ->
    res.json(result)

exports.remove = (req, res) ->
  result = {}
  Object.model.remove req.body, (err) ->
    res.json(result)