
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , object  = require('./routes/object')
  , environment = require('./routes/environment')
  , http = require('http')
  , mongoose = require('mongoose')
  , path = require('path');

mongoose.connect('mongodb://localhost/universe');

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(require('stylus').middleware(__dirname + '/public'));
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/init', object.init)
app.get('/objects', object.get_all)
app.get('/objects/:id', object.get_one)
app.post('/objects', object.add_new)
app.put('/objects/:id', object.update)
app.del('/objects/:id', object.remove)

app.get('/html_preview/:id', environment.html_preview)
app.get('/text_view/:id', environment.text_view)
app.get('/html_edit', environment.html_edit)

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
