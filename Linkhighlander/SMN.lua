toau_zones = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
        "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}



-- 122/132 total cards to finish hands,legs,feet+3
-- ================================= NOTES =======================================
-- Ifrit normal TP per hit = 95
-- Neck extra TP = 25/tic
s_tp = 0
e_tp = 0
leech = false
mb = false

getbayld = false
ac_bp = "Volt Strike"
bp_gb = "Thunderstorm"
include('organizer-lib')
function get_sets()
 
   -- Get SMN Gearsets
	include('smn_Gearsets.lua')   
--======================================== SKILLCHAIN ===================================
-- Light (Fragmentation <-> Fusion)
-- Predator Claws <-> Garland of Bliss (Fusion/Reverberation)
-- Volt Strike <-> Garland of Bliss / Atonement

-- Savage Blade (Fragmentation/Scission) <-> Flaming Crush (Fusion/Reverberation)

-- Darkness (Gravitation <-> Distortion)
-- Rush (Distortion/Scission) <-> Shattersoul (Gravitation/Induration)
-- Spinning Dive (Distortion/Detonation) <-> Shattersoul (Gravitation/Induration)

--======================================== FOODIES ============================
-- Shiro - Acc+14%
-- Kusa - Att+20%
-- Aka - Acc+11% Att+16%
-- Grape - Acc+11% MAC+15
-- Rolan - Acc+11% Macc+? (720 acc ~> 10% = +72 - Max 66!)

-- Sole Sushi (Acc+76) 
-- Salt Ramen (Acc+90)
-- Sublime Sushi (Acc+100)

--======================================== CORSAIR ROLLS ================================================
-- Drachen Roll - Pet Accuracy
-- Beast Roll - Pet Attack
-- Evokers Roll - MP
-- Puppet Roll - Pet Macc + Pet Mab
-- Companion Roll - Pet Regain + Pet Refresh
--========================================BPS CATEGORIES ================================================	
    --===================DEBUFF QUICK INFO ==========================
	--Rock Throw: Slow
	--Shock Strike: Stun
	--Deconstruction & Chronoshift: Absorb-Attributes & Gives it to pt 14'
	--Poison Nails: Poison
	--Moonlit Charge: Blind
	--Crescent Fang: Paralyze
	
--========================== CALCS
-- MAB+25 <=> BP+11%
-- MAB+8 <=> BP+x
-- x = (8*0.11)/25 = 3.52%
	Debuff_BPs = T{'Diamond Storm','Sleepga','Slowga','Tidal Roar','Shock Squall','Nightmare','Pavor Nocturnus',
	'Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar','Mewing Lullaby','Poison Nails', 'Moonlit Charge',
	'Shock Strike','Crescent Fang'}
	
    ward_debuff = T{'Somnolence','Lunar Cry','Mewing Lullaby','Nightmare','Lunar Roar','Slowga','Ultimate Terror','Sleepga',
	'Eerie Eye','Tidal Roar','Shock Squall','Pavor Nocturnus'}
	
	Additional_effect_BPs = T{'Rock Throw','Deconstruction','Chronoshift'}  
	
	
-- ==================MAGIC DMG=============================================	
	--==================== MAGIC DMG QUICK INFO ======================
	--Thunderspark: AoE & Paralyze
	
	Magical_BPs_affected_by_TP = T{'Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm','Holy Mist','Night Terror',
	'Lunar Bay','Thunderspark','Impact'} 
	
    Magical_BPs_unaffected_by_TP = T{'Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen'}
    	
--  ====================PHYSICAL===========================================
	Physical_BP=T{'Punch','Barracuda Dive','Claw','Axe Kick','Camisado','Regal Scratch',
	'Predator Claws','Chaotic Strike','Volt Strike','Spinning Dive','Rush'}
    
	Blunt=T{'Punch','Rock Throw','Axe Kick','Shock Strike','Moonlit Charge'}
	Slashing=T{'Barracuda Dive'}
	Piercing=T{'Claw','Poison Nails','Crescent Fang'}
	Unknown_Type=T{'Camisado','Regal Scratch','Deconstruction'}
	
--	=====================WARD===============================================	
	ward_buff_instant = T{'Healing Ruby','Raise II','Reraise II','Whispering Wing','Spring Water','Healing Ruby II','Soothing Ruby','Pacifying Ruby'}
	ward_buff_flat = T{'Aerial Armor','Earthern Ward'}
	ward_buff_varduration = T{'Shining Ruby','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl',
	'Glittering Ruby','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Inferno Howl','Diamond Storm',
	'Heavenward Howl','Hastega II','Soothing Current','Crystal Blessing'}
	
--=========================================================================================================
	
	AvatarList = T{'Shiva','Ramuh','Garuda','Leviathan','Diabolos','Titan','Fenrir','Ifrit','Carbuncle',
        'Fire Spirit','Air Spirit','Ice Spirit','Thunder Spirit','Light Spirit','Dark Spirit','Earth Spirit','Water Spirit',
        'Cait Sith','Alexander','Odin','Atomos'}
		
    send_command('input /macro book 1;input /macro set 3;')
	--wait .1;input /macro set 1;exec smn.txt')
	state = false
	VW_SMN_proc = ""
	Max_MAB_BP = "Meteor Strike"
end

function pet_change(pet,gain)
    idle()
end

function precast(spell)
--print('precast')
    if midaction() or pet_midaction() then
		if not (spell.name == "Convert") then 
			cancel_spell()
			return
		end
    end
	if buffactive['Astral Conduit'] then
        return
    end
	if spell.type == "WeaponSkill" then
		
        if sets.precast.WS[spell.name] then
            equip(sets.precast.WS[spell.name])
        end
	elseif spell.type == "WhiteMagic" or spell.type=="SummonerPact" then
		
		equip(sets.precast.FC)
		if string.find(spell.english,'Cur') then
			equip(set_combine(sets.precast.FC,sets.precast.Cur))
		end
	end
	 if string.find(spell.type,'BloodPact') then
	equip(sets.midcast.BP)
	end
end

function help()
windower.add_to_chat(8,'============ HELP MENU ==============')
windower.add_to_chat(8,'======== PLAIN JAR - Blunt ==========')
windower.add_to_chat(8,'Volt Strike')
windower.add_to_chat(8,'Crag Throw')
windower.add_to_chat(8,'====== GREEN BARS - Piercing ========')
windower.add_to_chat(8,'Crescent Fang - Fenrir')
windower.add_to_chat(8,'Poison Nails - Carby')
windower.add_to_chat(8,'Claw - Garuda')
windower.add_to_chat(8,'======== PINK RINGS - Slashing ==========')
windower.add_to_chat(8,'Predator Claws')
windower.add_to_chat(8,'Spinning Dive')
windower.add_to_chat(8,'Eclipse Bite')
windower.add_to_chat(8,'Blindside - Diabolos')
windower.add_to_chat(8,'====================================')
end
function midcast(spell)
--print('midcast')
  if midaction() or pet_midaction() then
		if not (spell.name == "Convert") then 
	
			return
		end
    end
    -- if string.find(spell.type,'BloodPact') then
        -- if buffactive['Astral Conduit'] then
            -- pet_midcast(spell)
        -- else
				
				-- equip(sets.midcast.BP)
				
		
        -- end
    --else
	if string.find(spell.english,'Cur') then
        equip(sets.midcast.Cur)
    elseif sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
		if string.find(spell.english,'Stoneskin') then
		send_command('@wait 3.8;cancel 37;')
		end
	elseif spell.skill == "Enfeebling Magic" then
	equip(sets.midcast.Enfeebling)
	
	elseif string.find(spell.english,'Garland')then
	
	equip(sets.precast.WS[spell.name])
    else
	--print('midcast-idle')
      --  idle()
    end
end

function aftercast(spell)
--print('aftercast')
      if midaction() or pet_midaction() then
		return
    end
    if buffactive['Astral Conduit'] then
	if spell.name == "Convert" then
		windower.send_command("input /pet "..ac_bp.." <t>")
	end
        return
    end
	
    if spell.name and (not spell.type or not string.find(spell.type,'BloodPact') and not AvatarList:contains(spell.name) or spell.interrupted) then -- and spell.name ~= 'Release'
        -- Don't want to swap away too quickly if I'm about to put BP damage gear on
        -- Need to wait 1 in order to allow pet information to update on Release.
	--print('here')
        idle()
    end
	
	
	if AvatarList:contains(spell.name) then
	--print('here2')
	idle()
	end
	if player.status == 'Engaged' then
	equip(sets.aftercast.Engaged)
	end
	
	--end
	--print(pet.status)
end

function status_change(new,old)
    if new=='Idle' then
	--print('stat_change_idle')
        idle()
		
    elseif new=='Resting' then
        equip(sets.aftercast.Resting)
	elseif  new == 'Engaged' then
        equip(sets.aftercast.Engaged)
    end
	
end



function pet_midcast(spell)
	
	if spell.type=='BloodPactRage' then

		if Physical_BP:contains(spell.name) then
            equip(sets.pet_midcast.Phys_BP)
		
		elseif spell.name == 'Flaming Crush' then
			equip(sets.pet_midcast.FlamingCrush)
			
		elseif Additional_effect_BPs:contains(spell.name) or Debuff_BPs:contains(spell.name) then
            equip(sets.pet_midcast.MAcc_BP)

		--=========================MAGIC BPs===============================
		--Magic II and IV is also affected by TP
		elseif Magical_BPs_affected_by_TP:contains(spell.name) or string.find(spell.name,' II') or string.find(spell.name,' IV') then
			if (mb==false) then
				if spell.name == Max_MAB_BP then -- ==== IF 5/5 BP use apoge legs
				equip(sets.pet_midcast.MAB_NO_TP_BP)
				else                            -- ==== IF 1/5 BP use enticers legs
				equip(sets.pet_midcast.MAB_TP_BP)
				end
			elseif (mb==true) then               --================================ MB MODE ==================
				if spell.name == Max_MAB_BP then -- ==== IF 5/5 BP use apoge legs
				equip(sets.pet_midcast.MAB_NO_TP_BP_MB)
				else                            -- ==== IF 1/5 BP use enticers legs
				equip(sets.pet_midcast.MAB_TP_BP_MB)
				end
			end
		elseif Magical_BPs_unaffected_by_TP:contains(spell.name) then
			equip(sets.pet_midcast.MAB_No_TP_BP)
			
		
			
		end
	elseif spell.type=='BloodPactWard' then
		if Debuff_BPs:contains(spell.name) then
		equip(sets.pet_midcast.MAcc_BP)
		
		elseif ward_buff_varduration:contains(spell.name) then
		equip(sets.pet_midcast.Buff_BP)
		
		elseif spell.name=='Whispering Wind' or spell.name=='Spring Water' 
		or spell.name=='Healing Ruby' or spell.name=='Healing Ruby II' then
		equip(sets.pet_midcast.Heal_BP)
		
		end
	
	end
	
end


function pet_aftercast(spell)
if buffactive['Astral Conduit']  then
	
	if player.mp <= 250 then
		print('mp issues')
		windower.send_command("input /ja 'Convert' <me>")
end

return
else
--print('pick')
idle()

end


end
function dream_shroud()


if world.time >=0 and world.time < 60 then
send_command('input /echo MAB+13 & MBD+1')

elseif (world.time >=60 and world.time < 120) or (world.time >=1380 and world.time < 1439) then
send_command('input /echo MAB+12 & MBD+2')

elseif (world.time >=120 and world.time < 180) or (world.time >=1320 and world.time < 1380) then
send_command('input /echo MAB+11 & MBD+3')

elseif (world.time >=180 and world.time < 240) or (world.time >=1260 and world.time < 1320) then
send_command('input /echo MAB+10 & MBD+4')

elseif (world.time >=240 and world.time < 300) or (world.time >=1200 and world.time < 1260) then
send_command('input /echo MAB+9 & MBD+5')

elseif (world.time >=300 and world.time < 360) or (world.time >=1140 and world.time < 1200) then
send_command('input /echo MAB+8 & MBD+6')

elseif (world.time >=360 and world.time < 420) or (world.time >=1080 and world.time < 1140) then
send_command('input /echo MAB+7 & MBD+7')

elseif (world.time >=420 and world.time < 480) or (world.time >=1020 and world.time < 1080) then
send_command('input /echo MAB+6 & MBD+8')

elseif (world.time >=420 and world.time < 480) or (world.time >=960 and world.time < 1020) then
send_command('input /echo MAB+5 & MBD+9')

elseif (world.time >=480 and world.time < 540) or (world.time >=900 and world.time < 960) then
send_command('input /echo MAB+4 & MBD+10')

elseif (world.time >=540 and world.time < 600) or (world.time >=840 and world.time < 900) then
send_command('input /echo MAB+3 & MBD+11')

elseif (world.time >=600 and world.time < 660) or (world.time >=780 and world.time < 840) then
send_command('input /echo MAB+2 & MBD+12')

elseif world.time >=720 and world.time < 780 then
send_command('input /echo MAB+1 & MBD+13')

end
end

function whois_dmgtype(Dmg_type)
if Dmg_type:upper() == 'BLUNT' then 
--print(Blunt)
elseif Dmg_type:upper() == 'PIERCING' then
--print(Piercing)
end
end
function whois_avatar(BP)

if Fenrir:contains(BP) then
--print('Fenrir')
end
end



function self_command(command)

    if command == 'Idle' then
        idle()
	elseif command == 'gc' then
    gear_collector.run(sets)
	elseif command == 't' then
	call_trusts()
	elseif command == 'help' then
	help()
	
		elseif command == 'gb' then
		if getbayld then
			getbayld = false
			
		elseif getbayld == false then
			getbayld = true
		end
		--print(getbayld)
	elseif	command == "Siphon" then
	check_day()
	elseif command == "BPMagic" then
	BP_Magic(state)
	elseif command == "BPPhy" then
	BP_Physical()
	elseif command == "BPBuff" then
	BPBuff()
	elseif command == "VWclear" then
	VW_SMN_proc = ""
	send_command('input /echo VW_SMN_proc clear')
	elseif command == "ds" then
	dream_shroud()
	elseif string.find(command,"wdt") then
	t = command:split(' ')
	whois_dmgtype(t[2])
	elseif command == "leech" then
		if leech then
			leech = false
			
		elseif leech == false then
			leech = true
		end
		--print(leech)
	elseif command == "mb" then
		if mb then
			mb = false
			
		elseif mb == false then
			mb = true
		end
		--print('MB Mode Change')
		--print(mb)
    end
end

function BPBuff()

if string.find(pet.name,'Garuda') then
BP = 'Whispering Wind'
Dbuff = false
elseif string.find(pet.name,'Leviathan') then
BP = 'Spring Water'
Dbuff = false
elseif string.find(pet.name,'Shiva') then
BP = 'Sleepga'
Dbuff = true
elseif string.find(pet.name,'Titan') then
BP = 'Earthen Ward'
Dbuff = false
elseif string.find(pet.name,'Carbuncle') then
BP='Healing Ruby II'
Dbuff = false
elseif string.find(pet.name,'Ifrit') then
BP='Crimson Howl'
Dbuff = false
elseif string.find(pet.name,'Ramuh') then
BP='Shock Squall'
Dbuff = true
elseif string.find(pet.name,'Diabolos') then
BP='Pavor Nocturnus'
Dbuff = false
elseif string.find(pet.name,'Fenrir') then
if  string.find(world.moon,'Gibbous') or  string.find(world.moon,'Full') or  string.find(world.moon,'First Quarter') then
BP='Heavenward Howl'
Dbuff = false
else
send_command('input /echo Not Endrain phase')
end

end
if Dbuff then
send_command('input /pet '..BP..' <t>')
else
send_command('input /pet '..BP..' <me>')
end
end

function BP_Magic(state)

if string.find(pet.name,'Garuda') then
	if (state==true) then
		BP = 'Aero IV'
		VW_SMN_proc = VW_SMN_proc.." | Garuda"
	else
		BP = 'Wind Blade'
		
	end
	
end
if string.find(pet.name,'Shiva') then
	if (state==true) then
		BP = 'Blizzard IV'
		VW_SMN_proc = VW_SMN_proc.." | Shiva"
	else
		BP = 'Heavenly Strike'
	end
	
end

if string.find(pet.name,'Cait Sith') then
	if (state==true) then
		BP = 'Mewing Lullaby'
		VW_SMN_proc = VW_SMN_proc.." | Shiva"
	else
		BP = 'Mewing Lullaby'
	end
	
end

if string.find(pet.name,'Fenrir') then
	if (state==true) then
		BP = 'Lunar Bay'
		VW_SMN_proc = VW_SMN_proc.." | Fenrir"
	else
		BP = 'Impact'
	end
	
end

if string.find(pet.name,'Carbuncle') then
	if (state==true) then
		BP = 'Holy Mist'
		VW_SMN_proc = VW_SMN_proc.." | Carby"
	else
		BP = 'Holy Mist'
	end
	
end

if string.find(pet.name,'Diabolos') then
	if (state==true) then
		BP = 'Night Terror'
		VW_SMN_proc = VW_SMN_proc.." | Diabolos"
	else
		BP = 'Night Terror'
	end
	
end

if string.find(pet.name,'Ifrit') then
	if (state==true) then
		BP = 'Fire IV'
		VW_SMN_proc = VW_SMN_proc.." | Ifrit"
	else
		--s_tp = pet.TP*10
		----print('Start: '..s_tp)
		
		BP = 'Meteor Strike'
	end
	
end

if string.find(pet.name,'Titan') then
	if (state==true) then
		BP = 'Stone IV'
		VW_SMN_proc = VW_SMN_proc.." | Titan"
	else
		BP = 'Geocrush'
	end
	
end

if string.find(pet.name,'Ramuh') then
	if (state==true) then
		BP = 'Thunder IV'
		VW_SMN_proc = VW_SMN_proc.." | Ramuh"
	else
		BP = 'Thunderstorm'
	end
	
end

if string.find(pet.name,'Leviathan') then
	if (state==true) then
		BP = 'Water IV'
		VW_SMN_proc = VW_SMN_proc.." | Levi"
	else
		BP = 'Grand Fall'
	end
	
end

send_command('input /pet '..BP..' <t>')
send_command('input /echo '..VW_SMN_proc)
end
function BP_Physical()

if string.find(pet.name,'Garuda') then
		BP = 'Predator Claws'
	
	
end
if string.find(pet.name,'Shiva') then
		BP = 'Rush'
end

if string.find(pet.name,'Fenrir') then
		BP = 'Eclipse Bite'
end

if string.find(pet.name,'Carbuncle') then

		BP = 'Holy Mist'

	
end

if string.find(pet.name,'Diabolos') then

		BP = 'Night Terror'

	
end

if string.find(pet.name,'Ifrit') then
		
		BP = 'Flaming Crush'

	
end

if string.find(pet.name,'Titan') then

		BP = 'Geocrush'

	
end

if string.find(pet.name,'Ramuh') then

		BP = 'Volt Strike'
	
	
end

if string.find(pet.name,'Leviathan') then
	BP = 'Spinning Dive'
	
end

send_command('input /pet '..BP..' <t>')

end
function buff_change(buff,gain)
if buff =='Voidwatcher' and gain==true then
--state = gain
VW_SMN_proc = ""
--windower.send_command('@wait 3;input /ma "Stoneskin" <me>')
--windower.send_command('@wait 9;input /pet "Flaming Crush" <bt>')
--windower.send_command('@wait 41;input /pet "Flaming Crush" <bt>')


end


end

function check_day()
----print(world.day_element)
if string.find(world.weather_element,'Fire') then
send_command('input /ma "Fire Spirit" <me>')
elseif string.find(world.weather_element,'Ice') then
send_command('input /ma "Ice Spirit" <me>')
elseif string.find(world.weather_element,'Wind') then
send_command('input /ma "Air Spirit" <me>')
elseif string.find(world.weather_element,'Earth') then
send_command('input /ma "Earth Spirit" <me>')
elseif string.find(world.weather_element,'Water') then
send_command('input /ma "Water Spirit" <me>')
elseif string.find(world.weather_element,'Lightning') then
send_command('input /ma "Thunder Spirit" <me>')
elseif string.find(world.weather_element,'Light') then 
send_command('input /ma "Light Spirit" <me>')
elseif string.find(world.weather_element,'Dark') then
send_command('input /ma "Dark Spirit" <me>')



elseif string.find(world.day_element,'Fire') then
send_command('input /ma "Fire Spirit" <me>')
elseif string.find(world.day_element,'Ice') then
send_command('input /ma "Ice Spirit" <me>')
elseif string.find(world.day_element,'Wind') then
send_command('input /ma "Air Spirit" <me>')
elseif string.find(world.day_element,'Earth') then
send_command('input /ma "Earth Spirit" <me>')
elseif string.find(world.day_element,'Water') then
send_command('input /ma "Water Spirit" <me>')
elseif string.find(world.day_element,'Lightning') then
send_command('input /ma "Thunder Spirit" <me>')
elseif string.find(world.day_element,'Light') then
send_command('input /ma "Light Spirit" <me>')
elseif string.find(world.day_element,'Dark') then
send_command('input /ma "Dark Spirit" <me>')
end
send_command('@wait 5;input /ja "Elemental Siphon" <me>')
send_command('@wait 8;input /pet "Release" <me>')

end

function call_trusts()

send_command('input /ma "August" <me>')
send_command('@wait 9;input /ma "Apururu (UC)" <me>')
send_command('@wait 18;input /ma "Koru-Moru" <me>')
send_command('@wait 27;input /ma "Zeid II" <me>')
send_command('@wait 36;input /ma "Ulmia" <me>')
send_command('@wait 45;input /pet "Release" <me>')
send_command('@wait 50;input /ma "Garuda" <me>')

end

function idle()

 --print('idle')
----print(pet.name)
    if pet.isvalid then
	

		--send_command('input /echo Hi There pet '..world.area)
     --if string.find(pet.name,'Spirit') then
     --       equip(sets.aftercast.Avatar.Spirit[pet.name])
			
      if buffactive["Avatar's Favor"] then
           equip(sets.aftercast.Perp_Base)
				--equip(sets.aftercast.Favor)
		
			
      else
		--print('no favor')
	
	equip(sets.aftercast.Perp_Base)
           -- if sets.aftercast.Avatar[pet.name] then
             --   equip(sets.aftercast.Avatar[pet.name])
				
            --end
		
        end
	else
	if leech then
	equip(set_combine(sets.aftercast.Idle),{back="Mecistopins mantle"})
	else
	--print('not leeching')
		if player.hpp < 50 then
			equip(sets.aftercast.Idle) --usar so phy dmg taken
		elseif player.mpp < 75 then
			equip(sets.aftercast.Idle)  --usar so recuperar mp
			--equip(sets.aftercast.Perp_Base2)  --usar so recuperar mp
		else
		
			equip(sets.aftercast.Idle)  --usar misto
			--equip(sets.aftercast.Perp_Base2)  --usar misto
		end
    end
	end
if string.find(world.area,'Remna') then
--	if toau_zones.contains(world.area) then
	--send_command('input /echo Hi There zone')
		--equip({ring2="Balrahn's Ring"})
	
	end
	

	
end

local clock = os.clock

function sleep(n)
  local t0 = clock()

  while clock() - t0 <= n do
  end
end
function check_incoming_text(original, modified, original_mode, modified_mode, blocked)

 if (original:find("A Wildskeeper") ~= nil ) then
      windower.send_command("input /party <scall11> Jump on the bandWAGON!!")
--       return
elseif (original:find("Ability cast") ~= nil ) then  
	windower.send_command("input /party ============= 1HR is up again LEROOY <scall11> =================")
--	return
elseif (original:find("victorious") ~= nil ) then  
	windower.send_command("input /party ==== Warping~~ <scall14>")
	windower.send_command("input /ma 'Warp' <me>")
	return
elseif (original:find("GBON") ~= nil ) then  
	--windower.send_command("input /party ============= Next BP Going =================")
	if getbayld==true then
		k = windower.ffxi.get_ability_recasts()
		if k[173] == 0 then
			--	if string.find(pet.name,'Ifrit') then
			--		windower.send_command("input /pet 'Flaming Crush' <t>")
			--	elseif string.find(pet.name,'Ramuh') then
			--		windower.send_command("input /pet 'Thunderstorm' <t>")
			--	else		
					windower.send_command("input /pet "..bp_gb.." <t>")
			--	end
		
		end
	end
	
	return
elseif (original:find("defeats") ~= nil ) then  
	      windower.send_command("input /t Briga look at the chest!")

return
end

end

--windower.register_event('incoming text', check_incoming_text)

