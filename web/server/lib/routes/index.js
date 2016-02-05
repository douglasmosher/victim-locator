// This needs to be the last route added
exports.serveIndex = function (app, staticFolder) {
  app.get('*', function (req, res) {
    res.sendFile('krpano.html', { root: staticFolder });
  });
};