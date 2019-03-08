-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	state.Buff.Barrage = buffactive.Barrage or false
	state.Buff.Camouflage = buffactive.Camouflage or false
	state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Normal', 'Acc', 'Str', 'Att')
	
	gear.default.weaponskill_neck = "Ocachi Gorget"
	gear.default.weaponskill_waist = "Elanid Belt"
	
	DefaultAmmo = {['Yoichinoyumi'] = "Kabura arrow", ['Annihilator'] = "Silver bullet"}
	U_Shot_Ammo = {['Yoichinoyumi'] = "Combat Caster's arrow", ['Annihilator'] = "Achiyalabopa bullet"}

	select_default_macro_book()

	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind ^f9 gs c cycle WeaponskillMode')
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
	send_command('unbind f9')
	send_command('unbind ^f9')
end


-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Sylvan Glovelettes +2"}
	sets.precast.JA['Camouflage'] = {body="Hunter's Jerkin"}
	sets.precast.JA['Scavenge'] = {feet="Hunter's Socks"}
	sets.precast.JA['Shadowbind'] = {hands="Hunter's Bracers"}
	sets.precast.JA['Sharpshot'] = {legs="Hunter's Braccae"}


	-- Fast cast sets for spells

	sets.precast.FC = {ear2="Loquacious Earring",}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {body="Scout's Jerkin",	
		head="Zha'Go's Barbut",}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Zha'Go's Barbut",
		body="Kyudogi +1",
		hands="Skadi's bazubands",
		legs="Skadi's chausses",
		feet="Hachiryu Sune-Ate",
		neck="Faith Torque",
		waist="Scout's Belt",
		left_ear="Bushinomimi",
		right_ear="Harmonius Earring",
		ring1="Triumph Ring +1",
		ring2="Triumph Ring +1",
		back="Amemet Mantle +1"}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {body="Kyudogi +1"})
	sets.precast.WS.Str = set_combine(sets.precast.WS, {head="Wyvern Helm +1",neck="Ire torque +1", waist="Toxon belt +1"})
	sets.precast.WS.Att = set_combine(sets.precast.WS, {body="Kyudogi +1", feet="Scout's Socks", waist="Toxon belt +1", ring1="Cerberus ring +1", ring2="Cerberus ring +1", back="Gunner's Mantle",})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Sidewinder"] = {	
	head="Zha'Go's Barbut",
    body="Kirin's Osode",
    hands="Skadi's bazubands",
    legs="Dusk Trousers +1",
    feet="Scout's Socks",
    neck="Qiqirn Collar",
    waist="Venturer's Belt",
    left_ear="Genin Earring",
    right_ear="Drone Earring",
    ring1="Dragon Ring +1",
    ring2="Triumph Ring +1",
    back="Amemet Mantle +1"}
	-- sets.precast.WS["Sidewinder"].Acc = set_combine(sets.precast.WS["Sidewinder"],{neck="Peacock Amulet"})
	-- sets.precast.WS["Sidewinder"].Str = set_combine(sets.precast.WS["Sidewinder"].MidACC,{ring1="Dragon Ring +1", right_ear="Behemoth Ring +1"})
	sets.precast.WS["Slug Shot"] = set_combine(sets.precast.WS, {neck="Light Gorget",ring1="Dragon Ring +1", ring2="Behemoth Ring +1"})
	sets.precast.WS["Slug Shot"].Att = set_combine(sets.precast.WS, {neck="Light Gorget",body="Kyudogi +1", feet="Scout's Socks", ring1="Cerberus ring +1", ring2="Cerberus ring +1",})
	sets.precast.WS["Coronach"] = set_combine(sets.precast.WS, {neck="Qiqirn Collar",legs="Byakko's Haidate", left_ear="Genin Earring", right_ear="Drone Earring",back="Fowler's Mantle +1"})
	sets.precast.WS["Coronach"].Att = set_combine(sets.precast.WS["Coronach"], {body="Kyudogi +1", feet="Scout's Socks", legs="Skadi's chausses",ring1="Cerberus ring +1", ring2="Cerberus ring +1", back="Gunner's Mantle",})
	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {ear1="Loquacious Earring"}

	sets.midcast.Utsusemi = {head="Walahra Turban",
							hands="Dusk Gloves +1",
							legs="Byakko's haidate",
							feet="Dusk Ledelsens +1",
							waist="Sonic Belt +1"}

	-- Ranged sets

	sets.midcast.RA = {
		head="Zha'Go's Barbut",
		body="Kyudogi +1",
		hands="Skadi's bazubands",
		legs="Skadi's chausses",
		feet="Scout's Socks",
		neck="Faith Torque",
		waist="Scout's Belt",
		left_ear="Bushinomimi",
		right_ear="Harmonius Earring",
		ring1="Cerberus Ring +1",
		ring2="Cerberus Ring +1",
		back="Gunner's Mantle",}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{neck="Peacock Amulet",body="Kyudogi +1", hands="Seiryu's Kote",ring1="Behemoth ring +1",ring2="Dragon Ring +1",left_ear="Drone Earring",back="Amemet Mantle +1",})

	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA, {neck="Faith Torque"})

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc, {neck="Faith Torque"})

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {neck="Hope Torque"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {neck="Hope Torque"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
	head="Blood Mask",
    body="Kirin's Osode",
    hands="Skadi's bazubands",
    legs="Blood Cuisses",
    feet="Areion Boots +1",
    neck="Hope Torque",
    waist="Scout's Belt",
    left_ear="Bushinomimi",
    right_ear="Brutal Earring",
    ring1="Defending Ring",
    ring2="Rajas Ring",
    back="Lamia Mantle +1"}
	
	-- Defense sets
	sets.defense.PDT = {
		head="Blood Mask",
		body="Blood Scale Mail",
		hands="Seiryu's Kote",
		legs="Blood Cuisses",
		feet="Areion Boots +1",
		neck="Qiqirn Collar",
		waist="Sonic Belt +1",
		left_ear="Velocity Earring",
		right_ear="Cassie Earring",
		ring1="Defending Ring",
		ring2="Merman's Ring",
		back="Lamia Mantle +1",}

	sets.defense.MDT = {
		head="Coral Visor +1",
		body="Kyudogi +1",
		hands="Merman's Bangles",
		neck="Jeweled Collar +1",
		waist="Resolute Belt",
		left_ear="Merman's Earring",
		right_ear="Merman's Earring",
		ring1="Defending Ring"}

	sets.Kiting = {legs="Blood Cuisses",feet="Areion Boots +1",}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		head="Walahra Turban",
		body="Kirin's Osode",
		hands="Dusk Gloves +1",
		legs="Byakko's Haidate",
		feet="Dusk Ledelsens +1",
		neck="Ancient Torque",
		waist="Sonic Belt +1",
		left_ear="Bushinomimi",
		right_ear="Brutal Earring",
		ring1="Toreador's Ring",
		ring2="Toreador's Ring",
		back="Amemet Mantle +1"}

	sets.engaged.Acc = {}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {ring2="Behemoth ring +1"})
	sets.buff.Camouflage = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
	end

	if spell.action_type == 'Ranged Attack' or
	  (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
		check_ammo(spell, action, spellMap, eventArgs)
	end
	
	if state.DefenseMode.value ~= 'None' and spell.type == 'WeaponSkill' then
		-- Don't gearswap for weaponskills when Defense is active.
		eventArgs.handled = true
	end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
		equip(sets.buff.Barrage)
		eventArgs.handled = true
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == "Camouflage" then
		if gain then
			equip(sets.buff.Camouflage)
			disable('body')
		else
			enable('body')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Check for proper ammo when shooting or weaponskilling
function check_ammo(spell, action, spellMap, eventArgs)
	-- Filter ammo checks depending on Unlimited Shot
	if state.Buff['Unlimited Shot'] then
		if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
			if player.inventory[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
				equip({ammo=U_Shot_Ammo[player.equipment.range]})
			elseif player.inventory[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
				equip({ammo=DefaultAmmo[player.equipment.range]})
			else
				add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
			end
		end
	else
		if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
			if DefaultAmmo[player.equipment.range] then
				if player.inventory[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Removing Unlimited Shot ammo.")
					equip({ammo=empty})
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Removing Unlimited Shot ammo.")
				equip({ammo=empty})
			end
		elseif player.equipment.ammo == 'empty' then
			if DefaultAmmo[player.equipment.range] then
				if player.inventory[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Leaving empty.")
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Leaving empty.")
			end
		elseif player.inventory[player.equipment.ammo].count < 15 then
			add_to_chat(122,"Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low ("..player.inventory[player.equipment.ammo].count..")")
		end
	end
end



-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 11)
end
