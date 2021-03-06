// Generated by CoffeeScript 1.6.1
var stage1,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

stage1 = (function(_super) {

  __extends(stage1, _super);

  function stage1(initparam) {
    stage1.__super__.constructor.call(this, initparam);
    this.myshipbullet = GLOBAL['myshipbullet'];
    this.enemylist = GLOBAL['enemylist'];
    this.enemybullet = GLOBAL['enemybullet'];
    this.worldend = GLOBAL['worldend'];
    this.scoreobj = GLOBAL['scoreobj'];
    this.gamecontrolobj = GLOBAL['gamecontrol'];
    this.mapControlObj = GLOBAL['mapcontrol'];
    this.stageControlObj = GLOBAL['stagecontrol'];
  }

  stage1.prototype.destructor = function() {
    return stage1.__super__.destructor.call(this);
  };

  stage1.prototype.behavior = function() {
    var _this = this;
    stage1.__super__.behavior.call(this);
    switch (this._processnumber) {
      case 0:
        this.stagetitle = addObject({
          type: LABEL,
          x: SCREEN_WIDTH / 2,
          y: -48,
          width: GLOBAL['GAMESCREEN_WIDTH'],
          height: 48,
          fontsize: 48,
          color: 'white',
          textalign: 'center',
          labeltext: "Stage Pluto...",
          opacity: 0.0,
          ys: 2
        });
        this.stagetitle.fadeIn(2000).delay(1000).fadeOut(1000).then(function() {
          removeObject(_this.stagetitle);
          return _this.stageControlObj.removeEnemy();
        });
        return this.nextjob();
    }
  };

  return stage1;

})(_stationary);
