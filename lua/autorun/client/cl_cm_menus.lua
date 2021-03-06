local DefaultWeapons = "weapon_burger_cs_m4 weapon_burger_cs_usp weapon_burger_cs_knife weapon_burger_cs_he"
--local DefaultEquipment = "none"

CreateClientConVar("cm_editor_weapons",DefaultWeapons,true,true)
--CreateClientConVar("cm_editor_equipment",DefaultEquipment,true,true)

local CurrentLoadout = CM_GetPlayerWeapons(LocalPlayer())
--local CurrentEquipment = CM_GetPlayerEquipment(LocalPlayer())

local TotalWeight = 0

local TextColorWhite = Color(255,255,255,255)
local TextColorBlack = Color(0,0,0,255)


-- Balance Info:

-- Misc >Nade > Melee > Sniper > Rifle > Shotgun > Smg > Pistol

-- 0, All T1

-- 1, T2 Pistols, T2 Melee
-- 3, T2 SMGs, T2 Shotguns
-- 5, T2 Rifles
-- 8, T2 Snipers
-- 11, T2 Nades, T2 Misc

-- 14, T3 Pistols, T3 Melee
-- 18, T3 SMGs, T3 Shotguns
-- 22, T3 Rifles
-- 26, T3 Snipers
-- 30, T3 Nades, T3 Misc

-- 35, T4 Pistols, T4 Melee
-- 40, T4 SMGs, T4 Shotguns
-- 45, T4 Rifles
-- 50, T4 Snipers
-- 55, T4 Nades, T4 Misc

-- 60, T5 Pistols, T5 Melee
-- 61, T5 SMGs, T5 Shotguns
-- 62, T5 Rifles
-- 63, T5 Snipers
-- 64, T5 Nades, T5 Misc

surface.CreateFont( "ClassmodTiny", {
	font = "Roboto-Medium",
	size = 12,
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

surface.CreateFont( "ClassmodTiny", {
	font = "Roboto-Medium",
	size = 14,
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

local SpaceOffset = 10
local TitleFontSize = 10
local LargeTitleFontSize = 40
local PanelHeight = 100


function CM_ShowClassMenu()

	local ply = LocalPlayer()
	
	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()
	CurrentLoadout = CM_GetPlayerWeapons(LocalPlayer())
	--CurrentEquipment = CM_GetPlayerEquipment(LocalPlayer())
	
	local x = ScrW() - 100
	local y = ScrH() - 100

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
	BaseFrame:SetMouseInputEnabled( true )
	
	local AllowedListItem = {}
	local ForbiddenListItem = {}
	
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
	
			local WeightFrame = vgui.Create("DPanel",BaseFrame)
			WeightFrame:SetPos(SpaceOffset*2,SpaceOffset*4)
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
			WeaponFrame:SetSize(LW - SpaceOffset*2, LH * 0.90 - SpaceOffset*5 )
			WeaponFrame:SetPos(SpaceOffset*2,SpaceOffset*6 + LH*0.05 )
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
				local AllowedWeapons = table.Copy(CMWeapons)
				local ForbiddenWeapons = {}		

				if CM_IsRankEnabled() then
					for k,v in pairs(AllowedWeapons) do
						if v.Rank and v.Rank > SimpleXPGetLevel(ply) then
							ForbiddenWeapons[k] = v
							AllowedWeapons[k] = nil
						end
					end
				end

				local AllowedKeys = table.GetKeys( AllowedWeapons )
				local ForbiddenKeys = table.GetKeys( ForbiddenWeapons )
				
				table.sort( ForbiddenKeys, function( a, b )
				
					local WeaponA = ForbiddenWeapons[a]
					local WeaponB = ForbiddenWeapons[b]
					local ply = LocalPlayer()
					
					if WeaponA.Rank == WeaponB.Rank then
						if math.abs(WeaponA.Slot) == math.abs(WeaponB.Slot) then
							if WeaponA.Weight == WeaponB.Weight then
								return a < b
							else
								return WeaponA.Weight < WeaponB.Weight
							end
						else	
							return WeaponA.Slot < WeaponB.Slot
						end
					else
						return WeaponA.Rank < WeaponB.Rank
					end
					
				end )

				table.sort( AllowedKeys, function( a, b )
					local WeaponA = AllowedWeapons[a]
					local WeaponB = AllowedWeapons[b]
					local ply = LocalPlayer()
					if math.abs(WeaponA.Slot) == math.abs(WeaponB.Slot) then
						if WeaponA.Weight == WeaponB.Weight then
							return a < b
						else
							return WeaponA.Weight < WeaponB.Weight
						end
					else	
						return WeaponA.Slot < WeaponB.Slot
					end
				end )
				
				--PrintTable(ForbiddenWeapons)

				local ply = LocalPlayer()
				
				
				for i=1, #AllowedKeys do
					CM_DrawThing(LW,LH,SpaceOffset,i,AllowedKeys,List,AllowedListItem,AllowedWeapons,WeightValue,false)
				end
				
				--[[
				local Blocker =  List:Add("DPanel")
				Blocker:SetSize(LW - SpaceOffset,PanelHeight)
				Blocker.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 100, 100, 150 ), true,true,true,true )
				end
				--]]
				
				for j=1, #ForbiddenKeys do
					CM_DrawThing(LW,LH,SpaceOffset,j,ForbiddenKeys,List,ForbiddenListItem,ForbiddenWeapons,WeightValue,true)
				end
	
	
		local LW, LH = AnotherFrame:GetSize()
	
			local ButtonFrame = vgui.Create("DButton",BaseFrame)
				ButtonFrame:SetPos(SpaceOffset*2,SpaceOffset*2 + LH * 0.95)
				ButtonFrame:SetText("RESET LOADOUT")
				ButtonFrame:SetSize(LW - SpaceOffset*2,LH*0.05)
				ButtonFrame.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
					if self:IsHovered() then
						draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
					end
				end
				ButtonFrame.DoClick = function()
					CurrentLoadout = {"none"}
					--CurrentEquipment = {"none"}
					
					for k,v in pairs(AllowedListItem) do
						if v:IsValid() then
							v.IsCurrentlySelected = false
						end
					end
					
					for k,v in pairs(ForbiddenListItem) do
						if v:IsValid() then
							v.IsCurrentlySelected = false
						end
					end
					
					timer.Simple(0, function()
						CM_RedrawWeight(WeightValue)
					end)
					
					RunConsoleCommand("cm_editor_weapons", string.Trim(string.Implode(" ",CurrentLoadout)))
					--RunConsoleCommand("cm_editor_equipment", string.Trim(string.Implode(" ",CurrentEquipment)))
				end

	CM_RedrawWeight(WeightValue)
	
end

concommand.Add( "cm_menu", CM_ShowClassMenu)

local LastRank = 0
local LastSlot = 0

function CM_DrawThing(LW,LH,SpaceOffset,i,Keys,List,ListItem,CMWeapons,WeightValue,IsForbidden)

	local k = Keys[i]
	local v = CMWeapons[k]

	if not v then
		--List:Remove()
	return end
	
	if IsForbidden then
		if CM_IsRankEnabled() then
			if LastRank ~= v.Rank then

				local Blocker =  List:Add("DPanel")
				Blocker:SetSize(LW - SpaceOffset,LargeTitleFontSize + SpaceOffset)
				Blocker.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 100, 100, 150 ), true,true,true,true )
				end
				
				local BlockerText = vgui.Create("DLabel",Blocker)
				BlockerText:SetText("Requires " .. SimpleXPCheckRank(v.Rank))
				BlockerText:SetFont("ClassmodSmall")
				BlockerText:SetTextColor(TextColorBlack)
				BlockerText:SizeToContents()
				BlockerText:Center()

				LastRank = v.Rank
				
			end
		end
	else
		if LastSlot ~= v.Slot then
			local Blocker =  List:Add("DPanel")
			Blocker:SetSize(LW - SpaceOffset,LargeTitleFontSize + SpaceOffset)
			Blocker.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
			
			local TextTable = {}
			
			TextTable[1] = "Melee"
			TextTable[2] = "Sidearm"
			TextTable[3] = "Secondary"
			TextTable[4] = "Primary"
			TextTable[5] = "Equipment"
			TextTable[100] = "Special"
			
			if TextTable[v.Slot] then
				local BlockerText = vgui.Create("DLabel",Blocker)
				BlockerText:SetText(string.upper(TextTable[v.Slot]))
				BlockerText:SetFont("ClassmodLarge")
				BlockerText:SetTextColor(TextColorBlack)
				BlockerText:SizeToContents()
				BlockerText:Center()
			end

			LastSlot = v.Slot
		end
	end
	
	

	ListItem[i] = List:Add("DPanel")
	ListItem[i]:SetSize(LW/3 - SpaceOffset,PanelHeight)
	
	if table.HasValue(CurrentLoadout,k) then
		ListItem[i].IsCurrentlySelected = true
	else
		ListItem[i].IsCurrentlySelected = false
	end
	
	ListItem[i].Paint = function(self,w,h)
	
		local RedMod = 255
		local GreenMod = 255
		local BlueMod =  255
		
		if self.IsCurrentlySelected then
			RedMod = 0
			BlueMod = 0
		elseif not CM_CanSpawnWith(LocalPlayer(),k,false) then
			GreenMod = 0
			BlueMod = 0
		end

		draw.RoundedBoxEx( 4, 0, 0, w, h, Color( RedMod, GreenMod, BlueMod, 150 ), true,true,true,true )
		
	end
	
	local LW, LH = ListItem[i]:GetSize()
	
	local SWEP = weapons.GetStored(k)
	
	if SWEP or v.Equipment then
	
		local GetModel = "models/props_c17/lampShade001a.mdl"
		
		if v.IconModel then
			GetModel = v.IconModel
		elseif SWEP then
			GetModel = SWEP.WorldModel
			
			if SWEP.DisplayModel then
				GetModel = SWEP.DisplayModel
			end	
		end
		
		if GetModel and GetModel ~= "" then
		
			local ModelPanel = vgui.Create( "DModelPanel",ListItem[i] )
			ModelPanel:SetPos( SpaceOffset, SpaceOffset )
			ModelPanel:SetSize( PanelHeight, PanelHeight )
			ModelPanel:SetLookAt( Vector( 0,0,0 ) )
		--	ModelPanel:SetLookAng( Angle(0,0,0) )
			ModelPanel:SetFOV(10)
			ModelPanel:SetModel( GetModel )

		end

		local WeaponNameFrame = vgui.Create("DPanel",ListItem[i])
		WeaponNameFrame:SetPos(PanelHeight,SpaceOffset)
		WeaponNameFrame:SetSize(LW - PanelHeight - SpaceOffset*2,LargeTitleFontSize + SpaceOffset)
		WeaponNameFrame:SetText("")
		WeaponNameFrame.Paint = function(self,w,h)
			draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
		end
		
		--if CM_IsRankEnabled() then
		
			local DetailsFrame = vgui.Create("DPanel",ListItem[i])
			DetailsFrame:SetPos(PanelHeight,SpaceOffset*3 + LargeTitleFontSize)
			DetailsFrame:SetSize(LW - PanelHeight - SpaceOffset*2,TitleFontSize + SpaceOffset)
			DetailsFrame:SetText("")
			DetailsFrame.Paint = function(self,w,h)
				draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
			end
			
			local DetailsText = vgui.Create("DLabel",DetailsFrame)
			
			local ActualText = ""
			
			if CM_IsRankEnabled() and CM_IsCostEnabled() and v.Cost then
				ActualText = SimpleXPCheckRank(v.Rank) .. ", $" .. v.Cost
			elseif CM_IsRankEnabled() then
				ActualText = SimpleXPCheckRank(v.Rank)
			elseif CM_IsCostEnabled() and v.Cost then
				ActualText = "$" .. v.Cost
			end
			
			DetailsText:SetText(ActualText)
			DetailsText:SetFont("ClassmodSmall")
			DetailsText:SetTextColor(TextColorBlack)
			DetailsText:SizeToContents()
			DetailsText:Center()
			
		--end
		
		
		local PrintName = "No Name"
		
		if v.Name then
			PrintName = v.Name
		elseif SWEP then
			PrintName = SWEP.PrintName
		end	
		
		local WeaponNameText = vgui.Create("DLabel",WeaponNameFrame)
		WeaponNameText:SetText(PrintName .. " [" .. v.Weight .. "KG]")
		WeaponNameText:SetFont("ClassmodLarge")
		WeaponNameText:SetTextColor(TextColorBlack)
		WeaponNameText:SizeToContents()
		WeaponNameText:Center()

		local ButtonPanel = vgui.Create("DButton",ListItem[i])
		ButtonPanel:SetPos(SpaceOffset,SpaceOffset)
		ButtonPanel:SetText("")
		ButtonPanel:SetSize(LW - SpaceOffset*2,LH - SpaceOffset*2)
		ButtonPanel.DoClick = function()
		
			if ListItem[i].IsCurrentlySelected then
				CurrentLoadout = CM_RemoveWeapon(k,CurrentLoadout)
				ListItem[i].IsCurrentlySelected = false
			else
				if not CM_CanSpawnWith(LocalPlayer(),k,true) then
					surface.PlaySound( "buttons/weapon_cant_buy.wav" )
				else
					table.Add(CurrentLoadout,{k})
					ListItem[i].IsCurrentlySelected = true
				end
			end
			
			
			RunConsoleCommand("cm_editor_weapons", string.Trim(string.Implode(" ",CurrentLoadout)))
			
			timer.Simple(0, function()
				CM_RedrawWeight(WeightValue)
			end)
		
		end
		
		if SWEP then
			ButtonPanel.WeaponStats = BURGERBASE_CalculateWeaponStats(LocalPlayer(),SWEP,true)
		end
		
		
		ButtonPanel.Paint = function(self,w,h)
			if self:IsHovered() then
			
				if self.WeaponStats then
			
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 255 ), true,true,true,true )
				
				
					local Offset = 5
					local MaxWidth = w - Offset*2
					
					local TotalSpace = -5
					
					local DamageMod = math.Clamp(self.WeaponStats.damage/100,0,1)
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth, SpaceOffset, Color( 255, 0, 0, 150 ), true,true,true,true )
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth*DamageMod, SpaceOffset, Color( 255, 255, 0, 150 ), true,true,true,true )
					draw.DrawText( "Damage","ClassmodTiny",Offset*2,Offset*1.5 + TotalSpace,Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT )
					TotalSpace = TotalSpace + Offset*3
					
					local AccuracyMod = math.Clamp(self.WeaponStats.accuracy,0,1)
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth, SpaceOffset, Color( 255, 0, 0, 150 ), true,true,true,true )
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth*AccuracyMod, SpaceOffset, Color( 255, 255, 0, 150 ), true,true,true,true )
					draw.DrawText( "Accuracy","ClassmodTiny",Offset*2,Offset*1.5 + TotalSpace,Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT )
					TotalSpace = TotalSpace + Offset*3
					
					local FireRateMod = math.Clamp(self.WeaponStats.rpm/800,0,1)
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth, SpaceOffset, Color( 255, 0, 0, 150 ), true,true,true,true )
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth*FireRateMod, SpaceOffset, Color( 255, 255, 0, 150 ), true,true,true,true )
					draw.DrawText( "Firerate","ClassmodTiny",Offset*2,Offset*1.5 + TotalSpace,Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT )
					TotalSpace = TotalSpace + Offset*3
					
					local DPSMod = math.Clamp(self.WeaponStats.dps/600,0,1)
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth, SpaceOffset, Color( 255, 0, 0, 150 ), true,true,true,true )
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth*DPSMod, SpaceOffset, Color( 255, 255, 0, 150 ), true,true,true,true )
					draw.DrawText( "DPS","ClassmodTiny",Offset*2,Offset*1.5 + TotalSpace,Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT )
					TotalSpace = TotalSpace + Offset*3
					
					local RangeMod = math.Clamp(self.WeaponStats.range/6000,0,1)
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth, SpaceOffset, Color( 255, 0, 0, 150 ), true,true,true,true )
					draw.RoundedBoxEx( 2, Offset, Offset*2 + TotalSpace, MaxWidth*RangeMod, SpaceOffset, Color( 255, 255, 0, 150 ), true,true,true,true )
					draw.DrawText( "Range","ClassmodTiny",Offset*2,Offset*1.5 + TotalSpace,Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT )
					TotalSpace = TotalSpace + Offset*3
					
					
					
					--[[
					if SWEP.Description then
						draw.DrawText( SWEP.Description,"ClassmodTiny",Offset*2,Offset*1.5 + TotalSpace,Color( 0, 0, 0, 255 ), TEXT_ALIGN_LEFT )
					end
					--]]
				else
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 100 ), true,true,true,true )		
				end
				
				
				
				
				
				
			end
		end
		
		local Description = ""
		
		if v.Description then
			Description = v.Description
		elseif SWEP and SWEP.Description then
			Description = v.Description
		end	
		
		if Description ~= "" then
			ButtonPanel:SetTooltip(Description)
		end
		
		
	else
		ListItem[i]:Remove()
	end

end

function CM_RedrawWeight(WeightValue)

	local WeightLimit = GetConVar("sv_class_weightlimit"):GetFloat()
	local Weapons = string.Explode(" ",string.Trim(GetConVar("cm_editor_weapons"):GetString()))

	TotalWeight = 0
	
	for k,v in pairs(Weapons) do
		if not CMWeapons[v] then

		else
			TotalWeight = TotalWeight + CMWeapons[v].Weight
		end
	end
	
	local MovePercent = CM_GetMoveMul(TotalWeight) * 100

	WeightValue:SetText(TotalWeight .. "/" .. WeightLimit .. " (Mobility: " .. MovePercent .. "%)" )
	WeightValue:SizeToContents()
	WeightValue:Center()

	
end

function CM_OnSpawnMenuOpen()

	--[[
	if engine.ActiveGamemode() == "sandbox" then
		net.Start("CM_PlaceSpawn")	
			net.WriteBool(true)
		net.SendToServer()
	end
	--]]

end

hook.Add("OnSpawnMenuOpen","CM_OnSpawnMenuOpen",CM_OnSpawnMenuOpen)





