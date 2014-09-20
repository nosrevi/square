'use strict';

var mongoose = require('mongoose'),
    Thing = mongoose.model('Thing'),
    Court = mongoose.model('Court');

/**
 * Get awesome things
 */
exports.awesomeThings = function(req, res) {
  return Thing.find(function (err, things) {
    if (!err) {
      return res.json(things);
    } else {
      return res.send(err);
    }
  });
};

/**
 * Get courts 
 */
exports.getCourts = function(req, res) {
  return Court.find(function (err, courts) {
    if (!err) {
      return res.json(courts);
    } else {
      return res.send(err);
    }
  });
};

exports.message = function(req, res) {
  res.send('Hello, World');
};
