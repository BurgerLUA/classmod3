CreateConVar( "sv_class_weightlimit", "100", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Maximum Weight Limit" )
CreateConVar( "sv_class_rankings", "0", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED, "Enable Rankings" )

-- Class Mod Weapon Data
CMWeapons = {}

CMWeapons["weapon_cs_ak47"] = { -- T2 Rifle
	Weight = 7,
	Slot = 4,
	Rank = 5,
}

CMWeapons["weapon_cs_aug"] =	{ -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = 22,
}

CMWeapons["weapon_cs_awp"] =	{  -- T3 Sniper
	Weight = 9,
	Slot = 4,
	Rank = 26,
}
	
CMWeapons["weapon_cs_deserteagle"] = { -- T3 Pistol
	Weight = 3,
	Slot = 2,
	Rank = 14,
}
	
CMWeapons["weapon_cs_dualbertta"] = { -- T3 Pistol
	Weight = 4,
	Slot = 2,
	Rank = 14,
}

CMWeapons["weapon_cs_famas"] = { -- T2 Rifle
	Weight = 6,
	Slot = 4,
	Rank = 5,
}
	
CMWeapons["weapon_cs_fiveseven"] = { -- T2 Pistol
	Weight = 2,
	Slot = 2,
	Rank = 1,
}
	
CMWeapons["weapon_cs_g3"] = { -- T3 Sniper
	Weight = 8,
	Slot = 4,
	Rank = 26,
}
	
CMWeapons["weapon_cs_galil"] = { -- T1 Rifle
	Weight = 6,
	Slot = 4,
	Rank = 0,
}
	
CMWeapons["weapon_cs_glock"] = { -- T1 Pistol
	Weight = 1,
	Slot = 2,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_he"] = { -- T1 Nade
	Weight = 1,
	Slot = 5,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_flash"] = { -- T2 Nade
	Weight = 1.5,
	Slot = 5,
	Rank = 11,
	}
	
CMWeapons["weapon_cs_smoke"] = { -- T3 Nade
	Weight = 2,
	Slot = 5,
	Rank = 30,
	}
	
CMWeapons["weapon_cs_knife"] = { -- T1 Melee
	Weight = 1,
	Slot = 1,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_m3"] = { -- T1 Shotgun
	Weight = 4,
	Slot = 3,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_m4"] = { -- T1 Rifle
	Weight = 6,
	Slot = 4,
	Rank = 0,
	}

CMWeapons["weapon_cs_mac10"] = { -- T1 SMG
	Weight = 4,
	Slot = 3,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_mp5"] = { -- T2 SMG
	Weight = 4,
	Slot = 3,
	Rank = 3,
	}
	
CMWeapons["weapon_cs_p90"] = { -- T3 SMG
	Weight = 5,
	Slot = 3,
	Rank = 18,
	}
	
CMWeapons["weapon_cs_p228"] = { -- T2 Pistol
	Weight = 2.5,
	Slot = 2,
	Rank = 1,
	}

CMWeapons["weapon_cs_para"] = { -- T3 Rifle
	Weight = 9,
	Slot = 4,
	Rank = 22,
	}

CMWeapons["weapon_cs_scout"] = { -- T1 Sniper
	Weight = 5,
	Slot = 4,
	Rank = 0,
	}

CMWeapons["weapon_cs_sig550"] = { -- T3 Sniper
	Weight = 8,
	Slot = 4,
	Rank = 26,
	}

CMWeapons["weapon_cs_sig552"] = { -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = 22,
	}

CMWeapons["weapon_cs_tmp"] =	{ -- T1 SMG
	Weight = 4,
	Slot = 3,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_ump"] =	{ -- T3 SMG
	Weight = 5,
	Slot = 3,
	Rank = 18,
	}
	
CMWeapons["weapon_cs_usp"] =	{ -- T1 Pistol
	Weight = 1,
	Slot = 2,
	Rank = 0,
	}
	
CMWeapons["weapon_cs_xm1014"] = { -- T3 Shotgun
	Weight = 5,
	Slot = 3,
	Rank = 18,
}

-- Burger
	
CMWeapons["weapon_bur_pee"] = { -- T1 Misc
	Weight = 0,
	Slot = 0,
	Rank = 1,
	}	
	
CMWeapons["weapon_bur_c4"] = { -- T3 Nade
	Weight = 3,
	Slot = 5,
	Rank = 30,
}	

CMWeapons["weapon_bur_gl"] = { -- T3 Nade
	Weight = 4,
	Slot = 3,
	Rank = 30,
}

CMWeapons["weapon_bur_tesla"] = { -- T4 Nade
	Weight = 3,
	Slot = 5,
	Rank = 55,
}

CMWeapons["weapon_bur_naughty"] = { -- T4 Misc
	Weight = 8,
	Slot = 4,
	Rank = 55,
}

CMWeapons["weapon_bur_medkit"] = { -- T1 Healing
	Weight = 3,
	Slot = 0,
	Rank = 0,
}

-- HL2

CMWeapons["weapon_cs_357"] = { -- T4 Pistol
	Weight = 4,
	Slot = 2,
	Rank = 35,
	}
	
CMWeapons["weapon_cs_ar2"] = { -- T4 Rifle
	Weight = 7,
	Slot = 4,
	Rank = 45,
	}	
	
CMWeapons["weapon_cs_crossbow"] = { -- T4 Misc
	Weight = 8,
	Slot = 4,
	Rank = 55,
	}	
	
CMWeapons["weapon_cs_crowbar"] = { -- T2 Melee
	Weight = 2,
	Slot = 1,
	Rank = 1,
	}

CMWeapons["weapon_cs_pistol"] = { -- T3 Pistol
	Weight = 4,
	Slot = 2,
	Rank = 14,
	}	
	
CMWeapons["weapon_cs_pistolx2"] = { -- T4 Pistol
	Weight = 8,
	Slot = 2,
	Rank = 35,
	}	
	
CMWeapons["weapon_cs_rpg"] = { -- T4 Misc
	Weight = 10,
	Slot = 4,
	Rank = 55,
	}
	
CMWeapons["weapon_cs_smg"] = { -- T3 SMG
	Weight = 4,
	Slot = 3,
	Rank = 18,
	}
	
CMWeapons["weapon_cs_spas"] = { -- T3 Shotgun
	Weight = 6,
	Slot = 3,
	Rank = 18,
	}	

-- Extras

CMWeapons["weapon_ex_combinesniper"] = { -- T4 Sniper
	Weight = 10,
	Slot = 4,
	Rank = 50,
}

CMWeapons["weapon_ex_double"] = { -- T4 Sniper
	Weight = 9,
	Slot = 4,
	Rank = 50,
}

CMWeapons["weapon_ex_gas"] = { -- T3 Nade
	Weight = 3,
	Slot = 5,
	Rank = 30,
}

CMWeapons["weapon_ex_gasgun"] = { -- T3 Misc
	Weight = 6,
	Slot = 3,
	Rank = 30,
}

CMWeapons["weapon_ex_minigun"] = { -- T4 Misc
	Weight = 20,
	Slot = 4,
	Rank = 55,
}

CMWeapons["weapon_ex_mosin"] = { -- T2 Sniper
	Weight = 6,
	Slot = 4,
	Rank = 8,
}

CMWeapons["weapon_ex_nes"] = { -- T5 Pistol
	Weight = 5,
	Slot = 2,
	Rank = 60,
}

CMWeapons["weapon_ex_p90minigun"] = { -- T4 SMG
	Weight = 8,
	Slot = 3,
	Rank = 40,
}

CMWeapons["weapon_ex_rebelsniper"] = { -- T4 Sniper
	Weight = 12,
	Slot = 4,
	Rank = 50,
}

CMWeapons["weapon_ex_stunstick"] = { -- T3 Melee
	Weight = 3,
	Slot = 1,
	Rank = 14,
}

CMWeapons["weapon_halo_plasmarifle"] = { -- T4 SMG
	Weight = 4,
	Slot = 3,
	Rank = 40,
}

CMWeapons["weapon_halo_sword"] = { -- T4 Melee
	Weight = 10,
	Slot = 1,
	Rank = 35,
}

--SMOD

CMWeapons["weapon_smod_alyxgun"] = { -- T4 Pistol
	Weight = 6,
	Slot = 2,
	Rank = 35,
}

CMWeapons["weapon_smod_anna"] = { -- T3 SMG
	Weight = 5,
	Slot = 3,
	Rank = 22,
}

CMWeapons["weapon_smod_beangun"] = { -- T4 Misc
	Weight = 5,
	Slot = 3,
	Rank = 55,
}

CMWeapons["weapon_smod_combinecannon"] = { -- T4 Rifle
	Weight = 9,
	Slot = 4,
	Rank = 45,
}

CMWeapons["weapon_smod_cz52"] = { -- T3 Pistol
	Weight = 2.5,
	Slot = 2,
	Rank = 14,
}

CMWeapons["weapon_smod_dbarrel"] = { -- T3 Shotgun
	Weight = 3,
	Slot = 3,
	Rank = 18,
}

CMWeapons["weapon_smod_drank"] = { -- T1 Misc
	Weight = 2,
	Slot = 0,
	Rank = 0,
}

CMWeapons["weapon_smod_dualcolts"] = { -- T5 Special
	Weight = 8,
	Slot = 2,
	Rank = 65,
}

CMWeapons["weapon_smod_fists"] = { -- T1 Melee
	Weight = 0,
	Slot = 1,
	Rank = 0,
}

CMWeapons["weapon_smod_flamethrower"] = { -- T4 Misc
	Weight = 15,
	Slot = 4,
	Rank = 55,
}

CMWeapons["weapon_smod_gl"] = { -- T4 Misc
	Weight = 12,
	Slot = 4,
	Rank = 55,
}

CMWeapons["weapon_smod_greasegun"] = { -- T2 SMG
	Weight = 4,
	Slot = 3,
	Rank = 3,
}

CMWeapons["weapon_smod_kar98"] = { -- T3 Sniper
	Weight = 8,
	Slot = 4,
	Rank = 26,
}

CMWeapons["weapon_smod_katana"] = { -- T4 Melee
	Weight = 8,
	Slot = 1,
	Rank = 35,
}

CMWeapons["weapon_smod_m1grande"] = { -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = 22,
}

CMWeapons["weapon_smod_m4a1"] = { -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = 22,
}

CMWeapons["weapon_smod_m60"] = { -- T4 Rifle
	Weight = 10,
	Slot = 4,
	Rank = 45,
}

CMWeapons["weapon_smod_maggrenade"] = { -- T4 Equipment
	Weight = 5,
	Slot = 5,
	Rank = 55,
}

CMWeapons["weapon_smod_mp40"] = { -- T2 SMG
	Weight = 4,
	Slot = 3,
	Rank = 3,
}

CMWeapons["weapon_smod_oicw"] = { -- T4 Rifle
	Weight = 8,
	Slot = 4,
	Rank = 45,
}

CMWeapons["weapon_smod_soybeans"] = { -- T4 Equipment
	Weight = 3,
	Slot = 5,
	Rank = 55,
}

CMWeapons["weapon_smod_svd"] = { -- T3 Sniper
	Weight = 9,
	Slot = 4,
	Rank = 26,
}

CMWeapons["weapon_smod_tripmine"] = { -- T4 Equipment
	Weight = 4,
	Slot = 5,
	Rank = 55,
}

-- GDCW

CMWeapons["weapon_snip_as50"] = { -- T4 Sniper
	Weight = 15,
	Slot = 4,
	Rank = 50,
}

CMWeapons["weapon_snip_awp"] = { -- T3 Sniper
	Weight = 9,
	Slot = 4,
	Rank = 26,
}

CMWeapons["weapon_snip_fal"] = { -- T3 Sniper
	Weight = 8,
	Slot = 4,
	Rank = 26,
}

CMWeapons["weapon_snip_m24"] = { -- T3 Sniper
	Weight = 8,
	Slot = 4,
	Rank = 26,
}

CMWeapons["weapon_snip_m76"] = { -- T3 Sniper
	Weight = 10,
	Slot = 4,
	Rank = 26,
}

CMWeapons["weapon_snip_m82"] = { -- T4 Sniper
	Weight = 15,
	Slot = 4,
	Rank = 50,
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
