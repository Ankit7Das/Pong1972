-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
--
-- https://github.com/Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[runs when the game first starts up, once; used to initialise the game]]
function love.load()
    -- use nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text 
    -- and graphics; try removing this function to see the difference!
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- initialize our virtual resolution, which will be rendered within our
    -- actual window no matter its dimensions; replaces our love.window.setMode call
    -- from the last example
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[keyboard handling, called by Love 2D each frame; passes in the key we pressed so we can access.]]
function love.keypressed(key)
    --keys can be accessed by string name
    if key == 'escape' then
        --function Love gives us to terminate application
        love.event.quit()
    end
end

--[[called after update by Love 2D, used to draw anything on the screen, update]]
function love.draw()
    --begin rendering at virtual res
    push:apply('start')

    --condensed onto one line from last example
    --note we are now using virtual width and height now for text placement
    love.graphics.printf(
        'Hello Pong!',          --text to render
        0,                      --starting X (0 since we're going to center it based on width)
        VIRTUAL_HEIGHT/2-6,      --starting Y (halfway down the screen)
        VIRTUAL_WIDTH,           --number of pixels to center within (the entire screen here)
        'center'                --alignment mode, can be 'center', 'left', or 'right'
    )

    --end rendering at virtual res
    push:apply('end')
end