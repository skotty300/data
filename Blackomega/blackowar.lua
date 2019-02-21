function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f10 gs c cycle melee set')


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {
	sub="Utu Grip",
	ammo="Staunch Tathlum",
	head="Sulevia's Mask +2",
	body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
	}

	-- Idle : Default
	sets.idle = {
		sub="Utu Grip",
	ammo="Staunch Tathlum",
	head="Sulevia's Mask +2",
	body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}
	meleeSetIndex = 0
	meleeSetHasBeenEngaged = false

	-- Melee: Index Names
	meleeSetNames = {
		[0] = 'Default',
		[1] = 'Accuracy',
		[2] = 'Hybrid DT',
	}

	-- Melee : Default
	sets.melee[0] = {
		sub="Utu Grip",
	    ammo="Ginsen",
	    head="Flam. Zucchetto +2",
	    body="Dagon Breast.",
	    hands="Sulev. Gauntlets +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="War. Beads +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
        right_ear="Brutal Earring",
	    left_ring="Flamma Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	} -- end sets.melee[1]

	-- Melee : Accuracy
	sets.melee[1] = { 
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head="Pummeler's Mask +2",
	    body="Agoge Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="War. Beads +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
	    right_ear="Telos Earring",
	    left_ring="Flamma Ring",
	    right_ring="Niqmaddu Ring",
	     back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	} -- end sets.melee[2]

	-- Melee : Hybrid DT
	sets.melee[2] = {
		sub="Utu Grip",
	    ammo="Staunch Tathlum",
	    head="Flam. Zucchetto +2",
	    body="Dagon Breast.",
	    hands="Sulev. Gauntlets +2",
	    legs="Sulev. Cuisses +2",
	    feet="Pumm. Calligae +3",
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt +1",
	    left_ear="Cessance Earring",
        right_ear="Brutal Earring",
	    left_ring="Moonbeam Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	} -- end sets.melee[3]


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {
		sub="Utu Grip",
	    ammo="Staunch Tathlum +1",
	    head={ name="Odyssean Helm", augments={'Accuracy+27','"Fast Cast"+3','INT+10',}},
	    body={ name="Odyss. Chestplate", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+3','INT+5','Mag. Acc.+14',}},
	    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
	    legs="Pumm. Cuisses +3",
	    feet={ name="Odyssean Greaves", augments={'Accuracy+24 Attack+24','"Fast Cast"+4','MND+4','Accuracy+7',}},
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt",
	    left_ear="Odnowa Earring +1",
	    right_ear="Loquac. Earring",
	    left_ring="Prolix Ring",
	    right_ring="Moonbeam Ring",
	    back="Moonlight Cape",
	}

	-- Precast : Fast Cast
	sets.precast.fastCast = {
		sub="Utu Grip",
	    ammo="Staunch Tathlum +1",
	    head={ name="Odyssean Helm", augments={'Accuracy+27','"Fast Cast"+3','INT+10',}},
	    body={ name="Odyss. Chestplate", augments={'"Mag.Atk.Bns."+4','"Fast Cast"+3','INT+5','Mag. Acc.+14',}},
	    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
	    legs="Pumm. Cuisses +3",
	    feet={ name="Odyssean Greaves", augments={'Accuracy+24 Attack+24','"Fast Cast"+4','MND+4','Accuracy+7',}},
	    neck="Loricate Torque +1",
	    waist="Ioskeha Belt",
	    left_ear="Odnowa Earring +1",
	    right_ear="Loquac. Earring",
	    left_ring="Prolix Ring",
	    right_ring="Moonbeam Ring",
	    back="Moonlight Cape",
	} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}
	sets.midcast.ws.accuracy = {}

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.default = {
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Sulev. Gauntlets +2",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.accuracy.default = {
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head="Agoge Mask +3",
	    body="Pumm. Lorica +3",
	    hands="Sulev. Gauntlets +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.accuracy.default

	-- Midcast : Weapon Skill : Metatron Torment
	sets.midcast.ws['Metatron Torment'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Argosy Mufflers +1",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Flamma Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws['Metatron Torment']

	-- Midcast : Weapon Skill : Metatron Torment
	sets.midcast.ws.accuracy['Metatron Torment'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Argosy Mufflers +1",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Flamma Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Metatron Torment']

	-- Midcast : Weapon Skill : Resolution
	sets.midcast.ws['Resolution'] = {
    main="",
    sub="Utu Grip",
        ammo="Seeth. Bomblet +1",
    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
    body={ name="Agoge Lorica +3", augments={'Enhances "Aggressive Aim" effect',}},
    hands="Sulev. Gauntlets +2",
    legs="Pumm. Cuisses +3",
    feet="Pumm. Calligae +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
} -- end sets.midcast.ws['Resolution']

	-- Midcast : Weapon Skill : Resolution
	sets.midcast.ws.accuracy['Resolution'] = {    
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head="Pummeler's Mask +2",
	    body={ name="Agoge Lorica +3", augments={'Enhances "Aggressive Aim" effect',}},
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="War. Beads +1",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.accuracy['Resolution']

	-- Midcast : Weapon Skill : Scourge
	sets.midcast.ws['Scourge'] = {    
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws['Scourge']

	-- Midcast : Weapon Skill : Scourge
	sets.midcast.ws.accuracy['Scourge'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.accuracy['Scourge']

	-- Midcast : Weapon Skill : Upheaval
	sets.midcast.ws['Upheaval'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Sulev. Gauntlets +2",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws['Upheaval']

	-- Midcast : Weapon Skill : Upheaval
	sets.midcast.ws.accuracy['Upheaval'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Sulev. Gauntlets +2",
	    legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Karieyh Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Upheaval']
		

	----------------------------------------------------------------------
	-- Utility Sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.jobAbility = {}

	-- Berserk
	sets.jobAbility['Berserk'] = {
		body="Pumm. Lorica +3",
		feet="Agoge Calligae +3",
		back="Cichol's Mantle",
	} -- end sets.jobAbility['Berserk']

	-- Aggressor
	sets.jobAbility['Aggressor'] = {
		head="Pummeler's Mask +2",
		body="Agoge Lorica +3",
	} -- end sets.jobAbility['Aggressor']
	
	-- Blood Rage
	sets.jobAbility['Blood Rage'] = {
		body="Boii Lorica +1"
	} -- end sets.jobAbility['Blood Rage']

	-- Mighty Strikes
	sets.jobAbility['Mighty Strikes'] = {
		hands="Agoge Mufflers +1"
	} -- end sets.jobAbility['Mighty Strikes']

	-- Provoke
	sets.jobAbility['Provoke'] = {
		sub="Utu Grip",
	    ammo="Ginsen",
	    head="Flam. Zucchetto +2",
	    body="Flamma Korazin +2",
	    hands="Sulev. Gauntlets +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="War. Beads +1",
	    waist="Ioskeha Belt",
	    left_ear="Brutal Earring",
	    right_ear="Telos Earring",
	    left_ring="Flamma Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.jobAbility['Provoke']

	-- Restraint
	sets.jobAbility['Restraint'] = {
		hands="Boii Mufflers +1",
	} -- end sets.jobAbility['Restraint']

	-- Tomahawk
	sets.jobAbility['Tomahawk'] = {
		ammo="Thr. Tomahawk",
		feet="Agoge Calligae +3",
	} -- end sets.jobAbility['Tomahawk']

	-- Warcry
	sets.jobAbility['Warcry'] = {
		head="Agoge Mask +3"
	} -- end sets.jobAbility['Warcry']

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

    	if meleeSetNames[meleeSetIndex] == 'Accuracy' then
			if sets.midcast.ws.accuracy[spell.english] then
				equip(sets.midcast.ws.accuracy[spell.english])
		    else
				equip(sets.midcast.ws.accuracy.default)
			end
    	else
			if sets.midcast.ws[spell.english] then
				equip(sets.midcast.ws[spell.english])
		    else
				equip(sets.midcast.ws.default)
			end
    	end

	elseif spell.type == 'JobAbility' then

		if sets.jobAbility[spell.english] then
			equip(sets.jobAbility[spell.english])
		end

	end

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)

	-- Check the player status
	if player.status == 'Engaged' then
		equip(sets.melee[meleeSetIndex])
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
		equip(sets.melee[meleeSetIndex])
	end

end -- end status_change()


----------------------------------------------------------------------
-- In game alerts to gear set changes
----------------------------------------------------------------------
function self_command(command)

	-- Equip idle set
	if command == 'toggle idle set' then
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Idle Set Equipped ----->')
		-- Equip the set
		equip(sets.idle)
	end -- end if

	-- Equip melee set
	if command == 'cycle melee set' then

		if meleeSetHasBeenEngaged == false then
			meleeSetHasBeenEngaged = true
			meleeSetIndex = 0
		else
			meleeSetIndex = meleeSetIndex + 1
			if meleeSetIndex > table.getn(sets.melee) then
				meleeSetIndex = 0
			end
		end

		equip(sets.melee[meleeSetIndex])
		send_command('@input /echo <----- Melee '..meleeSetNames[meleeSetIndex]..' Set Equipped ----->')

	end -- end if

end -- end self_command()