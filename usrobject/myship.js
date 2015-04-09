// Generated by CoffeeScript 1.6.1
var myship,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

myship = (function(_super) {

  __extends(myship, _super);

  function myship(initparam) {
    var collider;
    myship.__super__.constructor.call(this, initparam);
    this.myshipbullet = GLOBAL['myshipbullet'];
    this.enemybullet = GLOBAL['enemybullet'];
    this.gamecontrolobj = GLOBAL['gamecontrol'];
    this.scoreobj = GLOBAL['scoreobj'];
    this.worldend = GLOBAL['worldend'];
    this.speed = 5;
    this.bulletinterval = 0.2;
    this.bullettime = 0.0;
    collider = addObject({
      type: COLLIDER2D,
      image: 'collider',
      x: this.x,
      y: this.y,
      width: 4,
      height: 12,
      offsety: -20
    });
    this.collider = collider;
  }

  myship.prototype.destructor = function() {
    return myship.__super__.destructor.call(this);
  };

  myship.prototype.behavior = function() {
    var axes, button, obj, stick, vx, vy, _i, _len, _ref, _results;
    myship.__super__.behavior.call(this);
    switch (this._processnumber) {
      case 0:
        axes = PADAXES[0];
        stick = ANALOGSTICK[0][0];
        if (axes[HORIZONTAL] < 0) {
          this.animnum = 2;
        } else if (axes[HORIZONTAL] > 0) {
          this.animnum = 1;
        } else {
          this.animnum = 0;
        }
        if (Math.abs(stick[HORIZONTAL]) < 0.1) {
          vx = 0.0;
        } else {
          vx = stick[HORIZONTAL];
        }
        if (Math.abs(stick[VERTICAL]) < 0.1) {
          vy = 0.0;
        } else {
          vy = stick[VERTICAL];
        }
        vx *= this.speed;
        vy *= this.speed;
        this.x += vx;
        if (this.x < 0) {
          this.x = 0;
        }
        if (this.x > this.worldend.x) {
          this.x = this.worldend.x;
        }
        this.y += vy;
        if (this.y < 0) {
          this.y = 0;
        }
        if (this.y > this.worldend.y) {
          this.y = this.worldend.y;
        }
        button = PADBUTTONS[0];
        if (this.bullettime < LAPSEDTIME) {
          this.fire();
          this.bullettime = LAPSEDTIME + this.bulletinterval;
        }
        _ref = this.enemybullet;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          obj = _ref[_i];
          if ((obj != null)) {
            if (this.isIntersect(obj)) {
              playSound('bomb02');
              addObject({
                type: CONTROL,
                motionObj: burn02,
                x: this.x,
                y: this.y
              });
              this.gamecontrolobj.setProcessNumber(20);
              _results.push(removeObject(this));
            } else {
              _results.push(void 0);
            }
          } else {
            _results.push(void 0);
          }
        }
        return _results;
    }
  };

  myship.prototype.fire = function() {
    var obj;
    if (this.myshipbullet.length < 3) {
      playSound('shoot02');
      obj = addObject({
        image: 'myshipbullet',
        motionObj: myshipBullet,
        x: this.x,
        y: this.y - 8,
        width: 12,
        height: 32,
        opacity: 1.0,
        animlist: [[10, [0, 1]]],
        worldview: true
      }, this);
      return this.myshipbullet.push(obj);
    }
  };

  return myship;

})(_stationary);
