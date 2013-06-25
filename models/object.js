// Generated by CoffeeScript 1.4.0
(function() {
  var initObject;

  initObject = function() {
    var Schema, mongoose, _model, _schema;
    mongoose = require('mongoose');
    Schema = mongoose.Schema;
    _schema = new Schema({
      data: {},
      links: [
        {
          props: {},
          point: {
            type: Schema.ObjectId,
            ref: 'Object'
          }
        }
      ]
    });
    _model = mongoose.model('Object', _schema);
    return {
      schema: _schema,
      model: _model
    };
  };

  module.exports = initObject();

}).call(this);
