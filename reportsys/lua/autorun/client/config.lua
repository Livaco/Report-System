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