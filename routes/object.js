// Generated by CoffeeScript 1.4.0
(function() {
  var Object;

  Object = require('../models/object');

  exports.mongoose2backbone = function(model) {
    return {
      id: model._id,
      data: model.data,
      links: model.links
    };
  };

  exports.init = function(req, res) {
    var newObj,
      _this = this;
    newObj = new Object.model();
    newObj.data = req.body.data;
    newObj.links = req.body.links;
    return newObj.save(function(err) {
      return res.json({
        id: newObj._id
      });
    });
  };

  exports.get_all = function(req, res) {
    var _this = this;
    return Object.model.find({}, function(err, items) {
      var i, result, _i, _len;
      result = [];
      for (_i = 0, _len = items.length; _i < _len; _i++) {
        i = items[_i];
        result.push(exports.mongoose2backbone(i));
      }
      return res.json(result);
    });
  };

  exports.get_one = function(req, res) {
    var _this = this;
    return Object.model.findById(req.params.id, function(err, item) {
      return res.json(exports.mongoose2backbone(item));
    });
  };

  exports.add_new = function(req, res) {
    var newObj;
    console.log("Add new ", req.body);
    newObj = new Object.model();
    newObj.data = req.body.data;
    newObj.links = req.body.links;
    return newObj.save(function(err) {
      var result;
      result = {
        id: newObj._id
      };
      return res.json(result);
    });
  };

  exports.update = function(req, res) {
    var newObjData;
    console.log("Update ", req.body);
    newObjData = {
      _id: req.params.id,
      data: req.body.data,
      links: req.body.links
    };
    return Object.model.update(newObjData, function(err) {
      return res.json({});
    });
  };

  exports.remove = function(req, res) {
    return Object.model.remove({
      _id: req.params.id
    }, function(err) {
      return res.json({
        code: -1,
        message: "successed"
      });
    });
  };

}).call(this);
