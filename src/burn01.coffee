class burn01 extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        @num = 0

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
                if (@num++ > 5)
                    @nextjob()
                for i in [0...3]
                    angle = rand(360)
                    addObject
                        image: 'burnparticle'
                        motionObj: burnparticle01
                        x: @x + rand(10) - 5
                        y: @y + rand(10) - 5
                        xs: Math.cos(angle * RAD) * 30
                        ys: Math.sin(angle * RAD) * 30
                        scaleX: 7.0
                        scaleY: 7.0
                        width: 16
                        height: 16
                        worldview: true
                        animlist: [
                            [100, [0]]
                        ]
            when 1
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
