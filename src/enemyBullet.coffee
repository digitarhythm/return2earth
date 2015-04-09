class enemyBullet extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        @gamecontrolobj = GLOBAL['gamecontrol']
        @stagecontrolobj = GLOBAL['stagecontrol']
        @worldend = GLOBAL['worldend']

        collider = addObject
            type: COLLIDER2D
            image: 'collider'
            width: 8
            height: 8
            x: @x
            y: @y
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
                if (@x < -@width || @worldend.x + @width < @x || -@height > @y || @y > @worldend.y + @height)
                    @stagecontrolobj.enemyRemoveBullet(@)

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
