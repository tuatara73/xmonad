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
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        } `additionalKeys`
        [ ((mod4Mask, xK_l), spawn "slock")
        , ((mod4Mask, xK_f), spawn "firefox")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "sudo poweroff")
        , ((mod4Mask .|. shiftMask, xK_r), spawn "sudo reboot")
        , ((0, xK_Print), spawn "flameshot gui")
        ]
