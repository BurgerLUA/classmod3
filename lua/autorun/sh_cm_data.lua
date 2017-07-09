local T00 = 0
local TMelee = 5

local T01Sidearm = 1
local T01Secondary = 3
local T01Primary = 5
local T01Special = 8

local T02Sidearm = 11
local T02Secondary = 14
local T02Primary = 18
local T02Special = 22

local T03Sidearm = 26
local T03Secondary = 30
local T03Primary = 35
local T03Special = 40

local T04Sidearm = 45
local T04Secondary = 50
local T04Primary = 55
local T04Special = 56

-- Special Equipment

CMWeapons["armor20"] = {
	Name = "20 Armor",
	Equipment = true,
	Weight = 5,
	Slot = 100,
	Rank = T00,
	func = function(ply) 
		ply:SetArmor(ply:Armor() + 20)
	end,
}

CMWeapons["armor50"] = {
	Name = "50 Armor",
	Equipment = true,
	Weight = 12.5,
	Slot = 100,
	Rank = T01Special,
	func = function(ply) 
		ply:SetArmor(ply:Armor() + 50)
	end,
}

CMWeapons["armor100"] = {
	Name = "100 Armor",
	Equipment = true,
	Weight = 25,
	Slot = 100,
	Rank = T02Special,
	func = function(ply) 
		ply:SetArmor(ply:Armor() + 100)
	end,
}

--[[
CMWeapons["weapon_smod_drank"] = { -- T1 Misc
	Weight = 2,
	Slot = 100,
	Rank = T00,
}
--]]

-- Melee

CMWeapons["weapon_hl2_fists"] = { -- T1 Melee
	Weight = 0,
	Slot = 1,
	Rank = 0,
	Cost = 0,
}

CMWeapons["weapon_burger_cs_knife"] = { -- T1 Melee
	Weight = 1,
	Slot = 1,
	Rank = TMelee,
	Cost = 0,
}

CMWeapons["weapon_hl2_crowbar"] = { -- T2 Melee
	Weight = 2,
	Slot = 1,
	Rank = TMelee,
	Cost = 50,
	}

CMWeapons["weapon_hl2_stunstick"] = { -- T3 Melee
	Weight = 3,
	Slot = 1,
	Rank = TMelee,
	Cost = 500,
}


CMWeapons["weapon_smod_katana"] = { -- T3 Melee
	Weight = 25,
	Slot = 1,
	Rank = TMelee,
}


CMWeapons["weapon_halo_sword"] = { -- T2 Equipment
	Weight = 6,
	Slot = 1,
	Rank = TMelee,
}


CMWeapons["weapon_burfof_axe"] = { -- T2 Equipment
	Weight = 4,
	Slot = 1,
	Rank = TMelee,
}

CMWeapons["weapon_burfof_knife"] = { -- T2 Equipment
	Weight = 1.5,
	Slot = 1,
	Rank = TMelee,
}

CMWeapons["weapon_burfof_machete"] = { -- T2 Equipment
	Weight = 3,
	Slot = 1,
	Rank = TMelee,
}



-- T0

CMWeapons["weapon_smod_dbarrel"] = { -- T3 Shotgun
	Weight = 4,
	Slot = 3,
	Rank = T00,
}

CMWeapons["weapon_burger_cs_he"] = { -- T1 Nade
	Weight = 1,
	Slot = 5,
	Rank = T00,
	Cost = 200,
}

CMWeapons["weapon_burfof_deringer"] = { -- T2 Equipment
	Weight = 0,
	Slot = 2,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_hl2_pistol"] = { -- T0 Sidearm
	Weight = 2,
	Slot = 2,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_halo_plasmapistol"] = { -- T0 Sidearm
	Weight = 3,
	Slot = 2,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_hl2_smg"] = { -- T0 Secondary
	Weight = 4,
	Slot = 3,
	Rank = T00,
	Cost = 0,
}
	
CMWeapons["weapon_hl2_spas"] = { -- T0 Secondary
	Weight = 5,
	Slot = 3,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_burger_cs_m3"] = { -- T1 Shotgun
	Weight = 4,
	Slot = 3,
	Rank = T00,
	Cost = 1000,
}

CMWeapons["weapon_burger_cs_scout"] = { -- T0 Primary
	Weight = 6,
	Slot = 4,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_halo_sniper"] = { -- T0 Primary
	Weight = 8,
	Slot = 4,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_burger_cs_glock"] = { -- T1 Pistol
	Weight = 1,
	Slot = 2,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_burger_cs_usp"] =	{ -- T1 Pistol
	Weight = 1,
	Slot = 2,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_halo_magnum"] = { -- T2 Equipment
	Weight = 4,
	Slot = 2,
	Rank = T00,
}

CMWeapons["weapon_burger_cs_famas"] = { -- T2 Rifle
	Weight = 7,
	Slot = 4,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_burger_cs_galil"] = { -- T1 Rifle
	Weight = 6,
	Slot = 4,
	Rank = T00,
	Cost = 0,
}

CMWeapons["weapon_burger_cs_mac10"] = { -- T1 SMG
	Weight = 4,
	Slot = 3,
	Rank = T00,
	Cost = 1000,
}


CMWeapons["weapon_burger_cs_tmp"] =	{ -- T1 SMG
	Weight = 4,
	Slot = 3,
	Rank = T00,
	Cost = 1500,
	}


-- T01


CMWeapons["weapon_burfof_bow"] = { -- T2 Equipment
	Weight = 2,
	Slot = 3,
	Rank = T01Special,
}

CMWeapons["weapon_smod_mp5k"] = { -- T3 SMG
	Weight = 5,
	Slot = 3,
	Rank = T01Special,
}

CMWeapons["weapon_burger_cs_xm1014"] = { -- T3 Shotgun
	Weight = 5,
	Slot = 3,
	Rank = T01Secondary,
	Cost = 2000,
}

CMWeapons["weapon_burger_cs_flash"] = { -- T2 Nade
	Weight = 2,
	Slot = 5,
	Rank = T01Special,
	Cost = 300,
}


CMWeapons["weapon_smod_cz52"] = { -- T2 Sidearm
	Weight = 3,
	Slot = 2,
	Rank = T01Sidearm,
	Cost = 300,
}


CMWeapons["weapon_burger_cs_m4"] = { -- T1 Rifle
	Weight = 6,
	Slot = 4,
	Rank = T01Primary,
	Cost = 2000,
}

CMWeapons["weapon_burger_cs_ak47"] = { -- T2 Rifle
	Weight = 7,
	Slot = 4,
	Rank = T01Primary,
	Cost = 3000,
}

CMWeapons["weapon_halo_smg"] = { -- T2 Equipment
	Weight = 5,
	Slot = 3,
	Rank = T01Secondary,
}

CMWeapons["weapon_burger_cs_fiveseven"] = { -- T2 Pistol
	Weight = 2,
	Slot = 2,
	Rank = T01Sidearm,
	Cost = 300,
}

CMWeapons["weapon_burger_cs_p228"] = { -- T2 Pistol
	Weight = 2,
	Slot = 2,
	Rank = T01Sidearm,
	Cost = 300,
}


CMWeapons["weapon_burfof_volcanic"] = { -- T2 Equipment
	Weight = 4.5,
	Slot = 2,
	Rank = T01Sidearm,
}


CMWeapons["weapon_halo_beamrifle"] = { -- T2 Equipment
	Weight = 7.5,
	Slot = 4,
	Rank = T01Primary,
}

CMWeapons["weapon_smod_anna"] = { -- T3 Primary
	Weight = 6,
	Slot = 4,
	Rank = T01Primary,
	Cost = 1000,
}

CMWeapons["weapon_burfof_sharps"] = { -- T2 Equipment
	Weight = 8,
	Slot = 4,
	Rank = T01Special,
}

CMWeapons["weapon_smod_kar98"] = { -- T2 Sniper
	Weight = 9,
	Slot = 4,
	Rank = T01Primary,
}

CMWeapons["weapon_smod_combinecannon"] = { -- T2 Special
	Weight = 12,
	Slot = 4,
	Rank = T01Special,
}

CMWeapons["weapon_halo_beamrifle"] = { -- T2 Equipment
	Weight = 7.5,
	Slot = 4,
	Rank = T01Primary,
	Cost = 1000,
}

CMWeapons["weapon_halo_plasmarifle"] = { -- T2 Equipment
	Weight = 5,
	Slot = 3,
	Rank = T01Primary,
}

CMWeapons["weapon_burger_cs_mp5"] = { -- T2 SMG
	Weight = 5,
	Slot = 3,
	Rank = T01Secondary,
	Cost = 1500,
}

CMWeapons["weapon_burger_cs_ump"] =	{ -- T3 SMG
	Weight = 5,
	Slot = 3,
	Rank = T01Secondary,
	Cost = 2000,
	}

-- T02

CMWeapons["weapon_burfof_sawed_shotgun"] = { -- T2 Equipment
	Weight = 5,
	Slot = 2,
	Rank = T02Sidearm,
}

CMWeapons["weapon_smod_stg"] = { -- T3 SMG
	Weight = 6.5,
	Slot = 4,
	Rank = T02Secondary,
}

CMWeapons["weapon_smod_m4a1"] = { -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_smod_m1grande"] = { -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_burger_cs_smoke"] = { -- T3 Nade
	Weight = 3,
	Slot = 5,
	Rank = T02Primary,
	Cost = 400,
}

CMWeapons["weapon_halo_plasmarifle_red"] = { -- T2 Equipment
	Weight = 6,
	Slot = 3,
	Rank = T02Primary,
}

CMWeapons["weapon_halo_carbine"] = { -- T2 Equipment
	Weight = 7,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_halo_shotgun"] = { -- T2 Equipment
	Weight = 5,
	Slot = 3,
	Rank = T02Secondary,
}

CMWeapons["weapon_burger_cs_awp"] =	{  -- T3 Sniper
	Weight = 9,
	Slot = 4,
	Rank = T02Primary,
	Cost = 4000,
}

CMWeapons["weapon_burger_cs_aug"] =	{ -- T3 Rifle
	Weight = 8,
	Slot = 4,
	Rank = T02Primary,
	Cost = 3000,
}

CMWeapons["weapon_smod_greasegun"] = { -- T3 SMG
	Weight = 5,
	Slot = 3,
	Rank = T02Secondary,
}

CMWeapons["weapon_burfof_maresleg"] = { -- T3 Secondary
	Weight = 4,
	Slot = 3,
	Rank = T02Secondary,
}

CMWeapons["weapon_burfof_peacemaker"] = { -- T2 Equipment
	Weight = 3.5,
	Slot = 2,
	Rank = T02Secondary,
}

CMWeapons["weapon_burfof_henry"] = { -- T2 Equipment
	Weight = 7.5,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_burfof_coachgun"] = { -- T2 Equipment
	Weight = 6,
	Slot = 3,
	Rank = T02Secondary,
}

CMWeapons["weapon_smod_svd"] = { -- T3 Sniper
	Weight = 8,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_burfof_carbine"] = { -- T2 Equipment
	Weight = 7,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_halo_new"] = { -- T2 Equipment
	Weight = 9,
	Slot = 3,
	Rank = T02Secondary,
}

CMWeapons["weapon_burfof_carbine"] = { -- T2 Equipment
	Weight = 7,
	Slot = 4,
	Rank = T02Primary,
}

CMWeapons["weapon_burger_cs_para"] = { -- T3 Rifle
	Weight = 10,
	Slot = 4,
	Rank = T02Secondary,
	Cost = 4000,
}

CMWeapons["weapon_burger_cs_sig552"] = { -- T3 Rifle
	Weight = 8,
	Slot = 4,
	Rank = T02Secondary,
	Cost = 3000,
}

CMWeapons["weapon_burger_cs_deserteagle"] = { -- T3 Pistol
	Weight = 5,
	Slot = 2,
	Rank = T02Sidearm,
	Cost = 800,
}

CMWeapons["weapon_burger_cs_dualbertta"] = { -- T3 Pistol
	Weight = 4,
	Slot = 2,
	Rank = T02Sidearm,
	Cost = 900,
}

CMWeapons["weapon_burger_cs_p90"] = { -- T3 SMG
	Weight = 6,
	Slot = 3,
	Rank = T02Secondary,
	Cost = 2500,
}

CMWeapons["weapon_smod_oicw"] = { -- T3 Rifle
	Weight = 8,
	Slot = 4,
	Rank = T02Special,
}

CMWeapons["weapon_halo_battlerifle"] = { -- T2 Equipment
	Weight = 7,
	Slot = 4,
	Rank = T02Primary,
}

-- T03
CMWeapons["weapon_smod_alyxgun"] = { -- T3 Sidearm
	Weight = 6,
	Slot = 2,
	Rank = T03Sidearm,
	Cost = 500,
}



CMWeapons["weapon_smod_mp40"] = { -- T3 SMG
	Weight = 6,
	Slot = 3,
	Rank = T03Secondary,
}

CMWeapons["weapon_smod_tripmine"] = { -- T2 Equipment
	Weight = 5,
	Slot = 5,
	Rank = T03Special,
}

CMWeapons["weapon_smod_m4a1nade"] = { -- T3 Rifle
	Weight = 9,
	Slot = 4,
	Rank = T03Special,
}

CMWeapons["weapon_burfof_schofield"] = { -- T2 Equipment
	Weight = 5,
	Slot = 2,
	Rank = T03Sidearm,
}


CMWeapons["weapon_smod_m60"] = { -- T3 Rifle
	Weight = 11,
	Slot = 4,
	Rank = T03Special,
}

CMWeapons["weapon_smod_flamethrower"] = { -- T4 Special
	Weight = 10,
	Slot = 4,
	Rank = T03Special,
}

CMWeapons["weapon_smod_gl"] = { -- T4 Misc
	Weight = 12,
	Slot = 4,
	Rank = T03Special,
}


CMWeapons["weapon_burfof_walker"] = { -- T3 Sidearm
	Weight = 6,
	Slot = 2,
	Rank = T03Sidearm,
}

CMWeapons["weapon_burger_cs_g3"] = { -- T3 Sniper
	Weight = 10,
	Slot = 4,
	Rank = T03Primary,
	Cost = 5000,
}

CMWeapons["weapon_burger_cs_sig550"] = { -- T3 Sniper
	Weight = 10,
	Slot = 4,
	Rank = T03Primary,
	Cost = 5000,
}

CMWeapons["weapon_hl2_357"] = { -- T3 Pistol
	Weight = 5,
	Slot = 2,
	Rank = T03Sidearm,
	Cost = 800,
}

CMWeapons["weapon_hl2_ar2"] = { -- T3 Rifle
	Weight = 7,
	Slot = 4,
	Rank = T03Primary,
	Cost = 3000,
}

CMWeapons["weapon_hl2_crossbow"] = { -- T3 Misc
	Weight = 6,
	Slot = 4,
	Rank = T03Special,
	Cost = 1000,
}	

-- T04

CMWeapons["weapon_smod_beangun"] = { -- T3 Misc
	Weight = 11,
	Slot = 4,
	Rank = T04Special,
}

CMWeapons["weapon_smod_dualcolts"] = { -- T4 Sidearm
	Weight = 6,
	Slot = 2,
	Rank = T04Sidearm,
	Cost = 1200,
}