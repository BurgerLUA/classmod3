
local DefaultWeapons = "weapon_cs_m4 weapon_cs_usp weapon_cs_knife weapon_cs_he"
local MaxWeight = 20



CreateClientConVar("cm_editor_basestats","2",true,true)
CreateClientConVar("cm_editor_weapons",DefaultWeapons,true,true)


local CurrentLoadout = string.Explode(" ",GetConVar("cm_editor_weapons"):GetString())
local TotalWeight = 0

function CM_ShowClassMenu()

	local SpaceOffset = 10

	local BaseFrame = vgui.Create("DFrame")
	BaseFrame:SetSize(800,600)
	BaseFrame:Center()
	BaseFrame:SetVisible( true )
	BaseFrame:SetDraggable( false )
	BaseFrame:ShowCloseButton( true )
	BaseFrame:MakePopup()
	BaseFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local AnotherFrame = vgui.Create("DPanel",BaseFrame)
	AnotherFrame:StretchToParent(SpaceOffset,20 + SpaceOffset,SpaceOffset,SpaceOffset)
	AnotherFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local StatsFrame = vgui.Create("DPanel",AnotherFrame)
	StatsFrame:SetSize(800 - SpaceOffset*3 - (200 + SpaceOffset*2),90 + 15 + SpaceOffset*4)
	StatsFrame:SetPos(200 + SpaceOffset*2,SpaceOffset)
	StatsFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local StatsTitle = vgui.Create("DLabel",StatsFrame)
	StatsTitle:SetPos(SpaceOffset/2,SpaceOffset/2)
	StatsTitle:SetText("Class Stats")
	StatsTitle:SizeToContents()
	
	local HealthPanel = vgui.Create("DPanel",StatsFrame)
	HealthPanel:SetPos(SpaceOffset,SpaceOffset*2 + 5)
	HealthPanel:SetSize(50,20)
	HealthPanel.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 0, 0, 150 ), true,true,true,true )
	end
	
	local HealthText = vgui.Create("DLabel",HealthPanel)
	HealthText:SetText("Health")
	HealthText:SizeToContents()
	HealthText:Center()
	
	local HealthValue = vgui.Create("DLabel",StatsFrame)
	HealthValue:SetText("100")
	HealthValue:SizeToContents()
	HealthValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*2 + 5)
	
	local ShieldPanel = vgui.Create("DPanel",StatsFrame)
	ShieldPanel:SetPos(SpaceOffset,SpaceOffset*3 + 20 + 5)
	ShieldPanel:SetSize(50,20)
	ShieldPanel.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 0, 0, 255, 150 ), true,true,true,true )
	end
	
	local ShieldText = vgui.Create("DLabel",ShieldPanel)
	ShieldText:SetText("Shields")
	ShieldText:SizeToContents()
	ShieldText:Center()
	
	local ShieldValue = vgui.Create("DLabel",StatsFrame)
	ShieldValue:SetText("100")
	ShieldValue:SizeToContents()
	ShieldValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*3 + 20 + 5)
	
	local ArmorPanel = vgui.Create("DPanel",StatsFrame)
	ArmorPanel:SetPos(SpaceOffset,SpaceOffset*4 + 20 + 20 + 5)
	ArmorPanel:SetSize(50,20)
	ArmorPanel.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 0, 150 ), true,true,true,true )
	end
	
	local ArmorText = vgui.Create("DLabel",ArmorPanel)
	ArmorText:SetText("Armor")
	ArmorText:SizeToContents()
	ArmorText:Center()
	
	local ArmorValue = vgui.Create("DLabel",StatsFrame)
	ArmorValue:SetText("100")
	ArmorValue:SizeToContents()
	ArmorValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*4 + 20 + 20 + 5)

	local WeightPanel = vgui.Create("DPanel",StatsFrame)
	WeightPanel:SetPos(SpaceOffset,SpaceOffset*5 + 20 + 20 + 20 + 5)
	WeightPanel:SetSize(50,20)
	WeightPanel.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 0, 255, 0, 150 ), true,true,true,true )
	end
	
	local WeightText = vgui.Create("DLabel",WeightPanel)
	WeightText:SetText("Weight")
	WeightText:SizeToContents()
	WeightText:Center()
	
	local WeightValue = vgui.Create("DLabel",StatsFrame)
	WeightValue:SetText("0/30")
	WeightValue:SizeToContents()
	WeightValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*5 + 20 + 20 + 20 + 5)
	
	
	
	local ClassFrame = vgui.Create("DPanel",AnotherFrame)
	ClassFrame:SetSize(200,90 + 15 + SpaceOffset*4)
	ClassFrame:SetPos(SpaceOffset,SpaceOffset)
	ClassFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local ClassTitle = vgui.Create("DLabel",ClassFrame)
	ClassTitle:SetPos(SpaceOffset/2,SpaceOffset/2)
	ClassTitle:SetText("Base Protection")
	ClassTitle:SizeToContents()
	
	local ArmorButton = vgui.Create("DButton",ClassFrame)
	ArmorButton:SetPos(SpaceOffset,SpaceOffset + 15)
	ArmorButton:SetSize(200 - SpaceOffset*2,30)
	ArmorButton:SetText("Armor")
	ArmorButton.Paint = function(self,w,h)
		local Mod = 50
		if GetConVar("cm_editor_basestats"):GetFloat() == 1 then
			Mod = 255
		end
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( Mod, Mod, 0, 150 ), true,true,true,true )
	end
	ArmorButton.DoClick = function()
		RunConsoleCommand("cm_editor_basestats","1")
		timer.Simple(0, function()
			CM_RedrawStats(HealthValue,ShieldValue,ArmorValue,WeightValue)
		end)
	end
	
	local MixedButton = vgui.Create("DButton",ClassFrame)
	MixedButton:SetPos(SpaceOffset,SpaceOffset*2 + 15 + 30)
	MixedButton:SetSize(200 - SpaceOffset*2,30)
	MixedButton:SetText("Mixed")
	MixedButton.Paint = function(self,w,h)
		local Mod = 0
		if GetConVar("cm_editor_basestats"):GetFloat() == 2 then
			Mod = 255
		end
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( Mod/2, Mod/2, Mod/3, 150 ), true,true,true,true )
	end
	MixedButton.DoClick = function()
		RunConsoleCommand("cm_editor_basestats","2")
		timer.Simple(0, function()
			CM_RedrawStats(HealthValue,ShieldValue,ArmorValue,WeightValue)
		end)
	end
	
	local ShieldButton = vgui.Create("DButton",ClassFrame)
	ShieldButton:SetPos(SpaceOffset,SpaceOffset*3 + 15 + 30 + 30)
	ShieldButton:SetSize(200 - SpaceOffset*2,30)
	ShieldButton:SetText("Shields")
	ShieldButton.Paint = function(self,w,h)
		local Mod = 50
		if GetConVar("cm_editor_basestats"):GetFloat() == 3 then
			Mod = 255
		end
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 0, 0, Mod, 150 ), true,true,true,true )
	end
	ShieldButton.DoClick = function()
		RunConsoleCommand("cm_editor_basestats","3")
		timer.Simple(0, function()
			CM_RedrawStats(HealthValue,ShieldValue,ArmorValue,WeightValue)
		end)
	end

	CM_RedrawStats(HealthValue,ShieldValue,ArmorValue,WeightValue)
	
	local WeaponFrame = vgui.Create("DPanel",AnotherFrame)
	WeaponFrame:SetSize(800 - SpaceOffset*4, 385 )
	WeaponFrame:SetPos(SpaceOffset,90 + 15 + SpaceOffset*6)
	WeaponFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local WeaponScroll = vgui.Create("DScrollPanel",WeaponFrame)
	WeaponScroll:StretchToParent(SpaceOffset,SpaceOffset,SpaceOffset,SpaceOffset)
	WeaponScroll:Center()
	
	local List = vgui.Create("DIconLayout",WeaponScroll)
	--List:StretchToParent(SpaceOffset,SpaceOffset,SpaceOffset,SpaceOffset)
	List:SetSize(700,600)
	--List:Center()
	List:SetSpaceX(SpaceOffset)
	List:SetSpaceY(SpaceOffset)
	

	
	local Keys = table.GetKeys( CMWD )

	table.sort( Keys, function( a, b )
	
		if CMWD[a].Weight == CMWD[b].Weight then
			return a < b
		else
			return CMWD[a].Weight < CMWD[b].Weight
		end
	
		
	end )
	
	
	
	
	
	for i=1, #Keys do
	
		local k = Keys[i]
		local v = CMWD[k]
	
		local ListItem = List:Add("DPanel")
		ListItem:SetSize(700,150)
		
		if table.HasValue(CurrentLoadout,k) then
			ListItem.IsCurrentlySelected = true
		else
			ListItem.IsCurrentlySelected = false
		end
		
		
		ListItem.Paint = function(self,w,h)
		
			local RedMod = 255
			local GreenMod = 255
			local BlueMod =  255
			
			if self.IsCurrentlySelected then
				RedMod = 0
				BlueMod = 0
			elseif ( (v.Weight + TotalWeight) > MaxWeight) then
				GreenMod = 0
				BlueMod = 0
			end
			
			print(TotalWeight,MaxWeight)
			
		
			draw.RoundedBoxEx( 4, 0, 0, w, h, Color( RedMod, GreenMod, BlueMod, 150 ), true,true,true,true )
		end
		
		
		
		local SWEP = weapons.GetStored(k)
		
		if SWEP then
			local ContentIcon = vgui.Create("ContentIcon",ListItem)
			ContentIcon:SetMaterial("entities/" .. k)
			ContentIcon:SetName(SWEP.PrintName or "NULL")
			ContentIcon:SetPos(10,10)
			ContentIcon.DoClick = function()
			
				if ListItem.IsCurrentlySelected then
					table.RemoveByValue(CurrentLoadout,k)
					ListItem.IsCurrentlySelected = false
				else
					if (v.Weight + TotalWeight) > MaxWeight then
						surface.PlaySound( "buttons/weapon_cant_buy.wav" )
					else
						table.Add(CurrentLoadout,{k})
						ListItem.IsCurrentlySelected = true
					end
				end
				
				RunConsoleCommand("cm_editor_weapons",string.Implode(" ",CurrentLoadout))
				
				timer.Simple(0, function()
					CM_RedrawStats(HealthValue,ShieldValue,ArmorValue,WeightValue)
				end)
			
			end
			
			local WeaponNameFrame = vgui.Create("DPanel",ListItem)
			WeaponNameFrame:SetPos(150,SpaceOffset)
			WeaponNameFrame:SetSize(700 - 150 - SpaceOffset,40)
			WeaponNameFrame:SetText("")
			WeaponNameFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
			
			local WeaponNameText = vgui.Create("DLabel",WeaponNameFrame)
			WeaponNameText:SetText(SWEP.PrintName .. " [" .. v.Weight .. "KG]")
			WeaponNameText:SetFont("DermaLarge")
			WeaponNameText:SizeToContents()
			WeaponNameText:Center()
			
			
			
			
			
		end

	end
	
	
	
	--for i=1, 50 do
		--local ListItem = List:Add("DPanel")
		--ListItem:SetSize(100,100)
	--end
	
	
	
end

concommand.Add( "cm_loadout", CM_ShowClassMenu)

	
function CM_RedrawStats(HealthValue,ShieldValue,ArmorValue,WeightValue)

	local Var = GetConVar("cm_editor_basestats"):GetFloat()

	if not (Var == 1 or Var == 2 or Var == 3) then
		RunConsoleCommand("cm_editor_basestats","2")
		Var = 2
	end
	
	HealthValue:SetText(CMCD[Var].Health)
	HealthValue:SizeToContents()
	
	ShieldValue:SetText(CMCD[Var].Shield)
	ShieldValue:SizeToContents()
	
	ArmorValue:SetText(CMCD[Var].Armor)
	ArmorValue:SizeToContents()
	
	local Weapons = string.Explode(" ",GetConVar("cm_editor_weapons"):GetString())
	
	TotalWeight = 0
	
	for k,v in pairs(Weapons) do
		if not CMWD[v] then
			print("FAGGOT")
		else
			TotalWeight = TotalWeight + CMWD[v].Weight
		end
	end
	
	WeightValue:SetText(TotalWeight .. "/" .. MaxWeight)
	WeightValue:SizeToContents()
	
end

function CM_CustomHUD()

	local ply = LocalPlayer()

	local x = ScrW()
	local y = ScrH()
	
	local TotalWidth = 225
	local TotalHeight = TotalWidth*0.1
	
	CM_DrawHealth(x,y,TotalWidth,TotalHeight)
	CM_DrawAmmo(x,y,TotalWidth,TotalHeight)
		
end

function CM_DrawHealth(x,y,TotalWidth,TotalHeight)

	local Health = 100
	local MaxHealth = 100
	local Armor = 20
	local MaxArmor = 100
	local Shield = 75
	local MaxShield = 100
	
	local HealthMul = math.Clamp(Health/MaxHealth,0,1)
	local ArmorMul = math.Clamp(Armor/MaxArmor,0,1)
	local ShieldMul =  math.Clamp(Shield/MaxShield,0,1)

	local MaxHealthScale = (MaxHealth / (MaxArmor + MaxShield))*(2/3)
	local MaxArmorScale = (MaxArmor / (MaxHealth + MaxShield))*(2/3)
	local MaxShieldScale = (MaxShield / (MaxHealth + MaxArmor))*(2/3)
	
	local BaseX = x*0.02
	local BaseY = y*0.93
	
	local TotalAlpha = 200
	
	local Spacing = 4
	
	--Base
	draw.RoundedBox( 4, BaseX - Spacing*0.5, BaseY - Spacing*0.5, TotalWidth + Spacing,TotalHeight + Spacing, Color(255,255,255,100) )
	
	--Health
	if Health > 0 then
		draw.RoundedBox( 4, BaseX, BaseY, TotalWidth*MaxHealthScale*HealthMul,TotalHeight, Color(255,100,100,255) )
		draw.SimpleText( Health, "DermaLarge", BaseX + TotalWidth*MaxHealthScale*HealthMul*0.5, BaseY + TotalHeight/2 , Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
	end
	
	--Armor
	if Armor > 0 then
		draw.RoundedBox( 4, BaseX + TotalWidth*MaxHealthScale,BaseY,TotalWidth*MaxArmorScale*ArmorMul,TotalHeight,Color(255,255,0,TotalAlpha))
		draw.SimpleText( Armor, "DermaLarge", BaseX + TotalWidth*MaxHealthScale + TotalWidth*MaxArmorScale*ArmorMul*0.5, BaseY + TotalHeight/2, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	--Shields
	if Shield > 0 then
		draw.RoundedBox( 4,BaseX + TotalWidth*MaxHealthScale + TotalWidth*MaxArmorScale,BaseY,TotalWidth*MaxShieldScale*ShieldMul,TotalHeight,Color(0,0,255,TotalAlpha))
		draw.SimpleText( Armor, "DermaLarge", BaseX + TotalWidth*MaxHealthScale + TotalWidth*MaxArmorScale + TotalWidth*MaxShieldScale*ShieldMul*0.5, BaseY + TotalHeight/2, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end


end

--[[

function CM_DrawAmmo(x,y,TotalWidth,TotalHeight)
	
	local ply = LocalPlayer()
	
	local ClipAmmo = -1
	local CurrentAmmo = -1
	
	local Weapon = ply:GetActiveWeapon()
	
	if IsValid(Weapon) then
		ClipAmmo = Weapon:Clip1() or -1
		CurrentAmmo = ply:GetAmmoCount(Weapon:GetPrimaryAmmoType())
	end
	
	local BaseX = x*0.98 - TotalWidth
	local BaseY = y*0.93
	
	local Spacing = 4
	
	local AmmoDisplay = ClipAmmo .. "/" .. CurrentAmmo
	
	if ClipAmmo == -1 and ClipAmmo == -1   then
		AmmoDisplay = "Infinity"
	elseif ClipAmmo == -1 then
		AmmoDisplay = CurrentAmmo
	elseif CurrentAmmo == -1 then
		AmmoDisplay = ClipAmmo
	end
	
	draw.RoundedBox( 4, BaseX - Spacing*0.5, BaseY - Spacing*0.5, TotalWidth + Spacing,TotalHeight + Spacing, Color(255,255,255,100) )
	draw.SimpleText( AmmoDisplay, "DermaLarge", BaseX + TotalWidth/2, BaseY + TotalHeight/2 , Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

end

hook.Add("HUDPaint","CM: HUD PAINT",CM_CustomHUD)


hook.Add( "HUDShouldDraw", "Hide Battery and Health", function( name )
	
	 if ( name == "CHudHealth" or name == "CHudBattery" or name == "CHudAmmo" ) then
		 return false
	 end
	
end )

--]]