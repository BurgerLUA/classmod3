local DefaultWeapons = "weapon_cs_m4 weapon_cs_usp weapon_cs_knife weapon_cs_he"
local DefaultEquipment = ""

CreateClientConVar("cm_editor_basestats","2",true,true)
CreateClientConVar("cm_editor_equipment",DefaultEquipment,true,true)
CreateClientConVar("cm_editor_weapons",DefaultWeapons,true,true)

local CurrentEquipment = string.Explode(" ", string.Trim(GetConVar("cm_editor_weapons"):GetString()))
local CurrentLoadout = string.Explode(" ", string.Trim(GetConVar("cm_editor_weapons"):GetString()))

local TotalWeight = 0

local TextColorWhite = Color(255,255,255,255)
local TextColorBlack = Color(0,0,0,255)

surface.CreateFont( "ClassmodSmall", {
	font = "Roboto-Medium",
	size = 18,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "ClassmodLarge", {
	font = "Roboto-Medium",
	size = 36,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )




function CM_ShowClassMenu()

	local SpaceOffset = 10
	local TitleFontSize = 10
	local LargeTitleFontSize = 40
	
	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()
	
	local x = ScrW()*0.9
	local y = ScrH()*0.9

	local BaseFrame = vgui.Create("DFrame")
	BaseFrame:SetSize(x,y)
	BaseFrame:Center()
	BaseFrame:SetVisible( true )
	BaseFrame:SetDraggable( false )
	BaseFrame:ShowCloseButton( true )
	--BaseFrame:SetFont("ClassmodSmall")
	BaseFrame:SetTitle(" ")
	BaseFrame:MakePopup()
	BaseFrame.Paint = function(self,w,h)
		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
	end
	
	local LW, LH = BaseFrame:GetSize()
		
		local AnotherFrame = vgui.Create("DPanel",BaseFrame)
		AnotherFrame:StretchToParent(SpaceOffset,SpaceOffset + 20,SpaceOffset,SpaceOffset)
		AnotherFrame.Paint = function(self,w,h)
		
			local FlashyColor = HSVToColor( (CurTime()*10)%360, 1, 1 )
			
			FlashyColor.r = FlashyColor.r / 2
			FlashyColor.g = FlashyColor.g / 2
			FlashyColor.b = FlashyColor.b / 2
			FlashyColor.a = 150
			
			draw.RoundedBoxEx( 4, 0, 0, w, h, FlashyColor, true,true,true,true )
		end
		
		local LW, LH = AnotherFrame:GetSize()
	
			local StatsFrame = vgui.Create("DPanel",AnotherFrame)
			StatsFrame:SetSize(LW*0.75 - SpaceOffset*3,LH*0.25)
			StatsFrame:SetPos(LW*0.25 + SpaceOffset*2,SpaceOffset)
			StatsFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
	
			local LW, LH = StatsFrame:GetSize()
	
				local StatsTitle = vgui.Create("DLabel",StatsFrame)
				StatsTitle:SetPos(SpaceOffset/2,SpaceOffset/2)
				StatsTitle:SetText("Class Stats")
				StatsTitle:SetFont("ClassmodSmall")
				StatsTitle:SetTextColor(TextColorWhite)
				StatsTitle:SizeToContents()
	
				local HealthFrame = vgui.Create("DPanel",StatsFrame)
				HealthFrame:SetPos(SpaceOffset,SpaceOffset*2 + 5)
				HealthFrame:SetSize(50,20)
				HealthFrame.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 0, 0, 150 ), true,true,true,true )
				end
	
				local LW, LH = HealthFrame:GetSize()
	
					local HealthText = vgui.Create("DLabel",HealthFrame)
					HealthText:SetText("Health")
					HealthText:SetFont("ClassmodSmall")
					HealthText:SetTextColor(TextColorWhite)
					HealthText:SizeToContents()
					HealthText:Center()
	
					local HealthValue = vgui.Create("DLabel",StatsFrame)
					HealthValue:SetText("100")
					HealthValue:SetFont("ClassmodSmall")
					HealthValue:SetTextColor(TextColorWhite)
					HealthValue:SizeToContents()
					HealthValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*2 + 5)
	
				local ShieldFrame = vgui.Create("DPanel",StatsFrame)
				ShieldFrame:SetPos(SpaceOffset,SpaceOffset*3 + 20 + 5)
				ShieldFrame:SetSize(50,20)
				ShieldFrame.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 0, 0, 255, 150 ), true,true,true,true )
				end
	
				local LW, LH = ShieldFrame:GetSize()
	
					local ShieldText = vgui.Create("DLabel",ShieldFrame)
					ShieldText:SetText("Shields")
					ShieldText:SetFont("ClassmodSmall")
					ShieldText:SetTextColor(TextColorWhite)
					ShieldText:SizeToContents()
					ShieldText:Center()
					
					local ShieldValue = vgui.Create("DLabel",StatsFrame)
					ShieldValue:SetText("100")
					ShieldValue:SetFont("ClassmodSmall")
					ShieldValue:SetTextColor(TextColorWhite)
					ShieldValue:SizeToContents()
					ShieldValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*3 + 20 + 5)
	
				local ArmorFrame = vgui.Create("DPanel",StatsFrame)
				ArmorFrame:SetPos(SpaceOffset,SpaceOffset*4 + 20 + 20 + 5)
				ArmorFrame:SetSize(50,20)
				ArmorFrame.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 0, 150 ), true,true,true,true )
				end
	
				local LW, LH = ArmorFrame:GetSize()
	
					local ArmorText = vgui.Create("DLabel",ArmorFrame)
					ArmorText:SetText("Armor")
					ArmorText:SetFont("ClassmodSmall")
					ArmorText:SetTextColor(TextColorWhite)
					ArmorText:SizeToContents()
					ArmorText:Center()
					
					local ArmorValue = vgui.Create("DLabel",StatsFrame)
					ArmorValue:SetText("100")
					ArmorValue:SetFont("ClassmodSmall")
					ArmorValue:SetTextColor(TextColorWhite)
					ArmorValue:SizeToContents()
					ArmorValue:SetPos(SpaceOffset*2 + 50,SpaceOffset*4 + 20 + 20 + 5)
		
		
		
	
		local LW, LH = AnotherFrame:GetSize()
			
			local ClassFrame = vgui.Create("DPanel",AnotherFrame)
			ClassFrame:SetSize(LW*0.25,LH*0.25)
			ClassFrame:SetPos(SpaceOffset,SpaceOffset)
			ClassFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
			
			local LW, LH = ClassFrame:GetSize()
	
				local ClassTitle = vgui.Create("DLabel",ClassFrame)
				ClassTitle:SetPos(SpaceOffset/2,SpaceOffset/2)
				ClassTitle:SetText("Base Protection")
				ClassTitle:SetFont("ClassmodSmall")
				ClassTitle:SetTextColor(TextColorWhite)
				ClassTitle:SizeToContents()
	
				local ArmorButton = vgui.Create("DButton",ClassFrame)
				ArmorButton:SetPos(SpaceOffset,SpaceOffset + TitleFontSize)
				ArmorButton:SetSize(LW - SpaceOffset*2,LH*0.25)
				ArmorButton:SetText("Armor")
				ArmorButton:SetFont("ClassmodSmall")
				ArmorButton:SetTextColor(TextColorWhite)
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
				MixedButton:SetPos(SpaceOffset, (SpaceOffset + TitleFontSize) + (SpaceOffset/2 + LH*0.25) )
				MixedButton:SetSize(LW - SpaceOffset*2,LH*0.25)
				MixedButton:SetText("Mixed")
				MixedButton:SetFont("ClassmodSmall")
				MixedButton:SetTextColor(TextColorWhite)
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
				ShieldButton:SetPos(SpaceOffset, (SpaceOffset + TitleFontSize) + (SpaceOffset/2 + LH*0.25)*2 )
				ShieldButton:SetSize(LW - SpaceOffset*2,LH*0.25)
				ShieldButton:SetText("Shields")
				ShieldButton:SetFont("ClassmodSmall")
				ShieldButton:SetTextColor(TextColorWhite)
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
		
		local LW, LH = AnotherFrame:GetSize()
	
			local WeightFrame = vgui.Create("DPanel",BaseFrame)
			WeightFrame:SetPos(SpaceOffset*2,SpaceOffset*5 + LH*0.25)
			WeightFrame:SetSize(LW - SpaceOffset*2,LH*0.05 + SpaceOffset)
			WeightFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
	
			local LW, LH = WeightFrame:GetSize()
	
				local WeightBar = vgui.Create("DPanel",WeightFrame)
				WeightBar:SetPos(SpaceOffset,SpaceOffset)
				WeightBar:SetSize(LW - SpaceOffset*2,LH - SpaceOffset*2)
				WeightBar.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
				end
	
				local LW, LH = WeightBar:GetSize()
	
					local WeightFill = vgui.Create("DPanel",WeightBar)
					WeightFill:SetPos(SpaceOffset/2,SpaceOffset/2)
					WeightFill:SetSize(LW-SpaceOffset,LH-SpaceOffset)
					WeightFill.Paint = function(self,w,h)
						local WeightScale = TotalWeight / WeightLimit
						draw.RoundedBoxEx( 4, 0, 0, w * WeightScale, h, Color( 255 * WeightScale, 255 - (255*WeightScale), 0, 150 ), true,true,true,true )
					end
	
					local WeightValue = vgui.Create("DLabel",WeightBar)
					WeightValue:SetText("FUCK YOU")
					WeightValue:SetFont("ClassmodSmall")
					WeightValue:SetTextColor(TextColorBlack)
					WeightValue:SetDark(true)
					WeightValue:SizeToContents()
					WeightValue:Center()
	
		local LW, LH = AnotherFrame:GetSize()
	
			local WeaponFrame = vgui.Create("DPanel",BaseFrame)
			WeaponFrame:SetSize(LW - SpaceOffset*2, LH * 0.70 - SpaceOffset*5 )
			WeaponFrame:SetPos(SpaceOffset*2,SpaceOffset*7 + LH*0.30 )
			WeaponFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
	
			local WeaponScroll = vgui.Create("DScrollPanel",WeaponFrame)
			WeaponScroll:StretchToParent(SpaceOffset,SpaceOffset,SpaceOffset,SpaceOffset)
			WeaponScroll:Center()
			
			local LW, LH = WeaponScroll:GetSize()
	
				local List = vgui.Create("DIconLayout",WeaponScroll)
				List:SetSize(LW - SpaceOffset - 20,LH - SpaceOffset) -- 20 is for the scrollbars
				List:SetPos(0,0)
				List:SetSpaceX(SpaceOffset)
				List:SetSpaceY(SpaceOffset)

				local LW, LH = List:GetSize()
	
				local Keys = table.GetKeys( CMWeapons )

				table.sort( Keys, function( a, b )
				
	
					if math.abs(CMWeapons[a].Slot) == 0 and math.abs(CMWeapons[b].Slot) == 0 then
						if CMWeapons[a].Weight == CMWeapons[b].Weight then
							return a < b
						else
							return CMWeapons[a].Weight < CMWeapons[b].Weight
						end
					elseif math.abs(CMWeapons[a].Slot) == 0 and math.abs(CMWeapons[a].Slot) ~= 0 then
						return a < b
					elseif math.abs(CMWeapons[a].Slot) == math.abs(CMWeapons[b].Slot) then
						if CMWeapons[a].Weight == CMWeapons[b].Weight then
							return a < b
						else
							return CMWeapons[a].Weight < CMWeapons[b].Weight
						end
					else
						return math.abs(CMWeapons[a].Slot) < math.abs(CMWeapons[b].Slot)
					end
		
				end )
				
				local PanelHeight = 75

				for i=1, #Keys do
				
					local k = Keys[i]
					local v = CMWeapons[k]
				
					local ListItem = List:Add("DPanel")
					ListItem:SetSize(LW/3 - SpaceOffset*2,PanelHeight) -- 150 is for the icon size
					
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
						elseif ( (v.Weight + TotalWeight) > WeightLimit) then
							GreenMod = 0
							BlueMod = 0
						elseif CM_HasWeaponSlotSpace(v.Slot) then
							GreenMod = 0
							BlueMod = 0
						end
						
						draw.RoundedBoxEx( 4, 0, 0, w, h, Color( RedMod, GreenMod, BlueMod, 150 ), true,true,true,true )
						
					end
					
					local LW, LH = ListItem:GetSize()
					
					local SWEP = weapons.GetStored(k)
					
					if SWEP or k == "weapon_physgun" then
					
						local GetModel = ""
						
						if SWEP then
							GetModel = SWEP.WorldModel
						end
						
						if GetModel and GetModel ~= "" then
						
							local ModelPanel = vgui.Create( "DModelPanel",ListItem )
							ModelPanel:SetPos( SpaceOffset, SpaceOffset )
							ModelPanel:SetSize( PanelHeight, PanelHeight )
							ModelPanel:SetLookAt( Vector( 0,0,0 ) )
						--	ModelPanel:SetLookAng( Angle(0,0,0) )
							ModelPanel:SetFOV(10)
							ModelPanel:SetModel( GetModel )

						end

						local WeaponNameFrame = vgui.Create("DPanel",ListItem)
						WeaponNameFrame:SetPos(PanelHeight,SpaceOffset)
						WeaponNameFrame:SetSize(LW - PanelHeight - SpaceOffset*2,LargeTitleFontSize + SpaceOffset)
						WeaponNameFrame:SetText("")
						WeaponNameFrame.Paint = function(self,w,h)
							draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
						end
						
						local PrintName = "Physgun"
						
						if SWEP then
							PrintName = SWEP.PrintName
						end
						
						
						local WeaponNameText = vgui.Create("DLabel",WeaponNameFrame)
						WeaponNameText:SetText(PrintName .. " [" .. v.Weight .. "KG]")
						WeaponNameText:SetFont("ClassmodLarge")
						WeaponNameText:SetTextColor(TextColorBlack)
						WeaponNameText:SizeToContents()
						WeaponNameText:Center()

						local ButtonPanel = vgui.Create("DButton",ListItem)
						ButtonPanel:SetPos(SpaceOffset,SpaceOffset)
						ButtonPanel:SetText("")
						ButtonPanel:SetSize(LW - SpaceOffset*2,LH - SpaceOffset*2)
						ButtonPanel.DoClick = function()
						
							if ListItem.IsCurrentlySelected then
								table.RemoveByValue(CurrentLoadout,k)
								ListItem.IsCurrentlySelected = false
							else
								if (v.Weight + TotalWeight) > WeightLimit or (CM_HasWeaponSlotSpace(v.Slot)) then
									surface.PlaySound( "buttons/weapon_cant_buy.wav" )
								else
									table.Add(CurrentLoadout,{k})
									ListItem.IsCurrentlySelected = true
								end
							end
							
							RunConsoleCommand("cm_editor_weapons", string.Trim(string.Implode(" ",CurrentLoadout)))
							
							timer.Simple(0, function()
								CM_RedrawWeight(WeightValue)
							end)
						
						end
						ButtonPanel.Paint = function(self,w,h)
							--draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
						end
						
						
						
					end

				end
	
		local LW, LH = AnotherFrame:GetSize()
	
			--[[
	
			local EquipmentFrame = vgui.Create("DPanel",BaseFrame)
			EquipmentFrame:SetSize(LW*0.5 - SpaceOffset*2, LH * 0.70 - SpaceOffset*5 )
			EquipmentFrame:SetPos(SpaceOffset*2 + LW*0.5,SpaceOffset*7 + LH*0.30 )
			EquipmentFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
	
			local EquipmentScroll = vgui.Create("DScrollPanel",EquipmentFrame)
			EquipmentScroll:StretchToParent(SpaceOffset,SpaceOffset,SpaceOffset,SpaceOffset)
			EquipmentScroll:Center()
			
			local LW, LH = EquipmentScroll:GetSize()
	
				local EquipmentList = vgui.Create("DIconLayout",EquipmentScroll)
				EquipmentList:SetSize(LW - SpaceOffset - 20,LH - SpaceOffset) -- 20 is for the scrollbars
				EquipmentList:SetPos(0,0)
				EquipmentList:SetSpaceX(SpaceOffset)
				EquipmentList:SetSpaceY(SpaceOffset)

				local LW, LH = EquipmentList:GetSize()
	
				local Keys = table.GetKeys( CMEquipment )

				table.sort( Keys, function( a, b )
	
					if CMEquipment[a].Weight == CMEquipment[b].Weight then
						return a < b
					else
						return CMEquipment[a].Weight < CMEquipment[b].Weight
					end
		
				end )

				for i=1, #Keys do
				
					local k = Keys[i]
					local v = CMEquipment[k]
				
					local EquipmentListItem = EquipmentList:Add("DPanel")
					EquipmentListItem:SetSize(LW,150) -- 150 is for the icon size
					
					if table.HasValue(CurrentEquipment,k) then
						EquipmentListItem.IsCurrentlySelected = true
					else
						EquipmentListItem.IsCurrentlySelected = false
					end
					
					EquipmentListItem.Paint = function(self,w,h)
					
						local RedMod = 255
						local GreenMod = 255
						local BlueMod =  255
						
						if self.IsCurrentlySelected then
							RedMod = 0
							GreenMod = 255
							BlueMod = 0
						elseif ( (v.Weight + TotalWeight) > WeightLimit) then
							RedMod = 255
							GreenMod = 0
							BlueMod = 0
						elseif CM_HasEquipmentSlotSpace(v.Slot) then
							RedMod = 255
							GreenMod = 0
							BlueMod = 0
						end
						
						draw.RoundedBoxEx( 4, 0, 0, w, h, Color( RedMod, GreenMod, BlueMod, 150 ), true,true,true,true )
						
					end
					
					local LW, LH = EquipmentListItem:GetSize()
					
					local Object = v
					
					if Object then
						local EquipmentContentIcon = vgui.Create("ContentIcon",EquipmentListItem)
						--ContentIcon:SetMaterial("entities/" .. k)
						EquipmentContentIcon:SetName(Object.Name or "NULL")
						EquipmentContentIcon:SetPos(SpaceOffset,SpaceOffset)
						EquipmentContentIcon.DoClick = function()
						
							if EquipmentListItem.IsCurrentlySelected then
								table.RemoveByValue(CurrentEquipment,k)
								EquipmentListItem.IsCurrentlySelected = false
							else
								if (v.Weight + TotalWeight) > WeightLimit or (CM_HasEquipmentSlotSpace(v.Slot)) then
									surface.PlaySound( "buttons/weapon_cant_buy.wav" )
								else
									table.Add(CurrentEquipment,{k})
									EquipmentListItem.IsCurrentlySelected = true
								end
							end
							
							RunConsoleCommand("cm_editor_equipment", string.Trim(string.Implode(" ",CurrentEquipment)))
							
							timer.Simple(0, function()
								CM_RedrawWeight(WeightValue)
							end)
						
						end
						
						local EquipmentNameFrame = vgui.Create("DPanel",EquipmentListItem)
						EquipmentNameFrame:SetPos(150,SpaceOffset)
						EquipmentNameFrame:SetSize(LW - 150 - SpaceOffset*2,LargeTitleFontSize + SpaceOffset)
						EquipmentNameFrame:SetText("")
						EquipmentNameFrame.Paint = function(self,w,h)
							draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
						end
						
						local EquipmentNameText = vgui.Create("DLabel",EquipmentNameFrame)
						EquipmentNameText:SetText(Object.Name .. " [" .. v.Weight .. "KG]")
						EquipmentNameText:SetFont("ClassmodLarge")
						EquipmentNameText:SetTextColor(TextColorBlack)
						EquipmentNameText:SizeToContents()
						EquipmentNameText:Center()

					end

				end	
	--]]

	CM_RedrawWeight(WeightValue)
	CM_RedrawStats(HealthValue,ShieldValue,ArmorValue)
	
end

concommand.Add( "cm_menu", CM_ShowClassMenu)

function CM_HasEquipmentSlotSpace(slot)

	local Equipment = string.Explode(" ",string.Trim(GetConVar("cm_editor_equipment"):GetString()))
	
	for k,v in pairs(Equipment) do
		if not CMEquipment[v] then
			
		else
			if CMEquipment[v].Slot == slot and slot ~= 0 then
				return true
			end
		end
	end


end

function CM_HasWeaponSlotSpace(slot)

	local Weapons = string.Explode(" ",string.Trim(GetConVar("cm_editor_weapons"):GetString()))
	
	for k,v in pairs(Weapons) do
		if not CMWeapons[v] then
			
		else
			if CMWeapons[v].Slot == slot and (slot ~= 0 and slot ~= 5) then
				return true
			end
		end
	end


end



function CM_RedrawWeight(WeightValue)

	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()
	local Weapons = string.Explode(" ",string.Trim(GetConVar("cm_editor_weapons"):GetString()))
	local Equipment = string.Explode(" ",string.Trim(GetConVar("cm_editor_equipment"):GetString()))

	TotalWeight = 0
	
	for k,v in pairs(Weapons) do
		if not CMWeapons[v] then
			--print("FAGGOT")
		else
			TotalWeight = TotalWeight + CMWeapons[v].Weight
		end
	end
	
	for k,v in pairs(Equipment) do
		if not CMEquipment[v] then
			--print("FAGGOT")
		else
			TotalWeight = TotalWeight + CMEquipment[v].Weight
		end
	end

	WeightValue:SetText(TotalWeight .. "/" .. WeightLimit)
	WeightValue:SizeToContents()
	WeightValue:Center()
	
end
	
function CM_RedrawStats(HealthValue,ShieldValue,ArmorValue)

	local Var = GetConVar("cm_editor_basestats"):GetFloat()

	if not (Var == 1 or Var == 2 or Var == 3) then
		RunConsoleCommand("cm_editor_basestats","2")
		Var = 2
	end
	
	HealthValue:SetText(CMClasses[Var].Health)
	HealthValue:SizeToContents()
	
	ShieldValue:SetText(CMClasses[Var].Shield)
	ShieldValue:SizeToContents()
	
	ArmorValue:SetText(CMClasses[Var].Armor)
	ArmorValue:SizeToContents()
	
end

function CM_CustomHUD()

	local ply = LocalPlayer()

	local x = ScrW()
	local y = ScrH()
	
	local TotalWidth = 255
	local TotalHeight = TotalWidth*0.25
	
	--CM_DrawHealth(x,y,TotalWidth,TotalHeight)
	--CM_DrawAmmo(x,y,TotalWidth,TotalHeight)
		
end

local BaseColor = Color(255,255,255,255)
local MaxColor = 255

function CM_DrawHealth(x,y,TotalWidth,TotalHeight)

	local ply = LocalPlayer()

	local Health = ply:Health()
	local MaxHealth = ply:GetMaxHealth()
	
	local Armor = math.floor(ply:GetNWFloat("CM_Armor",0))
	local MaxArmor = ply:GetNWFloat("CM_MaxArmor",0)
	
	local Shield = math.floor(ply:GetNWFloat("CM_Shield",0))
	local MaxShield = ply:GetNWFloat("CM_MaxShield",0)
	

	local HealthMul = math.Clamp(Health/MaxHealth,0,1)
	local ArmorMul = math.Clamp(Armor/MaxArmor,0,1)
	local ShieldMul =  math.Clamp(Shield/MaxShield,0,1)
	
	if MaxHealth == 0 then
		HealthMul = 0
	end
	
	if MaxArmor == 0 then
		ArmorMul = 0
	end
	
	if MaxShield == 0 then
		ShieldMul = 0
	end
	
	
	
	local AllMul = (HealthMul + ArmorMul + ShieldMul)
	
	local SpaceMul = 1/2

	local MaxHealthScale = (MaxHealth / (MaxArmor + MaxShield + MaxHealth))
	local MaxArmorScale = (MaxArmor / (MaxHealth + MaxShield + MaxArmor))
	local MaxShieldScale = (MaxShield / (MaxArmor + MaxHealth + MaxShield))
	
	local BaseX = x*0.02
	local BaseY = y - x*0.02 - TotalHeight
	
	local TotalAlpha = 200
	
	local Spacing = 4

	
	
	--Base
	draw.RoundedBox( 4, BaseX - Spacing*0.5, BaseY - Spacing*0.5, TotalWidth + Spacing,TotalHeight + Spacing, BaseColor )
	
	--Health
	if Health > 0 then
		draw.RoundedBox( 4, BaseX, BaseY, TotalWidth*MaxHealthScale*HealthMul,TotalHeight, Color(MaxColor,MaxColor/2,MaxColor/2,255) )
		draw.SimpleText( Health, "DermaLarge", BaseX + TotalWidth*MaxHealthScale*HealthMul*0.5, BaseY + TotalHeight/2 , Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
	end
	
	--Armor
	if Armor > 0 then
		draw.RoundedBox( 4, BaseX + TotalWidth*MaxHealthScale,BaseY,TotalWidth*MaxArmorScale*ArmorMul,TotalHeight,Color(MaxColor,MaxColor,0,TotalAlpha))
		draw.SimpleText( Armor, "DermaLarge", BaseX + TotalWidth*MaxHealthScale + TotalWidth*MaxArmorScale*ArmorMul*0.5, BaseY + TotalHeight/2, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	--Shields
	if Shield > 0 then
		draw.RoundedBox( 4,BaseX + TotalWidth*MaxHealthScale + TotalWidth*MaxArmorScale,BaseY,TotalWidth*MaxShieldScale*ShieldMul,TotalHeight,Color(0,0,MaxColor,TotalAlpha))
		draw.SimpleText( Shield, "DermaLarge", BaseX + TotalWidth*MaxHealthScale + TotalWidth*MaxArmorScale + TotalWidth*MaxShieldScale*ShieldMul*0.5, BaseY + TotalHeight/2, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end


end



function CM_DrawAmmo(x,y,TotalWidth,TotalHeight)
	
	local ply = LocalPlayer()
	
	local ClipAmmo = -1
	local MaxAmmo = -1
	local CurrentAmmo = -1
	
	local Weapon = ply:GetActiveWeapon()
	
	if IsValid(Weapon) then
		ClipAmmo = Weapon:Clip1() or -1
		MaxAmmo = Weapon:GetMaxClip1() or -1
		CurrentAmmo = ply:GetAmmoCount(Weapon:GetPrimaryAmmoType())
	end
	
	local BaseX = x*0.98 - TotalWidth
	local BaseY = y - x*0.02 - TotalHeight
	
	local Spacing = 4
	
	local AmmoDisplay = ClipAmmo .. "/" .. CurrentAmmo
	
	local Mul = ClipAmmo / MaxAmmo
	
	if ClipAmmo == -1 and MaxAmmo == -1 and CurrentAmmo == -1  then
		AmmoDisplay = "Infinity"
	elseif ClipAmmo == -1 then
		AmmoDisplay = CurrentAmmo
	elseif CurrentAmmo == -1 then
		AmmoDisplay = ClipAmmo
	end
	
	draw.RoundedBox( 4, BaseX - Spacing*0.5, BaseY - Spacing*0.5, TotalWidth + Spacing,TotalHeight + Spacing, BaseColor )
	
	if Mul ~= 0 then
		draw.RoundedBox( 4, BaseX + Spacing*0.25, BaseY + Spacing*0.25, (TotalWidth - Spacing*0.5)*Mul,TotalHeight - Spacing*0.5, Color(MaxColor,MaxColor,0,255) )
	end
	
	draw.SimpleText( AmmoDisplay, "DermaLarge", BaseX + TotalWidth/2, BaseY + TotalHeight/2 , Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

end

hook.Add("HUDPaint","CM: HUD PAINT",CM_CustomHUD)


hook.Add( "HUDShouldDraw", "Hide Battery and Health", function( name )
	--[[
	 if ( name == "CHudHealth" or name == "CHudBattery" ) then
		 return false
	 end
	--]]
end )

