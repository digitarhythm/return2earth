class gameControl extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)

        # ワールドサイズ
        @worldend =
            x: 480
            y: 640
        GLOBAL['worldend'] = @worldend

        # ゲーム画面のサイズ
        GLOBAL['GAMESCREEN_WIDTH'] = 480
        GLOBAL['GAMESCREEN_HEIGHT'] = 640

        # マップ制御
        @mapControlObj = addObject
            type: CONTROL
            motionObj: mapControl
        GLOBAL['mapcontrol'] = @mapControlObj

        # 背景画像
        ###
        @bgimage = addObject
            image: 'bgimage'
            x: @worldend.x / 2
            y: @worldend.y / 2
            width: 1080
            height: 1920
            worldview: true
            scene: BGSCENE
        ###

        # ゲーム制御
        GLOBAL['gamecontrol'] = @

        #*********************************
        # バーチャルゲームパッド
        #*********************************
        @footer = addObject
            image: 'vgamepad'
            width: 480
            height: 147
            x: SCREEN_WIDTH / 2
            y: SCREEN_HEIGHT - (150 / 2) + 2
            animlist: [
                [100, [0]]
            ]
            scene: TOPSCENE
        createVirtualGamepad
            x: 100
            y: SCREEN_HEIGHT - 72
            scale: 1.5
            buttonscale: 2.5
            visible: true
            coord: [
                [SCREEN_WIDTH - (64 * 1.2) - 22, SCREEN_HEIGHT - (64 * 1.2) + 3]
            ]

        #*********************************
        # スコア表示背景
        #*********************************
        @scorearea = addObject
            image: 'scorebg'
            width: 640
            height: 30
            x: GLOBAL['GAMESCREEN_WIDTH'] / 2
            y: 15
            opacity: 0.7
            animlist: [
                [100, [0]]
            ]
            scene: GAMESCENE_SUB2

        #*********************************
        # ステージコントロール
        #*********************************
        @stageControlObj = addObject
            type: CONTROL
            motionObj: stageControl
        GLOBAL['stagecontrol'] = @stageControlObj

        @scoreControlObj = GLOBAL['scoreobj']

        #setWorldView((GLOBAL['GAMESCREEN_WIDTH']) / 2, (GLOBAL['GAMESCREEN_HEIGHT']) / 2)
        setWorldView(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

    #**************************
    # character destructor
    #**************************
    destructor:->
        super()
        removeObject(@mapControlObj) if (@mapControlObj?)
        removeObject(@footer) if (@footer?)
        removeObject(@titleimg) if (@titlemig?)

    #**************************
    # character behavior
    #**************************
    behavior:->
        super()

        #debugwrite
        #    labeltext: sprintf("<br><br><br>time=%@", LAPSEDTIME)
        #    clear: true

        switch @_processnumber

            #*************************************************************
            # タイトル
            #*************************************************************
            when 0
                @mapControlObj.dispMap(0, 1)

                # ゲームタイトル
                @titleimg = addObject
                    image: 'title'
                    x: GLOBAL['GAMESCREEN_WIDTH'] / 2
                    y: -120
                    width: 480
                    height: 200
                    scaleX: 0.7
                    scaleY: 0.7
                    animlist: [
                        [100, [0]]
                    ]
                    scene: GAMESCENE_SUB2

                # スタートボタン
                @startbuttonobj = addObject
                    image: 'startbutton'
                    motionObj: startbutton
                    x: GLOBAL['GAMESCREEN_WIDTH'] / 2
                    y: -120
                    width: 320
                    height: 120
                    scaleX: 0.5
                    scaleY: 0.5
                    animlist: [
                        [100, [0]]
                    ]
                    scene: TOPSCENE
                , @
                    
                @titleimg.moveBy(0, 300, 1000, BOUNCE, EASEOUT)

                @startbuttonobj.moveTo(GLOBAL['GAMESCREEN_WIDTH'] / 2, GLOBAL['GAMESCREEN_HEIGHT'] - 100, 1000, EXPO, EASEOUT).then =>
                    @setProcessNumber(2)
                @nextjob()

            when 1
                nop()
            when 2
                if (PADBUTTONS[0][7])
                    @nextjob()

            #*************************************************************
            # ゲームスタート
            #*************************************************************
            when 3
                removeObject(@titleimg)
                removeObject(@startbuttonobj)
                @mapControlObj.dispMap(0, 8)
                @bgm = playSound('bgm03', 1.0, true)
                @stageControlObj.setStage(1)
                @scoreControlObj.reset()
                @setProcessNumber(10)

            #*************************************************************
            #*************************************************************
            #*************************************************************
            #
            # ゲームここから
            #
            when 10 # ゲーム中
                nop()
            #
            # ゲームここまで
            #*************************************************************
            #*************************************************************
            #*************************************************************

            #*************************************************************
            # ゲームオーバー
            #*************************************************************
            when 20
                @bgm.stop()
                @gameover = addObject
                    type: LABEL
                    x: SCREEN_WIDTH / 2
                    y: GLOBAL['GAMESCREEN_HEIGHT'] / 2
                    width: GLOBAL['GAMESCREEN_WIDTH']
                    height: 64
                    fontsize: 64
                    color: 'white'
                    opacity: 0.0
                    textalign: 'center'
                    labeltext: 'GAME OVER'
                    scene: GAMESCENE_SUB2
                @gameover.fadeIn(500).delay(1000).fadeOut(500).then =>
                    removeObject(@gameover)
                    @stageControlObj.myshipRemoveAllBullet()
                    @stageControlObj.enemyRemoveAllBullet()
                    @stageControlObj.enemyRemoveAll()
                    #setWorldView((GLOBAL['GAMESCREEN_WIDTH']) / 2, (GLOBAL['GAMESCREEN_HEIGHT']) / 2, 0, 0)
                    setWorldView(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
                    @setProcessNumber(0)
                @nextjob()
            when 21
                nop()
                

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

