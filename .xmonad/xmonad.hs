import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.SpawnOnce
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
           {
             modMask = mod4Mask
             , terminal = "alacritty"
             , borderWidth = 2
             , normalBorderColor = "#cccccc"
             , focusedBorderColor = "#cd8b00"
             , startupHook = myStartupHook
             , handleEventHook    = fullscreenEventHook
             } `additionalKeysP`   
        [   ("<XF86AudioRaiseVolume>"  , spawn "pulsemixer --unmute && pulsemixer --change-volume +5")
          , ("<XF86AudioLowerVolume>"  , spawn "pulsemixer --unmute && pulsemixer --change-volume -5")
          , ("<XF86AudioMute>"         , spawn "pulsemixer --mute")
          , ("<Print>"                 , spawn "flameshot gui -p ~/Pictures/Screenshots")
          , ("M-d"                     , spawn "rofi -show drun")
        ]
           
myStartupHook = do
          spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 25 &"
          spawnOnce "picom"
          spawnOnce "feh --bg-fill ~/Downloads/wall.png"
          setWMName "LG3D"
