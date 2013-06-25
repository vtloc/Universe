initObject = () ->
  mongoose = require('mongoose')
  Schema = mongoose.Schema

  _schema = new Schema({
    data: {}

    links: [{
      props: {}
      point:
        type: Schema.ObjectId
        ref: 'Object'
    }]
  })

  _schema.methods.get_path = (fragment) =>
    if this.data.path?
      this.data.path
    else
      null

  _model = mongoose.model 'Object', _schema

  return {
    schema: _schema
    model: _model
  }

module.exports = initObject()
