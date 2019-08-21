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
	    ammo="Staunch Tathlum +1",
    head="Sulevia's Mask +2",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},
}

	-- Idle : Default
	sets.idle = {
		sub="Utu Grip",
	     ammo="Staunch Tathlum +1",
    head="Sulevia's Mask +2",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Sulev. Gauntlets +2",
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet="Hermes' Sandals",
    neck="Loricate Torque +1",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken-5%',}},
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
            head="Flam. zucchetto +2",
			neck="War. Beads +2",
			ear1="Brutal Earring",
			--ear1="Eabani Earring",
			ear2="Cessance Earring",
            body="Emicho Haubert +1",
			hands="Emi. Gauntlets +1",
			ring1="Petrov Ring",
			ring2="Niqmaddu Ring",
            back={ name="Cichol's mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken -5%',}},
			waist="Ioskeha Belt +1",
			legs="Pumm. Cuisses +3",
			feet="Pumm. Calligae +3",
	} -- end sets.melee[1]

	-- Melee : Accuracy
	sets.melee[1] = { 
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head="Pummeler's Mask +3",
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="War. Beads +2",
	    waist="Ioskeha Belt +1",
	    left_ear="Telos Earring",
	    right_ear="Cessance Earring",
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken -5%',}},
	} -- end sets.melee[2]

	-- Melee : Hybrid DT
	sets.melee[2] = {
		sub="Utu Grip",
	    ammo="Staunch Tathlum +1",
        head="Sulevia's mask +2",
		neck="Loricate Torque +1",
		ear1="Telos Earring",
		ear2="Cessance Earring",
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands="Sulev. Gauntlets +2",
		ring1="Moonlight Ring",
		ring2="Moonlight Ring",
        back={ name="Cichol's mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+4','"Dbl.Atk."+10','Damage taken -5%',}},
		waist="Flume Belt",
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet="Sulev. Leggings +2",
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
	    waist="Ioskeha Belt +1",
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
	    waist="Ioskeha Belt +1",
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
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Epaminondas's Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.accuracy.default = {
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
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
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Epaminondas's Ring",
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
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Flamma Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Metatron Torment']

	
	
	-- Midcast : Weapon Skill : Resolution
	sets.midcast.ws['Resolution'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
		neck="War. Beads +2",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		ring1="Flamma Ring",
		ring2="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
		waist="Ioskeha Belt +1",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3"}
	 -- end sets.midcast.ws['Resolution']

	-- Midcast : Weapon Skill : Resolution
	sets.midcast.ws.accuracy['Resolution'] = {    
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="War. Beads +2",
	    waist="Ioskeha Belt +1",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
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
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Epaminondas's Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws['Scourge']

	-- Midcast : Weapon Skill : Scourge
	sets.midcast.ws.accuracy['Scourge'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Ioskeha Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Scourge']

	-- Midcast : Weapon Skill : Upheaval
	sets.midcast.ws['Upheaval'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
		head="Agoge Mask +3",
		neck="War. Beads +2",
		ear1="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		body="Pumm. Lorica +3",
		hands="Sulev. Gauntlets +2",
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	} -- end sets.midcast.ws['Upheaval']

	-- Midcast : Weapon Skill : Upheaval
	sets.midcast.ws.accuracy['Upheaval'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Ioskeha Belt +1",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Upheaval']
	
	-- Midcast : Weapon Skill : Ukko\'s Fury
	sets.midcast.ws['Ukko\'s Fury'] = {
		sub="Utu Grip",
	    ammo="Yetshila +1",
		head="Agoge Mask +3",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		body="Agoge Lorica +3",
		hands="Sulev. Gauntlets +2",
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3"}
	 -- end sets.midcast.ws['Ukko\'s Fury']

	-- Midcast : Weapon Skill : Ukko\'s Fury
	sets.midcast.ws.accuracy['Ukko\'s Fury'] = {
		sub="Utu Grip",
	    ammo="Yetshila +1",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Ioskeha Belt +1",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Ukko\'s Fury']
		
		-- Midcast : Weapon Skill : Decimation
	sets.midcast.ws['Decimation'] = {
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head="Flam. zucchetto +2",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
		body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		ring1="Flamma Ring",
		ring2="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
		waist="Fotia Belt",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3"}
	 -- end sets.midcast.ws['Decimation']

	-- Midcast : Weapon Skill : Decimation
	sets.midcast.ws.accuracy['Decimation'] = {    
		sub="Utu Grip",
	    ammo="Seeth. Bomblet +1",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.accuracy['Decimation']

-- Midcast : Weapon Skill : Savage Blade
	sets.midcast.ws['Savage Blade'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
		head="Agoge Mask +3",
		neck="War. Beads +2",
		ear1="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		body="Pumm. Lorica +3",
		hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
		waist="Prosilio Belt +1",
		legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	} -- end sets.midcast.ws['Savage Blade']

	-- Midcast : Weapon Skill : Savage Blade
	sets.midcast.ws.accuracy['Savage Blade'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Ioskeha Belt +1",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Savage Blade']
	
	-- Midcast : Weapon Skill : Impulse Drive
	sets.midcast.ws['Impulse Drive'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
		head="Agoge Mask +3",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		body="Pumm. Lorica +3",
		hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		legs="Pumm. Cuisses +3",
	    feet="Sulev. Leggings +2",
	} -- end sets.midcast.ws['Impulse Drive']

	-- Midcast : Weapon Skill : Impulse Drive
	sets.midcast.ws.accuracy['Impulse Drive'] = {
		sub="Utu Grip",
	    ammo="Knobkierrie",
	    head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
	    body="Pumm. Lorica +3",
	    hands="Pumm. Mufflers +2",
	    legs="Pumm. Cuisses +3",
	    feet="Pumm. Calligae +3",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
	    left_ring="Regal Ring",
	    right_ring="Niqmaddu Ring",
	    back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.accuracy['Impulse Drive']
	
	
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
		head="Pummeler's Mask +3",
		body="Agoge Lorica +3",
	} -- end sets.jobAbility['Aggressor']
	
	-- Blood Rage
	sets.jobAbility['Blood Rage'] = {
		body="Boii Lorica +1"
	} -- end sets.jobAbility['Blood Rage']

	-- Mighty Strikes
	sets.jobAbility['Mighty Strikes'] = {
		hands="Agoge Mufflers +3"
	} -- end sets.jobAbility['Mighty Strikes']

	-- Provoke
	sets.jobAbility['Provoke'] = {ammo="Sapience Orb",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Moonlight Necklace",
		waist="Goading Belt",
		left_ear="Telos Earring",
		right_ear="Cryptic Earring",
		left_ring="Apeile Ring +1",
		right_ring="Apeile Ring",
		back="Moonlight Cape",
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