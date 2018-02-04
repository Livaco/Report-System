--[[

Report System
By Livaco

Don't edit this file if you do not know what your doing. Only edit the configuration.
]]--

IncludeCS("config.lua")

reports = {}

local function UserPanel()

	--chat.AddText(Color(120, 120, 120) .. "[Report System]" .. Color(255, 0, 0) .. " Opening user menu. If you wish to open the admin menu, use !reportadmin")

	PANEL = {}
	PANEL.Title = " User Menu - Report System by Livaco"
	PANEL.StartTime = SysTime()

	ReportedPlayer = "nil"
	ReportingPlayer = LocalPlayer():Nick()
	ReportReason = "nil"
	ReportOtherNotes = "nil"

	reports = {}

	local frame = vgui.Create("DFrame")
	frame:SetSize(Config.Width, Config.Height)
	frame:SetTitle(Config.ServerName .. PANEL.Title)
	frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame:Center()
	frame:MakePopup()

	frame.Paint = function(self, w, h)

		if Config.BlurBackground == true then

			Derma_DrawBackgroundBlur(frame, PANEL.StartTime)

		end

		draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50))

	end

	local closebutton = vgui.Create("DButton", frame)
	closebutton:SetPos(ScrW() * 0.789, 0)
	closebutton:SetSize(20, 20)
	closebutton:SetText("X")
	closebutton.DoClick = function()

		frame:Close()

	end
	function closebutton:Paint(w, h)

		if closebutton:IsHovered() then

			draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50))

		else

			draw.RoundedBox(0, 0, 0, w, h, Color(10, 10, 10))

		end

	end

	local players = vgui.Create("DListView", frame)
	players:SetSize(Config.Width * 0.2, Config.Height * 0.9)
	players:SetPos(Config.Width * 0.02, Config.Height * 0.06)
	players:AddColumn("Select Player")

	for k,v in pairs(player.GetAll()) do

		players:AddLine(v:Nick())

	end

	players.OnRowSelected = function(lst, index, pnl)

		ReportedPlayer = pnl:GetColumnText(1)
		print(ReportedPlayer)

	end

	local reasontext = vgui.Create("DLabel", frame)
	reasontext:SetPos(Config.Width * 0.25, Config.Height * 0.057)
	reasontext:SetText("Reason:")

	local reasonbox = vgui.Create("DTextEntry", frame)
	reasonbox:SetPos(Config.Width * 0.25, Config.Height * 0.09)
	reasonbox:SetSize(Config.Width * 0.73, Config.Height * 0.8)
	reasonbox:SetUpdateOnType(true)
	reasonbox:SetMultiline(true)
	reasonbox:SetText(Config.DefaultReason)

	reasonbox.OnChange = function(self)

		ReportReason = self:GetValue()

	end

	local submitbutton = vgui.Create("DButton", frame)
	submitbutton:SetText("Submit")
	submitbutton:SetPos(Config.Width * 0.25, Config.Height * 0.92)
	submitbutton:SetSize(Config.Width * 0.73, Config.Height * 0.02)

	-- Note: Start a net message and then send the table to the admin panel for it to display.

	submitbutton.DoClick = function()

		table.insert(reports, ReportingPlayer .. " reported " .. ReportedPlayer .. " for " .. ReportReason)

		net.Start("report_reporthandler")
		net.WriteTable(reports)
		net.SendToServer()

	end

end 


net.Receive("report_openuserpanel", UserPanel)

