local DefaultWeapons = "weapon_cs_m4 weapon_cs_usp weapon_cs_knife weapon_cs_he"

CreateClientConVar("cm_editor_weapons",DefaultWeapons,true,true)

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
	
	local ListItem = {}
	
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
				
				local PanelHeight = 100
				
				for i=1, #Keys do
				
					local k = Keys[i]
					local v = CMWeapons[k]
					
					
				
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
						elseif CM_CanNotSpawnWith(v.Slot) then
							GreenMod = 0
							BlueMod = 0
						end
						
						draw.RoundedBoxEx( 4, 0, 0, w, h, Color( RedMod, GreenMod, BlueMod, 150 ), true,true,true,true )
						
					end
					
					local LW, LH = ListItem[i]:GetSize()
					
					local SWEP = weapons.GetStored(k)
					
					if SWEP or k == "weapon_physgun" then
					
						local GetModel = ""
						
						if SWEP then
							GetModel = SWEP.WorldModel
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

						local ButtonPanel = vgui.Create("DButton",ListItem[i])
						ButtonPanel:SetPos(SpaceOffset,SpaceOffset)
						ButtonPanel:SetText("")
						ButtonPanel:SetSize(LW - SpaceOffset*2,LH - SpaceOffset*2)
						ButtonPanel.DoClick = function()
						
							if ListItem[i].IsCurrentlySelected then
								CurrentLoadout = CM_RemoveWeapon(k,CurrentLoadout)
								ListItem[i].IsCurrentlySelected = false
							else
								if CM_CanNotSpawnWith(v.Slot) then
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
						ButtonPanel.Paint = function(self,w,h)
							--draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
						end
						
						
						
					end

				end
	
		local LW, LH = AnotherFrame:GetSize()
	
			local ButtonFrame = vgui.Create("DButton",BaseFrame)
				ButtonFrame:SetPos(SpaceOffset*2,SpaceOffset*2 + LH * 0.95)
				ButtonFrame:SetText("RESET LOADOUT")
				ButtonFrame:SetSize(LW - SpaceOffset*2,LH*0.05)
				ButtonFrame.Paint = function(self,w,h)
					draw.RoundedBoxEx( 4, 0, 0, w, h, Color( 255, 255, 255, 150 ), true,true,true,true )
				end
				ButtonFrame.DoClick = function()
					CurrentLoadout = {"none"}
					for k,v in pairs(ListItem) do
						v.IsCurrentlySelected = false
					end
					
					timer.Simple(0, function()
						CM_RedrawWeight(WeightValue)
					end)
					
					RunConsoleCommand("cm_editor_weapons", string.Trim(string.Implode(" ",CurrentLoadout)))
				end

	CM_RedrawWeight(WeightValue)
	
end

concommand.Add( "cm_menu", CM_ShowClassMenu)

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

	WeightValue:SetText(TotalWeight .. "/" .. WeightLimit)
	WeightValue:SizeToContents()
	WeightValue:Center()
	
end
