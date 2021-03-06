// Generated by CoffeeScript 1.6.1
var scorecontrol,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

scorecontrol = (function(_super) {

  __extends(scorecontrol, _super);

  function scorecontrol(initparam) {
    scorecontrol.__super__.constructor.call(this, initparam);
    this.score = 0;
    this.vgamepadflag = false;
    this.scorelabel = addObject({
      type: LABEL,
      x: SCREEN_WIDTH / 2,
      y: 16,
      width: SCREEN_WIDTH,
      height: 24,
      fontsize: 24,
      color: 'white',
      textalign: 'left',
      labeltext: sprintf('SCORE: %08@', 0),
      scene: TOPSCENE
    });
  }

  scorecontrol.prototype.destructor = function() {
    scorecontrol.__super__.destructor.call(this);
    if ((this.scorelabel != null)) {
      return removeObject(this.scorelabel);
    }
  };

  scorecontrol.prototype.behavior = function() {
    scorecontrol.__super__.behavior.call(this);
    switch (this._processnumber) {
      case 0:
        return nop();
    }
  };

  scorecontrol.prototype.reset = function() {
    this.score = 0;
    return this.scorelabel.labeltext = "SCORE: " + sprintf("%08@", 0);
  };

  scorecontrol.prototype.add = function(num) {
    this.score += num;
    return this.scorelabel.labeltext = "SCORE: " + sprintf("%08@", this.score);
  };

  return scorecontrol;

})(_stationary);
