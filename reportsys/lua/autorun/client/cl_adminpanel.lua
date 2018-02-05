--[[

Report System
By Livaco

Don't edit this file if you do not know what your doing. Only edit the configuration.
]]--

local function AdminPanel()

	if LocalPlayer():IsAdmin() then

		-- TODO

		PANEL = {}
		PANEL.Title = " Administrator Menu - Report System by Livaco"
		PANEL.StartTime = SysTime()

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

		local reportlist = vgui.Create("DListView", frame)
		reportlist:Dock(FILL)
		reportlist:AddColumn("Reports - Right Click to Copy.")

		net.Receive("report_reports", function()

				ReportTable = net.ReadTable()

				for k,v in pairs(ReportTable) do

					reportlist:AddLine(v)

				end

		end)

		function reportlist:OnRowRightClick(id, text)

			chat.AddText(Color(120, 120, 120), "[Report System] ", Color(150, 150, 150), "Copied report ID " .. id .. ".")
			SetClipboardText(text:GetColumnText(1))

		end

	end

end

net.Receive("report_openadminpanel", AdminPanel)