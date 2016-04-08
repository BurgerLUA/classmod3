function CM_PlayerSpawn(ply)

	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()

	timer.Simple(0,function()
		
		local TotalWeight = 0
		local LoadoutTable = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_weapons")))
		local EquipmentTable = string.Explode(" ",string.Trim(ply:GetInfo("cm_editor_equipment")))
		local Number = math.random(1,3)
		
		if not ply:IsBot() then
			Number = tonumber(ply:GetInfo("cm_editor_basestats"))
		end
		
		local ClassData = CMClasses[Number]
		
		local HealthToGive = ClassData.Health
		local ArmorToGive = ClassData.Armor
		local ShieldToGive = ClassData.Shield

		if not ply:IsBot() then
		
			ply:StripWeapons()
		
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
				else
					ply:ChatPrint("ERROR: Unknown weapon " .. v )
					table.remove(LoadoutTable,k)
				end
			end
			
			for l,b in pairs(EquipmentTable) do
			
				local Object = CMEquipment[b]
			
				if Object then
					if TotalWeight + Object.Weight <= WeightLimit then
						TotalWeight = TotalWeight + Object.Weight
						
						if Object.Mod == "health" then
							HealthToGive = HealthToGive + Object.ModAmount
						elseif Object.Mod == "armor" then
							ArmorToGive = ArmorToGive + Object.ModAmount
						elseif Object.Mod == "shield" then
							ShieldToGive = ShieldToGive + Object.ModAmount
						end
						
					else
						ply:ChatPrint("ERROR: " .. b .. " exceeds weight limit.")
						table.remove(EquipmentTable,l)
					end
				else
					ply:ChatPrint("ERROR: Unknown equipment " .. b )
					table.remove(EquipmentTable,l)
				end
				
			end
		end
		
		ply:SetHealth(HealthToGive)
		ply:SetMaxHealth(HealthToGive)
		
		--[[
		ply:SetNWFloat("CM_Armor",ArmorToGive)
		ply:SetNWFloat("CM_MaxArmor",ArmorToGive)
		
		ply:SetNWFloat("CM_Shield",ShieldToGive)
		ply:SetNWFloat("CM_MaxShield",ShieldToGive)
		--]]
		
		if not ply:IsBot() then
			if #LoadoutTable > 0 then
				ply:ConCommand("cm_editor_weapons " .. string.Implode(" ",LoadoutTable))
			else
				ply:ConCommand("cm_editor_weapons weapon_bur_pee")
			end
			
			if  #EquipmentTable > 0 then
				ply:ConCommand("cm_editor_equipment " .. string.Implode(" ",EquipmentTable))
			else
				ply:ConCommand("cm_editor_equipment nothing")
			end
		end
		
	end)

end

hook.Add("PlayerSpawn","CM: PlayerSpawn",CM_PlayerSpawn)

function CM_ShowSpare2(ply)

	ply:ConCommand("cm_menu")

end

hook.Add("ShowSpare2","CM: ShowSpare2 Override",CM_ShowSpare2)


function CM_ScalePlayerDamage(ply,hitgroup,dmginfo)
	--[[
	local Damage = dmginfo:GetDamage()

	local Shield = ply:GetNWFloat("CM_Shield",0)
	local Armor = ply:GetNWFloat("CM_Armor",0)
	
	local MaxShield = ply:GetNWFloat("CM_MaxShield",0)
	local MaxArmor = ply:GetNWFloat("CM_MaxArmor",0)
	
	if hitgroup == HITGROUP_HEAD then
		Damage = Damage*2
	end
	
	if MaxShield > 0 then

		if Shield > 0 and Damage > 0 then

			if Damage >= Shield then
				dmginfo:SubtractDamage(Shield)
				Damage = math.Clamp(Damage - Shield,0,99999)
				ply:SetNWFloat("CM_Shield",0)
			else
				ply:SetNWFloat("CM_Shield", math.Clamp(Shield - Damage,0,MaxShield))
				dmginfo:ScaleDamage(0)
				Damage = 0
			end

		end
		
		ply.CM_NextShieldRegen = CurTime() + 10
		
	end	
	
	if MaxArmor > 0 then
	
		if Armor > 0 and Damage > 0 then
			
			if hitgroup == HITGROUP_HEAD then
				dmginfo:ScaleDamage(0.75)
				Damage = Damage*0.75
			else
				dmginfo:ScaleDamage(0.5)
				Damage = Damage*0.5
			end

			ply:SetNWFloat("CM_Armor",math.Clamp(Armor - Damage*0.5,0,MaxArmor))

		end
		
	end
	--]]
end

hook.Add("ScalePlayerDamage","CM: ScalePlayerDamage",CM_ScalePlayerDamage)

local NextThink = 0

function CM_Think()

	if NextThink <= CurTime() then

		for k,ply in pairs(player.GetAll()) do
		
			if not ply:IsBot() and ply:Alive() then
			
				local Shield = ply:GetNWFloat("CM_Shield",0)
				local MaxShield = ply:GetNWFloat("CM_MaxShield",0)
				
				if Shield < MaxShield  and MaxShield > 0 then
					if ply.CM_NextShieldRegen <= CurTime() then
						ply:SetNWFloat("CM_Shield",math.Clamp(Shield + 1,0,MaxShield))
					end
				end

			end
		
		end
		
		NextThink = CurTime() + 0.1
		
	end


end

hook.Add("Think","CM: Think",CM_Think)


local ForbiddenWeapons = {
	"weapon_cs_he",
	"weapon_cs_flash",
	"weapon_cs_smoke",
	"weapon_cs_rpg",
	"weapon_smod_drank",
	"weapon_cs_c4",
	"weapon_ex_gas",
	"weapon_smod_katana",
}

function CM_PreventWeaponExploits(ply,weapon,swep)

	if #player.GetAll() > 1 then
		if table.HasValue(ForbiddenWeapons,weapon) then
		
			ply:ChatPrint(weapon .. " cannot be spawned due to the abusive nature of spawning this every time you need it.")
		
			return false
		end
	end

	return true
end

hook.Add("PlayerGiveSWEP","CM_PreventWeaponExploits",CM_PreventWeaponExploits)
