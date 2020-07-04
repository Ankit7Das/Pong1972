WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[runs when the game first starts up, once; used to initialise the game]]
function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[called after update by Love 2D, used to draw anything on the screen, update]]
function love.draw()
    love.graphics.printf(
        'Hello Pong!',          --text to render
        0,                      --starting X (0 since we're going to center it based on width)
        WINDOW_HEIGHT/2-6,      --starting Y (halfway down the screen)
        WINDOW_WIDTH,           --number of pixels to center within (the entire screen here)
        'center'                --alignment mode, can be 'center', 'left', or 'right'
    )
end