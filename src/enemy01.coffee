class enemy01 extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        @gamecontrolobj = GLOBAL['gamecontrol']
        @stagecontrolobj = GLOBAL['stagecontrol']
        @enemylist = GLOBAL['enemylist']
        @enemybullet = GLOBAL['enemybullet']
        @myshipbullet = GLOBAL['myshipbullet']
        @myship = GLOBAL['myship']
        @scoreobj = GLOBAL['scoreobj']
        @basex = @x
        @worldend = GLOBAL['worldend']

        @xs = rand(8) - 4
        @ys = rand(4) + 1

        @angle = 30
        @angleadd = 12
        @speed = 12
        @fireinterval = 0.1
        @firecount = 0.0

        @aim_speed = 8
        @aim_fireinterval = 0.5
        @aim_firecount = 0.0

        collider = addObject
            image: 'scorebg'
            x: @x
            y: @y
            width: 48
            height: 48
            scene: TOPSCENE
        @collider = collider

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
                if (LAPSEDTIME > @firecount)
                    @firecount = LAPSEDTIME + @fireinterval
                    xs = Math.cos(@angle * RAD)
                    ys = Math.sin(@angle * RAD)
                    @fire(xs * @speed, ys * @speed)
                    @angle += @angleadd
                    if (@angle > 359)
                        @angle -= 360

                if (LAPSEDTIME > @aim_firecount)
                    @aim_firecount = LAPSEDTIME + @aim_fireinterval
                    dx = @myship.x - @x
                    dy = (@myship.y - 16) - @y
                    arc = Math.sqrt(dx * dx + dy * dy)
                    xs = dx / arc
                    ys = dy / arc
                    @fire(xs * @aim_speed, ys * @aim_speed)

                if (@x < 0 || @worldend.x < @x)
                    @xs *= -1
                if (@y < 0 || @worldend.y < @y)
                    @ys *= -1

                for bullet in @myshipbullet
                    if (bullet?)
                        if (@isIntersect(bullet))
                            playSound('bomb01')
                            addObject
                                type: CONTROL
                                motionObj: burn01
                                x: @x
                                y: @y
                            @scoreobj.add(100)
                            @stagecontrolobj.removeEnemy(@)
                            @stagecontrolobj.myshipRemoveBullet(bullet)

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

    fire:(xs, ys)->
        obj = addObject
            image: 'enemybullet'
            motionObj: enemyBullet
            width: 16
            height: 16
            scaleX: 0.75
            scaleY: 0.75
            x: @x
            y: @y
            xs: xs
            ys: ys
            animlist: [
                [100, [0]]
            ]
            scene: GAMESCENE
            worldview: true
        , @
        @enemybullet.push(obj)
