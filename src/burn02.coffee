class burn02 extends _stationary
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
                burn = addObject
                    image: 'burnparticle'
                    motionObj: burnparticle02
                    x: @x
                    y: @y
                    scaleX: 20.0
                    scaleY: 20.0
                    width: 16
                    height: 16
                    worldview: true
                    animlist: [
                        [100, [0]]
                    ]
                removeObject(@)

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
