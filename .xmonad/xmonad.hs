-- import someone
import XMonad

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeysP)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Renamed

import Data.Maybe
import Data.List
import Control.Monad
-- import end

-- my fix fullscreen function
setFullscreenSupported :: X ()
setFullscreenSupported = addSupported ["_NET_WM_STATE", "_NET_WM_STATE_FULLSCREEN"]

addSupported :: [String] -> X ()
addSupported props = withDisplay $ \dpy -> do
  r <- asks theRoot
  a <- getAtom "_NET_SUPPORTED"
  newSupportedList <- mapM (fmap fromIntegral . getAtom) props
  io $ do
     supportedList <- fmap (join . maybeToList) $ getWindowProperty32 dpy a r
     changeProperty32 dpy r a aTOM propModeReplace (nub $ newSupportedList ++ supportedList)
-- function end

-- custom xmobar
myXmobarPP h = xmobarPP {
     ppCurrent = xmobarColor "#50fa7b" "" . wrap "[" "]",
     ppOutput = hPutStrLn h}
-- custom xmobar end

--autostart
myStartupHook = do
     spawnOnce "trayer-srg --edge top --align right --widthtype request --padding 5 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 40 &"
     spawnOnce "picom"
     spawnOnce "feh --bg-fill ~/Downloads/wall.jpg"
     spawnOnce "onboard"
     spawnOnce "fcitx5"
-- autstart end

-- keybind
myKeyBind = [
     ("<XF86AudioRaiseVolume>"  , spawn "pulsemixer --unmute && pulsemixer --change-volume +5"),
     ("<XF86AudioLowerVolume>"  , spawn "pulsemixer --unmute && pulsemixer --change-volume -5"),
     ("<XF86AudioMute>"         , spawn "pulsemixer --mute"),
     ("M-p"                     , spawn "rofi -show drun")
     ]    
-- keybind end

-- layouts config
layouts = avoidStruts (tiled ||| Mirror tiled ||| tabs)
  where
     tiled = renamed [Replace "N"] $ gaps 4 4 $ toggleLayouts maximized (smartBorders (Tall 1 (3/100) (1/2)))
     tabs = renamed [Replace "T"] $ gaps 8 0 $ noBorders (tabbed shrinkText def)
     maximized = smartBorders Full
     gaps n k = spacingRaw False (Border n n n n) True (Border k k k k) True
-- layouts config end

-- main function
main = do 
  _topXmobar <- spawnPipe "xmobar"
  xmonad $ docks $ ewmh def
     {
     terminal           = "alacritty",
     borderWidth        = 2,
     modMask            = mod4Mask ,
     normalBorderColor  = "#2e303e",
     focusedBorderColor = "#e95678",
     startupHook        = myStartupHook <+> setFullscreenSupported,
     layoutHook         = layouts,
     handleEventHook    = handleEventHook def <+> fullscreenEventHook,
     logHook            = dynamicLogWithPP $ myXmobarPP _topXmobar
     }`additionalKeysP` myKeyBind
-- main function end
