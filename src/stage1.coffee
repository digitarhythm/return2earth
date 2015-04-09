class stage1 extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        #*********************************
        # ゲームで使用する配列
        #*********************************
        # 自機の弾
        @myshipbullet = GLOBAL['myshipbullet']
        # 敵
        @enemylist = GLOBAL['enemylist']
        # 敵の弾
        @enemybullet = GLOBAL['enemybullet']
        # 仮想空間
        @worldend = GLOBAL['worldend']

        #*********************************
        # 制御系オブジェクト
        #*********************************
        # スコア制御
        @scoreobj = GLOBAL['scoreobj']
        # ゲームコントロール
        @gamecontrolobj = GLOBAL['gamecontrol']
        # マップコントロール
        @mapControlObj = GLOBAL['mapcontrol']
        # ステージコントロール
        @stageControlObj = GLOBAL['stagecontrol']

    #**************************
    # character destructor
    #**************************
    destructor:->
        super()

    #**************************
    # character behavior
    #**************************
    behavior:->
        super()
        switch @_processnumber
            when 0
                @stagetitle = addObject
                    type: LABEL
                    x: SCREEN_WIDTH / 2
                    y: -48
                    width: GLOBAL['GAMESCREEN_WIDTH']
                    height: 48
                    fontsize: 48
                    color: 'white'
                    textalign: 'center'
                    labeltext: "Stage Pluto..."
                    opacity: 0.0
                    ys: 2
                @stagetitle.fadeIn(2000).delay(1000).fadeOut(1000).then =>
                    removeObject(@stagetitle)
                    @stageControlObj.removeEnemy()
                @nextjob()

    #**************************
    # touch event
    #**************************
    #touchesBegan:(pos)->
    #    super(pos)

    #**************************
    # swipe event
    #**************************
    #touchesMoved:(pos)->
    #    super(pos)

    #**************************
    # detach event
    #**************************
    #touchesEnded:(pos)->
    #    super(pos)

    #**************************
    # touch cancel event
    #**************************
    #touchesCanceled:(pos)->
    #    super(pos)
