Config = {}
--[[

Report System Configuration
By Livaco

]]--

-- Width percentage, ScrW() is the width of the players screen. e.g: If u wanted the width to be 80 percent of the screen, you would put Config.Width = ScrW() * 0.8
Config.Width = ScrW() * 0.8

-- Same above but with the height.
Config.Height = ScrH() * 0.8

-- Server Name, for the DFrame's Title
Config.ServerName = "Example Server"

-- Blur the background of the DFrame or not.
Config.BlurBackground = true

-- What should the default text be in the reason box
Config.DefaultReason = "Reason"

-- If the panel should close after the submit button is pressed. Recomended to stop spam.
Config.ClosePanelOnSubmit = true

-- What it should say underneath the Submit button, sort of like a licence agreement. Can't be too long or it will go off the screen.
Config.SubmitText = "NOTE: Any unfair or spammed reports will result in punishment."