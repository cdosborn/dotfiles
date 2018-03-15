import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , terminal = "st"
        , focusFollowsMouse = True
        , handleEventHook = fullscreenEventHook
        , layoutHook = avoidStruts $ smartBorders  $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "white" "black" . wrap "[" "]"
                        , ppTitle = xmobarColor "white" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , borderWidth = 2
        , focusedBorderColor = "#0000FF"
        , normalBorderColor = "#000000"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_e), spawn "EDITOR=vim st -e bash -c 'xsel -ob | vipe | xsel -ib'")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "x-www-browser")
        , ((mod4Mask .|. shiftMask, xK_l), spawn "gnome-screensaver-command -l")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, 0x1008FF11), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
        , ((0, 0x1008FF13), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
        , ((0, 0x1008FF12), spawn "amixer -D pulse set Master toggle")
        , ((0, 0x1008FF02), spawn "xbacklight -inc 10%")
        , ((0, 0x1008FF03), spawn "xbacklight -dec 10%")
        ]
