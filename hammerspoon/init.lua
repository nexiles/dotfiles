local grid = require "hs.grid"
local windowAnimationDuration = 0

grid.GRIDHEIGHT = 4
grid.GRIDWIDTH  = 4
grid.HINTS = {
	{ "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10" },
	{ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" },
	{ "Q", "W", "E", "R", "T", "Z", "U", "I", "O", "P" },
	{ "A", "S", "D", "F", "G", "H", "J", "K", "L", ";" },
	{ "Y", "X", "C", "V", "B", "N", "M", ",", ".", "/" } }

---------------------------------------------------------------------
---------------------------------------------------------------------
-- https://github.com/gwww/dotfiles/blob/master/_hammerspoon/init.lua

-- Cycle args for the function when called repeatedly: cycleCalls( fn, { {args1...}, ... } )
function cycleCalls( fn, args )
    local argIndex = 0
    return function()
        argIndex = argIndex + 1
        if (argIndex > #args) then
            argIndex = 1;
        end
        fn( args[ argIndex ] );
    end
end

-- This method can be used to place a window to a position and size on the screen by using
-- four floats instead of pixel sizes. Returns the window instance. Examples:
--     windowToGrid( someWindow, 0, 0, 0.25, 0.5 );     -- top-left, width: 25%, height: 50%
--     windowToGrid( someWindow, 0.3, 0.2, 0.5, 0.35 ); -- top: 30%, left: 20%, width: 50%, height: 35%
function windowToGrid( window, rect )
    -- TODO: change rect to use named indices rather than integer
    if not window then
        return window
    end

    local screen = hs.screen.mainScreen():fullFrame()
    window:setFrame( {
        x = math.floor( rect[1] * screen.w + .5 ) + screen.x,
        y = math.floor( rect[2] * screen.h + .5 ) + screen.y,
        w = math.floor( rect[3] * screen.w + .5 ),
        h = math.floor( rect[4] * screen.h + .5 )
    }, windowAnimationDuration)
    return window
end

function toGrid( x, y, w, h )
    windowToGrid( hs.window.focusedWindow(), x, y, w, h );
end

-- Toggle between full screen and orginial size. Returns the window instance.
local previousSizes = {}
function toggleMaximize( window )
    if not window then
        return window
    end

    local id = window:id()
    if not id then
    	return window
    end
    if previousSizes[ id ] == nil then
        previousSizes[ id ] = window:frame()
        window:maximize(windowAnimationDuration)
    else
        window:setFrame( previousSizes[ id ], windowAnimationDuration )
        previousSizes[ id ] = nil
    end

    return window
end

---------------------------------------------------------------------
---------------------------------------------------------------------
-- key binding
local modNone = {}
local k = hs.hotkey.modal.new(modNone, "f1")
k:bind( modNone, "escape", function() k:exit() end)
k:bind( modNone, "return", function() k:exit() end)

function k:entered()
	hs.alert.show('Window Manager', 99999)
end

function k:exited()
	hs.alert.closeAll()
end

function modalExit()
	k:exit()
end

k:bind( modNone, 'f1', function() modalExit(); hs.grid.show() end)
-- Centre window
k:bind( modNone, 'c', cycleCalls( toGrid, {{.04, 0, 0.92, 1},{0.22, 0.025, 0.56, 0.95},{0.1, 0, 0.8, 1}} ) )
-- Toggle between maximized and its initial size and position.
k:bind( modNone, 'space', function() toggleMaximize(  hs.window.focusedWindow() ); k:exit() end )
k:bind( modNone, 'm', function() toggleMaximize(  hs.window.focusedWindow() ); k:exit() end )
-- Size/position to one side of the screen
k:bind( modNone, 'left',  cycleCalls( toGrid, { {0, 0, 0.5, 1},   {0, 0, 0.6, 1},   {0, 0, 0.4, 1} } ));
k:bind( modNone, 'right', cycleCalls( toGrid, { {0.5, 0, 0.5, 1}, {0.4, 0, 0.6, 1}, {0.6, 0, 0.4, 1} } ));
k:bind( modNone, 'up',    function() toGrid( {0, 0,   1, 0.3 } ) end )
k:bind( modNone, 'down',  function() toGrid( {0, 0.7, 1, 0.3 } ) end )

---------------------------------------------------------------------
---------------------------------------------------------------------
-- config reloading
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/dotfiles/hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")