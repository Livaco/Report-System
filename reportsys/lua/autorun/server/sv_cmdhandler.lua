--[[

Report System
By Livaco

Don't edit this file if you do not know what your doing. Only edit the configuration.
]]--

util.AddNetworkString("report_openuserpanel")
util.AddNetworkString("report_openadminpanel")
util.AddNetworkString("report_nopermerror")
util.AddNetworkString("report_reporthandler")
util.AddNetworkString("report_reports")

net.Receive("report_reporthandler", function()

	reportstable = net.ReadTable() -- Hold the var for when the admin menu appears.

end)

hook.Add("PlayerSay", "reportsyscmdhandler", function(sender, text, teambool)

	if text == "!report" or text == "!reportplayer" then
		
		net.Start("report_openuserpanel")
		net.Send(sender)

		return ""
		
	end

	if text == "!reportadmin"  then
		
		if sender:IsAdmin() then

			net.Start("report_openadminpanel")
			net.Send(sender)

			net.Start("report_reports")
			net.WriteTable(reportstable)
			net.Send(sender)

		else

			net.Start("report_nopermerror")
			net.Send(sender)	

		end

	end
	
end)