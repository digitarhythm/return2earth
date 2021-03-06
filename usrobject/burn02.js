// Generated by CoffeeScript 1.6.1
var burn02,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

burn02 = (function(_super) {

  __extends(burn02, _super);

  function burn02(initparam) {
    burn02.__super__.constructor.call(this, initparam);
  }

  burn02.prototype.destructor = function() {
    return burn02.__super__.destructor.call(this);
  };

  burn02.prototype.behavior = function() {
    var burn;
    burn02.__super__.behavior.call(this);
    switch (this._processnumber) {
      case 0:
        burn = addObject({
          image: 'burnparticle',
          motionObj: burnparticle02,
          x: this.x,
          y: this.y,
          scaleX: 20.0,
          scaleY: 20.0,
          width: 16,
          height: 16,
          worldview: true,
          animlist: [[100, [0]]]
        });
        return removeObject(this);
    }
  };

  return burn02;

})(_stationary);
