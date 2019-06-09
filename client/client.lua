  glassesOn = false
  currentGlasses = nil
  myGlasses = nil
  sgTexture = nil
  glassesSet = false
  noGlasses = false

  hatsTexture = nil
  hatsOn = false
  currentHats = nil
  myHats = nil
  hatsSet = false
  noHats = false

  masksTexture = nil
  masksOn = false
  currentMasks = nil
  myMasks = nil
  masksSet = false
  nomasks = false

RegisterNetEvent('sung')
AddEventHandler('sung', function()
--[[
  Sets variables for if sunglasses are on and which sunglasses they are
]]--
  local ad = "clothingspecs"
   local ads = "mp_masks@standard_car@ds@"
  local player = PlayerPedId()
  loadAnimDict( ad )
  loadAnimDict( ads )
  local player = GetPlayerPed(-1)
  local currentGlasses = GetPedPropIndex(player, 1)
  if currentGlasses == -1 and glassesSet == false then
    noGlasses = true
    glassesSet = false
  elseif currentGlasses ~= -1 and glassesSet == false then
    myGlasses = GetPedPropIndex(player, 1)
    sgTexture = GetPedPropTextureIndex(player, 1)
    noGlasses = false
    glassesSet = true
    glassesOn = true
  elseif currentGlasses == -1 and glassesSet == true then
    glassesOn = false
  elseif glassesSet == true and currentGlasses ~= -1 and myGlasses ~= currentGlasses then
    myGlasses = GetPedPropIndex(player, 1)
    sgTexture = GetPedPropTextureIndex(player, 1)
    glassesSet = true
    noGlasses = false
    glassesOn = true
  end 

--Takes Glasses off / Puts them On
if not noGlasses then
  glassesOn = not glassesOn
  if glassesOn then
  RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
    SetPedPropIndex(player, 1, myGlasses, sgTexture, 2)
  else
  RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off", 8.0, 0.6, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
    ClearPedProp(player, 1)
  end
else
  ShowNotification('You are not wearing sunglasses')
end

end, false)

--Adding hats here

RegisterNetEvent('hats')
AddEventHandler('hats', function()
--[[
  Sets variables for if hat is on and which hat it is
]]--
  local ad = "missheist_agency2ahelmet"
   local ads = "mp_masks@standard_car@ds@"
  local player = PlayerPedId()
  loadAnimDict( ad )
  loadAnimDict( ads )
  local player = GetPlayerPed(-1)
  local currentHats = GetPedPropIndex(player, 0)
  if currentHats == -1 and hatsSet == false then
    noHats = true
    hatsSet = false
  elseif currentHats ~= -1 and hatsSet == false then
    myHats = GetPedPropIndex(player, 0)
    hatsTexture = GetPedPropTextureIndex(player, 0)
    noHats = false
    hatsSet = true
    hatsOn = true
  elseif currentHats == -1 and hatsSet == true then
    hatsOn = false
  elseif hatsSet == true and currentHats ~= -1 and myHats ~= currentHats then
    myHats = GetPedPropIndex(player, 0)
    hatsTexture = GetPedPropTextureIndex(player, 0)
    hatsSet = true
    noHats = false
    hatsOn = true
  end 

--Takes hat off / Puts it On
if not noHats then
  hatsOn = not hatsOn
  if hatsOn then
  RequestAnimDict(dict)
	TaskPlayAnim( player, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
    SetPedPropIndex(player, 0, myHats, hatsTexture, 2)
  else
  RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	    ClearPedProp(player, 0)
  end
else
  ShowNotification('You are not wearing a hat')
end

end, false)

---------------------

RegisterNetEvent('mask')
AddEventHandler('mask', function()
--[[
  Sets variables for if masks are on and which masks they are
]]--
  local player = PlayerPedId()
  local currentMasks = GetPedDrawableVariation(player, 1)
  local ad = "missfbi4"
  local ads = "mp_masks@standard_car@ds@"
  local players = PlayerPedId()
  loadAnimDict( ad )
  loadAnimDict( ads )
  if currentMasks == -1 and masksSet == false then
    nomasks = false
    masksSet = true
  elseif currentMasks ~= -1 and masksSet == false then
    myMasks = GetPedDrawableVariation(player, 1)
    masksTexture = GetPedTextureVariation(player, 1)
    nomasks = false
    masksSet = true
    masksOn = true
  elseif currentMasks == -1 and masksSet == true then
    masksOn = true
  elseif masksSet == false and currentMasks ~= -1 and myMasks ~= currentMasks then
    myMasks = GetPedDrawableVariation(player, 1)
    masksTexture = GetPedTextureVariation(player, 1)
    masksSet = true
    nomasks = false
    masksOn = true
  end 

--Takes masks off / Puts them On
if not nomasks then
  masksOn = not masksOn
  if masksOn then
  RequestAnimDict(dict)
	TaskPlayAnim( players, ads, "put_on_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
SetPedComponentVariation(GetPlayerPed(-1), 1, myMasks, masksTexture, 2)
  else
  RequestAnimDict(dict)
	TaskPlayAnim( player, ad, "takeoff_mask", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Wait (600)
	ClearPedSecondaryTask(PlayerPedId())
	SetPedComponentVariation(player, 1, 0 ,0 ,2)
  end
else
  ShowNotification('You are not wearing a mask')
end

end, false)

RegisterCommand('hat', function()
  TriggerEvent('hats')
end)

RegisterCommand('glasses', function()
  TriggerEvent('sung')
end)

RegisterCommand('mask', function()
  TriggerEvent('mask')
end)

--Function to show the notification

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
  end
  
------------Animation

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end
