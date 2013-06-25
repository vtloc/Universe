Object = require('../models/object')

exports.mongoose2backbone = (model) ->
  {
    id: model._id
    data: model.data
    links: model.links
  }

exports.init = (req, res) ->
  newObj = new Object.model()
  newObj.data = req.body.data
  newObj.links = req.body.links
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
  console.log "Add new ", req.body
  newObj = new Object.model()
  newObj.data = req.body.data
  newObj.links = req.body.links
  newObj.save (err) ->
    result = {id: newObj._id}
    res.json(result)

exports.update = (req, res) ->
  console.log "Update ", req.body
  newObjData =
    _id: req.params.id
    data: req.body.data
    links: req.body.links

  Object.model.update newObjData, (err) ->
    res.json({})

exports.remove = (req, res) ->
  Object.model.remove {_id: req.params.id}, (err) ->
    res.json({code:-1,message: "successed"})