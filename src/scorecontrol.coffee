class scorecontrol extends _stationary
    #**************************
    # character constructor
    #**************************
    constructor:(initparam)->
        super(initparam)
        @score = 0
        @vgamepadflag = false

        @scorelabel = addObject
            type: LABEL
            x: SCREEN_WIDTH / 2
            y: 16
            width: SCREEN_WIDTH
            height: 24
            fontsize: 24
            color: 'white'
            textalign: 'left'
            labeltext: sprintf('SCORE: %08@', 0)
            scene: TOPSCENE


    #**************************
    # character destructor
    #**************************
    destructor:->
        super()
        removeObject(@scorelabel) if (@scorelabel?)

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

    reset:->
        @score = 0
        @scorelabel.labeltext = "SCORE: "+sprintf("%08@", 0)

    add:(num)->
        @score += num
        @scorelabel.labeltext = "SCORE: "+sprintf("%08@", @score)
