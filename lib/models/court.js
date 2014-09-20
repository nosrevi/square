'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;
    
/**
 * Court Schema
 */
var CourtSchema = new Schema({
  name: String,
  lat: String,
  lng: String,
  verified: Boolean
});

mongoose.model('Court', CourtSchema);
