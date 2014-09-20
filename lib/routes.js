'use strict';

var api = require('./controllers/api'),
    index = require('./controllers'),
    users = require('./controllers/users'),
    session = require('./controllers/session');

var middleware = require('./middleware');

/**
 * Application routes
 */
module.exports = function(app) {

  // Server API Routes
  app.get('/api/v1/awesomeThings', api.awesomeThings);

  app.get('/api/getCourts', api.getCourts);
  
  app.post('/api/v1/users', users.create);
  app.put('/api/v1/users', users.changePassword);
  app.get('/api/v1/users/me', users.me);
  app.get('/api/v1/users/:id', users.show);

  app.post('/api/v1/session', session.login);
  app.del('/api/v1/session', session.logout);
  app.get('/api/v1/message', api.message);

  // All undefined api/v1 routes should return a 404
  app.get('/api/v1/*', function(req, res) {
    res.send(404);
  });

  // All other routes to use Angular routing in app/scripts/app.js
  app.get('/partials/*', index.partials);
  app.get('/*', middleware.setUserCookie, index.index);
  
};
