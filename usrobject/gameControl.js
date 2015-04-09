// Generated by CoffeeScript 1.6.1
var gameControl,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

gameControl = (function(_super) {

  __extends(gameControl, _super);

  function gameControl(initparam) {
    gameControl.__super__.constructor.call(this, initparam);
    this.worldend = {
      x: 480,
      y: 640
    };
    GLOBAL['worldend'] = this.worldend;
    GLOBAL['GAMESCREEN_WIDTH'] = 480;
    GLOBAL['GAMESCREEN_HEIGHT'] = 640;
    this.mapControlObj = addObject({
      type: CONTROL,
      motionObj: mapControl
    });
    GLOBAL['mapcontrol'] = this.mapControlObj;
    /*
    @bgimage = addObject
        image: 'bgimage'
        x: @worldend.x / 2
        y: @worldend.y / 2
        width: 1080
        height: 1920
        worldview: true
        scene: BGSCENE
    */

    GLOBAL['gamecontrol'] = this;
    this.footer = addObject({
      image: 'vgamepad',
      width: 480,
      height: 147,
      x: SCREEN_WIDTH / 2,
      y: SCREEN_HEIGHT - (150 / 2) + 2,
      animlist: [[100, [0]]],
      scene: TOPSCENE
    });
    createVirtualGamepad({
      x: 100,
      y: SCREEN_HEIGHT - 72,
      scale: 1.5,
      buttonscale: 2.5,
      visible: true,
      coord: [[SCREEN_WIDTH - (64 * 1.2) - 22, SCREEN_HEIGHT - (64 * 1.2) + 3]]
    });
    this.scorearea = addObject({
      image: 'scorebg',
      width: 640,
      height: 30,
      x: GLOBAL['GAMESCREEN_WIDTH'] / 2,
      y: 15,
      opacity: 0.7,
      animlist: [[100, [0]]],
      scene: GAMESCENE_SUB2
    });
    this.stageControlObj = addObject({
      type: CONTROL,
      motionObj: stageControl
    });
    GLOBAL['stagecontrol'] = this.stageControlObj;
    this.scoreControlObj = GLOBAL['scoreobj'];
    setWorldView(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
  }

  gameControl.prototype.destructor = function() {
    gameControl.__super__.destructor.call(this);
    if ((this.mapControlObj != null)) {
      removeObject(this.mapControlObj);
    }
    if ((this.footer != null)) {
      removeObject(this.footer);
    }
    if ((this.titlemig != null)) {
      return removeObject(this.titleimg);
    }
  };

  gameControl.prototype.behavior = function() {
    var _this = this;
    gameControl.__super__.behavior.call(this);
    switch (this._processnumber) {
      case 0:
        this.mapControlObj.dispMap(0, 1);
        this.titleimg = addObject({
          image: 'title',
          x: GLOBAL['GAMESCREEN_WIDTH'] / 2,
          y: -120,
          width: 480,
          height: 200,
          scaleX: 0.7,
          scaleY: 0.7,
          animlist: [[100, [0]]],
          scene: GAMESCENE_SUB2
        });
        this.startbuttonobj = addObject({
          image: 'startbutton',
          motionObj: startbutton,
          x: GLOBAL['GAMESCREEN_WIDTH'] / 2,
          y: -120,
          width: 320,
          height: 120,
          scaleX: 0.5,
          scaleY: 0.5,
          animlist: [[100, [0]]],
          scene: TOPSCENE
        }, this);
        this.titleimg.moveBy(0, 300, 1000, BOUNCE, EASEOUT);
        this.startbuttonobj.moveTo(GLOBAL['GAMESCREEN_WIDTH'] / 2, GLOBAL['GAMESCREEN_HEIGHT'] - 100, 1000, EXPO, EASEOUT).then(function() {
          return _this.setProcessNumber(2);
        });
        return this.nextjob();
      case 1:
        return nop();
      case 2:
        if (PADBUTTONS[0][7]) {
          return this.nextjob();
        }
        break;
      case 3:
        removeObject(this.titleimg);
        removeObject(this.startbuttonobj);
        this.mapControlObj.dispMap(0, 8);
        this.bgm = playSound('bgm03', 1.0, true);
        this.stageControlObj.setStage(1);
        this.scoreControlObj.reset();
        return this.setProcessNumber(10);
      case 10:
        return nop();
      case 20:
        this.bgm.stop();
        this.gameover = addObject({
          type: LABEL,
          x: SCREEN_WIDTH / 2,
          y: GLOBAL['GAMESCREEN_HEIGHT'] / 2,
          width: GLOBAL['GAMESCREEN_WIDTH'],
          height: 64,
          fontsize: 64,
          color: 'white',
          opacity: 0.0,
          textalign: 'center',
          labeltext: 'GAME OVER',
          scene: GAMESCENE_SUB2
        });
        this.gameover.fadeIn(500).delay(1000).fadeOut(500).then(function() {
          removeObject(_this.gameover);
          _this.stageControlObj.myshipRemoveAllBullet();
          _this.stageControlObj.enemyRemoveAllBullet();
          _this.stageControlObj.enemyRemoveAll();
          setWorldView(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
          return _this.setProcessNumber(0);
        });
        return this.nextjob();
      case 21:
        return nop();
    }
  };

  return gameControl;

})(_stationary);
