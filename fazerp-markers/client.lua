playerPed = PlayerPedId()
pCoords = GetEntityCoords(playerPed)

CreateThread(function ()
    while true do
        Wait(500)
        playerPed = PlayerPedId()
        pCoords = GetEntityCoords(playerPed)
    end
end)

CreateThread(function ()
  while true do
      Wait(0)
      sleep = true
      for zoneTitel, zoneData in pairs(Config.Markers) do
              if #(zoneData.Coords - pCoords) < zoneData.Show then
                  sleep = false
                  if not HasStreamedTextureDictLoaded(zoneData.Name) then
                      RequestStreamedTextureDict(zoneData.Name, true)
                    while not HasStreamedTextureDictLoaded(zoneData.Name) do
                      Wait(1)
                    end
                    else
                      DrawMarker(9, zoneData.Coords, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, zoneData.Wielkosc, zoneData.Wielkosc, zoneData.Wielkosc, 255, 255, 255, 255,true, false, 2, true, zoneData.Name, "marker", false)
                  end	 
              end
      end
      if sleep then
          Wait(500)
      end
  end
end)