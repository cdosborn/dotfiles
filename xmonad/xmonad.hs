import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified XMonad.StackSet as W


myManageHook = composeAll
    [ role =? "gimp-toolbox-color-dialog" --> doFloat
    , role =? "gimp-action-search-dialog" --> doFloat
    , className =? "upwork" --> doFloat ]
  where role = stringProperty "WM_WINDOW_ROLE"
        name = stringProperty "WM_NAME"
        className = stringProperty "WM_CLASS"

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = myManageHook <+> manageDocks <+> manageHook defaultConfig
        , terminal = "xfce4-terminal"
        , focusFollowsMouse = True
        , handleEventHook = fullscreenEventHook
        , layoutHook = avoidStruts $ smartBorders  $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "white" "black" . wrap "[" "]"
                        , ppTitle = xmobarColor "white" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , borderWidth = 8
        , focusedBorderColor = "#AAAAFF"
        , normalBorderColor = "#000000"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_e), spawn "EDITOR=vim x-terminal-emulator -e bash -c 'xsel -ob | vipe | xsel -ib'")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "x-www-browser")
        , ((mod4Mask .|. shiftMask, xK_l), spawn "systemctl suspend")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((controlMask, xK_Right), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
        , ((controlMask, xK_Left), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
        , ((0, 0x1008FF11), spawn "~/dotfiles/scripts/pactl-volume-change.sh -10%")
        , ((0, 0x1008FF13), spawn "~/dotfiles/scripts/pactl-volume-change.sh +10%")
        , ((0, 0x1008FF12), spawn "amixer -D pulse set Master toggle")
        , ((0, 0x1008FF02), spawn "xbacklight -inc 10%")
        , ((0, 0x1008FF03), spawn "xbacklight -dec 10%")
        , ((0, 0x1008FF59), sendMessage ToggleStruts)
        ]
