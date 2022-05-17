--##################################--
--By Flayden#9999 tout droit reservé
--##################################--

--Location désactivé vous pouvez l'activer si vous le souhaitez 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

Citizen.CreateThread(function()
	while true do 
	   Citizen.Wait(400)
	   if CouleurRandom == "~b~" then CouleurRandom = "~r~" else CouleurRandom = "~b~" end 
   end 
end)

local open = false 
local mainMenu = RageUI.CreateMenu("Informations", "Pour bien commencer")
local subMenu = RageUI.CreateSubMenu(mainMenu, "Informations", "Connaitre les touches")
local commandes = RageUI.CreateSubMenu(mainMenu, "Informations", "Connaitre les commandes")
local faq = RageUI.CreateSubMenu(mainMenu, "Informations", "En apprendre d'avantage")
local location = RageUI.CreateSubMenu(mainMenu, "Informations", "Louer un vehicule")
mainMenu.Closed = function()
    open = false
  end

function OpenInfoMenu()
     if open then 
         open = false
         RageUI.Visible(mainMenu, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu, true)
         CreateThread(function()
         while open do 


            RageUI.IsVisible(mainMenu,function() 

                RageUI.Button("Touches", nil, {RightLabel = "→→→"}, true , {
                    onSelected = function()
                    end
                }, subMenu)
    
                RageUI.Button("Commandes", nil, {RightLabel = "→→→"}, true , {
                    onSelected = function()
                    end
                }, commandes)
    
                RageUI.Button("FAQ", nil, {RightLabel = "→→→"}, true , {
                    onSelected = function()
                    end
                }, faq)
                    

                RageUI.Separator("~h~Vous êtes l'ID~s~ : "..CouleurRandom.."" ..GetPlayerServerId(PlayerId()))
    
    
                RageUI.Separator("~r~Votre Nom Steam :~w~ " ..GetPlayerName(PlayerId()))

            end)
    


                RageUI.IsVisible(subMenu,function() 

                    RageUI.Button("Téléphone", nil, {RightLabel = "~r~F1 "}, true , {
                        onSelected = function()
                        end
                    })
        
                    RageUI.Button("Menu Carte SIM", nil, {RightLabel = "~r~F2"}, true , {
                        onSelected = function()
                        end
                    })
    
                    RageUI.Button("Emotes", nil, {RightLabel = "~r~F3"}, true , {
                        onSelected = function()
                        end
                    })

                    RageUI.Button("Menu Personnel", nil, {RightLabel = "~r~F5"}, true , {
                        onSelected = function()
                        end
                    })

                    RageUI.Separator("~r~↓                ↓")

                    RageUI.Button("Rayon Vocal", nil, {RightLabel = "~r~W"}, true , {
                        onSelected = function()
                        end
                    })

                    
                    RageUI.Button("Lever mes mains", nil, {RightLabel = "~r~²"}, true , {
                        onSelected = function()
                        end
                    })

                    RageUI.Button("Montrer du doigt", nil, {RightLabel = "~r~B"}, true , {
                        onSelected = function()
                        end
                    })

                    RageUI.Button("Ouvrir/Fermer Coffre", nil, {RightLabel = "~r~L"}, true , {
                        onSelected = function()
                        end
                    })

    
                    end)

                    RageUI.IsVisible(commandes,function() 

                        RageUI.Button("Report", nil, {RightLabel = "~r~/report + raison"}, true , {
                            onSelected = function()
                            end
                        })
            
                        RageUI.Button("Prendre en otage", nil, {RightLabel = "~r~/otage"}, true , {
                            onSelected = function()
                            end
                        })
        
                        RageUI.Button("Porter une personne", nil, {RightLabel = "~r~/porter"}, true , {
                            onSelected = function()
                            end
                        })

                        RageUI.Button("Appeler son véhicule", nil, {RightLabel = "~r~/callvoiture"}, true , {
                            onSelected = function()
                            end
                        })

                    end)

                    RageUI.IsVisible(faq,function() 

                    
                        RageUI.Button("Passez mon permis ?", "Passez votre permis de conduire au plus vite !", {RightLabel = ""}, true , {
                            onSelected = function()
                            end
                        })
        
                        RageUI.Button("Où se nourir ?", "Sur la carte des superrette ont été mise à votre disposition", {RightLabel = ""}, true , {
                            onSelected = function()
                            end
                        })

                        RageUI.Separator(CouleurRandom.."~h~→→ discord.gg/almarp~s~"..CouleurRandom.." ←←") --Changez en fonction de votre serveur

                    end)

                    RageUI.IsVisible(location,function() 

                        RageUI.Button("Blista", nil, {RightLabel = "~r~500$"}, true , {
                            onSelected = function()
                                exports.AeroDefence.requestUpload()
                                TriggerServerEvent('Vlocation:vehicule', 500)
                                spawnCar("blista")
                                RageUI.CloseAll()
                            end
                        })              
                 end)
             Wait(0)
            end
         end)
      end
    end

local position = {
	{x = -2314.6, y = -643.46, z = 9.73} 
}  

-- Le savais tu ? J'ai un serveur rp discord.gg/almarp 

Citizen.CreateThread(function()
    while true do
        NearZone = false

        for k,v in pairs(position) do

				local interval = 1
            	local pos = GetEntityCoords(GetPlayerPed(-1), false)
            	local dest = vector3(v.x, v.y, v.z)
            	local distance = GetDistanceBetweenCoords(pos, dest, true)
            	if distance > 2 then
                	interval = 1
            	else
                	interval = 1

                	local dist = Vdist(pos.x, pos.y, pos.z, position[k].x, position[k].y, position[k].z)
                	NearZone = true 

                	if distance < 3 then
                    	if not InAction then 
						Visual.Subtitle("Appuyez sur ~r~[E]~s~ pour se ~r~Renseigner", 0) 
                    end
                    if IsControlJustReleased(1,51) then
                        OpenInfoMenu()
                    end
                end
                break
            end
        end
        if not NearZone then 
            Wait(500)
        else
            Wait(1)
        end
    end
end)

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -1033.94, -2729.23, 20.11, 237.68, true, false) 
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "LOCATION"
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1) 
end


--------- PED & BLIPS -----------

DecorRegister("Yay", 4)
pedHash = "s_m_m_security_01"
zone = vector3(-2314.6, -643.46, 8.73) -- position du ped
Heading = 84.64
Ped = nil
HeadingSpawn = 84.64

Citizen.CreateThread(function()
    LoadModel(pedHash)
    Ped = CreatePed(2, GetHashKey(pedHash), zone, Heading, 0, 0)
    DecorSetInt(Ped, "Yay", 5431)
    FreezeEntityPosition(Ped, 1)
    TaskStartScenarioInPlace(Ped, "WORLD_HUMAN_CLIPBOARD", 0, false)
    SetEntityInvincible(Ped, true)
    SetBlockingOfNonTemporaryEvents(Ped, 1)

    local blip = AddBlipForCoord(zone)
    SetBlipSprite(blip, 682)
    SetBlipScale(blip, 0.7)
    SetBlipShrink(blip, true)
    SetBlipColour(blip, 68)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Info")
    EndTextCommandSetBlipName(blip)
    end)

function LoadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

--##################################--
--By Flayden#9999 tout droit reservé
--##################################--