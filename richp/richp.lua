Citizen.CreateThread(function()
  while true do
      local PlayerName = GetPlayerName(PlayerId())
      local id = GetPlayerServerId(PlayerId())

		    SetDiscordAppId(1159187893974224967)

		      SetDiscordRichPresenceAsset('logo')
          SetDiscordRichPresenceAssetText('Server Name')
       
          SetDiscordRichPresenceAssetSmall('tick')
          SetDiscordRichPresenceAssetSmallText('Verified By Fivem')

SetRichPresence(PlayerName.." ["..id.."]")
        SetDiscordRichPresenceAction(0, "Connect Fivem Server", "fivem://connect/localhost:30120")
        SetDiscordRichPresenceAction(1, "Join Discord", "https://discord.gg/xyz")

		Citizen.Wait(60000)
	end
end)
