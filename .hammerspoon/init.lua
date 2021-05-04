function getWinList(name)
   return hs.window.filter.new(false):setAppFilter(name, { currentSpace = true }):getWindows()
end


function launchOrNextWindow(name, showName)
   local findName = showName or name
   local appName = hs.application.frontmostApplication():name()
   if findName ~= appName then
      hs.application.launchOrFocus(name)
   else
      local wlist = getWinList(findName)
      local wcount = #wlist
      if wcount > 1 then
	 hs.eventtap.keyStroke({'cmd'}, '`')
      else
	 local win = wlist[1]
	 if win:isMinimized() then win:unminimize() else win:minimize() end
      end
   end
end


function mapLaunch(key, name, showName)
   hs.hotkey.bind({'cmd','alt','shift','ctrl'}, key, function()
	 launchOrNextWindow(name, showName)
   end)
end


mapLaunch('s', 'Firefox')
mapLaunch('e', 'Emacs')
mapLaunch('d', 'Screen Sharing')
mapLaunch('q', 'screenshot')
mapLaunch('m', 'Spotify')
mapLaunch('f', 'Finder')
mapLaunch('a', 'Kitty')

function moveLeftHalf()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()
   f.x = max.x
   f.y = max.y
   f.w = max.w / 2
   f.h = max.h
   win:setFrame(f)
end

function moveRightHalf()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()
   f.x = max.x + (max.w / 2)
   f.y = max.y
   f.w = max.w / 2
   f.h = max.h
   win:setFrame(f)
end

function maximize()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()
   f.x = max.x
   f.y = max.y
   f.w = max.w
   f.h = max.h
   win:setFrame(f)
end

function moveToScreen(screenPos)
   window = hs.window.focusedWindow()
   screen = hs.screen.find({x=screenPos, y=0})
   window:moveToScreen(screen)
end
hs.hotkey.bind({'cmd','alt','shift','ctrl'}, "1", function()
      moveToScreen(0)
      moveLeftHalf()
end)

hs.hotkey.bind({'cmd','alt','shift','ctrl'}, "2", function()
      moveToScreen(0)
      moveRightHalf()
end)

hs.hotkey.bind({'cmd','alt','shift','ctrl'}, "3", function()
      moveToScreen(1)
      moveLeftHalf()
end)

hs.hotkey.bind({'cmd','alt','shift','ctrl'}, "4", function()
      moveToScreen(1)
      moveRightHalf()
end)
hs.hotkey.bind({'cmd','alt','shift','ctrl'}, "z", maximize)
