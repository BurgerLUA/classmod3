CreateConVar( "sv_class_weightlimit", "100", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Maximum Weight Limit" )
CreateConVar( "sv_class_rankings", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Enable Rankings" )

-- Class Mod Weapon Data

function CM_GetPlayerWeapons(ply)
	if CLIENT then
		Weapons = string.Explode(" ",string.Trim(GetConVar("cm_editor_weapons"):GetString()))
	else
		Weapons = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_weapons")))
	end
	
	return Weapons
	
end

function CM_GetPlayerWeight(ply)

	local Weapons = CM_GetPlayerWeapons(ply)
	local WeightCount = 0

	for k,v in pairs(Weapons) do
		local Weapon = CMWeapons[v]
		if Weapon then
			WeightCount = WeightCount + Weapon.Weight
		end
	end
	
	return WeightCount

end

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

function CM_CanSpawnWith(ply,weapon,givereason)

	local Weapon01 = CMWeapons[weapon]

	if CM_IsRankEnabled() then
		if Weapon01.Rank > SimpleXPGetLevel(ply) then
			if givereason then
				print("NOT UNLOCKED")
			end
			return false
		end
	end
	
	local Weapons = CM_GetPlayerWeapons(ply)
	
	if table.Count(Weapons) > 0 then
	
		local TotalWeight = Weapon01.Weight
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

	if Weapon01.Slot <= 0 or Weapon01.Slot == 5 then
		return false
	end
	
	return Weapon01.Slot == Weapon02.Slot
	
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