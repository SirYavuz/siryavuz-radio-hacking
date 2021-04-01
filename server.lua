ESX = nil
local usbal = false
local sinyalal = false
local devreal = false
local konumal = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('konum:bilgisi:al')
AddEventHandler('konum:bilgisi:al', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local konumparasi = xPlayer.getInventoryItem('cash').count
    local degistiritem = xPlayer.getInventoryItem('lokalizator').count
    local usbitem = xPlayer.getInventoryItem('atm_hack_usb').count
    local devreitem = xPlayer.getInventoryItem('net_cracker').count
    if not konumal then
    if devreitem >= 1 then 
    if usbitem >= 1 then 
    if degistiritem >= 1 then 
    if konumparasi >= Config.KonumPrice then 
        xPlayer.removeInventoryItem('cash', Config.KonumPrice)  
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'success', text = 'Konum birazdan sana iletilecek '})
        TriggerClientEvent('konum:goster', source)
        konumal = true
        else
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Paran yok, Beleşe bilgi de yok!'})
        end
    else
        --sinyal yok
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Sinyal yok!'})
    end
else
    --usb yok
    TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'usb yok!'})
end
else
    --devre yok
    TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'devre yok!'})
end
else
    TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Zaten konumu aldın daha ne lazım sana birader!'}) 
end
end)

RegisterNetEvent('sinyal:item:al')
AddEventHandler('sinyal:item:al', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local degistir = xPlayer.getInventoryItem('cash').count
    if not sinyalal then 
    if degistir >= Config.DegistiriciPrice then 
        xPlayer.removeInventoryItem('cash', Config.DegistiriciPrice)  
        xPlayer.addInventoryItem('lokalizator', 1)  
        sinyalal = true
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'success', text = 'Sinyal değiştirici aldın'})
        else
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Paran yok, mal da yok!'})
        end
    else
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Zaten almışsın günde 1 tane elabilirsin!'}) 
    end
end)

RegisterNetEvent('hackusb:item:al')
AddEventHandler('hackusb:item:al', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local hack = xPlayer.getInventoryItem('cash').count
    if not usbal then
    if hack >= Config.HackUsbPrice then 
        xPlayer.removeInventoryItem('cash', Config.HackUsbPrice)  
        xPlayer.addInventoryItem('atm_hack_usb', 1) 
        usbal = true 
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'success', text = 'USB aldın'})
        else
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Paran yok, mal da yok!'})
        end
    else
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Zaten almışsın günde 1 tane elabilirsin!'})
    end
end)

RegisterNetEvent('devrekarti:item:al')
AddEventHandler('devrekarti:item:al', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local devre = xPlayer.getInventoryItem('cash').count
    if not devreal then
    if devre >= Config.DevreKartiPrice then 
        xPlayer.removeInventoryItem('cash', Config.DevreKartiPrice)  
        xPlayer.addInventoryItem('net_cracker', 1)  
        devreal = true
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'success', text = 'Devre Kartı aldın'})
        else
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Paran yok, mal da yok!'})
        end
    else
        TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Zaten almışsın günde 1 tane elabilirsin!'})
    end
end)

RegisterNetEvent('santral:kontrol')
AddEventHandler('santral:kontrol', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local santral = xPlayer.getInventoryItem('lokalizator').count
   
    if santral >= 1 then 
            xPlayer.removeInventoryItem('lokalizator', 1)       
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'success', text = 'Sinyal Değiştiriciyi Kuruyorsun'})
            TriggerClientEvent('santral:onay', source)
        else
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Sinyal Değiştiricin olmadan yapamazsın!'})
        end
end)


RegisterNetEvent('karavan:kontrol')
AddEventHandler('karavan:kontrol', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local karavan = xPlayer.getInventoryItem('atm_hack_usb').count
   
    if karavan >= 1 then 
            xPlayer.removeInventoryItem('atm_hack_usb', 1)       
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'success', text = 'Bütün bağlantılar tamamlandı ve Hack işlemine geçiyorsun. Bol Şans'})
            TriggerClientEvent('karavan:onay', source)
        else
            TriggerClientEvent('skavronskyynotify:client:SendAlert', source, {type = 'error', text = 'Hack USB olmadan yapamazsın!'})
        end
end)

