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
	state.Buff['Double Shot'] = buffactive['Double Shot'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc', 'DoubleShot')
	state.WeaponskillMode:options('Normal', 'Acc', 'DoubleShot')
	
	gear.default.weaponskill_neck = "Fotia Gorget"
	gear.default.weaponskill_waist = "Fotia Belt"
	
	DefaultAmmo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Fomalhaut'] = "Chrono Bullet"}
	U_Shot_Ammo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Fomalhaut'] = "Chrono Bullet"}

	select_default_macro_book()

	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind ^f9 gs c cycle OffenseMode')
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
	sets.precast.JA['Bounty Shot'] = {hands="Amini Glove. +1",}
	sets.precast.JA['Eagle Eye Shot'] = {
		head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
        body="Nisroch Jerkin",
        hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
        legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
		--feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}},
        neck="Iskur Gorget",
        waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		--right_ear="Dedition Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring", 
        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
		}
	sets.precast.JA['Camouflage'] = {body= "Orion Jerkin +2"}
	sets.precast.JA['Scavenge'] = {feet="Hunter's Socks"}
	sets.precast.JA['Shadowbind'] = {hands= "Orion Bracers +2"}
	sets.precast.JA['Sharpshot'] = {legs= "Orion Braccae +1"}
	sets.precast.JA['Barrage'] = {hands= "Orion Bracers +2"}


	-- Fast cast sets for spells

	sets.precast.FC = {
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		feet="Carmine Greaves",
		neck="Orunmila's Torque",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Orunmila's Torque"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
		body="Oshosi Vest",
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
		feet="Meg. Jam. +2",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Ilabrat Ring",
		right_ring="Dingir Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','"Snapshot"+10',}},
	}


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		head="Orion Beret +3",
		body={ name="Arc. Jerkin +3", augments={'Enhances "Snapshot" effect',}},
		hands="Meg. Gloves +2",
		legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Telos Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Dingir Ring", 
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
}

	sets.precast.WS["Jishnu's Radiance"] = {
		head={ name="Herculean Helm", augments={'Rng.Atk.+21','Crit.hit rate+3','STR+9','Rng.Acc.+8',}},
		body="Nisroch Jerkin",
		hands="Kobo Kote",
		legs="Jokushu Haidate",
		feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Regal Ring",
		right_ring="Begrudging Ring", 
		back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+10',}},
}
	sets.precast.WS['Trueflight'] = {
		head="Orion Beret +3",
		body={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+10','Weapon skill damage +5%','STR+6','Mag. Acc.+10',}},
		neck="Sanctity Necklace",
		waist="Hachirin-no-Obi",
		--waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		right_ring="Weather. Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
}
	
	sets.precast.WS['Wildfire'] = {
		head="Orion Beret +3",
		body={ name="Samnuha Coat", augments={'Mag. Acc.+14','"Mag.Atk.Bns."+13','"Fast Cast"+4','"Dual Wield"+3',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Arc. Braccae +3", augments={'Enhances "Eagle Eye Shot" effect',}},
		feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+10','Weapon skill damage +5%','STR+6','Mag. Acc.+10',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		right_ring="Regal Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},
}
	sets.precast.WS.Acc = {
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
		legs="Meg. Chausses +2"
		}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		feet="Carmine Greaves",
		neck="Orunmila's Torque",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		right_ring="Weather. Ring",
	}

	sets.midcast.Utsusemi = {
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		feet="Carmine Greaves",
		neck="Orunmila's Torque",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		right_ring="Weather. Ring",
		}

	-- Ranged sets
	
	sets.midcast.RA = {
	    head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
        body="Nisroch Jerkin",
        hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
        legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
		feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
		--feet={ name="Adhemar Gamashes", augments={'HP+50','"Store TP"+6','"Snapshot"+8',}},
        neck="Iskur Gorget",
        waist="Yemaya Belt",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		--right_ear="Dedition Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring", 
        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
	}
	
	sets.midcast.DoubleShot = {
	    head="Oshosi Mask",
        body="Oshosi Vest",
        hands="Oshosi Gloves",
        legs="Oshosi Trousers",
		feet="Oshosi Leggings",
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
        left_ring="Ilabrat Ring",
        right_ring="Dingir Ring",
        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
	}
	
	sets.midcast.RA.Acc = {
		head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
		body="Orion Jerkin +2",
		hands="Orion Bracers +2",
		legs="Meg. Chausses +2",
		feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Enervating Earring",
		right_ear="Telos Earring",
		left_ring="Regal Ring", 
		right_ring="Dingir Ring", 
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
	}

	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear2="Tripudio Earring",ring2="Rajas Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear2="Tripudio Earring"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {head="Adhemar Bonnet +1",neck="Sanctity Necklace",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}

	-- Idle sets
	sets.idle = {
	    head="Meghanada Visor +2",
	    body="Meg. Cuirie +2",
	    hands="Meg. Gloves +2",
	    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	    feet="Meg. Jam. +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
	    left_ring="Defending Ring",
	    right_ring="Warden's Ring",
	    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
		--back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','CHR+1','Accuracy+2','DEF+8',}},
	}
	
	-- Defense sets
	sets.defense.PDT = {
	    head="Meghanada Visor +2",
	    body="Meg. Cuirie +2",
	    hands="Meg. Gloves +2",
	    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	    feet="Meg. Jam. +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
	    left_ring="Defending Ring",
	    right_ring="Warden's Ring",
	    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
		--back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','CHR+1','Accuracy+2','DEF+8',}},
		}

	sets.defense.MDT = {
	    head="Meghanada Visor +2",
	    body="Meg. Cuirie +2",
	    hands="Meg. Gloves +2",
	    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	    feet="Meg. Jam. +2",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
	    left_ring="Defending Ring",
	    right_ring="Warden's Ring",
	    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
		--back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','CHR+1','Accuracy+2','DEF+8',}},
		}

	sets.Kiting = {legs="Carmine Cuisses +1"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
        head="Mummu Bonnet +2",
        body="Mummu Jacket +2",
        hands="Mummu Wrists +2",
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
        neck="Sanctity Necklace",
        waist="Eschan Stone",
		left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back="Agema Cape",
		--back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','CHR+1','Accuracy+2','DEF+8',}},
	}



	sets.engaged.Acc = {
        head={ name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}},
        body="Meg. Cuirie +2",
        hands={ name="Adhemar Wristbands", augments={'AGI+10','Rng.Acc.+15','Rng.Atk.+15',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
        neck="Iskur Gorget",
        waist="Hurch'lan Sash",
        left_ear="Brutal Earring",
        left_ear="Telos Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring", 
        back="Agema Cape",
	}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = {
	 	head="Orion Beret +3",
        body="Nisroch Jerkin",
        hands="Orion Bracers +2",
        legs="Meg. Chausses +2",
		feet={ name="Arcadian Socks +3", augments={'Enhances "Stealth Shot" effect',}},
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
        left_ring="Regal Ring",
        right_ring="Dingir Ring",
        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
	}
	sets.buff.Camouflage = {
		body="Orion Jerkin +2",
	}
	
	sets.buff.DoubleShot = {		
	    head="Oshosi Mask",
        body={ name="Arc. Jerkin +3", augments={'Enhances "Snapshot" effect',}},
        hands="Oshosi Gloves",
        legs="Oshosi Trousers",
		feet="Oshosi Leggings",
        neck="Iskur Gorget",
        waist="Yemaya Belt",
        left_ear="Telos Earring",
        right_ear="Enervating Earring",
        left_ring="Ilabrat Ring",
        right_ring="Dingir Ring",
        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
	}
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
	if spell.action_type == 'Ranged Attack' and state.Buff['Double Shot'] then
		equip(sets.buff.DoubleShot)
		eventArgs.handled = true
	end
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
	if buff == "Double Shot" then
		if gain then
			equip(sets.buff.DoubleShot)
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
	set_macro_page(1, 13)
end
