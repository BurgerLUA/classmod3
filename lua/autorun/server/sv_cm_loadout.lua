function CM_PlayerSpawn(ply)

	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()

	timer.Simple(0,function()
		
		local TotalWeight = 0
		local LoadoutTable = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_weapons")))

		if not ply:IsBot() then
			for k,v in pairs(LoadoutTable) do
			
				local SWEP = CMWeapons[v]

				if SWEP then
					if TotalWeight + SWEP.Weight <= WeightLimit then
						TotalWeight = TotalWeight + SWEP.Weight
						
						local Weapon = ply:Give(v)

					else
						ply:ChatPrint("ERROR: " .. v .. " exceeds weight limit.")
						table.remove(LoadoutTable,k)
					end
				elseif v ~= "none" then
					ply:ChatPrint("ERROR: Unknown weapon " .. v )
					table.remove(LoadoutTable,k)
				end
				
			end
		end
		
		if not ply:IsBot() then
			if #LoadoutTable > 0 then
				if #LoadoutTable >= 2 then
					table.RemoveByValue(LoadoutTable,"none")
				end
				ply:ConCommand("cm_editor_weapons " .. string.Implode(" ",LoadoutTable))
			else
				ply:ConCommand("cm_editor_weapons none")
			end
		end
		
	end)

end

hook.Add("PlayerSpawn","CM: PlayerSpawn",CM_PlayerSpawn)

function CM_ShowSpare2(ply)

	ply:ConCommand("cm_menu")

end

hook.Add("ShowSpare2","CM: ShowSpare2 Override",CM_ShowSpare2)

local ForbiddenWeapons = {
	"weapon_cs_he",
	"weapon_cs_flash",
	"weapon_cs_smoke",
	"weapon_cs_rpg",
	"weapon_smod_drank",
	"weapon_cs_c4",
	"weapon_ex_gas",
	"weapon_smod_katana",
	"weapon_smod_tripmine",
	"weapon_smod_maggrenade"
}

function CM_PreventWeaponExploits(ply,weapon,swep)

	if #player.GetHumans() > 1 then
		if table.HasValue(ForbiddenWeapons,weapon) then
		
			ply:ChatPrint(weapon .. " cannot be spawned due to the abusive nature of spawning this every time you need it.")
		
			return false
		end
	end

	return true
end

hook.Add("PlayerGiveSWEP","CM_PreventWeaponExploits",CM_PreventWeaponExploits)
