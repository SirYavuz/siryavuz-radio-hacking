ESX                           = nil
local gorev = false
local itemdurum = 0
local saticidurum = false
local karavan = false
local sure = 1 * 60000 
local kanalOn = false
local YaziDurum = true


local uydunumarasi = 0
local uydukonumu = { x = 0.0, y = 0.0, z = 0.0 }

local uydukonumlari = {
	[1] = {name = "Uydu 1",x = 2136.96, y = 2900.72 , z = 57.26},
	[2] = {name = "Uydu 2",x = 2106.51, y = 2923.63 , z = 57.43},
	[3] = {name = "Uydu 3",x = 2078.2, y = 2945.8 , z = 56.41},
	[4] = {name = "Uydu 4",x = 2049.47, y = 2946.01 , z = 57.43},
	[5] = {name = "Uydu 5",x = 2000.78, y = 2930.42 , z = 56.97},
	[6] = {name = "Uydu 6",x = 1965.66, y = 2917.33 , z = 56.17}
}
     
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()  
    while true do
        Citizen.Wait(0)
    
        if not karavan then
        else
        if karavanMarker() then 
            if IsControlJustPressed(1, 38) then
                TriggerServerEvent('karavan:kontrol')
            end
        end
    end
        if itemsMarker() then
            if IsControlJustPressed(1, 38) then
            itemsMenu()
            YaziDurum = false
            end
        end
        if not gorev then
        if santralMarker() then
            if IsControlJustPressed(1, 38) then
            TriggerServerEvent('santral:kontrol')
            end
        end
    else
        if uydular() then
            if IsControlJustPressed(1,38) then
                if GetDistanceBetweenCoords(ux,uy,uz, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
                    dogruUydu()
                else
                    ESX.ShowNotification('Yanlış yerdesin diğerlerini dene!')
                end
            end
        end
    end
    end
 end)

 Citizen.CreateThread(function()
    local yavuz = {x= 1507.04, y = 3577.5, z = 38.74, h=208.74}  
    saticiped(yavuz.x, yavuz.y, yavuz.z, yavuz.h)
end)


function itemsMarker()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.Items) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= Config.MarkerDisctances then
        if YaziDurum then
        DrawText3Ds(1507.27, 3577.17, 38.74, Config.ItemsMarkerText)
        end
			return true
    end

  end
end

function santralMarker()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.Santral) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= Config.MarkerDisctances then
        DrawText3Ds(2296.42, 2944.04, 46.58, Config.santralMarkerText)
			return true
    end

  end
end

function karavanMarker()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.Karavan) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= Config.MarkerDisctances then
        DrawText3Ds(1748.62, 3791.66, 34.85, Config.KaravanHackText)
			return true
    end

  end
end

function uydular()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.Uydular) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= Config.UyduDistance then
        DrawMarker(Config.Type, 2136.96, 2900.72, 57.26, 0.0, 0.0, 5.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        DrawMarker(Config.Type, 2106.51, 2923.63, 57.43, 0.0, 0.0, 5.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        DrawMarker(Config.Type, 2078.2, 2945.8, 56.41, 0.0, 0.0, 5.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        DrawMarker(Config.Type, 2049.47, 2946.01, 57.43, 0.0, 0.0, 5.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        DrawMarker(Config.Type, 2000.78, 2930.42, 56.97, 0.0, 0.0, 5.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
        DrawMarker(Config.Type, 1965.66, 2917.33, 56.17, 0.0, 0.0, 5.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
	-- 	if IsControlJustPressed(1, 38) then
    --         ESX.ShowNotification('Daha  yapmadık onu canım')
    -- end
			return true
    end

  end
end

RegisterNetEvent('durum:arti')
AddEventHandler('surum:arti', function(source)
    itemdurum = itemdurum + 1
end)

function itemsMenu()
    Citizen.Wait(120)

    local _elements = {
        {label = ('Sinyal Değiştirici Satın Al ' ..Config.DegistiriciPrice.. '$'), value = 'sinyalitem'},
        {label = ('Hack USB Satın Al ' ..Config.HackUsbPrice.. '$'), value = 'hackusb'},
        {label = ('Devre Karti Satın Al ' ..Config.DevreKartiPrice.. '$'), value = 'devrekarti'},
        {label = ('Konum Bilgisi Öğren ' ..Config.KonumPrice.. '$'), value = 'konumbil'},
    }

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'itemsmenu',
        {
            title = ('Itemler'),
            title = ('Itemler'),
            align = 'top-left',
            elements = _elements
        },

        function(data, menu)
            if data.current.value == 'sinyalitem' then
                    TriggerServerEvent('sinyal:item:al')
            elseif data.current.value == 'hackusb' then
                    TriggerServerEvent('hackusb:item:al')
            elseif data.current.value == 'devrekarti' then
                    TriggerServerEvent('devrekarti:item:al')
            elseif data.current.value == 'konumbil' then
                    TriggerServerEvent('konum:bilgisi:al')
            end

            menu.close()
            YaziDurum = true
        end,

        function(data, menu)
            menu.close()
            YaziDurum = true
        end
    )
end

function santralMenu()
    Citizen.Wait(120)

    local _elements = {
        {label = ('Kolay Seviye'), value = 'kolayseviye'},
        {label = ('Zor Seviye'), value = 'zorseviye'},
    }

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'santralmenusu',
        {
            title = ('Seviyeler'),
            title = ('Seviyeler'),
            align = 'top-left',
            elements = _elements
        },

        function(data, menu)
            if data.current.value == 'kolayseviye' then
                    hackKolay()
            elseif data.current.value == 'zorseviye' then
                    hackZor()
            end

            menu.close()
        end,

        function(data, menu)
            menu.close()
        end
    )
end

RegisterNetEvent('konum:goster')
AddEventHandler('konum:goster', function(source)
    Citizen.Wait(Config.KonumBeklemeSuresi)
    ESX.ShowNotification('Konum geldi')
    SetNewWaypoint(2287.01, 2948.29, 46.75)
    PlaySoundFrontend(-1, "WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
end)

RegisterNetEvent('santral:onay')
AddEventHandler('santral:onay', function(source)
    santralMenu()
end)


function DrawText3Ds(x,y,z, text)

	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- function DrawText3Ds(x,y,z, text)
--     local onScreen,_x,_y=World3dToScreen2d(x,y,z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     AddTextComponentString(text)
--     DrawText(_x,_y)
--     local factor = (string.len(text)) / 500
--     DrawRect(_x,_y+0.0125, 0.0002+ factor, 0.025, 0, 0, 0, 50)
-- end 



function saticiped(x,y,z,h)
    local hashKey = `ig_old_man2`
    local pedType = 5
  
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end
  
    saticiPed = CreatePed(pedType, hashKey, x,y,z - 0.98,h, 0, 0)
  
  
    ClearPedTasks(saticiPed)
    ClearPedSecondaryTask(saticiPed)
    TaskSetBlockingOfNonTemporaryEvents(saticiPed, true)
    SetPedFleeAttributes(saticiPed, 0, 0)
    SetPedCombatAttributes(saticiPed, 17, 1)
  
    SetPedSeeingRange(saticiPed, 0.0)
    SetPedHearingRange(saticiPed, 0.0)
    SetPedAlertness(saticiPed, 0)
    SetPedKeepTask(saticiPed, true)
    SetPedDiesWhenInjured(saticiPed, false)
    SetEntityInvincible(saticiPed, true)
    FreezeEntityPosition(saticiPed, true)
  
  end

  function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     Citizen.Wait(5)
    end
   end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 5000, 0, 0, false, false, false)
	end)
end

function usbAnim()
    Citizen.CreateThread(function()
      RequestAnimDict("anim@heists@ornate_bank@hack")
      while not HasAnimDictLoaded("anim@heists@ornate_bank@hack") do
        Citizen.Wait(0)
      end
        attachObject()
        TaskPlayAnim(GetPlayerPed(-1), "anim@heists@ornate_bank@hack", "hack_loop" ,8.0, -8.0, -1, 50, 0, false, false, false)
    end)
end

function attachObject()
    tab = CreateObject(GetHashKey("prop_laptop_01a"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 60.0, 280.0, 180.0, true, true, false, true, 1, true)
end

function stopAnim()
    StopAnimTask(GetPlayerPed(-1), "anim@heists@ornate_bank@hack", "hack_loop" ,8.0, -8.0, -1, 50, 0, false, false, false)
    DeleteEntity(tab)
end


function sakinolchamp()
    DisableControlAction(0, 24, true) -- Attack
    DisableControlAction(0, 257, true) -- Attack 2
    DisableControlAction(0, 25, true) -- Aim
    DisableControlAction(0, 263, true) -- Melee Attack 1
    DisableControlAction(0, 32, true) -- W
    DisableControlAction(0, 34, true) -- A
    DisableControlAction(0, 31, true) -- S
    DisableControlAction(0, 30, true) -- D

    DisableControlAction(0, 45, true) -- Reload
    DisableControlAction(0, 22, true) -- Jump
    DisableControlAction(0, 44, true) -- Cover
    DisableControlAction(0, 37, true) -- Select Weapon
    DisableControlAction(0, 23, true) -- Also 'enter'?
 end

 function hackKolay()
    gorev = true
    exports["datacrack"]:Start(2)
    AddEventHandler("datacrack", function(output)
        if output then
            ESX.ShowHelpNotification('Bağlantı Kuruldu!', false, true, 5000)
            SetNewWaypoint(2060.6, 2930.17, 47.57)
            Citizen.Wait(Config.UyduBeklemeSuresi)
            ESX.ShowNotification('Konum bölgesi işaretlendi hangi uyduya bağlanman gerektiğini sen bulacaksın. Bol şans!')
            PlaySoundFrontend(-1, "WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
            uydukolay()
        else
            ESX.ShowHelpNotification('Başaramadın!', false, true, 5000)
        end
    end)
 end

 function hackZor()
    gorev = true
    exports["datacrack"]:Start(4.5)
    AddEventHandler("datacrack", function(output) 
        if output then
            ESX.ShowHelpNotification('Bağlantı Kuruldu!', false, true, 5000)
            uyduisaret()
        else
            ESX.ShowHelpNotification('Başaramadın', false, true, 5000)
        end
    end)
 end

 function uydukolay()
    uydunumarasi = math.random(1, 6)
    ux = uydukonumlari[uydunumarasi].x
    uy = uydukonumlari[uydunumarasi].y
    uz = uydukonumlari[uydunumarasi].z

 end

 function uyduisaret()
    uydunumarasi = math.random(1, 6)
        ux = uydukonumlari[uydunumarasi].x
		uy = uydukonumlari[uydunumarasi].y
        uz = uydukonumlari[uydunumarasi].z
        SetNewWaypoint(uydukonumlari[uydunumarasi].x,uydukonumlari[uydunumarasi].y)
        Citizen.Wait(Config.UyduBeklemeSuresi)
        ESX.ShowNotification('İşaretlendi')
        PlaySoundFrontend(-1, "WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)   
 end

 
function hangiuydu()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(uydukonumu) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= Config.MarkerDisctances then
       
			return true
    end

  end
end

function dogruUydu()
    startAnim("mini@repair", "fixing_a_ped")
    exports['progressBars']:startUI(Config.UyduKurulumSuresi, "Kurulum yapılıyor")
    Citizen.Wait(Config.UyduKurulumSuresi)
    ClearPedTasks(GetPlayerPed(-1))
    ESX.ShowNotification('Kurulumu yaptın git ve bu işi bitir')
    SetNewWaypoint(1748.62, 3791.66, 34.85)
    gorev = false
    karavan = true
end

RegisterNetEvent('karavan:onay')
AddEventHandler('karavan:onay', function(source)
    block = Config.Block
    hacktime = Config.Time
    startAnim("mp_fbi_heist", "loop")
	TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",block,hacktime,hackBaslat)
    startAnim("mp_fbi_heist", "loop")
    Citizen.Wait(5000)
    startAnim("mp_fbi_heist", "loop")
    Citizen.Wait(5000)
    startAnim("mp_fbi_heist", "loop")
    Citizen.Wait(5000)
    startAnim("mp_fbi_heist", "loop")
    Citizen.Wait(5000)
    startAnim("mp_fbi_heist", "loop")
end)

function hackBaslat(success, timeremaining)
    Citizen.Wait(5000)
    startAnim("mp_fbi_heist", "loop")
    local playerPed = GetPlayerPed(-1)
    TriggerEvent('mhacking:hide')
    startAnim("mp_fbi_heist", "loop")
	ClearPedTasks(PlayerPedId())
    if success then
        TriggerEvent('mhacking:hide')
        ESX.ShowNotification('Başardın Tebrikler')	
        ClearPedTasksImmediately(playerPed)
        kanal()
    else
        ESX.ShowNotification('başaramadık abi')
        ClearPedTasksImmediately(playerPed)
	end
end


function kanal()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'kanal', {
		title = ('Girilecek Kanal'),
	}, function(data, menu)
        local kanal = tonumber(data.value)
		if kanal  then
            TriggerEvent('kanal:sok', kanal)
            menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('kanal:sok')
AddEventHandler('kanal:sok', function(kanal)
    local _source = source
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
    local channel =  kanal

    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(channel), true);
    exports.tokovoip_script:addPlayerToRadio(tonumber(channel))
    karavan = false
    kanalOn = true
    ESX.ShowNotification('Telsize bağlandın kalan dakika : '..Config.TelsizSuresi..'')
    Citizen.Wait(sure)
    kanalCik()
end)

function kanalCik()
    local playerName = GetPlayerName(PlayerId())
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
 
    if kanalOn then 
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    ESX.ShowNotification('Kanaldan ayrıldın')
        kanalOn = false
    end
end


