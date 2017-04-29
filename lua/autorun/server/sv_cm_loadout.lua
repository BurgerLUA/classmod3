function CM_TakeMoney(ply,money)
	MONEYMOD_AddMoney(ply,-money)
end


function CM_Loadout( ply )

	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()
	local TotalWeight = 0
	local LoadoutTable = CM_GetPlayerWeapons(ply)

	if not ply:IsBot() then
	
		ply:StripAmmo()
	
		--ply:Give("weapon_physgun")
		--ply:Give("gmod_tool")
	
		local WeaponsToSpawnWith = {}
		
		
		local HighestSlot = 0
	
		for k,v in pairs(LoadoutTable) do
		
			print("BEFORE",v)
		
			local SWEP = CMWeapons[v]

			if SWEP then
				if CM_CanSpawnWith(ply,v,true,WeaponsToSpawnWith) then

					table.Add(WeaponsToSpawnWith,{v})
					
					if SWEP.Cost then
						CM_TakeMoney(ply,SWEP.Cost)
					end
					
					
					local Slot = SWEP.Slot
					
					if HighestSlot < Slot and Slot ~= 5 and Slot ~= 1 then
						HighestSlot = Slot
					end
				end			
			elseif v ~= "none" then
				ply:ChatPrint("ERROR: Unknown weapon " .. v )
			end
			
		end

		for l,b in pairs(WeaponsToSpawnWith) do
			print("AFTER",b)
			ply:Give(b)
			if CMWeapons[b].Slot == HighestSlot then
				ply:SelectWeapon(b)		
			end
		end

		if #WeaponsToSpawnWith > 0 then
			if #WeaponsToSpawnWith > 1 then
				table.RemoveByValue(WeaponsToSpawnWith,"none")
			end
			ply:ConCommand("cm_editor_weapons " .. string.Implode(" ",WeaponsToSpawnWith))
		else
			ply:ConCommand("cm_editor_weapons none")
		end
		
		return true
		
	end

end

hook.Add("PlayerLoadout","CM_Loadout",CM_Loadout)

function CM_ShowSpare2(ply)

	ply:ConCommand("cm_menu")

end

hook.Add("ShowSpare2","CM: ShowSpare2 Override",CM_ShowSpare2)

--[[
local ForbiddenWeapons = {
	"weapon_burger_cs_he",
	"weapon_burger_cs_flash",
	"weapon_burger_cs_smoke",
	"weapon_burger_cs_rpg",
	"weapon_smod_drank",
	"weapon_burger_cs_c4",
	"weapon_ex_gas",
	"weapon_smod_katana",
	"weapon_smod_tripmine",
	"weapon_smod_maggrenade"
}
--]]

function CM_PreventWeaponExploits(ply,weapon,swep)

	--[[
	if #player.GetHumans() > 1 then
		return false
	end
	--]]

	return true

end

hook.Add("PlayerGiveSWEP","CM_PreventWeaponExploits",CM_PreventWeaponExploits)


util.AddNetworkString("CM_PlaceSpawn")



net.Receive("CM_PlaceSpawn", function(len,ply)

	--[[
	if ply:Alive() then
		local SpawnPoints = ents.FindByClass("ent_bur_spawnpoint")
		
		local ShouldSpawn = true
		local OldSpawnpoint = nil
		
		for k,v in pairs(SpawnPoints) do
			if v.Owner == ply then
				ShouldSpawn = false
				OldSpawnpoint = v
			end
		end
		
		if ShouldSpawn then
			local Ent = ents.Create("ent_bur_spawnpoint")
			Ent:SetPos(ply:GetPos())
			Ent:SetAngles(ply:GetAngles())
			Ent:Spawn()
			Ent:Activate()
			Ent:SetOwner(ply)
		else
			ply:ChatPrint("You already have a spawnpoint! Deleting old one in 3 seconds...")
			SafeRemoveEntityDelayed(OldSpawnpoint,3)
		end
	else
		ply:ChatPrint("But you're dead tho")
	end
	--]]

end)
