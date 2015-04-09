class mapControl extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        @map = []
        for k in [0...2]
            tmp2 = []
            for i in [0...(GLOBAL['GAMESCREEN_HEIGHT'] / 32)]
                @tmp = []
                for j in [0...(GLOBAL['GAMESCREEN_WIDTH'] / 32)]
                    @tmp.push(if (rand(20) == 0) then rand(2) + 1 else 0)
                tmp2.push(@tmp)
            for arr in tmp2
                tmp2.push(arr)
            @map.push(tmp2)

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
                if (@mapObject?)
                    if (@mapObject.y > GLOBAL['GAMESCREEN_HEIGHT'])
                        y2 = @mapObject.y
                        @mapObject.y = @mapObject.y - GLOBAL['GAMESCREEN_HEIGHT']
                if (@mapObject2?)
                    if (@mapObject2.y > GLOBAL['GAMESCREEN_HEIGHT'])
                        @mapObject2.y = @mapObject2.y - GLOBAL['GAMESCREEN_HEIGHT']

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

    dispMap:(num, speed = 1)->
        if (@mapObject?)
            removeObject(@mapObject)
        if (@mapObject2?)
            removeObject(@mapObject2)
        if (num == 0)
            @mapObject = addObject
                image: 'star'
                type: MAP
                map: @map[0]
                x: GLOBAL['GAMESCREEN_WIDTH'] / 2
                y: 0
                width: 32
                height: 32
                ys: speed
                scene: BGSCENE
#                worldview: true
            @mapObject2 = addObject
                image: 'star'
                type: MAP
                map: @map[1]
                x: GLOBAL['GAMESCREEN_WIDTH'] / 2
                y: 0
                width: 32
                height: 32
                ys: speed * 0.5
                scene: BGSCENE
#                worldview: true

