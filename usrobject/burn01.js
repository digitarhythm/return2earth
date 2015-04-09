// Generated by CoffeeScript 1.6.1
var burn01,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

burn01 = (function(_super) {

  __extends(burn01, _super);

  function burn01(initparam) {
    burn01.__super__.constructor.call(this, initparam);
    this.num = 0;
  }

  burn01.prototype.destructor = function() {
    return burn01.__super__.destructor.call(this);
  };

  burn01.prototype.behavior = function() {
    var angle, i, _i, _results;
    burn01.__super__.behavior.call(this);
    switch (this._processnumber) {
      case 0:
        if (this.num++ > 5) {
          this.nextjob();
        }
        _results = [];
        for (i = _i = 0; _i < 3; i = ++_i) {
          angle = rand(360);
          _results.push(addObject({
            image: 'burnparticle',
            motionObj: burnparticle01,
            x: this.x + rand(10) - 5,
            y: this.y + rand(10) - 5,
            xs: Math.cos(angle * RAD) * 30,
            ys: Math.sin(angle * RAD) * 30,
            scaleX: 7.0,
            scaleY: 7.0,
            width: 16,
            height: 16,
            worldview: true,
            animlist: [[100, [0]]]
          }));
        }
        return _results;
        break;
      case 1:
        return removeObject(this);
    }
  };

  return burn01;

})(_stationary);