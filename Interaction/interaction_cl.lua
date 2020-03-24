-- The main thread of the interaction script:
-- Defines the button E to check for suitable targets (peds and cars with peds inside)
-- Checks for the distance and initiates either:
-- Arrests (if player is aiming at the car with a weapon), traffic stop (if the player aims at a moving car), talk to the targeted ped (either on foot or a ped in a standing car)
CreateThread(function()
	while true do
		local playerped = GetPlayerPed(-1)
		local playerpedcoords = GetEntityCoords(playerped, false)
		local camcoords = GetGameplayCamCoord()
		local player = PlayerId()
		if IsControlJustPressed(0,51) and not (atarrest or atevidence or atcloth or atheal or atgarage or atweapon or athelp) and (PlayerData.job.name == 'police') then
			if IsPlayerFreeAiming(player) and IsPedArmed(playerped, 5) then
				local flag_hasTarget, SelectTarget = GetEntityPlayerIsFreeAimingAt(player)
				if flag_hasTarget and GetEntityType(SelectTarget) == 1 and GetPedType(SelectTarget) ~=28 and not IsPedAPlayer(SelectTarget) then
					local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, GetEntityCoords(SelectTarget))
					if distanceToTarget <= 30 then
						local FlagFollowing = false
						local index = 0
						local TargetNetID = PedToNet(SelectTarget)

						for i, NetID in ipairs(ClientFollowingList) do
							if TargetNetID == NetID then
								FlagFollowing = true
								index = i
								break
							end
						end

						if FlagFollowing then
							table.remove(ClientFollowingList, index)
							TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
						end

						TriggerEvent('pd5m:int:HavePedSurrender', SelectTarget)
						Wait(2000)
					else
						Notify('Too far away.')
					end
				elseif flag_hasTarget and GetEntityType(SelectTarget) == 2 then
					local TargetInVeh = nil
					for i = -1, 2, 1 do
						if not IsVehicleSeatFree(SelectTarget, i) then
							TargetInVeh = GetPedInVehicleSeat(SelectTarget, i)
							break
						end
					end
					if GetEntityType(TargetInVeh) == 1 and not IsPedAPlayer(TargetInVeh) then
						local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, GetEntityCoords(SelectTarget))
						if distanceToTarget <= 30 then
							TriggerEvent('pd5m:int:HavePedSurrender', TargetInVeh)
							Wait(2000)
						else
							Notify('Too far away.')
						end
					else
						Notify('No ped in the vehicle.')
					end
				else
					Notify('No ped or vehicle found.')
				end
			else
				if not IsPedInAnyVehicle(playerped, true) then
					local lookingvector = GetPlayerLookingVector(playerped, 30)
					local flag_hasTarget, targetcoords, SelectTarget = GetPedInDirection(camcoords, lookingvector)
					if flag_hasTarget and GetEntityType(SelectTarget) == 1 and GetPedType(SelectTarget) ~=28 and not IsPedAPlayer(SelectTarget) then
						local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
						if distanceToTarget <= 10 then
							local FlagFollowing = false
							local index = 0
							local TargetNetID = PedToNet(SelectTarget)

							for i, NetID in ipairs(ClientFollowingList) do
								if TargetNetID == NetID then
									FlagFollowing = true
									index = i
									break
								end
							end

							if FlagFollowing then
								table.remove(ClientFollowingList, index)
								TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
							end
							TriggerEvent('pd5m:int:inittalk', SelectTarget, false)
							Wait(2000)
						else
							Notify('Too far away.')
						end
					else
						local flag_hasTarget, targetcoords, targetVeh = GetVehInDirection(camcoords, lookingvector)
						if flag_hasTarget and GetEntityType(targetVeh) == 2 then
							local TargetInVeh = nil
							for i = -1, 2, 1 do
								if not IsVehicleSeatFree(targetVeh, i) then
									TargetInVeh = GetPedInVehicleSeat(targetVeh, i)
									break
								end
							end
							if GetEntityType(TargetInVeh) == 1 and not IsPedAPlayer(TargetInVeh) then
								if GetEntitySpeed(targetVeh) < 0.2 then
									local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
									if distanceToTarget <= 10 then
										TriggerEvent('pd5m:int:inittalk', TargetInVeh, true)
										Wait(2000)
									else
										Notify('Too far away.')
									end
								else
									local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
									if distanceToTarget <= 20 then
										TriggerEvent('pd5m:int:initstopcar', targetVeh, true)
										Wait(2000)
									else
										Notify('Too far away.')
									end
								end
							else
								Notify('No ped in the vehicle.')
							end
						else
							Notify('No ped or vehicle found.')
						end
					end
				else
					--Notify('Please get out of your vehicle.')
				end
			end
		end
		flag_hasTarget = false
		targetcoords = nil
		distanceToTarget = nil
		Wait(0)
	end
end)

-- Registers a vehicle with ped inside, checks for possible fleeing triggers and triggers the result (car will either pull to the side or attempt to flee).
-- This event can be triggered by the player on foot aiming at a moving vehicle or from a vehicle without a parameter.
-- If the player is in a vehicle this script will choose a vehicle in front.
-- If the player is on foot you may not trigger this script without a given targetveh.
-- This event will be triggered through the main interaction loop.
-- Advice: Do not use this since it's already set for player control.
-- Variables: EntityId
RegisterNetEvent('pd5m:int:initstopcar') -- only trigger this function for source, never use -1 serverside for this event.
AddEventHandler('pd5m:int:initstopcar', function(targetveh)
	local TargetInVeh = 0
	local flagnotalk = false
	local releasecar = false
	if flag_VehicleSelected == 1 then
		flag_VehicleSelected = 0
		releasecar = true
	end
	local playerped = GetPlayerPed(-1)
	local playerveh = nil
	if IsPedInAnyVehicle(playerped, false) and IsPedInAnyPoliceVehicle(playerped) then
		playerveh = GetVehiclePedIsIn(playerped, false)
		local pvpos = GetEntityCoords(playerveh)
		local infrontofplayerveh = GetOffsetFromEntityInWorldCoords(playerveh, 0.0, 15.0, 0.0)
		flag_VehicleSelected, vehcoords, targetveh = GetVehInDirection(pvpos, infrontofplayerveh)
	elseif not IsPedInAnyVehicle(playerped, true) then
		if GetEntityType(targetveh) == 2 then
			flag_VehicleSelected = 1
			local vehcoords = GetEntityCoords(targetveh)
		end
	end
	if flag_VehicleSelected == 1 then
		local TargetVehNetID = VehToNet(targetveh)

		local TargetInVeh = nil
		for i = -1, 2, 1 do
			if not IsVehicleSeatFree(targetveh, i) then
				TargetInVeh = GetPedInVehicleSeat(targetveh, i)
				break
			end
		end
		if TargetInVeh ~= 0 and TargetInVeh ~= nil then
			if GetVehicleFuelLevel(targetveh) == 0.0 then
				SetVehicleFuelLevel(targetveh, 1000.0)
				TaskVehicleDriveWander(TargetInVeh, targetveh, 30.0, NormalDrivingBehavior)
				flag_VehicleSelected = 0
				Notify('Vehicle released.')
			else
				local TargetNetID = PedToNet(TargetInVeh)
				local TargetVehNetID = VehToNet(targetveh)

				local TargetFlagListIndex, TargetVehFlagListIndex = SyncPedAndVeh(TargetInVeh, targetveh)

				InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)

				TriggerEvent('pd5m:int:weaponizeped', TargetInVeh)

				for i, NetID in ipairs(ClientPedNoTalkList) do
					if NetID == TargetNetID then
						flagnotalk = true
						break
					end
				end

				if flagnotalk then
					Notify('This vehicle cannot be stopped.')
				else
					if releasecar then
						SetVehicleFuelLevel(targetveh, 1000.0)
						TaskVehicleDriveWander(TargetInVeh, targetveh, 30.0, NormalDrivingBehavior)
						flag_VehicleSelected = 0
						Notify('Vehicle released.')
					else
						if IsPedInAnyVehicle(playerped, false) then
							Notify('Activate your sirens to stop the car.')
							while not IsVehicleSirenOn(GetVehiclePedIsIn(playerped, false)) do
								if releasecar then
									break
								end
								Wait(100)
							end
						end
						SetVehicleSiren(playerveh, false)
						if ClientPedConfigList[TargetFlagListIndex].flagfleeinstant then
							if IsPedInAnyVehicle(playerped, false) and IsPedInAnyPoliceVehicle(playerped) then
								playerveh = GetVehiclePedIsIn(playerped, false)
								SetVehicleSiren(playerveh, false)
							end
							TriggerEvent('pd5m:int:pedflee', TargetInVeh, playerped)
							flag_VehicleSelected = 0
						else
							Notify('Car is stopping.')
							TriggerEvent('pd5m:int:stopcar', targetveh, TargetInVeh)
							flag_VehicleSelected = 0
						end
					end
				end
			end
		else
			Notify('The car is empty.')
		end
	else
		Notify('No car found.')
	end
end)

-- This event initialises an interaction with a chosen ped.
-- Checks if the ped is already synced to the client. If not, syncs (and possibly has the server create the ped's flags).
-- Checks for possible flags prohibiting talking to the ped. Checks if the ped is "stopped" (meaning is currently waiting to interact with officers).
-- Executes the correct event to talk to the ped (either starttalk or continuetalk).
-- This event will be triggered through the main interaction loop.
-- Advice: Do not use this since it's already set for player control.
-- Variables: EntityId, bool
AddEventHandler('pd5m:int:inittalk', function(target, flaginveh)
	local TargetNetID = PedToNet(target)
	local targetveh = 0
	local TargetVehNetID = 0

	if flaginveh then
		targetveh = GetVehiclePedIsIn(target, false)
		TargetVehNetID = VehToNet(targetveh)
	end

	TargetFlagListIndex, TargetVehFlagListIndex = SyncPedAndVeh(target, targetveh)

	if flaginveh then
		InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)
	end

	TriggerEvent('pd5m:int:weaponizeped', target)

	local flagstopped = CheckFlag(TargetNetID, 'Stopped')
	local flagnotalk = CheckFlag(TargetNetID, 'NoTalk')
	local flagiscurrentlytalking = CheckFlag(TargetNetID, 'Talking')

	if not flagstopped then
		if flagnotalk then
			Notify("The Ped doesn't respond.")
		else
			TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'Stopped')
			TriggerEvent('pd5m:int:starttalk', target, flaginveh)
		end
	else
		if flagiscurrentlytalking then
			Notify('Ped is currently talking to another officer!')
		elseif flagnotalk then
			Notify("The Ped doesn't respond.")
		else
			TriggerEvent('pd5m:int:continuetalk', target, flaginveh)
		end
	end
end)

-- This event is executed when the ped is not "stopped".
-- Checks for fleeing / fighting triggers. If a trigger is found executes the behavior.
-- Otherwise it executes the event responsible for the interaction itself.
-- Do not use this, trigger 'pd5m:int:inittalk'
AddEventHandler('pd5m:int:starttalk', function(target, flaginveh)

	local playerped = GetPlayerPed(-1)
	local TargetNetID = PedToNet(target)

	TriggerServerEvent('pd5m:syncsv:ShowCommunication', PedToNet(playerped), TargetNetID, 'One moment please!', 2000)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

	if ClientPedConfigList[TargetFlagListIndex].flagfleeinstant then
		TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'Stopped')
		if flaginveh then
			TriggerEvent('pd5m:int:pedflee', target, playerped)
		elseif ClientPedConfigList[TargetFlagListIndex].flagfight then
			TriggerEvent('pd5m:int:pedhostile', target, playerped)
		else
			TriggerEvent('pd5m:int:pedflee', target, playerped)
		end
	else

		local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

		if not FlagNoFear then
			SetBlockingOfNonTemporaryEvents(target, true)
			SetPedCombatAttributes(target, 46, true)
			TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
		end

		TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PedToNet(playerped), NormalAddress[math.random(1, #NormalAddress)], 2000)
		TriggerEvent('pd5m:int:activetalk', target, flaginveh)
	end
end)

-- This event executes the event responsible for the interaction itself.
-- Do not use this, trigger 'pd5m:int:inittalk'
AddEventHandler('pd5m:int:continuetalk', function(target, flaginveh)
	TriggerEvent('pd5m:int:activetalk', target, flaginveh)
end)

-- The following events are used for interaction between the player and any other ped.
-- This includes getting identifying information, questions, orders and informing the ped about actions taken against it (e.g. drugtest or arrest).
-- These events are intended to be used inside of menus and should only be executed outside of menus with caution.
-- variables: EntityId, INT
AddEventHandler('pd5m:int:AskForLicence', function(target, LicenceIndex)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetResistModifier = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	if LicenceIndex == 1 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForID[math.random(1, #OFCAskForID)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 0) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if not ClientPedConfigList[TargetFlagListIndex].flagid then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoLicenceResponse[math.random(1, #NormalNoLicenceResponse)], 2000)
			elseif ClientPedConfigList[TargetFlagListIndex].flaghideid then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalLicenceHideResponse[math.random(1, #NormalLicenceHideResponse)], 2000)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalLicenceResponse[math.random(1, #NormalLicenceResponse)], 2000)
				TriggerEvent('pd5m:int:showid', target)
			end
		end
	elseif LicenceIndex == 2 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForDriverLicence[math.random(1, #OFCAskForDriverLicence)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 1) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if not ClientPedConfigList[TargetFlagListIndex].flaglicence then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoLicenceResponse[math.random(1, #NormalNoLicenceResponse)], 2000)
			elseif ClientPedConfigList[TargetFlagListIndex].flaghideid then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalLicenceHideResponse[math.random(1, #NormalLicenceHideResponse)], 2000)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalLicenceResponse[math.random(1, #NormalLicenceResponse)], 2000)
				TriggerEvent('pd5m:int:showdriverlicence', target)
			end
		end
	elseif LicenceIndex == 3 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForGunLicence[math.random(1, #OFCAskForGunLicence)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 2) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if not ClientPedConfigList[TargetFlagListIndex].flagweaponlicence then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoLicenceResponse[math.random(1, #NormalNoLicenceResponse)], 2000)
			elseif ClientPedConfigList[TargetFlagListIndex].flaghideid then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalLicenceHideResponse[math.random(1, #NormalLicenceHideResponse)], 2000)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalLicenceResponse[math.random(1, #NormalLicenceResponse)], 2000)
				TriggerEvent('pd5m:int:showweaponpermit', target)
			end
		end
	end
end)

AddEventHandler('pd5m:int:AskForItems', function(target, LicenceIndex)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetResistModifier = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	if LicenceIndex == 1 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForSubstance[math.random(1, #OFCAskForSubstance)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 3) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if not ClientPedConfigList[TargetFlagListIndex].flagdrug then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoDrugResponse[math.random(1, #NormalNoDrugResponse)], 2000)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalDrugResponse[math.random(1, #NormalDrugResponse)], 2000)
			end
		end
	elseif LicenceIndex == 2 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForAlcohol[math.random(1, #OFCAskForAlcohol)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 4) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if not ClientPedConfigList[TargetFlagListIndex].flagdrunk then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoAlcoholResponse[math.random(1, #NormalNoAlcoholResponse)], 2000)
			else
				if math.random(1, 10) <= 2 then
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAlcoholHideResponse[math.random(1, #NormalAlcoholHideResponse)], 2000)
				else
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAlcoholResponse[math.random(1, #NormalAlcoholResponse)], 2000)
				end
			end
		end
	elseif LicenceIndex == 3 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForIllegalItems[math.random(1, #OFCAskForIllegalItems)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 5) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if not ClientPedConfigList[TargetFlagListIndex].flagpedillegalitem then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoIllegalItemsResponse[math.random(1, #NormalNoIllegalItemsResponse)], 2000)
			else
				if math.random(1, 10) <= 5 then
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalIllegalItemsHideResponse[math.random(1, #NormalIllegalItemsHideResponse)], 2000)
				else
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalIllegalItemsResponse[math.random(1, #NormalIllegalItemsResponse)], 2000)
				end
			end
		end
	elseif LicenceIndex == 4 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForWeapons[math.random(1, #OFCAskForWeapons)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 6) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if ClientPedConfigList[TargetFlagListIndex].savepedweapons == {} or not ClientPedConfigList[TargetFlagListIndex].flagweaponlicence then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoWeaponsResponse[math.random(1, #NormalNoWeaponsResponse)], 2000)
			else
				if ClientPedConfigList[TargetFlagListIndex].flagpedillegalweapon then
					TellTheOfficerYouAreIllegallyArmed = math.random(1, 100)
					if TellTheOfficerYouAreIllegallyArmed <= 70 then
						TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalIllegalWeaponsHideResponse[math.random(1, #NormalIllegalWeaponsHideResponse)], 2000)
					elseif TellTheOfficerYouAreIllegallyArmed <= 95 and TellTheOfficerYouAreIllegallyArmed > 70 then
						TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalWeaponsResponse[math.random(1, #NormalWeaponsResponse)], 2000)
					else
						TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalIllegalWeaponsResponse[math.random(1, #NormalIllegalWeaponsResponse)], 2000)
					end
				else
					if math.random(1, 10) <= 2 then
						TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalWeaponsHideResponse[math.random(1, #NormalWeaponsHideResponse)], 2000)
					else
						TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalWeaponsResponse[math.random(1, #NormalWeaponsResponse)], 2000)
					end
				end
			end
		end
	end
end)

AddEventHandler('pd5m:int:QuestionPed', function(target, LicenceIndex)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetResistModifier = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	if LicenceIndex == 1 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForStartingPoint[math.random(1, #OFCAskForStartingPoint)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 7) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAnswerStartingPoint[math.random(1, #NormalAnswerStartingPoint)], 2000)
		end
	elseif LicenceIndex == 2 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForDestination[math.random(1, #OFCAskForDestination)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 8) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAnswerDestination[math.random(1, #NormalAnswerDestination)], 2000)
		end
	elseif LicenceIndex == 3 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForActivity[math.random(1, #OFCAskForActivity)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 9) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAnswerActivity[math.random(1, #NormalAnswerActivity)], 2000)
		end
	elseif LicenceIndex == 4 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCAskForSuspiciousActivity[math.random(1, #OFCAskForSuspiciousActivity)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 10) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseQuestionResponse[math.random(1, #NormalRefuseQuestionResponse)], 2000)
		else
			if ClientPedConfigList[TargetFlagListIndex].PedUnusualActivity[1] ~= nil then
				for i, entry in ClientPedConfigList[TargetFlagListIndex].PedUnusualActivity do
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, entry, 2000)
				end
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAnswerNoSuspiciousActivity[math.random(1, #NormalAnswerNoSuspiciousActivity)], 2000)
			end
		end
	end
end)

AddEventHandler('pd5m:int:VehiclePedOrder', function(target, LicenceIndex)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetResistModifier = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	if LicenceIndex == 1 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCOrderOutOfVehicle[math.random(1, #OFCOrderOutOfVehicle)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 11) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			local VehicleNetID = ClientPedConfigList[TargetFlagListIndex].VehicleNetID
			if VehicleNetID ~= nil and DoesEntityExist(NetToEnt(VehicleNetID)) and GetEntityType(NetToEnt(VehicleNetID)) == 2 then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
				TriggerEvent('pd5m:int:OrderPedInOutVehicle', target)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoVehicleResponse[math.random(1, #NormalNoVehicleResponse)], 2000)
			end
		end
	elseif LicenceIndex == 2 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCOrderIntoVehicle[math.random(1, #OFCOrderIntoVehicle)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 12) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			local VehicleNetID = ClientPedConfigList[TargetFlagListIndex].VehicleNetID
			if VehicleNetID ~= nil and DoesEntityExist(NetToEnt(VehicleNetID)) and GetEntityType(NetToEnt(VehicleNetID)) == 2 then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
				TriggerEvent('pd5m:int:OrderPedInOutVehicle', target)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoVehicleResponse[math.random(1, #NormalNoVehicleResponse)], 2000)
			end
		end
	end
end)

AddEventHandler('pd5m:int:InformPedInvestigation', function(target, LicenceIndex)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetResistModifier = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	if LicenceIndex == 1 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformBreathalyzer[math.random(1, #OFCInformBreathalyzer)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 13) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowbreathalyzer', true)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
		end
	elseif LicenceIndex == 2 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformDrugtest[math.random(1, #OFCInformDrugtest)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 14) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowdrugtest', true)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
		end
	elseif LicenceIndex == 3 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformPersonSearch[math.random(1, #OFCInformPersonSearch)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 15) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowpersonsearch', true)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
		end
	elseif LicenceIndex == 4 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformCarSearch[math.random(1, #OFCInformCarSearch)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 16) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			local VehicleNetID = ClientPedConfigList[TargetFlagListIndex].VehicleNetID
			if VehicleNetID ~= nil and DoesEntityExist(NetToEnt(VehicleNetID)) and GetEntityType(NetToEnt(VehicleNetID)) == 2 then
				TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowcarsearch', true)
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoVehicleResponse[math.random(1, #NormalNoVehicleResponse)], 2000)
			end
		end
	end
end)

AddEventHandler('pd5m:int:InformPedActions', function(target, LicenceIndex)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetResistModifier = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	if LicenceIndex == 1 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformCarSeizure[math.random(1, #OFCInformCarSeizure)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 17) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			local VehicleNetID = ClientPedConfigList[TargetFlagListIndex].VehicleNetID
			if VehicleNetID ~= nil and DoesEntityExist(NetToEnt(VehicleNetID)) and GetEntityType(NetToEnt(VehicleNetID)) == 2 then
				TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowcarseizure', true)
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalNoVehicleResponse[math.random(1, #NormalNoVehicleResponse)], 2000)
			end
		end
	elseif LicenceIndex == 2 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformObjectConfiscation[math.random(1, #OFCInformObjectConfiscation)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 18) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowitemconfiscation', true)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
		end
	elseif LicenceIndex == 3 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformArrest[math.random(1, #OFCInformArrest)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 19) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowarrest', true)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
		end
	elseif LicenceIndex == 4 then
		TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, OFCInformFine[math.random(1, #OFCInformFine)], 2000)
		if GetNthBinaryFlag(TargetResistModifier, 20) == 1 then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowfine', true)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerpedNetID, NormalAcceptOrderResponse[math.random(1, #NormalAcceptOrderResponse)], 2000)
		end
	end
end)

-- This event is used to show communication between two given peds.
-- This event first cuts the text into pieces of max 99 chars while keeping words intact.
-- Does not support hyphentation so do not use single words with over 89 characters.
-- If the talking ped (first ID given) is the player, this event will execute the function that shows the text at the bottom of the screen.
-- Otherwise the text will be shown over the ped's head.
-- Do not use this, trigger 'pd5m:syncsv:ShowCommunication'
RegisterNetEvent('pd5m:int:ShowCommunication')
AddEventHandler('pd5m:int:ShowCommunication', function(NetID, PartnerNetID, text, displaytime)
	CreateThread(function()
	-- Cut text into pieces of max 99 chars

	local TalkingPed = NetToPed(NetID)

	if IsPedAPlayer(TalkingPed) or GetPedType(TalkingPed) == 6 or GetPedType(TalkingPed) == 27 then
		StringTalking = 'Officer: '
	else
		StringTalking = 'Ped: '
	end

	local DisplayText = StringTalking .. text
	local DisplayTextLength = string.len(DisplayText)
	DisplayTextMainList = {}
	DisplayTextSubList = {}
	local breakloop = false

	if DisplayTextLength > 99 then
		local n = 1
		for word in string.gmatch(DisplayText, "%S+") do
			table.insert(DisplayTextSubList, word)
			n = n + 1
		end


		local DisplayTextHelpNew = DisplayTextSubList[1]
		local i = 1
		while i < n do
			local DisplayTextHelpLength = 0
			while DisplayTextHelpLength < 90 do
				i = i + 1
				local DisplayTextHelp = DisplayTextHelpNew
				if DisplayTextSubList[i] == nil then
					local breakloop = true
					break
				end
				DisplayTextHelpNew = DisplayTextHelp .. ' ' .. DisplayTextSubList[i]
				DisplayTextHelpLength = string.len(DisplayTextHelpNew)
				Wait(0)
			end
			if breakloop then
				table.insert(DisplayTextMainList, DisplayTextHelp)
				break
			end
			DisplayTextHelp = DisplayTextHelp .. ' ' .. '...'
			table.insert(DisplayTextMainList, DisplayTextHelp)
			i = i - 1
			DisplayTextHelpNew = '...'
			Wait(0)
		end
	else
		table.insert(DisplayTextMainList, DisplayText)
	end

	-- check if target or partner is already displaying a message. Wait if yes and print if no

	-- -- note that this is not working properly and needs a revamp.
	local FlagWaitForTalkingEnd = false

	if DisplayingList["" .. NetID] == true or DisplayingList["" .. PartnerNetID] == true then
			FlagWaitForTalkingEnd = true
	end

	while FlagWaitForTalkingEnd do
		FlagWaitForTalkingEnd = false
		if DisplayingList["" .. NetID] == true or DisplayingList["" .. PartnerNetID] == true then
			FlagWaitForTalkingEnd = true
		end
		Wait(100)
	end

	-- Print Messages

	DisplayingList["" .. NetID] = true

	if TalkingPed == GetPlayerPed(-1) then
		for _, entry in ipairs(DisplayTextMainList) do
			PrintTextAtBottom(entry, displaytime)
			Wait(200)
		end
	else
		for _, entry in ipairs(DisplayTextMainList) do
			PrintTextOverPedHead(TalkingPed, entry, displaytime)
			Wait(200)
		end
	end
	DisplayingList["" .. NetID] = false
	end)
end)

-- This event is responsible for the correct interaction between the player and a ped.
-- Sets the flag that opens the talking menus and makes the ped look at the player.
-- Uses a few global variables that are necessary to ensure proper behavior of the talking menu.
-- Do not use this, trigger 'pd5m:int:inittalk'
AddEventHandler('pd5m:int:activetalk', function(target, flaginveh)
	CreateThread(function()
		local TargetNetID = PedToNet(target)

		TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'Talking')

		CreateThread(function()
			while not CheckFlag(TargetNetID, 'Talking') do
				Wait(200)
			end
			while CheckFlag(TargetNetID, 'Talking') do
				if not flaginveh then
					if IsPedWalking(target) or not IsPedFacingPed(target, GetPlayerPed(-1), 0.5) then
						if CheckFlag(TargetNetID, 'Arrested') then
						else
							ClearPedTasks(target)
						end
						makeEntityFaceEntity(target, GetPlayerPed(-1))
						TaskLookAtEntity(target, GetPlayerPed(-1), -1, 2048, 3)
					end
				end
				Wait(2000)
			end
		end)

		--Create if-clause to select the correct Talking-Menu: normal, incar, custom (for missions), (possible additions later on)
		--Sync using additional ped-flags

		MenuTarget = target
		MenuTargetNetID = PedToNet(target)
		MenuPlayerPed = GetPlayerPed(-1)
		MenuPlayerPedNetID = PedToNet(MenuPlayerPed)
		MenuFlagInVeh = flaginveh
		Wait(200)
		while WarMenu.IsMenuOpened('pd5m:int:talkmenu') do
			Wait(200)
		end

		TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'Talking')

		MenuTarget = nil
		MenuTargetNetID = nil
		MenuPlayerPed = nil
		MenuPlayerPedNetID = nil
		MenuFlagInVeh = nil
	end)
end)

-- The following events are used to print a notification showing the ID of the target.
-- It is important that the given target is already synced to the client otherwise this event might result in an error.
-- While usable it's probably safer to avoid using this on its own.
-- variables: EntityId
AddEventHandler('pd5m:int:showid', function(target)
	local TargetNetID = PedToNet(target)
	table.insert(ClientPlayerGotPedIDList, TargetNetID)

	local PedHeadHandle = RegisterPedheadshot(target)

	while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
		Wait(1000)
	end

	local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local FirstName = ClientPedConfigList[TargetFlagListIndex].FirstName
	local Surname =  ClientPedConfigList[TargetFlagListIndex].LastName
	local PedGender = ClientPedConfigList[TargetFlagListIndex].PedGender
	local BirthYear = tostring(ClientPedConfigList[TargetFlagListIndex].BirthYear)
	local BirthMonth = tostring(ClientPedConfigList[TargetFlagListIndex].BirthMonth)
	local BirthDay = tostring(ClientPedConfigList[TargetFlagListIndex].BirthDay)
	local RandomID = ClientPedConfigList[TargetFlagListIndex].RandomID

	local DateOfBirth = BirthYear .. "/" .. BirthMonth .. "/" .. BirthDay

	BeginTextCommandThefeedPost("TWOSTRINGS")

	AddTextComponentSubstringPlayerName("~y~Surname:			~s~" .. Surname .. "~n~ ~y~First Name:		~s~" .. FirstName .. "~n~ ~y~Gender:			~s~" .. PedGender .. "~n~ ~y~Date of")
	AddTextComponentSubstringPlayerName("Birth:		~s~" .. DateOfBirth)

	EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, 'Identification Card', "~g~" .. RandomID)
	EndTextCommandThefeedPostTicker(false, false)

	UnregisterPedheadshot(PedHeadHandle)
end)

AddEventHandler('pd5m:int:showdriverlicence', function(target)
	local TargetNetID = PedToNet(target)
	table.insert(ClientPlayerGotPedDriverLicenceList, TargetNetID)

	local PedHeadHandle = RegisterPedheadshot(target)

	while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
		Wait(500)
	end

	local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local FirstName = ClientPedConfigList[TargetFlagListIndex].FirstName
	local Surname =  ClientPedConfigList[TargetFlagListIndex].LastName
	local PedGender = ClientPedConfigList[TargetFlagListIndex].PedGender
	local BirthYear = tostring(ClientPedConfigList[TargetFlagListIndex].BirthYear)
	local BirthMonth = tostring(ClientPedConfigList[TargetFlagListIndex].BirthMonth)
	local BirthDay = tostring(ClientPedConfigList[TargetFlagListIndex].BirthDay)
	local RandomLicenceID = ClientPedConfigList[TargetFlagListIndex].RandomLicenceID

	local DateOfBirth = BirthYear .. "/" .. BirthMonth .. "/" .. BirthDay

	BeginTextCommandThefeedPost("TWOSTRINGS")

	AddTextComponentSubstringPlayerName("~y~Surname:			~s~" .. Surname .. "~n~ ~y~First Name:		~s~" .. FirstName .. "~n~ ~y~Gender:			~s~" .. PedGender .. "~n~ ~y~Date of")
	AddTextComponentSubstringPlayerName("Birth:		~s~" .. DateOfBirth)

	EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Driver's Licence", "~g~" .. RandomLicenceID)
	EndTextCommandThefeedPostTicker(false, false)

	UnregisterPedheadshot(PedHeadHandle)
end)

AddEventHandler('pd5m:int:showweaponpermit', function(target)
	local TargetNetID = PedToNet(target)
	table.insert(ClientPlayerGotPedWeaponPermitList, TargetNetID)

	local PedHeadHandle = RegisterPedheadshot(target)

	while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
		Wait(500)
	end

	local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local FirstName = ClientPedConfigList[TargetFlagListIndex].FirstName
	local Surname =  ClientPedConfigList[TargetFlagListIndex].LastName
	local PedGender = ClientPedConfigList[TargetFlagListIndex].PedGender
	local BirthYear = tostring(ClientPedConfigList[TargetFlagListIndex].BirthYear)
	local BirthMonth = tostring(ClientPedConfigList[TargetFlagListIndex].BirthMonth)
	local BirthDay = tostring(ClientPedConfigList[TargetFlagListIndex].BirthDay)
	local RandomWeaponID = ClientPedConfigList[TargetFlagListIndex].RandomWeaponID

	local DateOfBirth = BirthYear .. "/" .. BirthMonth .. "/" .. BirthDay

	BeginTextCommandThefeedPost("TWOSTRINGS")

	AddTextComponentSubstringPlayerName("~y~Surname:			~s~" .. Surname .. "~n~ ~y~First Name:		~s~" .. FirstName .. "~n~ ~y~Gender:			~s~" .. PedGender .. "~n~ ~y~Date of")
	AddTextComponentSubstringPlayerName("Birth:		~s~" .. DateOfBirth)

	EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Weapon Permit", "~g~" .. RandomWeaponID)
	EndTextCommandThefeedPostTicker(false, false)

	UnregisterPedheadshot(PedHeadHandle)
end)

-- -- Officer Actions

-- This event makes a car pull to the side.
-- Only works on cars that have a driver which should be given through the second parameter.
-- Do not use this, trigger 'pd5m:int:initstopcar'
AddEventHandler('pd5m:int:stopcar', function(targetveh, TargetInVeh)
	-- Note: Stopcar uses fixed Offsets and a driving pattern. This fails in corners and often in the city.
	-- Try reworking this Event by getting the navigation data and coding small deviations from said data.
	-- You might be able to use GenerateDirectionsToCoord, a taxi script or a different implementation of DrivingStyle - ignore all pathing
	-- Another option could involve checking for intersections, making the car drive through one and using GetPointOnRoadSide() or GetRoadSidePointWithHeading().
	-- This option needs checks to prevent the car from pulling left instead of right. Also it needs to be cancelled at some point in order to stop the ped from driving in circles.
	print('Started')
	local playerped = GetPlayerPed(-1)
	local playerveh = nil
	local vehiclehash = GetEntityModel(targetveh)
	local CutoffInteger = 0

	local TrafficLight = IsVehicleStoppedAtTrafficLights(targetveh)
	while TrafficLight do
		print('Stopped at traffic lights.')
		TrafficLight = IsVehicleStoppedAtTrafficLights(targetveh)
		Wait(5000)
	end

	SetBlockingOfNonTemporaryEvents(TargetInVeh, true)

	while GetEntitySpeed(targetveh) > 6.0 and CutoffInteger < 500 do
		print('Breaking')
		CutoffInteger = CutoffInteger + 1
		print(CutoffInteger)
		ClearPedTasks(TargetInVeh)
		TaskVehicleTempAction(TargetInVeh, targetveh, 27, 20)
		Wait(20)
		ClearPedTasks(TargetInVeh)
		TaskVehicleTempAction(TargetInVeh, targetveh, 9, 5)
		Wait(5)
	end
	if CutoffInteger > 499 then
		Notify('Car bugged out. Traffic Stop aborted.')
		ClearPedTasksImmediately(TargetInVeh)
		SetPedIntoVehicle(TargetInVeh, targetveh, -1)
	else
		ClearPedTasks(TargetInVeh)
		local coordx, coordy, coordz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, 0.0, 100.0, 0.0))
		TaskVehicleDriveToCoord(TargetInVeh, targetveh, coordx, coordy, coordz, 6.0, 2.0, vehiclehash, 171, 2.0, true)
		Wait(50)

		local NumberOfTriesPullingOff = 0
		local NumberOfTries = 0
		local BreakWhileLoops = false

		while IsPointOnRoad(GetEntityCoords(targetveh)) and not BreakWhileLoops and CutoffInteger < 500 do
			CutoffInteger = CutoffInteger + 1
			print(CutoffInteger)
			while IsPointOnRoad(GetEntityCoords(targetveh)) and not BreakWhileLoops and CutoffInteger < 500 do
				CutoffInteger = CutoffInteger + 1
				print(CutoffInteger)
				NumberOfTriesPullingOff = NumberOfTriesPullingOff + 1
				if NumberOfTries > 60 and (NumberOfTriesPullingOff % 2 == 0)then
					print('Resetting')
					ClearPedTasks(TargetInVeh)
					TaskVehicleDriveWander(TargetInVeh, targetveh, 6.0,444)
					Wait(5000)
				end
				print('Turn right')
				NumberOfTries = 0
				local TargetVehHeading = GetEntityHeading(targetveh)
				ClearPedTasks(TargetInVeh)
				local vehx, vehy, vehz = table.unpack(GetEntityCoords(targetveh))
				local forwardx, forwardy, forwardz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, 0.0, 6.0, 0.0))
				local speedx = forwardx - vehx
				local speedy = forwardy - vehy
				local speedz = forwardz - vehz
				SetEntityVelocity(targetveh, speedx, speedy, speedz)
				local coordx, coordy, coordz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, 11.0, 30.0, 0.0))
				TaskVehicleDriveToCoord(TargetInVeh, targetveh, coordx, coordy, coordz, 6.0, 2.0, vehiclehash, 21758123, 2.0, true)
				Wait(800)

				local AngleTurned = GetEntityHeading(targetveh) - TargetVehHeading
				while AngleTurned < - 180 do
					AngleTurned = AngleTurned + 360
					Wait(0)
				end
				while AngleTurned > 180 do
					AngleTurned = AngleTurned - 360
					Wait(0)
				end
				print(AngleTurned)
				if AngleTurned < 7 and AngleTurned > -7 and GetEntitySpeed(targetveh) > 1.0 then
					BreakWhileLoops = true
				end

				local OffsetX = 4.0

				while IsPointOnRoad(GetEntityCoords(targetveh)) and NumberOfTries < 61 and not BreakWhileLoops and CutoffInteger < 500 do
					CutoffInteger = CutoffInteger + 1
					print(CutoffInteger)
					local IsStuckInteger = 0
					NumberOfTries = NumberOfTries + 1
					ClearPedTasks(TargetInVeh)
					print('Driving forward')
					local coordx, coordy, coordz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, OffsetX, 30.0, 0.0))
					TaskVehicleDriveToCoord(TargetInVeh, targetveh, coordx, coordy, coordz, 6.0, 2.0, vehiclehash, 21758123, 2.0, true)

					local AngleTurnedInside = GetEntityHeading(targetveh) - TargetVehHeading
					while AngleTurnedInside < - 180 do
						AngleTurnedInside = AngleTurnedInside + 360
						Wait(0)
					end
					while AngleTurnedInside > 180 do
						AngleTurnedInside = AngleTurnedInside - 360
						Wait(0)
					end
					if AngleTurnedInside > 20 or AngleTurnedInside < -20 then
						OffsetX = 0.0
					end
					Wait(100)
					while GetEntitySpeed(targetveh) < 0.2 and CutoffInteger < 500 do
						CutoffInteger = CutoffInteger + 1
						print(CutoffInteger)
						print('Checking is stuck')
						IsStuckInteger = IsStuckInteger + 1
						if IsStuckInteger > 25 then
							print('Is stuck')
							ClearPedTasks(TargetInVeh)
							NumberOfTries = 61
							TaskVehicleTempAction(TargetInVeh, targetveh, 22, 500)
							Wait(500)
							break
						end
						Wait(40)
					end
				end
			end

			Wait(100)

			if BreakWhileLoops then
				while GetEntitySpeed(targetveh) > 0.2 and CutoffInteger < 500 do
					CutoffInteger = CutoffInteger + 1
					print(CutoffInteger)
					print('BreakWhileStopping')
					TaskVehicleTempAction(TargetInVeh, targetveh, 27, 35)
					Wait(40)
				end
				break
			else
				ClearPedTasks(TargetInVeh)
				print('Pulling vehicle correct')
				local coordx, coordy, coordz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, -15.0, 30.0, 0.0))
				TaskVehicleDriveToCoord(TargetInVeh, targetveh, coordx, coordy, coordz, 10.0, 2.0, vehiclehash, 21758123, 2.0, true)
				Wait(600)
				ClearPedTasks(TargetInVeh)
				TaskVehicleTempAction(TargetInVeh, targetvesh, 20, 15)
				Wait(15)
			end

			ClearPedTasks(TargetInVeh)

			while GetEntitySpeed(targetveh) > 0.2 and CutoffInteger < 500 do
				CutoffInteger = CutoffInteger + 1
				print(CutoffInteger)
				print('Stopping')
				TaskVehicleTempAction(TargetInVeh, targetveh, 27, 35)
				Wait(40)
			end
		end
		print('stopped')
		if CutoffInteger > 499 then
			Notify('Car bugged out. Traffic Stop aborted.')
			ClearPedTasksImmediately(TargetInVeh)
			SetPedIntoVehicle(TargetInVeh, targetveh, -1)
		else
			ClearPedTasks(TargetInVeh)
			SetVehicleFuelLevel(targetveh, 0.0)
			SetVehicleEngineOn(targetveh, false, false, true)
		end
	end
	Notify('Car has stopped.')
	SetBlockingOfNonTemporaryEvents(TargetInVeh, false)
	TaskVehicleDriveWander(target, targetveh, 30.0, NormalDrivingBehavior)
end)

-- This event makes the ped leave or enter its personal vehicle.
-- Needs to have the ped and vehicle synced to each other (denoted by the config entries 'VehicleNetID' for the ped and 'PedNetID' for the vehicle).
-- Do not trigger this function through the chat.
-- As this event only executes an order the player gives to the ped it'll mostly be used within a talking menu as part of 'pd5m:int:VehiclePedOrder'
-- Advice: Do not use this, trigger this through a talking menu.
AddEventHandler('pd5m:int:OrderPedInOutVehicle', function(target)
	if IsPedInAnyVehicle(target, false) then
		TaskLeaveAnyVehicle(target, 1, 1)
	else
		local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
		local VehicleNetID = ClientPedConfigList[TargetFlagListIndex].VehicleNetID
		if VehicleNetID ~= nil and DoesEntityExist(NetToEnt(VehicleNetID)) and GetEntityType(NetToEnt(VehicleNetID)) == 2 then
			local targetvehicle = NetToVeh(VehicleNetID)
			local targetposx, targetposy, targetposz = table.unpack(GetEntityCoords(target))
			local vehposx, vehposy, vehposz = table.unpack(GetEntityCoords(targetvehicle))
			if Vdist2(targetposx, targetposy, targetposz, vehposx, vehposy, vehposz) < 15.0 then
				for i=-1, 2, 1 do
					if IsVehicleSeatFree(targetvehicle, i) then
						TaskEnterVehicle(target, targetvehicle, 10000, i, 1.0, 1, 0)
						break
					end
				end
			end
		end
	end
end)


-- the following events are primarily used within the interaction menu on button 'x'.
-- The events are mostly interactions that the player can use on foot, some in the vehicle.
-- Events are triggered using chat messages with radialmenu.
-- Events are used without variables since each of them can find their own targets.
-- It's best to not trigger these events yourself since the interaction menu already has them bound to player control.
RegisterNetEvent('pd5m:int:search')
AddEventHandler('pd5m:int:search', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local TargetVehNetID = nil
	local FlagTargetInClientPedList = false
	local TargetFlagListIndex = nil
	local flagallowpersonsearch = false
	local flagallowcarsearch = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local FlagFollowing = false
			local index = 0
			TargetNetID = PedToNet(target)

			for i, NetID in ipairs(ClientFollowingList) do
				if TargetNetID == NetID then
					FlagFollowing = true
					index = i
					break
				end
			end

			if FlagFollowing then
				table.remove(ClientFollowingList, index)
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
			end

			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then
				makeEntityFaceEntity(playerped, target)
				Wait(1000)

				TargetNetID = PedToNet(target)

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				flagallowpersonsearch = ClientPedConfigList[TargetFlagListIndex].flagallowpersonsearch
				if flagallowpersonsearch then
					local newtargetheading = GetEntityHeading(playerped)
					TaskAchieveHeading(target, newtargetheading, 1000)
					Wait(1000)

					TaskStartScenarioInPlace(playerped, "PROP_HUMAN_BUM_BIN", 0, 1)

					Wait(3500)

					local savepeditems = ClientPedConfigList[TargetFlagListIndex].savepeditems

					local PedHeadHandle = RegisterPedheadshot(target)

					while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
						Wait(1000)
					end

					local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

					local founditems = nil
					local founditems2 = nil
					local secondpost = false

					if #savepeditems == 0 then
						founditems = "No items found."
					else
						for i, item in ipairs(savepeditems) do
							if i == 1 then
								founditems = "You found the following items: ~n~" .. item
							else
								if i > 4 then
									secondpost = true
									if i == 5 then
										founditems2 = item
									else
										founditems2 = founditems2 .. "~n~" .. item
									end
								else
									founditems = founditems .. "~n~" .. item
								end
							end
						end
					end

					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName(founditems)
					EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Search results", "")
					EndTextCommandThefeedPostTicker(false, false)

					if secondpost then
						BeginTextCommandThefeedPost("TWOSTRINGS")
						AddTextComponentSubstringPlayerName(founditems2)
						EndTextCommandThefeedPostTicker(false, false)
					end

					UnregisterPedheadshot(PedHeadHandle)

					Wait(1000)

					ClearPedTasks(playerped)

					Wait(500)

					makeEntityFaceEntity(target, playerped)

				else
					TriggerEvent('pd5m:int:PedResistAction', target, 1)
				end
			else
				Notify('Too far away.')
			end
		else
			local flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
			if flag_hasTarget and GetEntityType(targetveh) == 2 then
				local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
				if distanceToTarget <= 4.0 then
					if GetVehicleNumberOfPassengers(targetveh) == 0 and IsVehicleSeatFree(targetveh, -1) then

						TargetVehNetID = PedToNet(targetveh)

						_, TargetVehFlagListIndex = SyncPedAndVeh(0, targetveh)

						TargetNetID = ClientVehConfigList[TargetVehFlagListIndex].PedNetID

						if TargetNetID == 0 or TargetNetID == nil then
							flagallowcarsearch = true
						else
							target = NetToEnt(TargetNetID)
							if DoesEntityExist(target) and not IsEntityDead(target) then
								TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

								InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)

								TriggerEvent('pd5m:int:weaponizeped', target)

								local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

								if not FlagNoFear then
									SetBlockingOfNonTemporaryEvents(target, true)
									SetPedCombatAttributes(target, 46, true)
									TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
								end

								flagallowcarsearch = ClientPedConfigList[TargetFlagListIndex].flagallowcarsearch
							else
								flagallowcarsearch = true
							end
						end

						if flagallowcarsearch then
							TaskStartScenarioInPlace(playerped, "PROP_HUMAN_BUM_BIN", 0, 1)

							Wait(3500)

							local savevehitems = ClientVehConfigList[TargetVehFlagListIndex].savevehitems

							local founditems = nil
							local founditems2 = nil
							local secondpost = false

							if #savevehitems == 0 then
								founditems = "No items found."
							else
								for i, item in ipairs(savevehitems) do
									if i == 1 then
										founditems = "You found the following items: ~n~" .. item
									else
										if i > 4 then
											secondpost = true
											if i == 5 then
												founditems2 = item
											else
												founditems2 = founditems2 .. "~n~" .. item
											end
										else
											founditems = founditems .. "~n~" .. item
										end
									end
								end
							end

							BeginTextCommandThefeedPost("TWOSTRINGS")
							AddTextComponentSubstringPlayerName(founditems)
							EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Search results", "")
							EndTextCommandThefeedPostTicker(false, false)

							if secondpost then
								BeginTextCommandThefeedPost("TWOSTRINGS")
								AddTextComponentSubstringPlayerName(founditems2)
								EndTextCommandThefeedPostTicker(false, false)
							end

							Wait(1000)

							ClearPedTasks(playerped)
						else
							Notify('Car cannot be searched.')
						end
					else
						Notify('Car is not empty.')
					end
				else
					Notify('Too far away.')
				end
			else
				Notify('No ped or vehicle found.')
			end
		end
	end
end)

RegisterNetEvent('pd5m:int:breathalyzer')
AddEventHandler('pd5m:int:breathalyzer', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local FlagTargetInClientPedList = false
	local TargetFlagListIndex = nil
	local flagallowbreathalyzer = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then
				makeEntityFaceEntity(playerped, target)
				Wait(1000)

				TargetNetID = PedToNet(target)

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				flagallowbreathalyzer = ClientPedConfigList[TargetFlagListIndex].flagallowbreathalyzer
				if flagallowbreathalyzer then
					makeEntityFaceEntity(target, playerped)

					Wait(1000)

					local oldheading = GetEntityHeading(playerped)
					local newheading = oldheading + 40
					TaskAchieveHeading(playerped, newheading, 1000)

					Wait(1000)

					loadAnimDict("missmic4premiere")

					TaskPlayAnim(playerped, "missmic4premiere", "interview_short_lazlow", 4.0, 4.0, -1, 0, 0.0, 0, 0, 0)

					Wait(2000)

					local savedrunklevel = ClientPedConfigList[TargetFlagListIndex].savedrunklevel

					local savedrunklevelBAC = savedrunklevel / 10

					local PedHeadHandle = RegisterPedheadshot(target)
					while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
						Wait(1000)
					end

					local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)
					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName("The breathalyzer shows a breath alcohol level of ~y~")
					AddTextComponentSubstringPlayerName(savedrunklevel .. " ‰ ~s~or ~y~" .. savedrunklevelBAC .. " BAC~s~.")
					EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Breathalyzer", "Test results")
					EndTextCommandThefeedPostTicker(false, false)

					UnregisterPedheadshot(PedHeadHandle)
					Wait(1000)

					ClearPedTasks(playerped)
					SetEntityHeading(playerped, oldheading)
				else
					TriggerEvent('pd5m:int:PedResistAction', target, 1)
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No ped found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:drugtest')
AddEventHandler('pd5m:int:drugtest', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local FlagTargetInClientPedList = false
	local TargetFlagListIndex = nil
	local flagallowdrugtest = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then

				makeEntityFaceEntity(playerped, target)
				Wait(1000)

				TargetNetID = PedToNet(target)

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				flagallowdrugtest = ClientPedConfigList[TargetFlagListIndex].flagallowdrugtest
				if flagallowdrugtest then
					makeEntityFaceEntity(target, playerped)

					Wait(1000)

					local oldheading = GetEntityHeading(playerped)
					local newheading = oldheading + 40
					TaskAchieveHeading(playerped, newheading, 1000)

					Wait(1000)

					loadAnimDict("missmic4premiere")

					TriggerServerEvent('pd5m:syncsv:TaskPlayAnim', playerped, "missmic4premiere", "interview_short_lazlow", 4.0, 4.0, -1, 0, 0.0, 0, 0, 0)

					Wait(2000)

					local flagdrug = ClientPedConfigList[TargetFlagListIndex].flagdrug
					local savedrug = ClientPedConfigList[TargetFlagListIndex].savedrug
					local savedruglevel = ClientPedConfigList[TargetFlagListIndex].savedruglevel

					local PedHeadHandle = RegisterPedheadshot(target)
					while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
						Wait(1000)
					end

					local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

					if flagdrug then
						BeginTextCommandThefeedPost("TWOSTRINGS")
						AddTextComponentSubstringPlayerName("The quick drug test shows traces of ~y~" .. savedrug .. "~s~ in the suspect's saliva.")
						AddTextComponentSubstringPlayerName("A more detailed test indicates a concentration of ~y~" .. savedruglevel .. " ng/ml ~s~ in the suspect's blood.")
						EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Drug test", "Test results")
						EndTextCommandThefeedPostTicker(false, false)
					else
						BeginTextCommandThefeedPost("TWOSTRINGS")
						AddTextComponentSubstringPlayerName("No sign of drugs found.")
						EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Drug test", "Test results")
						EndTextCommandThefeedPostTicker(false, false)
					end

					UnregisterPedheadshot(PedHeadHandle)
					Wait(1000)

					ClearPedTasks(playerped)
					SetEntityHeading(playerped, oldheading)
				else
					TriggerEvent('pd5m:int:PedResistAction', target, 1)
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No ped found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:seizecar')
AddEventHandler('pd5m:int:seizecar', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetVehNetID = nil
	local TargetNetID = nil
	local target = nil
	local TargetVehFlagListIndex = nil
	local TargetFlagListIndex = nil
	local flagseizecar = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(targetveh) == 2 then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 4.0 then
				if GetVehicleNumberOfPassengers(targetveh) == 0 and IsVehicleSeatFree(targetveh, -1) then

					TargetVehNetID = VehToNet(targetveh)

					_, TargetVehFlagListIndex = SyncPedAndVeh(0, targetveh)

					TargetNetID = ClientVehConfigList[TargetVehFlagListIndex].PedNetID

					if TargetNetID ~= 0 and TargetNetID ~= nil then
						target = NetToPed(TargetNetID)
						if DoesEntityExist(target) and not IsEntityDead(target) then
							TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
							flagseizecar = ClientPedConfigList[TargetFlagListIndex].flagallowcarseizure
							if flagseizecar then
								TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'VehicleNetID', nil)
								TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'PedNetID', nil)
							end
						else
							TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'PedNetID', nil)
							flagseizecar = true
						end
					else
						flagseizecar = true
					end

					if flagseizecar then
						SetVehicleCanBeUsedByFleeingPeds(targetveh, false)
						SetVehicleDoorsShut(targetveh, false)
						SetVehicleDoorsLocked(targetveh, 2)

						BeginTextCommandThefeedPost("TWOSTRINGS")
						AddTextComponentSubstringPlayerName("You seized and locked the car. Call a towtruck to remove the vehicle.")
						EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Police measure", "")
						EndTextCommandThefeedPostTicker(false, false)
					else
						Notify('You cannot seize this car.')
					end
				else
					Notify('Car is not empty.')
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No car found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:confiscateitems')
AddEventHandler('pd5m:int:confiscateitems', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local TargetVehNetID = nil
	local FlagTargetInClientPedList = false
	local TargetFlagListIndex = nil
	local flagallowitemconfiscation = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then
				makeEntityFaceEntity(playerped, target)
				Wait(1000)

				TargetNetID = PedToNet(target)

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				flagallowitemconfiscation = ClientPedConfigList[TargetFlagListIndex].flagallowitemconfiscation
				if flagallowitemconfiscation then
					local newtargetheading = GetEntityHeading(playerped)
					TaskAchieveHeading(target, newtargetheading, 1000)
					Wait(1000)

					TaskStartScenarioInPlace(playerped, "PROP_HUMAN_BUM_BIN", 0, 1)

					Wait(3500)

					local savepeditems = ClientPedConfigList[TargetFlagListIndex].savepeditems

					for i, item in ipairs(savepeditems) do
						table.insert(ClientItemsList, item)
					end

					TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'savepeditems', {})

					local PedHeadHandle = RegisterPedheadshot(target)

					while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
						Wait(1000)
					end

					local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

					BeginTextCommandThefeedPost("TWOSTRINGS")

					AddTextComponentSubstringPlayerName("You confiscated the items of the suspect.")
					EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, "Police measure", "")
					EndTextCommandThefeedPostTicker(false, false)

					UnregisterPedheadshot(PedHeadHandle)

					Wait(1000)

					ClearPedTasks(playerped)

					Wait(500)

					makeEntityFaceEntity(target, playerped)

				else
					TriggerEvent('pd5m:int:PedResistAction', target, 2)
				end
			else
				Notify('Too far away.')
			end
		else
			local flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
			if flag_hasTarget and GetEntityType(targetveh) == 2 then
				local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
				if distanceToTarget <= 4.0 then
					if GetVehicleNumberOfPassengers(targetveh) == 0 and IsVehicleSeatFree(targetveh, -1) then
						TargetVehNetID = PedToNet(targetveh)

						_, TargetVehFlagListIndex = SyncPedAndVeh(0, targetveh)

						TargetNetID = ClientVehConfigList[TargetVehFlagListIndex].PedNetID

						if TargetNetID == 0 or TargetNetID == nil then
							flagallowitemconfiscation = true
						else
							target = NetToEnt(TargetNetID)
							if DoesEntityExist(target) then
								TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

								InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)

								TriggerEvent('pd5m:int:weaponizeped', target)

								local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

								if not FlagNoFear then
									SetBlockingOfNonTemporaryEvents(target, true)
									SetPedCombatAttributes(target, 46, true)
									TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
								end

								flagallowitemconfiscation = ClientPedConfigList[TargetFlagListIndex].flagallowitemconfiscation

							else
								flagallowitemconfiscation = true
							end
						end

						if flagallowitemconfiscation then
							TaskStartScenarioInPlace(playerped, "PROP_HUMAN_BUM_BIN", 0, 1)

							Wait(3500)

							local savevehitems = ClientVehConfigList[TargetVehFlagListIndex].savevehitems

							for i, item in ipairs(savevehitems) do
								table.insert(ClientItemsList, item)
							end

							TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'savevehitems', {})

							BeginTextCommandThefeedPost("TWOSTRINGS")
							AddTextComponentSubstringPlayerName("You confiscated the items in the car.")
							EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Police measure", "")
							EndTextCommandThefeedPostTicker(false, false)

							Wait(1000)

							ClearPedTasks(playerped)
						else
							Notify('You cannot confiscate items from this car.')
						end
					else
						Notify('Car is not empty.')
					end
				else
					Notify('Too far away.')
				end
			else
				Notify('No ped or vehicle found.')
			end
		end
	end
end)

RegisterNetEvent('pd5m:int:fineped')
AddEventHandler('pd5m:int:fineped', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetInVeh = nil
	local TargetNetID = nil
	local FlagTargetInClientPedList = false
	local TargetFlagListIndex = nil
	local flagallowfine = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then
				makeEntityFaceEntity(playerped, target)
				Wait(1000)

				TargetNetID = PedToNet(target)

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				flagallowfine = ClientPedConfigList[TargetFlagListIndex].flagallowfine
				if flagallowfine then
					FineHeight = "Amount to fine in $."
					FineText = ""

					AddTextEntry('RunIDLabel', FineText)
					DisplayOnscreenKeyboard(6, "RunIDLabel", "", FineHeight, "", "", "", 30)
					while (UpdateOnscreenKeyboard() == 0) do
						DisableAllControlActions(0)
						Wait(0)
					end
					if (GetOnscreenKeyboardResult()) then
						local result = tonumber(GetOnscreenKeyboardResult())
						if IsInt(result) then
							BeginTextCommandThefeedPost("TWOSTRINGS")
							AddTextComponentSubstringPlayerName("You fined the suspect for a total of ~y~" .. result .. " $~s~.")
							EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Police measure", "")
							EndTextCommandThefeedPostTicker(false, false)
						else
							Notify('Please enter a valid amount.')
						end
					end
				else
					TriggerEvent('pd5m:int:PedResistAction', target, 2)
				end

			else
				Notify('Too far away.')
			end
		else
			local flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
			if flag_hasTarget and GetEntityType(targetveh) == 2 then
				local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
				if distanceToTarget <= 2.0 then
					for i = -1, 2, 1 do
						if not IsVehicleSeatFree(targetveh, i) then
							TargetInVeh = GetPedInVehicleSeat(targetveh, i)
							break
						end
					end
					if TargetInVeh ~= 0 and TargetInVeh ~= nil and not IsPedAPlayer(TargetInVeh) then
						TargetNetID = PedToNet(TargetInVeh)

						TargetFlagListIndex, _ = SyncPedAndVeh(TargetInVeh, 0)

						TriggerEvent('pd5m:int:weaponizeped', TargetInVeh)

						local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

						if not FlagNoFear then
							SetBlockingOfNonTemporaryEvents(TargetInVeh, true)
							SetPedCombatAttributes(TargetInVeh, 46, true)
							TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
						end

						flagallowfine = ClientPedConfigList[TargetFlagListIndex].flagallowfine
						if flagallowfine then
							FineHeight = "Amount to fine in $."
							FineText = "Enter the amount you want to fine the suspect."

							AddTextEntry('RunIDLabel', FineText)
							DisplayOnscreenKeyboard(6, "RunIDLabel", "", FineHeight, "", "", "", 30)
							while (UpdateOnscreenKeyboard() == 0) do
								DisableAllControlActions(0)
								Wait(0)
							end
							if (GetOnscreenKeyboardResult()) then
								local result = tonumber(GetOnscreenKeyboardResult())
								if result ~= nil then
									if IsInt(result) then
										BeginTextCommandThefeedPost("TWOSTRINGS")
										AddTextComponentSubstringPlayerName("You fined the suspect for a total of ~y~" .. result .. " $~s~.")
										EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Police measure", "")
										EndTextCommandThefeedPostTicker(false, false)
									else
										Notify('Please enter a valid amount.')
									end
								else
									Notify('Please enter a valid amount.')
								end
							end
						else
							TriggerEvent('pd5m:int:PedResistAction', TargetInVeh, 2)
						end
					else
						Notify('The car is empty.')
					end
				else
					Notify('Too far away.')
				end
			else
				Notify('No ped or vehicle found.')
			end
		end
	end
end)

RegisterNetEvent('pd5m:int:arrestped') --handcuff-fct
AddEventHandler('pd5m:int:arrestped', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local FlagTargetInClientPedList = false
	local TargetFlagListIndex = nil
	local flagallowarrest = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then

				TargetNetID = PedToNet(target)

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				flagallowarrest = ClientPedConfigList[TargetFlagListIndex].flagallowarrest
				if CheckFlag(TargetNetID, 'Arrested') then
					SetEnableHandcuffs(target, false)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'Arrested')
					TriggerEvent('pd5m:int:PedSetAllAllowConfigFlags', target, false)

					local PlayerpedNetID = PedToNet(playerped)

					TriggerServerEvent('pd5m:syncsv:unhandcuffingevent', TargetNetID, PlayerpedNetID)

				elseif flagallowarrest then
					TriggerEvent('pd5m:sync:PedSetAllAllowConfigFlags', target, true)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'Stopped')
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'Arrested')

					local PlayerpedNetID = PedToNet(playerped)

					--TriggerEvent('pd5m:int:handcuffingevent', TargetNetID, PlayerpedNetID)

					TriggerServerEvent('pd5m:syncsv:handcuffingevent', TargetNetID, PlayerpedNetID)

					--[[CreateThread(function()
						local FlagContinue = true
						local ThreadTarget = target
						local ThreadTargetNetID = TargetNetID
						while FlagContinue do
							FlagContinue = false
							local FlagArrested = CheckFlag(TargetNetID, 'Arrested')
							if FlagArrested then
								FlagContinue = true
								loadAnimDict("mp_arresting")
								if IsEntityPlayingAnim(target, "mp_arresting", "idle", 3) then

								else
									TriggerServerEvent('pd5m:syncsv:TaskPlayAnim', target, "mp_arresting", "idle", 8.0, -8, -1, 50, 0.0, 0, 0, 0)
									SetPedCanPlayGestureAnims(target, false)
								end
							end
							Wait(500)
						end
					end)]]

				else
					TriggerEvent('pd5m:int:PedResistAction', target, 3)
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No ped found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:handcuffingevent')
AddEventHandler('pd5m:int:handcuffingevent', function(TargetNetID, PlayerpedNetID)
	local playerped = NetToPed(PlayerpedNetID)
	local target = NetToPed(TargetNetID)

	makeEntityFaceEntity(playerped, target)
	local newtargetheading = GetEntityHeading(playerped)
	TaskAchieveHeading(target, newtargetheading, 1000)

	loadAnimDict("mp_arresting")

	Wait(1000)

	TaskPlayAnim(playerped, "mp_arresting", "a_uncuff", 8.0, -8, -1, 0, 0.0, 0, 0, 0)
	TaskPlayAnim(target, "mp_arresting", "idle", 8.0, 8.0, -1, 51, 1.0, 0, 0, 0)

	SetEnableHandcuffs(target, true)
	SetPedCanPlayGestureAnims(target, false)
	SetPedCanPlayAmbientAnims(target, false)
	SetPedCanPlayAmbientBaseAnims(target, false)
	SetPedCanPlayInjuredAnims(target, false)
	SetPedCanPlayVisemeAnims(target, false, 0)

	Wait(1000)
end)

CreateThread(function()
	while true do
		for i, TargetNetID in ipairs(ClientPedArrestedList) do
			local target = NetToPed(TargetNetID)

			loadAnimDict("mp_arresting")

			if IsEntityPlayingAnim(target, "mp_arresting", "idle", 3) then

			else
				TaskPlayAnim(target, "mp_arresting", "idle", 8.0, 8.0, -1, 51, 1.0, 0, 0, 0)
			end
		end
		Wait(500)
	end
end)

RegisterNetEvent('pd5m:int:unhandcuffingevent')
AddEventHandler('pd5m:int:unhandcuffingevent', function(TargetNetID, PlayerpedNetID)
	local playerped = NetToPed(PlayerpedNetID)
	local target = NetToPed(TargetNetID)

	makeEntityFaceEntity(playerped, target)
	local newtargetheading = GetEntityHeading(playerped)
	TaskAchieveHeading(target, newtargetheading, 1000)

	Wait(1000)

	loadAnimDict("mp_arresting")

	TaskPlayAnim(playerped, "mp_arresting", "a_uncuff", 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
	Wait(2000)
	TaskPlayAnim(target, "mp_arresting", "idle", 99999.0, 8.0, -1, 0, 0.0, 0, 0, 0)

	ClearPedTasks(target)
	SetPedCanPlayGestureAnims(target, true)
	SetPedCanPlayAmbientAnims(target, true)
	SetPedCanPlayAmbientBaseAnims(target, true)
	SetPedCanPlayInjuredAnims(target, true)
	SetPedCanPlayVisemeAnims(target, true, 0)

end)

RegisterNetEvent('pd5m:int:letpedfollow')
AddEventHandler('pd5m:int:letpedfollow', function()
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local TargetFlagListIndex = nil

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 5.0 then
				TargetNetID = PedToNet(target)

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, "Stop right there.", 2000)
				else
					table.insert(ClientFollowingList, TargetNetID)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoTalk')
					TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, "Follow me, please.", 2000)
					CreateThread(function()
						local FlagContinue = true
						local ThreadTarget = target
						local ThreadTargetNetID = TargetNetID
						local FlagArrested = CheckFlag(TargetNetID, 'Arrested')
						while FlagContinue do
							FlagContinue = false
							for i, NetID in ipairs(ClientFollowingList) do
								if NetID == ThreadTargetNetID then
									FlagContinue = true
									break
								end
							end
							if not FlagArrested then
								ClearPedTasks(ThreadTarget)
							end
							TaskGoToEntity(ThreadTarget, playerped, 10000, 2.3, 1.0 , 0.0, 0)
							Wait(500)
						end
					end)
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No ped found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:grabped')
AddEventHandler('pd5m:int:grabped', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetNetID = nil
	local TargetFlagListIndex = nil

	if flag_grabbed then
		local OwnerNetID = NetworkGetEntityOwner(grabbedTarget)
		local TargetNetID = PedToNet(grabbedTarget)
		TriggerServerEvent('pd5m:syncsv:ungrabped', TargetNetID)
		flag_grabbed = false
		grabbedTarget = nil
	elseif not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, target = GetPedInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(target) == 1 and GetPedType(target) ~=28 and not IsPedAPlayer(target) then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 2.0 then
				TargetNetID = PedToNet(target)

				local FlagFollowing = false
				local index = 0

				for i, NetID in ipairs(ClientFollowingList) do
					if TargetNetID == NetID then
						FlagFollowing = true
						index = i
						break
					end
				end

				if FlagFollowing then
					table.remove(ClientFollowingList, index)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				TriggerEvent('pd5m:int:weaponizeped', target)

				local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

				if not FlagNoFear then
					SetBlockingOfNonTemporaryEvents(target, true)
					SetPedCombatAttributes(target, 46, true)
					TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
				end

				local FlagArrested = CheckFlag(TargetNetID, 'Arrested')

				if FlagArrested then
					local OwnerNetID = NetworkGetEntityOwner(target)
					local PlayerpedNetID = PedToNet(playerped)
					grabbedTarget = target
					flag_grabbed = true
					TriggerServerEvent('pd5m:syncsv:grabped', TargetNetID, PlayerpedNetID)
				else
					Notify('Arrest the ped to grab it.')
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No ped found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:grabbingevent')
AddEventHandler('pd5m:int:grabbingevent', function(TargetNetID, PlayerpedNetID)
	local target = NetToPed(TargetNetID)
	local playerped = NetToPed(PlayerpedNetID)

	local targetElbow = GetEntityBoneIndexByName(target, "MH_L_Elbow")
	local playerElbow = GetEntityBoneIndexByName(playerped, "MH_R_Elbow")
	AttachEntityToEntity(target, playerped, 11816, 0.3, 0.4, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
end)

RegisterNetEvent('pd5m:int:ungrabbingevent')
AddEventHandler('pd5m:int:ungrabbingevent', function(TargetNetID)
	local target = NetToPed(TargetNetID)
	DetachEntity(target, 0, false)
end)

RegisterNetEvent('pd5m:int:packejectped')
AddEventHandler('pd5m:int:packejectped', function() -- move ped in or out of vehicle
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local target = nil
	local TargetNetID = nil
	local TargetFlagListIndex = nil
	local flagBothFree = false
	local seatChosen = 1

	if IsPedInAnyVehicle(playerped, false) and IsPedInAnyPoliceVehicle(playerped) then
		local playerveh = GetVehiclePedIsIn(playerped, false)
		if GetEntitySpeed(playerveh) < 0.2 then
			for i = 0, 2, 1 do
				if not IsVehicleSeatFree(playerveh, i) then
					target = GetPedInVehicleSeat(playerveh, i)

					TargetNetID = PedToNet(target)

					TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

					TriggerEvent('pd5m:int:weaponizeped', target)

					local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

					if not FlagNoFear then
						SetBlockingOfNonTemporaryEvents(target, true)
						SetPedCombatAttributes(target, 46, true)
						TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
					end

					local FlagArrested = CheckFlag(TargetNetID, 'Arrested')

					local Seat = "front right"

					if i == 1 then
						Seat = "back left"
					elseif i == 2 then
						Seat = "back right"
					end

					if FlagArrested then
						TaskLeaveVehicle(target, playerveh, 256)
					else
						local PedType = GetPedType(target)
						if (PedType == 21 or PedType == 20 or PedType == 4 or PedType == 5 or PedType == 26) and not IsPedAPlayer(target) then
							TaskLeaveVehicle(target, playerveh, 256)
						else
							Notify("You can't kick the ped in the " .. Seat .. " seat.")
						end
					end

				end
			end
		else
			Notify('Stop the car to eject people.')
		end
	elseif not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(targetveh) == 2 then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 4.0 then

				if flag_grabbed then
					local FlagBackLeft = IsVehicleSeatFree(targetveh, 1)
					local FlagBackRight = IsVehicleSeatFree(targetveh, 2)
					if FlagBackLeft or FlagBackRight then
						if FlagBackRight then
							SeatChosen = 2
						else
							SeatChosen = 1
						end

						local VehHeading = GetEntityHeading(targetveh)
						local Dx, Dy, Dz = table.unpack(GetEntryPositionOfDoor(targetveh, SeatChosen+1))
						local Ox, Oy, Oz = table.unpack(GetOffsetFromEntityGivenWorldCoords(targetveh, Dx, Dy, Dz))

						local corr = 0
						local corrSign = 0

						if SeatChosen == 1 then
							corr = -0.2
							corrSign = -1
						else
							corr = 0.2
							corrSign = 1
						end

						local Cx, Cy, Cz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, Ox+corr, Oy-2.0, Oz))

						TaskGoStraightToCoord(playerped, Cx, Cy, Cz, 1.0, 10000, VehHeading, 0.1)
						local distanceCheck = true

						while distanceCheck do
							local Px, Py, Pz = table.unpack(GetEntityCoords(playerped))
							local distance = Vdist2(Px, Py, Pz, Cx, Cy, Cz)
							if tonumber(distance) < 0.2 then
								distanceCheck = false
							end
							Wait(100)
						end

						Wait(1000)

						distanceCheck = true
						TaskAchieveHeading(playerped, VehHeading, 2000)

						while GetEntityHeading(playerped) - VehHeading > 5.0 do
							Wait(100)
						end

						target = grabbedTarget
						DetachEntity(grabbedTarget, 0, true)
						flag_grabbed = false
						grabbedTarget = nil

						local Cx, Cy, Cz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, Ox+(6*corr), Oy-2.2, Oz))

						TaskGoStraightToCoord(playerped, Cx, Cy, Cz, 1.0, 10000, VehHeading, 0.1)

						while distanceCheck do
							local Px, Py, Pz = table.unpack(GetEntityCoords(playerped))
							local distance = Vdist2(Px, Py, Pz, Cx, Cy, Cz)
							if tonumber(distance) < 0.2 then
								distanceCheck = false
							end
							Wait(100)
						end

						distanceCheck = true

						TaskGoStraightToCoord(playerped, Dx, Dy, Dz, 1.0, 10000, VehHeading, 0.1)

						Wait(2000)

						if not IsVehicleDoorFullyOpen(targetveh, SeatChosen+1) then
							TaskOpenVehicleDoor(playerped, targetveh, 10000, SeatChosen, 1.0)
							Wait(1500)
						end

						local Cx, Cy, Cz = table.unpack(GetOffsetFromEntityInWorldCoords(targetveh, Ox+(3*corr), Oy+0.3, Oz))

						TaskGoStraightToCoord(playerped, Cx, Cy, Cz, 1.0, 10000, VehHeading+(corrSign*75.0), 0.1)

						while distanceCheck do
							local Px, Py, Pz = table.unpack(GetEntityCoords(playerped))
							local distance = Vdist2(Px, Py, Pz, Cx, Cy, Cz)
							if tonumber(distance) < 0.2 then
								distanceCheck = false
							end
							Wait(100)
						end

						TaskAchieveHeading(playerped, VehHeading+(corrSign*75.0), 2000)

						TaskEnterVehicle(target, targetveh, 10000, SeatChosen, 1.0, 1, 0)
					else
						Notify('The car is full.')
					end
				else
					Notify('You can only pack a grabbed ped.')
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No car found.')
		end
	end
end)

RegisterNetEvent('pd5m:int:runid')
AddEventHandler('pd5m:int:runid', function()
	local FirstnameSearch = "Firstname "
	local SurnameSearch = "Surname"
	local TargetSearchNetID = nil
	local targetSearch = nil
	local TargetSearchFlagListIndex = nil

	local NumberOfTakenIDs = 0
	local RunIDText = 'Enter name of suspect:'
	local foundresult = false
	local ResultWordList = {}
	local FirstnameList = nil
	local SurnameList = nil

	local TargetNetID = nil
	local target = nil
	local TargetFlagListIndex = nil
	local Firstname = nil
	local Surname = nil
	local PedGender = nil
	local BirthYear = nil
	local BirthMonth = nil
	local BirthDay = nil
	local IDValid = nil
	local flagwanted = nil
	local saveoffense = 'None'
	local RandomID = nil
	local flagpedillegalweapon = false
	local flagfight = false
	local flagpedhasweapons = false

	if ClientPlayerGotPedIDList[1] ~= nil then
		NumberOfTakenIDs = #ClientPlayerGotPedIDList
		TargetSearchNetID = ClientPlayerGotPedIDList[#ClientPlayerGotPedIDList]
		targetSearch = NetToPed(TargetSearchNetID)
		TargetSearchFlagListIndex, _ = SyncPedAndVeh(targetSearch, 0)
		FirstnameSearch = ClientPedConfigList[TargetSearchFlagListIndex].FirstName .. " "
		SurnameSearch = ClientPedConfigList[TargetSearchFlagListIndex].LastName
		RunIDText = 'Enter name of suspect or a number between 1 and ' .. NumberOfTakenIDs .. ':'
	end

	AddTextEntry('RunIDLabel', RunIDText)
	DisplayOnscreenKeyboard(6, "RunIDLabel", "", FirstnameSearch, SurnameSearch, "", "", 30)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0)
		Wait(0)
	end
	if (GetOnscreenKeyboardResult()) then
		Notify('Checking database...')
		local result = GetOnscreenKeyboardResult()
		if tonumber(result) ~= nil then
			if IsInt(tonumber(result)) and 1 <= tonumber(result) and tonumber(result) <= NumberOfTakenIDs then
				TargetNetID = ClientPlayerGotPedIDList[tonumber(result)]
				target = NetToPed(TargetNetID)
				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
				Firstname = ClientPedConfigList[TargetFlagListIndex].FirstName
				Surname = ClientPedConfigList[TargetFlagListIndex].LastName
				PedGender = ClientPedConfigList[TargetFlagListIndex].PedGender
				BirthYear = ClientPedConfigList[TargetFlagListIndex].BirthYear
				BirthMonth = ClientPedConfigList[TargetFlagListIndex].BirthMonth
				BirthDay = ClientPedConfigList[TargetFlagListIndex].BirthDay
				IDValid = "Valid"
				flagwanted = ClientPedConfigList[TargetFlagListIndex].flagwanted
				saveoffense = ClientPedConfigList[TargetFlagListIndex].saveoffense
				RandomID = ClientPedConfigList[TargetFlagListIndex].RandomID
				flagpedillegalweapon = ClientPedConfigList[TargetFlagListIndex].flagpedillegalweapon
				flagfight = ClientPedConfigList[TargetFlagListIndex].flagfight
				if ClientPedConfigList[TargetFlagListIndex].savepedweapons[1] ~= nil then
					flagpedhasweapons = true
				end
				foundresult = true
			else
				Notify('Input is not valid.')
			end
		else
			for word in string.gmatch(result, "%S+") do
				table.insert(ResultWordList, word)
			end
			if #ResultWordList == 2 then
				Firstname = ResultWordList[1]
				Surname = ResultWordList[2]
				for i, List in ipairs(ClientPedConfigList) do
					if List.FirstName == Firstname and List.LastName == Surname then
						TargetNetID = List.NetID
						target = NetToPed(TargetNetID)
						TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
						PedGender = List.PedGender
						BirthYear = List.BirthYear
						BirthMonth = List.BirthMonth
						BirthDay = List.BirthDay
						IDValid = "Valid"
						flagwanted = List.flagwanted
						saveoffense = List.saveoffense
						RandomID = List.RandomID
						flagpedillegalweapon = List.flagpedillegalweapon
						flagfight = List.flagfight
						if List.savepedweapons[1] ~= nil then
							flagpedhasweapons = true
						end
						foundresult = true
						break
					end
				end
				if not foundresult then
					FirstnameList = SearchPedEntry('FirstName', Firstname)
					SurnameList = SearchPedEntry('LastName', Surname)
					while FirstnameList == nil or SurnameList == nil do
						Wait(100)
					end
					for i, ID in ipairs(FirstnameList) do
						for j, NetID in ipairs(SurnameList) do
							if ID == NetID then
								TargetNetID = NetID
								target = NetToPed(TargetNetID)
								TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
								PedGender = ClientPedConfigList[TargetFlagListIndex].PedGender
								BirthYear = ClientPedConfigList[TargetFlagListIndex].BirthYear
								BirthMonth = ClientPedConfigList[TargetFlagListIndex].BirthMonth
								BirthDay = ClientPedConfigList[TargetFlagListIndex].BirthDay
								IDValid = "Valid"
								flagwanted = ClientPedConfigList[TargetFlagListIndex].flagwanted
								saveoffense = ClientPedConfigList[TargetFlagListIndex].saveoffense
								RandomID = ClientPedConfigList[TargetFlagListIndex].RandomID
								flagpedillegalweapon = ClientPedConfigList[TargetFlagListIndex].flagpedillegalweapon
								flagfight = ClientPedConfigList[TargetFlagListIndex].flagfight
								if ClientPedConfigList[TargetFlagListIndex].savepedweapons[1] ~= nil then
									flagpedhasweapons = true
								end
								foundresult = true
								break
							end
						end
						if foundresult == true then
							break
						end
					end
				end
				if not foundresult then
					Notify('No entry in database found.')
				end
			else
				Notify('Input is not valid.')
			end
		end

		if foundresult then
			local PedHeadHandle = RegisterPedheadshot(target)

			while not IsPedheadshotReady(PedHeadHandle) or not IsPedheadshotValid(PedHeadHandle) do
				Wait(1000)
			end

			local PedHeadString = GetPedheadshotTxdString(PedHeadHandle)

			local DateOfBirth = BirthYear .. "/" .. BirthMonth .. "/" .. BirthDay

			local ArrestPed = nil
			if flagwanted then
				flagwanted = "True"
				ArrestPed = '~r~ Outstanding arrest warrant'
			else
				flagwanted = "False"
				ArrestPed = '~g~ No Flags'
			end

			local DangerNotice = nil
			if flagpedillegalweapon or flagfight or flagpedhasweapons then
				DangerNotice = '~y~ Proceed with caution!'
			else
				DangerNotice = '~b~ No known problems.'
			end

			local Color = "~g~"
			if IDValid == "Valid" then
				Color = "~g~"
			elseif IDValid == "Expired" then
				Color = "~y~"
			elseif IDValid == "Fake" then
				Color = "~r~"
			end

			BeginTextCommandThefeedPost("TWOSTRINGS")

			AddTextComponentSubstringPlayerName("~y~Surname:			~s~" .. Surname .. "~n~ ~y~First Name:		~s~" .. Firstname .. "~n~ ~y~Gender:			~s~" .. PedGender .. "~n~ ~y~Date of")
			AddTextComponentSubstringPlayerName("Birth:		~s~" .. DateOfBirth)

			EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'ID Database Result', Color .. RandomID)
			EndTextCommandThefeedPostTicker(false, false)

			BeginTextCommandThefeedPost("TWOSTRINGS")

			AddTextComponentSubstringPlayerName("~y~Wanted:			~s~" .. flagwanted)
			AddTextComponentSubstringPlayerName("~n~ ~y~Offense:			~s~" .. saveoffense)
			EndTextCommandThefeedPostMessagetext(PedHeadString, PedHeadString, false, 4, ArrestPed, DangerNotice)
			EndTextCommandThefeedPostTicker(false, false)

			UnregisterPedheadshot(PedHeadHandle)
		end
	end
end)

RegisterNetEvent('pd5m:int:runplate')
AddEventHandler('pd5m:int:runplate', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local flag_hasTarget = nil
	local targetcoords = nil
	local targetveh = nil
	local foundveh = false

	local TargetVehFlagListIndex = nil
	local LicencePlate = nil
	local Registration = nil
	local OwnerFirstName = nil
	local OwnerSurname = nil
	local OwnerWanted = nil
	local OwnerOffense = 'None'

	if IsPedInAnyVehicle(playerped, false) and IsPedInAnyPoliceVehicle(playerped) then
		local playerveh = GetVehiclePedIsIn(playerped, false)
		local pvpos = GetEntityCoords(playerveh)
		local infrontofplayerveh = GetOffsetFromEntityInWorldCoords(playerveh, 0.0, 15.0, 0.0)
		flag_hasTarget, targetcoords, targetveh = GetVehInDirection(pvpos, infrontofplayerveh)
		if flag_hasTarget and GetEntityType(targetveh) == 2 then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 10.0 then
				foundveh = true
			else
				Notify('Too far away.')
			end
		else
			Notify('No car found.')
		end
	elseif not IsPedInAnyVehicle(playerped, true) then
		local camcoords = GetGameplayCamCoord()
		local lookingvector = GetPlayerLookingVector(playerped, 30)
		flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(targetveh) == 2 then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 10.0 then
				foundveh = true
			else
				Notify('Too far away.')
			end
		else
			Notify('No car found.')
		end
	end

	if foundveh then
		Notify('Checking database...')
		local TargetInVeh = 0
		local TargetVehNetID = VehToNet(targetveh)

		for i = -1, 2, 1 do
			if not IsVehicleSeatFree(targetveh, i) then
				TargetInVeh = GetPedInVehicleSeat(targetveh, i)
				break
			end
		end

		local TargetFlagListIndex, TargetVehFlagListIndex = SyncPedAndVeh(TargetInVeh, targetveh)

		if TargetInVeh ~= 0 and TargetInVeh ~= nil then
			local flagsyncdata = false

			if ClientVehConfigList[TargetVehFlagListIndex].FirstName ~= ClientPedConfigList[TargetFlagListIndex].FirstName then
				flagsyncdata = true
			elseif ClientVehConfigList[TargetVehFlagListIndex].LastName ~= ClientPedConfigList[TargetFlagListIndex].LastName then
				flagsyncdata = true
			elseif ClientVehConfigList[TargetVehFlagListIndex].flagwanted ~= ClientPedConfigList[TargetFlagListIndex].flagwanted then
				flagsyncdata = true
			elseif ClientVehConfigList[TargetVehFlagListIndex].saveoffense ~= ClientPedConfigList[TargetFlagListIndex].saveoffense then
				flagsyncdata = true
			end

			if flagsyncdata then
				local TargetNetID = PedToNet(TargetInVeh)
				InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)
				Wait(1000)
			end
		end

		LicencePlate = GetVehicleNumberPlateText(targetveh)
		Registration = ClientVehConfigList[TargetVehFlagListIndex].Registration
		OwnerFirstName = ClientVehConfigList[TargetVehFlagListIndex].FirstName
		OwnerSurname = ClientVehConfigList[TargetVehFlagListIndex].LastName
		OwnerWanted = ClientVehConfigList[TargetVehFlagListIndex].flagwanted
		OwnerOffense = ClientVehConfigList[TargetVehFlagListIndex].saveoffense
	end

	if foundveh then

		local Color = "~g~"
		local RegColor = "~g~"

		if Registration == 'Uninsured' or Registration == 'Unregistered' then
			RegColor = "~y~"
		elseif Registration == 'Stolen' then
			RegColor = "~r~"
		end

		if OwnerWanted then
			OwnerWanted = "True"
			Color = "~r~"
		else
			OwnerWanted = "False"
		end

		BeginTextCommandThefeedPost("TWOSTRINGS")

		AddTextComponentSubstringPlayerName("~y~Registration:			~s~" .. RegColor .. Registration .. "~n~ ~y~Owner Surname:		~s~" .. OwnerSurname .. "~n~ ~y~Owner First name:		~s~" .. OwnerFirstName)
		AddTextComponentSubstringPlayerName("~n~ ~y~Owner wanted:		~s~" .. Color .. OwnerWanted .. "~n~ ~y~Owner Offense:		~s~" .. OwnerOffense)

		EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'Vehicle Database Result', Color .. LicencePlate)
		EndTextCommandThefeedPostTicker(false, false)
	end
end)

-- This event is the base for threatening a ped with a weapon.
-- Initialises the interaction and sends over the important data to decide on the ped's reaction.
-- Triggered through the main interaction loop.
-- Advice: Do not use this since it's already set for player control.
-- variables: EntityId
AddEventHandler('pd5m:int:HavePedSurrender', function(target)
	local playerped = GetPlayerPed(-1)
	local PlayerpedNetID = PedToNet(playerped)
	local TargetNetID = PedToNet(target)
	local FlagTargetInClientPedList = false
	local flaginveh = IsPedInAnyVehicle(target, true)
	local targetveh = 0
	local TargetVehFlagListIndex = nil

	if IsPedInAnyVehicle(playerped, true) then
		Notify('Exit the vehicle to threaten the ped.')
	else
		if flaginveh then
			targetveh = GetVehiclePedIsIn(target, false)
		end

		local TargetFlagListIndex, TargetVehFlagListIndex = SyncPedAndVeh(target, targetveh)

		if flaginveh then
			local TargetVehNetID = VehToNet(targetveh)
			InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)
		end

		TriggerEvent('pd5m:int:weaponizeped', target)

		local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')

		if not FlagNoFear then
			SetBlockingOfNonTemporaryEvents(target, true)
			SetPedCombatAttributes(target, 46, true)
			TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoFear')
		end

		if flaginveh then
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, 'Police, stop the vehicle and surrender!', 2000)
		else
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', PlayerpedNetID, TargetNetID, 'Police, take your hands up!', 2000)
		end

		TriggerEvent('pd5m:int:PedThreatenedWeapon', target)
	end
end)

-- Used to have the ped equip the weapons it should have according to its config.
-- Mostly used during initialization and creation of the ped's config.
-- Should not be necessary to use.
--
-- Variables: EntityId
AddEventHandler('pd5m:int:weaponizeped', function(target)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	if ClientPedConfigList[TargetFlagListIndex].savepedweapons[1] ~= nil then
		for i, weapon in ipairs(ClientPedConfigList[TargetFlagListIndex].savepedweapons) do
			GiveWeaponToPed(target, weapon, 500, false, false)
		end
	end
	SetPedCanSwitchWeapon(target, true)
end)

-- Makes a ped flee from a chaser. Chaser should mostly be the player ped.
-- Ensure that the fleeing ped is already synced to the client.
-- Variables: EntityId, EntityId
AddEventHandler('pd5m:int:pedflee', function(target, chaser)
	local TargetNetID = PedToNet(target)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	TriggerEvent('pd5m:sync:PedSetAllAllowConfigFlags', target, false)
	SetPedCombatAttributes(target, 46, false)
	SetBlockingOfNonTemporaryEvents(target, false)
	TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoFear')
	TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoTalk')
	if ClientPedConfigList[TargetFlagListIndex].VehicleNetID ~= nil then
		if IsPedInAnyVehicle(target, true) then
			local targetveh = GetVehiclePedIsIn(target, false)
			SetVehicleHandbrake(targetveh, false)
			SetVehicleFuelLevel(targetveh, 1000.0)
			if not GetIsVehicleEngineRunning(targetveh) then
				SetVehicleEngineOn(targetveh, true, false, false)
			end
		else
			TaskEnterVehicle(target, NetToVeh(ClientPedConfigList[TargetFlagListIndex].VehicleNetID), 10000, -1, 2.0, 1, 0)
			while not IsPedInAnyVehicle(target, false) do
				Wait(500)
			end
			local targetveh = GetVehiclePedIsIn(target, false)
			SetVehicleFuelLevel(targetveh, 1000.0)
			SetVehicleHandbrake(targetveh, false)
			if not GetIsVehicleEngineRunning(targetveh) then
				SetVehicleEngineOn(targetveh, true, false, false)
			end
		end
	end

	local playerRelGroup = GetPedRelationshipGroupHash(chaser)
	local PedRelGroup = GetPedRelationshipGroupHash(target)
	SetRelationshipBetweenGroups(3, PedRelGroup, playerRelGroup)
	SetRelationshipBetweenGroups(3, playerRelGroup, PedRelGroup)

	SetPedPathAvoidFire(target, true)
	SetPedPathCanUseClimbovers(target, true)
	SetPedPathCanUseLadders(target, true)
	SetPedPathMayEnterWater(target, true)
	SetPedPathPreferToAvoidWater(target, true)
	SetPedCanEvasiveDive(target, true)
	SetPedFleeAttributes(target, 2, true)
	SetDriveTaskDrivingStyle(target, 786944) --do this randomly for different driving styles, also slow down PD vehicles
	SetDriverAbility(target, 1.0)
	SetDriverAggressiveness(target, 1.0)
	SetDriverRacingModifier(target, 1.0)
	if not IsPedInAnyVehicle(target, false) then
		ClearPedTasksImmediately(target)
	else
		ClearPedTasks(target)
	end
	local TargetBlip = AddBlipForEntity(target)
	table.insert(ClientPedBlipList, TargetBlip)

	CreateThread(function()
		local AreaHasCops = true
		TaskSmartFleePed(target, chaser, 10000.0, -1, false, false)
		while AreaHasCops do
			AreaHasCops = false
			local targetx, targety, targetz = table.unpack(GetEntityCoords(target, false))
			local players = GetActivePlayers()
			for _, player in ipairs(players) do
				playerped = GetPlayerPed(player)
				if IsEntityInArea(playerped, targetx-500, targety-500, targetz-500, targetx+500, targety+500, targetz+500, 0, 1, 0) then
					AreaHasCops = true
					break
				end
			end
			local flagarrested = CheckFlag(TargetNetID, 'Arrested')
			if flagarrested or IsEntityDead(target) then
				break
			end
			if IsPedInAnyVehicle(target, true) then
				local targetveh = GetVehiclePedIsIn(target, false)
				SetVehicleIsRacing(targetveh, true)
			end
			Wait(3000)
		end
		TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
		if flagarrested then
			ClearPedTasksImmediately(target)
			RemoveBlip(TargetBlip)
			local playerRelGroup = GetPedRelationshipGroupHash(chaser)
			local PedRelGroup = GetPedRelationshipGroupHash(target)
			SetRelationshipBetweenGroups(0, PedRelGroup, playerRelGroup)
			SetRelationshipBetweenGroups(0, playerRelGroup, PedRelGroup)
		elseif IsEntityDead(target) then
			RemoveBlip(TargetBlip)
			SetEntityAsNoLongerNeeded(target)

		else
			ClearPedTasksImmediately(target)
			TaskWanderStandard(target, 10.0, 10)
			RemoveBlip(TargetBlip)
			SetEntityAsNoLongerNeeded(target)
			local playerRelGroup = GetPedRelationshipGroupHash(chaser)
			local PedRelGroup = GetPedRelationshipGroupHash(target)
			SetRelationshipBetweenGroups(3, PedRelGroup, playerRelGroup)
			SetRelationshipBetweenGroups(3, playerRelGroup, PedRelGroup)
		end
	end)
end)

-- Makes a ped fight a designated enemy. Enemy should mostly be the player ped.
-- Ensure that the fighting ped is already synced to the client.
-- Variables: EntityId, EntityId
AddEventHandler('pd5m:int:pedhostile', function(target, enemy)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetNetID = PedToNet(target)
	TriggerEvent('pd5m:sync:PedSetAllAllowConfigFlags', target, false)
	SetBlockingOfNonTemporaryEvents(target, false)
	SetPedCombatAttributes(target, 46, false)
	TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoFear')
	TriggerServerEvent('pd5m:syncsv:AddPedFlagEntry', TargetNetID, 'NoTalk')

	SetPedPathAvoidFire(target, true)
	SetPedPathCanUseClimbovers(target, true)
	SetPedPathCanUseLadders(target, true)
	SetCanAttackFriendly(target, true, false)
	SetPedCombatAttributes(target, 0, true)
	SetPedCombatAttributes(target, 1, true)
	SetPedCombatAttributes(target, 2, true)
	SetPedCombatAttributes(target, 3, true)
	SetPedCombatAttributes(target, 5, true)
	SetPedCombatAttributes(target, 20, true)
	SetPedCombatAttributes(target, 52, true)
	SetPedCanEvasiveDive(target, true)
	SetPedCanPeekInCover(target, true)
	SetPedCombatRange(target, 2)

	local playerRelGroup = GetPedRelationshipGroupHash(enemy)
	local PedRelGroup = GetPedRelationshipGroupHash(target)
	SetRelationshipBetweenGroups(5, PedRelGroup, playerRelGroup)
	SetRelationshipBetweenGroups(5, playerRelGroup, PedRelGroup)

	-- random combat stats
	local ChooseMovement = 1
	local ChooseShootrate = 100

	if IsPedArmed(target, 4) then
		local RandomMovement = math.random(1, 100)
		if RandomMovement <= 5 then
			ChooseMovement = 0
		elseif RandomMovement > 5 and RandomMovement <= 60 then
			ChooseMovement = 1
		elseif RandomMovement > 60 and RandomMovement <= 95 then
			ChooseMovement = 2
		else
			ChooseMovement = 3
		end
	else
		ChooseMovement = 3
	end

	local ChooseAccuracy = math.random(1, 101) - 1

	local RandomShootrate = math.random(1, 100)
	if RandomShootrate <= 10 then
		ChooseShootrate = math.random(5, 50)
	elseif RandomShootrate > 10 and RandomShootrate <= 63 then
		ChooseShootrate = math.random(50, 150)
	elseif RandomShootrate > 63 and RandomShootrate <= 85 then
		ChooseShootrate = math.random(150, 350)
	elseif RandomShootrate > 85 and RandomShootrate <= 97 then
		ChooseShootrate = math.random(350, 650)
	else
		ChooseShootrate = math.random(650, 1000)
	end

	SetPedCombatMovement(target, ChooseMovement) -- 0: Stationary, 1: Defensive, 2: Offensive, 3: Suicidal
	SetPedAccuracy(target, ChooseAccuracy) -- 0 - 100 % accuracy
	SetPedShootRate(target, ChooseShootrate) -- 0 - 1000 Schussrate

	ClearPedTasksImmediately(target)
	TargetBlip = AddBlipForEntity(target)
	table.insert(ClientPedBlipList, TargetBlip)
	SetPedAsEnemy(target, true)

	CreateThread( function()
		local AreaHasEnemies = false
		TaskCombatPed(target, enemy, 0, 16)
		local playerped = enemy
		AreaHasEnemies = true
		while AreaHasEnemies do
			AreaHasEnemies = false
			local targetx, targety, targetz = table.unpack(GetEntityCoords(target, false))
			local players = GetActivePlayers()
			for _, player in ipairs(players) do
				playerped = GetPlayerPed(player)
				local px, py, pz = table.unpack(GetEntityCoords(playerped, false))
				if IsEntityInArea(playerped, targetx-100, targety-100, targetz-100, targetx+100, targety+100, targetz+100, 0, 1, 0) then
					AreaHasEnemies = true
					TaskCombatPed(target, playerped, 0, 16)
					break
				end
			end
			local flagarrested = CheckFlag(TargetNetID, 'Arrested')
			if flagarrested or IsEntityDead(target) then
				break
			end
			Wait(3000)
		end
		TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')

		if flagarrested then
			ClearPedTasksImmediately(target)
			RemoveBlip(TargetBlip)
			SetCanAttackFriendly(target, false, false)
			SetPedAsEnemy(target, false)
			local playerRelGroup = GetPedRelationshipGroupHash(enemy)
			local PedRelGroup = GetPedRelationshipGroupHash(target)
			SetRelationshipBetweenGroups(0, PedRelGroup, playerRelGroup)
			SetRelationshipBetweenGroups(0, playerRelGroup, PedRelGroup)
		elseif IsEntityDead(target) then
			RemoveBlip(TargetBlip)
			SetEntityAsNoLongerNeeded(target)
		else
			ClearPedTasksImmediately(target)
			TaskWanderStandard(target, 10.0, 10)
			RemoveBlip(TargetBlip)
			SetCanAttackFriendly(target, false, false)
			SetPedAsEnemy(target, false)
			SetEntityAsNoLongerNeeded(target)
			local playerRelGroup = GetPedRelationshipGroupHash(enemy)
			local PedRelGroup = GetPedRelationshipGroupHash(target)
			SetRelationshipBetweenGroups(3, PedRelGroup, playerRelGroup)
			SetRelationshipBetweenGroups(3, playerRelGroup, PedRelGroup)
		end
	end)
end)

-- -- -- Being Drunk

-- -- -- Being drugged

-- Event to make Ped resist an action the officer takes.
-- Used for non-compliance, e.g. resisting arrest.
-- Use strength to determine the action the target will use against the player:
-- Strength 1 -> slight back-off
-- Strength 2 -> push back the officer
-- Strength 3 -> Hit officer to the ground and trigger flee or fight-response.
-- Variables: EntityId, INT (between 1 and 3)
AddEventHandler('pd5m:int:PedResistAction', function(target, strength)
	local TargetFlagListIndex = SyncPedAndVeh(target, 0)
	local PedGender = GetPedGender(target)
	local TargetNetID = PedToNet(target)
	local playerped = GetPlayerPed(-1)
	local PlayerPedNetID = PedToNet(playerped)
	if IsPedInAnyVehicle(target, true) then
		local targetveh = GetVehiclePedIsIn(target, false)
		if strength == 2 then
			ClearPedTasks(target)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalStopInteractionResponse[math.random(1, #NormalStopInteractionResponse)], 2000)
			TriggerEvent('pd5m:int:stoptalk', target, true)
		elseif strength == 3 then
			ClearPedTasks(target)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalFleeResponse[math.random(1, #NormalFleeResponse)], 2000)
			SetVehicleHandbrake(targetveh, false)
			SetVehicleFuelLevel(targetveh, 1000.0)
			TriggerEvent('pd5m:int:pedflee', target, playerped)
		else
			ClearPedTasks(target)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalRefuseOrderResponse[math.random(1, #NormalRefuseOrderResponse)], 2000)
		end
	else
		if strength == 2 then
			ClearPedTasks(target)
			makeEntityFaceEntity(target, playerped)
			loadAnimDict("melee@unarmed@streamed_core")
			loadAnimDict("reaction@shove")
			Wait(800)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalResistActionResponse[math.random(1, #NormalResistActionResponse)], 2000)
			TaskPlayAnim(target, "melee@unarmed@streamed_core", "shove", 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
			Wait(200)
			TaskPlayAnim(playerped, "reaction@shove", "shoved_front", 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
			Wait(1300)
			TriggerEvent('pd5m:int:stoptalk', target, false)
			Wait(500)
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalStopInteractionResponse[math.random(1, #NormalStopInteractionResponse)], 2000)
		elseif strength == 3 then
			ClearPedTasks(target)
			makeEntityFaceEntity(target, playerped)
			Wait(800)
			loadAnimDict("melee@unarmed@streamed_core")
			loadAnimDict("get_up@standard")
			TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalResistActionResponse[math.random(1, #NormalResistActionResponse)], 2000)
			TaskPlayAnim(playerped, "melee@unarmed@streamed_core", "victim_takedown_front_elbow", 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
			Wait(100)
			local DisableFPCam = true
			CreateThread(function()
				while DisableFPCam do
					DisableFirstPersonCamThisFrame()
					Wait(0)
				end
			end)
			TaskPlayAnim(target, "melee@unarmed@streamed_core", "plyr_takedown_front_elbow", 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
			Wait(1300)
			if ClientPedConfigList[TargetFlagListIndex].flagfight then --this can be expanded with a multitude of variables much like in "pd5m:int:PedThreatenedWeapon"
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalFightResponse[math.random(1, #NormalFightResponse)], 2000)
				TriggerEvent('pd5m:int:pedhostile', target, playerped)
			else
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalFleeResponse[math.random(1, #NormalFleeResponse)], 2000)
				TriggerEvent('pd5m:int:pedflee', target, playerped)
			end
			local playerheading = GetEntityHeading(playerped)
			local newheading = playerheading - 180
			if newheading < - 180 then
				newheading = newheading + 360
			end
			Wait(700)
			TaskPlayAnim(playerped, "get_up@standard", "front", 99999.0, 8.0, -1, 0, 0.0, 0, 0, 0)
			SetEntityHeading(playerped, newheading)
			Wait(500)
			DisableFPCam = false
		else
			ClearPedTasks(target)
			local direction = "0"
			local px, py, pz = table.unpack(GetEntityCoords(playerped))
			local offx, offy, offz = table.unpack(GetOffsetFromEntityGivenWorldCoords(target, px, py, pz))
			if offy > 0 then
				if offx > 0 and offx^2 > offy^2 then
					direction = "90"
				elseif offx < 0 and offx^2 > offy^2 then
					direction = "-90"
				end
			else
				direction = "180"
				if offx > 0 and offx^2 > offy^2 then
					direction = "90"
				elseif offx < 0 and offx^2 > offy^2 then
					direction = "-90"
				end
			end

			if PedGender == 'Female' then
				loadAnimDict("reaction@back_away@f")
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalResistActionResponse[math.random(1, #NormalResistActionResponse)], 2000)
				TaskPlayAnim(target, "reaction@back_away@f", direction, 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
				Wait(1500)
				ClearPedTasks(target)
			else
				loadAnimDict("reaction@back_away@m")
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', TargetNetID, PlayerPedNetID, NormalResistActionResponse[math.random(1, #NormalResistActionResponse)], 2000)
				TaskPlayAnim(target, "reaction@back_away@m", direction, 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
				Wait(1500)
				ClearPedTasks(target)
			end
		end
	end
end)

-- -- -- Threatened with words, check reaction

-- this is intended as a means for the player to get around ped refusals. Comes at a risk if the ped doesn't let itself be threatened.
-- If successful the player can get the peds approval to a planned action (like breathalyzer) or get an answer to a question (give ID or sth)
-- If unsucessful the ped will a) mock the player, b) call for a supervisor, c) break off the talk by himself (wander, not flee)


-- This event checks for the reaction of the targeted ped if threatened with a weapon by the player.
-- Do not use this, trigger 'pd5m:int:HavePedSurrender'
AddEventHandler('pd5m:int:PedThreatenedWeapon', function(target)
	local playerped = GetPlayerPed(-1)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local pedfleeflag = 0
	local pedfightflag = 0
	local flagpedweapon = false
	local copsmodifier = 0
	local alliesmodifier = 1

	if ClientPedConfigList[TargetFlagListIndex].savepedweapons[1] ~= nil then
		flagpedweapon = true
	end

	if ClientPedConfigList[TargetFlagListIndex].flagfleeinstant then
		pedfleeflag = pedfleeflag + 50
	end
	if ClientPedConfigList[TargetFlagListIndex].flagfight then
		pedfleeflag = pedfleeflag + 50
		pedfightflag = pedfightflag + 60
	end
	if ClientPedConfigList[TargetFlagListIndex].flagdrug then
		pedfleeflag = pedfleeflag + 80
		pedfightflag = pedfightflag + 70
	end
	if ClientPedConfigList[TargetFlagListIndex].flagwanted then
		pedfleeflag = pedfleeflag + 50
		pedfightflag = pedfightflag - 5
	end
	if ClientPedConfigList[TargetFlagListIndex].flagpedillegalweapon then
		pedfleeflag = pedfleeflag + 60
		pedfightflag = pedfightflag + 60
	end
	if ClientPedConfigList[TargetFlagListIndex].flagpedweapon or IsPedArmed(target, 4) then
		if ClientPedConfigList[TargetFlagListIndex].flagweaponlicence then
			pedfightflag = pedfightflag - 5
		else
			pedfightflag = pedfightflag + 20
		end
	end
	if ClientPedConfigList[TargetFlagListIndex].flagpedillegalitem then
		pedfleeflag = pedfleeflag + 30
		pedfightflag = pedfightflag - 5
	end

	if GetSelectedPedWeapon(target) ~= 0xA2719263 and IsPedArmed(target, 4) then
		pedfleeflag = pedfleeflag + 70
		pedfightflag = pedfightflag + 70
	end

	if HasEntityClearLosToEntityInFront(target, playerped) then
		if HasEntityClearLosToEntityInFront(playerped, target) then
			pedfleeflag = pedfleeflag + 20
			pedfightflag = pedfightflag + 20
		else
			pedfleeflag = pedfleeflag + 50
			pedfightflag = pedfightflag + 50
		end
	else
		if HasEntityClearLosToEntityInFront(playerped, target) then
			pedfleeflag = pedfleeflag - 50
			pedfightflag = pedfightflag - 50
		else
			pedfleeflag = pedfleeflag
			pedfightflag = pedfightflag
		end
	end

	local pedx, pedy, pedz = table.unpack(GetEntityCoords(target, false))

	for i, ID in ipairs(GetActivePlayers()) do
		local playerpeds = GetPlayerPed(ID)
		if IsEntityInArea(playerpeds, pedx-50, pedy-50, pedz-50, pedx+50, pedy+50, pedz+50, true, true, 0) then
			copsmodifier = copsmodifier + 1
		end
	end

	for i, ID in ipairs(ClientPedConfigList[TargetFlagListIndex].AlliesList) do
		local alliedpeds = NetToPed(ID)
		if IsEntityInArea(alliedpeds, pedx-50, pedy-50, pedz-50, pedx+50, pedy+50, pedz+50, true, true, 0) then
			alliesmodifier = alliesmodifier + 1
		end
	end

	if copsmodifier == 0 then
		copsmodifier = 1
	end

	pedfleeflag = pedfleeflag * (alliesmodifier/copsmodifier)
	pedfightflag = pedfightflag * (alliesmodifier/copsmodifier)

	if math.random(1, 100) <= pedfleeflag then
		if math.random(1, 100) <= pedfightflag then
			TriggerEvent('pd5m:int:pedhostile', target, playerped)
		else
			TriggerEvent('pd5m:int:pedflee', target, playerped)
		end
	else
		TriggerEvent('pd5m:int:PedSurrender', target)
	end
end)

-- This event makes the ped surrender and has it allow every action the player can use against the ped.
-- Do not use this, trigger 'pd5m:int:HavePedSurrender'
AddEventHandler('pd5m:int:PedSurrender', function(target)
	local TargetNetID = PedToNet(target)
	local FlagNoFear = CheckFlag(TargetNetID, 'NoFear')
	local flaginveh = false
	local targetveh = nil
	local playerped = GetPlayerPed(-1)

	flaginveh = IsPedInAnyVehicle(target, true)

	if flaginveh then
		targetveh = GetVehiclePedIsIn(target, false)
		ClearPedTasks()
		TaskVehicleTempAction(target, targetveh, 27, 2000)
		while GetEntitySpeed(targetveh) > 0.2 do
			Wait(100)
		end
		TaskLeaveAnyVehicle(target, 1, 1)
		Wait(500)
	else
		ClearPedTasks()
	end

	local playerRelGroup = GetPedRelationshipGroupHash(playerped)
	local PedRelGroup = GetPedRelationshipGroupHash(target)
	SetRelationshipBetweenGroups(0, PedRelGroup, playerRelGroup)
	SetRelationshipBetweenGroups(0, playerRelGroup, PedRelGroup)

	TaskHandsUp(target, -1, 0, -1, true)
	TriggerEvent('pd5m:sync:PedSetAllAllowConfigFlags', target, 'true')
	TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoTalk')
end)

-- The thread that defines every warmenu option related to "normal" talking.
CreateThread(function()

	-- Numbers behind the list note the binary numbers for the resistmodifier.
	-- Use the following code to make the "target" resist certain questions / actions in addition to already existing flags.
	-- In this example the ped will resist every question for weapons and actions that would result in a check for weapons.
	-- To make target comply, use negative numbers (in the example below the ped will allow an ID-check).
	-- Please use only the true powers of 2 and not sums of multiple items.

	-- TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	-- resistvalue = ClientPedConfigList[TargetFlagListIndex].resistmodifier
	-- newvalues = {-1, 4, 64, 32768, 65536, 131072, 262144, 524288}
	-- TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'resistmodifierList', newvalues)

	-- In order to replace the current flags with your own, simply do the following. Non mentioned flags will be false, meaning the target won't resist.
	-- newresistvalue = 4 + 64 + 32768 + 65536 + 131072 + 262144 + 524288
	-- TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'resistmodifier', newresistvalue

	local LicenceList = {'ID', "driver's licence", 'weapon permit'} -- ID = 1, Licence = 2, Weapon = 4
	local CurrentLicenceIndex = 1
	local SelectedLicenceIndex = 1

	local IllegalQList = {'drugs', 'alcohol', 'illegal items', 'weapons'} -- Drugs = 8, Alcohol = 16, Illegal Items = 32, Weapons = 64
	local CurrentIllegalQIndex = 1
	local SelectedIllegalQIndex = 1

	local QuestionList = {'starting point', 'destination', 'activity', 'suspicious activities'} -- Starting = 128, Destination = 256, Activity = 512, Suspicious Activities = 1024
	local CurrentQuestionIndex = 1
	local SelectedQuestionIndex = 1

	local VehicleOList = {'out of vehicle', 'into vehicle'} -- Out of vehicle = 2048, Into vehicle = 4096
	local CurrentVehicleOIndex = 1
	local SelectedVehicleOIndex = 1

	local InvestigationList = {'breathalyzer', 'drug test', 'people search', 'car search'} -- Breathalyzer = 8192, Drug test = 16384, people search = 32768, car search = 65536
	local CurrentInvestigationIndex = 1
	local SelectedInvestigationIndex = 1

	local ActionsList = {'vehicle seizure', 'object confiscation', 'arrest', 'fine'} -- vehicle seizure = 131072, object confiscation = 262144, arrest = 524288, fine = 1048576
	local CurrentActionsIndex = 1
	local SelectedActionsIndex = 1

	WarMenu.CreateMenu('pd5m:int:talkmenu', 'Talk')
	--WarMenu.CreateMenu('pd5m:int:missionmenu', 'Talk')
	--WarMenu.CreateMenu('pd5m:int:arrestedmenu', 'Verhör')

	while true do
		if WarMenu.IsMenuOpened('pd5m:int:talkmenu') then
			if WarMenu.Button('Greet') then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', MenuPlayerPedNetID, MenuTargetNetID, "Good day, my name is Officer " .. GetPlayerName(PlayerId()) .. ".", 2000)
				Wait(2000)
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', MenuTargetNetID, MenuPlayerPedNetID, NormalGreetResponse[math.random(1, #NormalGreetResponse)], 2000)
				Wait(100)
				WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('Ask for Licences', LicenceList, CurrentLicenceIndex, SelectedLicenceIndex, function(currentIndex, selectedIndex)
					CurrentLicenceIndex = currentIndex
					SelectedLicenceIndex = selectedIndex
				end) then
					TriggerEvent('pd5m:int:AskForLicence', MenuTarget, SelectedLicenceIndex)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
					Wait(100)
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('Ask for Items', IllegalQList, CurrentIllegalQIndex, SelectedIllegalQIndex, function(currentIndex, selectedIndex)
					CurrentIllegalQIndex = currentIndex
					SelectedIllegalQIndex = selectedIndex
				end) then
					TriggerEvent('pd5m:int:AskForItems', MenuTarget, SelectedIllegalQIndex)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
					Wait(100)
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('Question Ped', QuestionList, CurrentQuestionIndex, SelectedQuestionIndex, function(currentIndex, selectedIndex)
					CurrentQuestionIndex = currentIndex
					SelectedQuestionIndex = selectedIndex
				end) then
					TriggerEvent('pd5m:int:QuestionPed', MenuTarget, SelectedQuestionIndex)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
					Wait(100)
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('Vehicle Orders', VehicleOList, CurrentVehicleOIndex, SelectedVehicleOIndex, function(currentIndex, selectedIndex)
					CurrentVehicleOIndex = currentIndex
					SelectedVehicleOIndex = selectedIndex
				end) then
					TriggerEvent('pd5m:int:VehiclePedOrder', MenuTarget, SelectedVehicleOIndex)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
					Wait(100)
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('Investigation', InvestigationList, CurrentInvestigationIndex, SelectedInvestigationIndex, function(currentIndex, selectedIndex)
					CurrentInvestigationIndex = currentIndex
					SelectedInvestigationIndex = selectedIndex
				end) then
					TriggerEvent('pd5m:int:InformPedInvestigation', MenuTarget, SelectedInvestigationIndex)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
					Wait(100)
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('Actions', ActionsList, CurrentActionsIndex, SelectedActionsIndex, function(currentIndex, selectedIndex)
					CurrentActionsIndex = currentIndex
					SelectedActionsIndex = selectedIndex
				end) then
					TriggerEvent('pd5m:int:InformPedActions', MenuTarget, SelectedActionsIndex)
					TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
					Wait(100)
					WarMenu.CloseMenu()
			elseif WarMenu.Button('Let Ped Wait') then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', MenuPlayerPedNetID, MenuTargetNetID, OFCWait[math.random(1, #OFCWait)], 2000)
				Wait(2000)
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', MenuTargetNetID, MenuPlayerPedNetID, NormalWaitResponse[math.random(1, #NormalWaitResponse)], 2000)
				Wait(100)
				WarMenu.CloseMenu()
			elseif WarMenu.Button('Release Ped') then
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', MenuPlayerPedNetID, MenuTargetNetID, OFCBye[math.random(1, #OFCBye)], 2000)
				Wait(2000)
				TriggerServerEvent('pd5m:syncsv:ShowCommunication', MenuTargetNetID, MenuPlayerPedNetID, NormalGoodbye[math.random(1, #NormalGoodbye)], 2000)
				TriggerEvent('pd5m:int:stoptalk', MenuTarget, MenuFlagInVeh)
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', MenuTargetNetID, 'Talking')
				Wait(100)
				WarMenu.CloseMenu()
			end
			WarMenu.Display()
		elseif CheckFlag(MenuTargetNetID, 'Talking') then
			WarMenu.OpenMenu('pd5m:int:talkmenu')
		end
		Wait(0)
	end
end)

-- Threads to imprison an arrested and grabbed ped.
-- The first thread checks if the player is in range of the marker.
-- If yes, pressing E will use the marker and delete the ped.
if ActivateArrestMarkers then
	atarrest = false

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_arrest_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					atarrest = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to imprison the ped (must be handcuffed and grabbed).', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to imprison the ped (must be handcuffed and grabbed).', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to imprison the ped (must be handcuffed and grabbed).', 500)
					atarrest = false
				end
			end
			Wait(0)
		end
	end)

	CreateThread(function()
		while true do
			if IsControlJustPressed(0, 51) and atarrest and flag_grabbed then
				local target = grabbedTarget
				local TargetNetID = PedToNet(target)
				TriggerServerEvent('pd5m:syncsv:ungrabped', TargetNetID)

				flag_grabbed = false
				grabbedTarget = nil

				while IsEntityAttachedToAnyPed(target) do
					Wait(500)
				end

				TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)

				local FirstName = ClientPedConfigList[TargetFlagListIndex].FirstName
				local LastName = ClientPedConfigList[TargetFlagListIndex].LastName

				local TargetName = FirstName .. " " .. LastName

				DeleteEntity(target)

				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("The suspect was brought into the prison and serves their sentence.")
				EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Imprisonment report", TargetName)
				EndTextCommandThefeedPostTicker(false, false)
			elseif IsControlJustPressed(0,51) and atarrest then
				Notify('You need to grab the ped to arrest it.')
			end
			Wait(0)
		end
	end)
end

-- This event is called after the player releases a ped by releasing it in the talking menu.
-- Makes the ped wander around in the area randomly, resets flags like NoFear.
-- If the ped owns a vehicle this script will make the ped enter the vehicle and drive away.
-- If the ped already is in a vehicle, the script will make the ped drive away.
-- This event is already used through the talking menu and is intended to be only used this way.
-- Advice: Do not use this, trigger it through the talking menu.
-- Variables: EntityId, bool
AddEventHandler('pd5m:int:stoptalk', function(target, flaginveh)
	local TargetNetID = PedToNet(target)
	SetPedCombatAttributes(target, 46, false)
	SetBlockingOfNonTemporaryEvents(target, false)
	TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'NoFear')

	TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', TargetNetID, 'Stopped')
	SetEntityAsNoLongerNeeded(target)

	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local TargetVehicleNetID = ClientPedConfigList[TargetFlagListIndex].VehicleNetID

	if TargetVehicleNetID ~= nil and TargetVehicleNetID ~= 0 then
		targetveh = NetToEnt(TargetVehicleNetID)
	else
		targetveh = 0
	end

	if GetEntityType(targetveh) == 2 and not flaginveh then
		TaskEnterVehicle(target, targetveh, 10000, -1, 1.0, 1, 0)
		local CutoffEnterVehicleInteger = 0
		while not IsPedInAnyVehicle(target, false) and CutoffEnterVehicleInteger < 21 do
			CutoffEnterVehicleInteger = CutoffEnterVehicleInteger + 1
			Wait(500)
		end
		flaginveh = true
	end
	if not flaginveh then
		ClearPedTasksImmediately(target)
		TaskWanderStandard(target, 10.0, 10)
	else
		if not GetIsVehicleEngineRunning(targetveh) then
			SetVehicleEngineOn(targetveh, true, false, false)
		end
		SetVehicleHandbrake(targetveh, false)
		SetVehicleFuelLevel(targetveh, 1000.0)
		SetEntityAsNoLongerNeeded(targetveh)
		TaskVehicleDriveWander(target, targetveh, 30.0, NormalDrivingBehavior)
	end
end)
