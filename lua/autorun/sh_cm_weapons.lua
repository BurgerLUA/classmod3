CreateConVar( "sv_class_weightlimit", "100", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Maximum Weight Limit" )
CreateConVar( "sv_class_rankings", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Enable Rankings" )

-- Class Mod Weapon Data
CMWeapons = {}

CMWeapons["weapon_cs_ak47"] = { 
	Weight = 7,
	Slot = 4,
	Rank = 1,
}

CMWeapons["weapon_cs_aug"] =	{ 
	Weight = 7,
	Slot = 4,
	Rank = 2,
}

CMWeapons["weapon_cs_awp"] =	{ 
	Weight = 9,
	Slot = 4,
	Rank = 3,
}
	
CMWeapons["weapon_cs_deserteagle"] = { 
	Weight = 3,
	Slot = 2,
	Rank = 3,
	}
CMWeapons["weapon_cs_dualbertta"] = { 
	Weight = 4,
	Slot = 2,
	Rank = 3,
	}
CMWeapons["weapon_cs_famas"] = { 
	Weight = 6,
	Slot = 4,
	Rank = 1,
	}
CMWeapons["weapon_cs_fiveseven"] = { 
	Weight = 2,
	Slot = 2,
	Rank = 1,
	}
	
CMWeapons["weapon_cs_g3"] = { 
	Weight = 8,
	Slot = 4,
	Rank = 3,
	}
	
CMWeapons["weapon_cs_galil"] = { 
	Weight = 6,
	Slot = 4,
	Rank = 2,
	}
	
CMWeapons["weapon_cs_glock"] = { 
	Weight = 1,
	Slot = 2,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_he"] = { 
	Weight = 1,
	Slot = 5,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_flash"] = { 
	Weight = 1.5,
	Slot = 5,
	Rank = 1,
	}
	
CMWeapons["weapon_cs_smoke"] = { 
	Weight = 2,
	Slot = 5,
	Rank = 10,
	}
	
CMWeapons["weapon_cs_knife"] = { 
	Weight = 1,
	Slot = 1,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_m3"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 1,
	}
	
CMWeapons["weapon_cs_m4"] = { 
	Weight = 6,
	Slot = 4,
	Rank = 0,
	}

CMWeapons["weapon_cs_mac10"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_mp5"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 1,
	}
	
CMWeapons["weapon_cs_p90"] = { 
	Weight = 5,
	Slot = 3,
	Rank = 5,
	}
	
CMWeapons["weapon_cs_p228"] = { 
	Weight = 2.5,
	Slot = 2,
	Rank = 1,
	}

CMWeapons["weapon_cs_para"] = { 
	Weight = 9,
	Slot = 4,
	Rank = 5,
	}

CMWeapons["weapon_cs_scout"] = { 
	Weight = 5,
	Slot = 4,
	Rank = 3,
	}

CMWeapons["weapon_cs_sig550"] = { 
	Weight = 8,
	Slot = 4,
	Rank = 5,
	}

CMWeapons["weapon_cs_sig552"] = { 
	Weight = 7,
	Slot = 4,
	Rank = 3,
	}

CMWeapons["weapon_cs_tmp"] =	{ 
	Weight = 4,
	Slot = 3,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_ump"] =	{ 
	Weight = 5,
	Slot = 3,
	Rank = 5,
	}
	
CMWeapons["weapon_cs_usp"] =	{ 
	Weight = 1,
	Slot = 2,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_xm1014"] = { 
	Weight = 5,
	Slot = 3,
	Rank = 5,
}

-- Burger
	
CMWeapons["weapon_bur_pee"] = { 
	Weight = 0,
	Slot = 0,
	Rank = 1,
	}	
	
CMWeapons["weapon_bur_c4"] = { 
	Weight = 3,
	Slot = 5,
	Rank = 5,
}	

CMWeapons["weapon_bur_gl"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 5,
}

CMWeapons["weapon_bur_tesla"] = { 
	Weight = 3,
	Slot = 5,
	Rank = 5,
}

CMWeapons["weapon_bur_naughty"] = { 
	Weight = 8,
	Slot = 4,
	Rank = 10,
}

CMWeapons["weapon_bur_medkit"] = { 
	Weight = 3,
	Slot = 0,
	Rank = 0,
}

-- HL2

CMWeapons["weapon_cs_357"] = { 
	Weight = 4,
	Slot = 2,
	Rank = 3,
	}
	
CMWeapons["weapon_cs_ar2"] = { 
	Weight = 7,
	Slot = 4,
	Rank = 5,
	}	
	
CMWeapons["weapon_cs_crossbow"] = { 
	Weight = 8,
	Slot = 4,
	Rank = 5,
	}	
	
CMWeapons["weapon_cs_crowbar"] = { 
	Weight = 2,
	Slot = 1,
	Rank = 1,
	}

CMWeapons["weapon_cs_pistol"] = { 
	Weight = 4,
	Slot = 2,
	Rank = 1,
	}	
	
CMWeapons["weapon_cs_pistolx2"] = { 
	Weight = 8,
	Slot = 2,
	Rank = 5,
	}	
	
CMWeapons["weapon_cs_rpg"] = { 
	Weight = 10,
	Slot = 4,
	Rank = 10,
	}
	
CMWeapons["weapon_cs_smg"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 3,
	}
	
CMWeapons["weapon_cs_spas"] = { 
	Weight = 6,
	Slot = 3,
	Rank = 2,
	}	

-- Extras

CMWeapons["weapon_ex_combinesniper"] = { 
	Weight = 10,
	Slot = 4,
	Rank = 10,
}

CMWeapons["weapon_ex_double"] = { 
	Weight = 9,
	Slot = 4,
	Rank = 5,
}

CMWeapons["weapon_ex_gas"] = { 
	Weight = 3,
	Slot = 5,
	Rank = 10,
}

CMWeapons["weapon_ex_gasgun"] = { 
	Weight = 6,
	Slot = 3,
	Rank = 10,
}

CMWeapons["weapon_ex_minigun"] = { 
	Weight = 20,
	Slot = 4,
	Rank = 10,
}

CMWeapons["weapon_ex_mosin"] = { 
	Weight = 6,
	Slot = 4,
	Rank = 4,
}

CMWeapons["weapon_ex_nes"] = { 
	Weight = 5,
	Slot = 2,
	Rank = 10,
}

CMWeapons["weapon_ex_p90minigun"] = { 
	Weight = 8,
	Slot = 3,
	Rank = 10,
}

CMWeapons["weapon_ex_rebelsniper"] = { 
	Weight = 12,
	Slot = 4,
	Rank = 10,
}

CMWeapons["weapon_ex_stunstick"] = { 
	Weight = 3,
	Slot = 1,
	Rank = 5,
}

CMWeapons["weapon_halo_plasmarifle"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 10,
}

CMWeapons["weapon_halo_sword"] = { 
	Weight = 10,
	Slot = 1,
	Rank = 10,
}


--SMOD

CMWeapons["weapon_smod_alyxgun"] = { 
	Weight = 6,
	Slot = 2,
	Rank = 3,
}

CMWeapons["weapon_smod_anna"] = { 
	Weight = 5,
	Slot = 3,
	Rank = 4,
}

CMWeapons["weapon_smod_beangun"] = { 
	Weight = 5,
	Slot = 3,
	Rank = 10,
}

CMWeapons["weapon_smod_combinecannon"] = { 
	Weight = 9,
	Slot = 4,
	Rank = 8,
}

CMWeapons["weapon_smod_cz52"] = { 
	Weight = 2.5,
	Slot = 2,
	Rank = 3,
}

CMWeapons["weapon_smod_dbarrel"] = { 
	Weight = 3,
	Slot = 3,
	Rank = 1,
}

CMWeapons["weapon_smod_drank"] = { 
	Weight = 2,
	Slot = 0,
	Rank = 0,
}

CMWeapons["weapon_smod_dualcolts"] = { 
	Weight = 8,
	Slot = 2,
	Rank = 5,
}

CMWeapons["weapon_smod_fists"] = { 
	Weight = 0,
	Slot = 0,
	Rank = 0,
}

CMWeapons["weapon_smod_flamethrower"] = { 
	Weight = 15,
	Slot = 4,
	Rank = 10,
}

CMWeapons["weapon_smod_gl"] = { 
	Weight = 12,
	Slot = 4,
	Rank = 10,
}

CMWeapons["weapon_smod_greasegun"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 2,
}

CMWeapons["weapon_smod_kar98"] = { 
	Weight = 8,
	Slot = 4,
	Rank = 2,
}

CMWeapons["weapon_smod_katana"] = { 
	Weight = 8,
	Slot = 1,
	Rank = 5,
}

CMWeapons["weapon_smod_m1grande"] = { 
	Weight = 7,
	Slot = 4,
	Rank = 3,
}

CMWeapons["weapon_smod_m4a1"] = { 
	Weight = 7,
	Slot = 4,
	Rank = 0,
}

CMWeapons["weapon_smod_m60"] = { 
	Weight = 10,
	Slot = 4,
	Rank = 5,
}

CMWeapons["weapon_smod_maggrenade"] = { 
	Weight = 5,
	Slot = 5,
	Rank = 10,
}

CMWeapons["weapon_smod_mp40"] = { 
	Weight = 4,
	Slot = 3,
	Rank = 1,
}

CMWeapons["weapon_smod_oicw"] = { 
	Weight = 8,
	Slot = 4,
	Rank = 5,
}

CMWeapons["weapon_smod_soybeans"] = { 
	Weight = 3,
	Slot = 5,
	Rank = 10,
}

CMWeapons["weapon_smod_svd"] = { 
	Weight = 9,
	Slot = 4,
	Rank = 5,
}

CMWeapons["weapon_smod_tripmine"] = { 
	Weight = 4,
	Slot = 5,
	Rank = 10,
}

print("LOADED WEAPON LOADOUT DATA")

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
