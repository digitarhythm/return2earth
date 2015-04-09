class stageControl extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)

        #*********************************
        # ゲームで使用する配列
        #*********************************
        # 自機の弾
        @myshipbullet = []
        GLOBAL['myshipbullet'] = @myshipbullet
        # 敵
        @enemylist = []
        GLOBAL['enemylist'] = @enemylist
        # 敵の弾
        @enemybullet = []
        GLOBAL['enemybullet'] = @enemybullet

        @worldend = GLOBAL['worldend']

        #*********************************
        # 制御系オブジェクト
        #*********************************
        # スコア制御
        @scoreobj = addObject
            type: CONTROL
            motionObj: scorecontrol
        GLOBAL['scoreobj'] = @scoreobj
        # ステージコントロール
        GLOBAL['stagecontrol'] = @
        # ゲームコントロール
        @gamecontrolobj = GLOBAL['gamecontrol']
        # マップコントロール
        @mapControlObj = GLOBAL['mapcontrol']

        @stagenum = 0

    #**************************
    # character destructor
    #**************************
    destructor:->
        super()
        removeObject(@myshipobj) if (@myshipobj?)
        removeObject(@scoreobj) if (@scoreobj?)
        removeObject(@stageManager) if (@stageManager?)

    #**************************
    # character behavior
    #**************************
    behavior:->
        super()
        switch @_processnumber
            when 0
                nop()

            when 1 # 1面
                @myshipObj = addObject
                    image: 'myship'
                    motionObj: myship
                    x: @worldend.x / 2
                    y: GLOBAL['GAMESCREEN_HEIGHT'] / 5 * 4
                    width: 128
                    height: 128
                    scaleX: 0.4
                    scaleY: 0.4
                    animlist: [
                        [30, [0, 1]]
                        [30, [2]]
                        [30, [3]]
                    ]
                    scene: GAMESCENE_SUB2
                    worldview: true
                GLOBAL['myship'] = @myshipObj
                # 1面オブジェクト生成
                @stageManager = addObject
                    type: CONTROL
                    motionObj: stage1
                @nextjob()
            when 2
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

    #**************************
    # 自機の弾を削除する
    #**************************
    myshipRemoveBullet:(bullet)->
        for obj, num in @myshipbullet
            if (obj? && bullet?)
                if (obj._uniqueID == bullet._uniqueID)
                    @myshipbullet.splice(num, 1)
                    removeObject(obj)
                    break

    #**************************
    # 敵の弾を削除する
    #**************************
    enemyRemoveBullet:(bullet, flag = false)->
        for obj, num in @enemybullet
            if (obj? && bullet?)
                if (obj._uniqueID == bullet._uniqueID)
                    @enemybullet.splice(num, 1)
                    removeObject(obj)
                    break

    #**************************
    # 敵を削除して生成する
    #**************************
    removeEnemy:(enemy)->
        if (enemy?)
            removeObject(enemy)
            for obj, num in @enemylist
                if (obj._uniqueID == enemy._uniqueID)
                    @enemylist.splice(num, 1)
        obj = addObject
            image: 'enemy01'
            motionObj: enemy01
            width: 32
            height: 32
            x: rand(GLOBAL['GAMESCREEN_WIDTH'])
            y: 0
            #opacity: 0.5
            scaleX: 3.0
            scaleY: 3.0
            animlist: [
                [100, [5, 6, 5, 7]]
            ]
            worldview: true
        @enemylist.push(obj)

    #**************************
    # 敵の弾を全て削除
    #**************************
    enemyRemoveAllBullet:->
        for obj in @enemybullet
            removeObject(obj)
        @enemybullet.length = 0

    #**************************
    # 自機の弾を全て削除
    #**************************
    myshipRemoveAllBullet:->
        for obj in @myshipbullet
            removeObject(obj)
        @myshipbullet.length = 0

    #**************************
    # 敵をすべて削除
    #**************************
    enemyRemoveAll:->
        for obj in @enemylist
            removeObject(obj)
        @enemylist.length = 0

    #**************************
    # ステージセレクト
    #**************************
    setStage:(num)->
        switch (num)
            when 1
                @setProcessNumber(1)

