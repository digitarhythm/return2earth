class myship extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        @myshipbullet = GLOBAL['myshipbullet']
        @enemybullet = GLOBAL['enemybullet']
        @gamecontrolobj = GLOBAL['gamecontrol']
        @scoreobj = GLOBAL['scoreobj']
        @worldend = GLOBAL['worldend']

        @speed = 5
        @bulletinterval = 0.2
        @bullettime = 0.0

        collider = addObject
            type: COLLIDER2D
            image: 'collider'
            x: @x
            y: @y
            width: 4
            height: 12
            offsety: -20
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
                axes = PADAXES[0]
                stick = ANALOGSTICK[0][0]
                #debugwrite
                #    labeltext: sprintf("x=%@, y=%@", stick[HORIZONTAL], stick[VERTICAL])
                #    clear: true

                if (axes[HORIZONTAL] < 0)
                    @animnum = 2
                else if (axes[HORIZONTAL] > 0)
                    @animnum = 1
                else
                    @animnum = 0

                if (Math.abs(stick[HORIZONTAL]) < 0.1)
                    vx = 0.0
                else
                    vx = stick[HORIZONTAL]
                if (Math.abs(stick[VERTICAL]) < 0.1)
                    vy = 0.0
                else
                    vy = stick[VERTICAL]

                vx *= @speed
                vy *= @speed

                @x += vx
                if (@x < 0)
                    @x = 0
                if (@x > @worldend.x)
                    @x = @worldend.x

                @y += vy
                if (@y < 0)
                    @y = 0
                if (@y > @worldend.y)
                    @y = @worldend.y

                button = PADBUTTONS[0]
                #if (button[0])
                if (@bullettime < LAPSEDTIME)
                    @fire()
                    @bullettime = LAPSEDTIME + @bulletinterval
                #else
                #    @bulletinterval = 0

                for obj in @enemybullet
                    if (obj?)
                        if (@isIntersect(obj))
                            playSound('bomb02')
                            addObject
                                type: CONTROL
                                motionObj: burn02
                                x: @x
                                y: @y
                            @gamecontrolobj.setProcessNumber(20)
                            removeObject(@)
                            
                #setWorldView(@x, @y)

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

    fire:->
        if (@myshipbullet.length < 3)
            playSound('shoot02')
            obj = addObject
                image: 'myshipbullet'
                motionObj: myshipBullet
                x: @x
                y: @y - 8
                width: 12
                height: 32
                opacity: 1.0
                animlist: [
                    [10, [0, 1]]
                ]
                worldview: true
            , @
            @myshipbullet.push(obj)

