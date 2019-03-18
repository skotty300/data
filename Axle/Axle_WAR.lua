function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	windower.send_command('bind f9 gs c toggle idle set')
	windower.send_command('bind f11 gs c toggle engaged set')
	windower.send_command('bind f12 gs c toggle engaged set')

	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}
	sets.engaged = {}
	
	-- Idle : Default
	sets.idle = {
    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Weapon skill damage +4%','STR+9','Accuracy+15',}},
    body="Flamma Korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.engaged.index = {'Normal','Acc','DT','Dead'}
	engaged_index = 1

	-- Melee : default
	-- Store TP: 69
	-- Triple Attack: 5%
	-- Double Attack: 33%
	sets.engaged.Normal = {
		ammo="Ginsen",
--    	head={ name="Valorous Mask", augments={'VIT+9','Crit. hit damage +1%','Quadruple Attack +3',}},
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +2",
--		hands="Sulevia's gauntlets +2",
--		hands="Valorous mitts",
		hands="Emicho gauntlets",
		legs="Pummeler's cuisses +3",
		feet="Pummeler's calligae +3",
--		neck="Combatant's Torque",
		neck="Warrior's beads",
		waist="Ioskeha belt",
--		waist="Reiki yotai",
		left_ear="Cessance earring",
--		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Niqmaddu ring",
		right_ring="Regal Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
} -- end sets.melee

	sets.engaged.Acc = {
    ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Warrior's Beads",
    waist="Ioskeha Belt",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Flamma Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
} -- end sets.melee

	sets.engaged.DT = {
    ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
} -- end sets.melee
	sets.engaged.Dead = {
    ammo="Staunch Tathlum",
    head="Twilight helm",
    body="Twilight mail",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Sulev. Leggings +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
} -- end sets.melee

	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fast Cast
	sets.precast.fastCast = {
        hands="Leyline gloves",
        body="Odyss. Chestplate",
		feet="Odyssean Greaves9	",
		neck="Baetyl pendant",
		waist="Ioskeha belt",
		left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring",
        right_ring="Prolix Ring",
	} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.default = {
		ammo="Knobkierrie",
		head="Flamma zucchetto +2",
		body="Argosy Hauberk +1",
		legs="Argosy breeches +1",
		feet="Sulevia's leggings +2",
		hands="Argosy mufflers +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Niqmaddu ring",
		right_ring="Regal Ring",
		back ={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Tachi: Fudo
	sets.midcast.ws['Decimation'] = {
		ammo="Seething Bomblet +1",
		head="Flam. zucchetto +2",
--		head="Argosy Celata",
		body="Argosy Hauberk +1",
    	legs="Pummeler's cuisses +3",
--		legs="Argosy Breeches +1",
--		feet="Argosy Sollerets",
    	feet="Pummeler's calligae +3",
--		feet="Flam. gambieras +2",
		hands="Argosy mufflers +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear="Cessance earring",
		left_ring="Niqmaddu ring",
		right_ring="Regal Ring",
		back ={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	
	}
	sets.midcast.ws['Cloudsplitter'] = {
    ammo="Knobkierrie",
--    head="Flam. Zucchetto +2",
	head="Terminal helm",
--    body={ name="Valorous Mail", augments={'DEX+7','Weapon skill damage +6%','Accuracy+11 Attack+11','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
	body="Terminal plate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Valor. Hose", augments={'Accuracy+20','Weapon skill damage +3%',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Weather. Ring",
    right_ring="Regal Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	
	}
	sets.midcast.ws['Resolution'] = {
		ammo="Seething Bomblet +1",
--    	head={ name="Argosy Celata", augments={'STR+10','DEX+10','Attack+15',}},
		head="Flam. zucchetto +2",
--		head="Argosy Celata",
		body="Argosy Hauberk +1",
--    	legs="Pummeler's cuisses +3",
		legs="Argosy Breeches +1",
--		feet="Argosy Sollerets",
--    	feet="Pummeler's calligae +3",
		feet="Flam. gambieras +2",
		hands="Argosy mufflers +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Niqmaddu ring",
		right_ring="Regal Ring",
		back ={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	
	}
	-- end sets.midcast.ws['Resolution']

		-- Midcast : Weapon Skill : Tachi: Jinpu
--	sets.midcast.ws["Tachi: Jinpu"] = {
	--head="Twilight helm",
--	body="Twilight mail",
--	hands="Tanner's gloves",
--	feet="Shukuyu sune-ate",
--	neck="Loricate torque +1",
--	right_ear="Eabani earring",
--	left_ear="Dominance earring",
--	waist="Gishdubar sash",
--	left_ring="Defending ring",
--	right_ring="Prolix ring",
--	back="Reiki cloak",
--	}
	-- end sets.midcast.ws["Tachi: Jinpu"]


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Hasso set
	sets.utility.hasso = {
	} -- end sets.utility.hasso

	-- Meditate set
	sets.utility.meditate = {
	} -- end sets.utility.meditate

	-- Warding Circle set
	sets.utility.wardingCircle = {
 	} -- end sets.utility.wardingCircle

end -- end get_sets()


----------------------------------------------------------------------
-- Callback for when casting begins
----------------------------------------------------------------------
function precast(spell)

    if spell.action_type == 'Magic' then
		equip(sets.precast.fastCast)
	end

end -- end precast()


----------------------------------------------------------------------
-- Callback for after casting begins, but before it fires
----------------------------------------------------------------------
function midcast(spell)

	-- Check if the action is a weapon skill
    if spell.type == 'WeaponSkill' then
		-- Check if the action is a specified weapon skill
		if sets.midcast.ws[spell.name] then
			-- Equip the appropriate specific ws set
			equip(sets.midcast.ws[spell.name])
	    else
	    	-- Equip default ws set
			equip(sets.midcast.ws.default)
		end
	elseif spell.type == 'JobAbility' then
		if spell.name == 'Hasso' then
			equip(sets.utility.hasso)
		elseif spell.name == 'Meditate' then
			equip(sets.utility.meditate)
		elseif spell.name == 'Warding Circle' then
			equip(sets.utility.wardingCircle)
		end
	end

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)

	-- Check the player status
	if player.status =='Engaged' then
		equip(sets.engaged[sets.engaged.index[engaged_index]])
	else
		equip(sets.idle)
	end

end -- end aftercast()


----------------------------------------------------------------------
-- Callback for whenever engagment status changes
----------------------------------------------------------------------
function status_change(new,old)

	-- Check the player status
	if new == 'Idle' then
		equip(sets.idle)
	elseif new == 'Engaged' then
		equip(sets.engaged[sets.engaged.index[engaged_index]])
	end

end -- end status_change()


----------------------------------------------------------------------
-- In game alerts to gear set changes
----------------------------------------------------------------------
function self_command(command)

	-- Equip the idle set
	if command == 'toggle idle set' then
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Idle Set Equipped ----->')
		-- Equip the set
		equip(sets.idle)
	elseif command == 'toggle engaged set' then
		engaged_index = engaged_index +1
	if engaged_index > #sets.engaged.index then engaged_index = 1 end
		windower.add_to_chat(8,' --- Engaged Mode changed to '..sets.engaged.index[engaged_index]..' --- ')
		--windower.add_to_chat(121,' --- Engaged Mode changed to '..sets.engaged.index[engaged_index]..' --- ')
		equip(sets.engaged[sets.engaged.index[engaged_index]])
	end--end if

end -- end self_command()