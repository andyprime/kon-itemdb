(function (exports) {
  var Hogan = require('hogan.js');
  var t = {
  },
  r = function(n) {
    var tn = t[n];
    return function(c, p, i) {
      return tn.render(c, p || t, i);
    };
  };
  return {
  };
}(typeof exports === 'undefined' ? (this.target = {}) : exports));