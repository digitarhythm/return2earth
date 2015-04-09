class startbutton extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)

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
                nop()

    #**************************
    # touch event
    #**************************
    touchesBegan:(pos)->
        super(pos)
        @x += 2
        @y += 2

    #**************************
    # swipe event
    #**************************
    #touchesMoved:(pos)->
    #    super(pos)

    #**************************
    # detach event
    #**************************
    touchesEnded:(pos)->
        super(pos)
        @x -= 2
        @y -= 2
        if (@x - (@width / 2) < pos.x && @y - (@height / 2) < pos.y && pos.x < @x + (@width / 2) && pos.y < @y + (@height / 2))
            if (@parent._processnumber == 2)
                playSound('gamestart')
                @parent.waitjob(1)

    #**************************
    # touch cancel event
    #**************************
    #touchesCanceled:(pos)->
    #    super(pos)
