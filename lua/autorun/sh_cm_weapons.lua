CreateConVar( "sv_class_weightlimit", "100", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Maximum Weight Limit" )
CreateConVar( "sv_class_rankings", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Enable Rankings" )

-- Class Mod Weapon Data

function CM_GetPlayerWeapons(ply)
	local Weapons
	if CLIENT then
		Weapons = string.Explode(" ",string.Trim(GetConVar("cm_editor_weapons"):GetString()))
	else
		Weapons = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_weapons")))
	end
	return Weapons
end
--[[
function CM_GetPlayerEquipment(ply)
	local Equipment
	if CLIENT then
		Equipment = string.Explode(" ",string.Trim(GetConVar("cm_editor_equipment"):GetString()))
	else
		Equipment = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_equipment")))
	end
	return Weapons	
end
--]]

function CM_GetPlayerWeight(ply)

	local Weapons = CM_GetPlayerWeapons(ply) --+ CM_GetPlayerEquipment(ply)
	local WeightCount = 0

	for k,v in pairs(Weapons) do
		local Weapon = CMWeapons[v]
		if Weapon then
			WeightCount = WeightCount + Weapon.Weight
		end
	end
	
	return WeightCount

end

function CM_GetPlayerWeightCurrent(ply)

	local Weapons = ply:GetWeapons()
	local WeightCount = (ply:Armor()/4)

	for k,v in pairs(Weapons) do
		local Weapon = CMWeapons[v:GetClass()]
		if Weapon then
			WeightCount = WeightCount + Weapon.Weight
		end
	end
	
	return WeightCount

end




function CM_UpdateWeight(ply)
	ply.CM_Weight = CM_GetPlayerWeightCurrent(ply)
end

local NextUpdate = 0

function CM_Think()
	if NextUpdate <= CurTime() then
		if SERVER then
			for k,v in pairs(player.GetHumans()) do
				CM_UpdateWeight(v)
			end
		end
		if CLIENT then
			CM_UpdateWeight(LocalPlayer())
		
		end
		NextUpdate = NextUpdate + 0.25
	end
end

hook.Add("Think","CM_Think",CM_Think)

function CM_GetMoveMul(weight)
	if not weight then weight = 0 end
	return math.Round( math.Clamp(0.6 + (1 - (weight / 40))*0.5,0.25,1),2 )
end

function CM_Move(ply,mv)
	if not ply:IsBot() then
		local SpeedMul = CM_GetMoveMul(ply.CM_Weight)
		mv:SetMaxClientSpeed(mv:GetMaxSpeed() * SpeedMul)
		mv:SetMaxSpeed(mv:GetMaxSpeed() * SpeedMul)
	end
end

hook.Add("Move","CM_Move",CM_Move)

function CM_GetPlayerNadeCount(ply)

	local Weapons = CM_GetPlayerWeapons(ply)
	
	local NadeCount = 0
	
	for k,v in pairs(Weapons) do
		local Weapon = CMWeapons[v]
		if Weapon then
			if WeaponSlot == 5 then
				NadeCount = NadeCount + 1
			end
		end
	end
	
	return NadeCount

end

function CM_CanSpawnWith(ply,weapon,givereason,tableoverride)

	if not tableoverride then
		tableoverride = CM_GetPlayerWeapons(ply)
	end

	local Weapon01 = CMWeapons[weapon]
	
	if not Weapon01 then return false end
	
	if CM_IsRankEnabled() then
		if Weapon01.Rank then
			if Weapon01.Rank > SimpleXPGetLevel(ply) then
				if givereason then
					print("NOT UNLOCKED")
				end
				return false
			end
		else
			print(Weapon01.Name," has no rank!")
		end
	end
	
	if CM_IsCostEnabled() then
		if Weapon01.Cost > MONEYMOD_GetMoney(ply) then
			if givereason then
				print("NOT ENOUGH MONEY")
			end
			return false
		end
	end
	
	local Weapons = tableoverride
	
	if table.Count(Weapons) > 0 then
	
	
		local TotalWeight = Weapon01.Weight or 0
		local TotalCost = Weapon01.Cost or 0
		local GrenadeCount = 0
		
		if Weapon01.Slot == 5 then
			GrenadeCount = 1
		end

		for k,v in pairs(Weapons) do
			if CMWeapons[v] then
				local Weapon02 = CMWeapons[v]
				
				if Weapon01 ~= Weapon02 then

					if CM_SharesSameSlot(Weapon01,Weapon02) then
						if givereason then
							print("SHARES SAME SLOT")
						end
						return false
					end

					if Weapon02.Slot == 5 then
						GrenadeCount = GrenadeCount + 1
					end
					
					if GrenadeCount > 3 then
						if givereason then
							print("YOU HAVE MORE THAN 3 GRENADES")
						end
						return false
					end
					
					if CM_IsCostEnabled() then
					
						TotalCost = TotalCost + (Weapon02.Cost or 0)
					
						if TotalCost > MONEYMOD_GetMoney(ply) then
							if givereason then
								print("NOT ENOUGH MONEY")
							end
							return false
						end
					end

					TotalWeight = TotalWeight + Weapon02.Weight
					
					if TotalWeight > CM_GetMaxWeight() then
						if givereason then
							print("TOTAL WEIGHT EXCEEDS MAXIMUM WEIGHT.")
						end
						return false
					end	
				end
				
			end
		end
		
	end

	return true
	
end

function CM_SharesSameSlot(Weapon01,Weapon02)

	if Weapon01.Slot <= 1 or Weapon01.Slot == 5 then
		return false
	end
	
	return Weapon01.Slot == Weapon02.Slot
	
end

function CM_IsCostEnabled()
	return false
end

function CM_RemoveWeapon(weapon,CurrentLoadout)

	table.RemoveByValue(CurrentLoadout,weapon)
	
	if table.Count(CurrentLoadout) == 0 then
		CurrentLoadout = {"none"}
	elseif table.Count(CurrentLoadout) >= 2 and table.HasValue(CurrentLoadout,"none") then
		table.RemoveByValue(CurrentLoadout,"none")
	end
	
	return CurrentLoadout

end

function CM_IsRankEnabled()
	return ( GetConVar("sv_class_rankings"):GetFloat() == 1 )
end

function CM_GetMaxWeight()
	return ( GetConVar("sv_class_weightlimit"):GetFloat() )
end