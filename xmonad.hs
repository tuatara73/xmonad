import XMonad
import XMonad.Hooks.DynamicBars
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO



main = do   
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks defaultConfig
		{ terminal    = "st"
		}
        { layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        }
         `additionalKeys`
        [ ((mod4Mask, xK_l), spawn "slock")
        , ((mod4Mask, xK_f), spawn "firefox")
        , ((mod4Mask, xK_r), spawn "remmina")
        , ((mod4Mask, xK_n), spawn "st -e nnn")
        , ((mod4Mask, xK_n), spawn "st -e nnn")
        , ((mod4Mask, xK_Prior), spawn "pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo +5%")
        , ((mod4Mask, xK_Next), spawn "pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo -5%")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "sudo poweroff")
        , ((mod4Mask .|. shiftMask, xK_r), spawn "sudo reboot")
        , ((0, xK_Print), spawn "flameshot gui")
        ]
