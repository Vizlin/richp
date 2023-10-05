       local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = -1

CreateThread(function()
  while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do         
    Wait(500)
    prevframes = GetFrameCount()
    prevtime = GetGameTimer()            
    end

  while true do         
    curtime = GetGameTimer()
      curframes = GetFrameCount()       
        
      if((curtime - prevtime) > 1000) then
          fps = (curframes - prevframes) - 1                
          prevtime = curtime
          prevframes = curframes
      end      
    Wait(350)
  end    
end)

function players()
  local players = {}

  for i = 0, 62 do
      if NetworkIsPlayerActive(i) then
          table.insert(players, i)
      end
  end

  return players
end

function SetRP()
  local name = GetPlayerName(PlayerId())
  local id = GetPlayerServerId(PlayerId())

		    SetDiscordAppId(1159187893974224967)

		      SetDiscordRichPresenceAsset('logo')
          SetDiscordRichPresenceAssetText('Server Name')
       
          SetDiscordRichPresenceAssetSmall('tick')
          SetDiscordRichPresenceAssetSmallText('Verified By Fivem')
end

Citizen.CreateThread(function()
  while true do

  Citizen.Wait(1)
    SetRP()
      players = {}
      for i = 0, 128 do
          if NetworkIsPlayerActive( i ) then
              table.insert( players, i )
          end
      end


      SetRichPresence("FPS: " ..fps.. " | Nick: " ..GetPlayerName(PlayerId()) .. " | ID: " ..GetPlayerServerId(PlayerId()) .. "")
        SetDiscordRichPresenceAction(0, "Connect Fivem Server", "fivem://connect/localhost:30120")
        SetDiscordRichPresenceAction(1, "Join Discord", "https://discord.gg/xyz")

		Citizen.Wait(60000)
	end
end)