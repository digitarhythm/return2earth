#**********************************************************************************************************
# enforce game engine
#
# 2014.04.04 ver2.0
#
# Coded by Kow Sakazaki
#**********************************************************************************************************

# static values setting ***********************************************************************************
DEBUG           = true                      # デバッグモード
SCREEN_WIDTH    = 480                       # 画面の幅
SCREEN_HEIGHT   = 800                       # 画面の高さ
BGCOLOR         = "black"                   # 背景色
OBJECTNUM       = 256                       # キャラの最大数
FPS             = 60                        # FPS
GRAVITY_X       = 0.0                       # box2d用水平方向重力
GRAVITY_Y       = 9.8                       # box2d用垂直方向重力
GAMEPADMIX      = true

# preloading image list ***********************************************************************************
MEDIALIST =
    controlplane    : 'media/picture/controlplane.png'
    collider        : 'media/picture/colliderimage.png'
    startbutton     : 'media/picture/startbutton.png'
    enemy01         : 'media/picture/chara1.png'
    enemybullet     : 'media/picture/enemybullet.png'
    burnparticle    : 'media/picture/enemybullet.png'
    title           : 'media/picture/title.png'
    myship          : 'media/picture/myship.png'
    myshipbullet    : 'media/picture/myshipbullet.png'
    mapchip         : 'media/picture/mapchip.png'
    scorebg         : 'media/picture/scorebg.png'
    blacktile       : 'media/picture/blacktile.png'
    mycollider      : 'media/picture/mychara_collider.png'
    vgamepad        : 'media/picture/vgamepad.png'
    star            : 'media/picture/star.png'
    bgimage         : 'media/picture/galaxy.png'
    controllerbg    : 'media/picture/controllerselect.png'

    gamestart       : 'media/sound/gamestart.mp3'
    shoot02         : 'media/sound/shoot02.mp3'
    shoot03         : 'media/sound/shoot03.mp3'
    bomb01          : 'media/sound/bomb01.mp3'
    bomb02          : 'media/sound/bomb02.mp3'
    bgm03           : 'media/sound/bgm03.mp3'
