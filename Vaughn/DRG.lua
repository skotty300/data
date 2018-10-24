function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- Idle : Default
	sets.idle = {
		ammo="Staunch Tathlum",
		head="Sulevia's Mask",
		body="Sulevia's Plate.",
		hands="Sulev. Gauntlets",
		legs="Carmine Cuisses",
		feet="Sulevia's Leggings",
		neck="Twilight torque",
		waist="Flume Belt",
		left_ear="Infused Earring",
		right_ear="Etiolation Earring",
		left_ring="Sheltered Ring",
		right_ring="Gelatinous Ring",
		back="Solemnity cape",
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : default
	sets.melee = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Flamma korazin +2",
		hands="Sulevia's Gauntlets +2",
		legs="Sulevia's Cuisses +1",
		feet="Flam. Gambieras +2",
		neck="Lissome Necklace",
		waist="Ioskeha Belt",
		left_ear="Brutal Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back="Atheling Mantle",
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fast Cast
	sets.precast.fastCast = {
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		feet="Carmine Greaves",
		neck="Orunmila's Torque",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Prolix Ring",
	} -- end sets.precast.fastCast

	-- Precast : Angon
	sets.precast.angon = {
		ammo="Angon",
	} -- end sets.precast.angon


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.default = {
		ammo="Amar Cluster",
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +1",
		hands="Flam. Manopolas +1",
		legs="Flamma Dirs +1",
		feet="Sulev. Leggings",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Ishvara Earring",
		left_ring="Flamma Ring",
		right_ring="Petrov Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Stardiver
	sets.midcast.ws["Stardiver"] = {
		ammo="Amar Cluster",
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +1",
		hands="Sulev. Gauntlets",
		legs="Sulev. Cuisses",
		feet="Flam. Gambieras +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear="Cessance Earring",
		left_ring="Flamma Ring",
		right_ring="Petrov Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.midcast.ws["Stardiver"]


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Jump set
	sets.utility.jump = {
		ammo="Ginsen",
		head="Sulevia's Mask +2",
		body="Vishap Mail +2",
		hands="Vis. Fng. Gaunt. +1",
		legs="Flamma Dirs +2",
		feet="Flam. Gambieras +2",
		neck="Shulmanu Collar",
		waist="Ioskeha Belt",
		left_ear="Digni. Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.jump

	-- High jump set
	sets.utility.highJump = {
		ammo="Ginsen",
		head="Sulevia's Mask +2",
		body="Vishap Mail +2",
		hands="Vis. Fng. Gaunt. +1",
		legs="Ptero. Brais +1",
		feet="Flam. Gambieras +2",
		neck="Shulmanu Collar",
		waist="Ioskeha Belt",
		left_ear="Digni. Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.highJump

	-- HP set
	sets.utility.hp = {
		hands="Despair Fin. Gaunt.",
		feet={ name="Ptero. Greaves +1", augments={'Enhances "Empathy" effect',}},
	} -- end sets.utility.hp

	-- Spirit jump set
	sets.utility.spiritJump = {
		ammo="Ginsen",
		head="Sulevia's Mask +2",
		body="Pelt. Plackart +1",
		hands="Sulev. Gauntlets +2",
		legs="Pelt. Cuissots +1",
		feet="Flam. Gambieras +2",
		neck="Shulmanu Collar",
		waist="Ioskeha Belt",
		left_ear="Digni. Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.spiritJump

	-- Soul jump set
	sets.utility.soulJump = {
		ammo="Ginsen",
		head="Sulevia's Mask +2",
		body="Pelt. Plackart +1",
		hands="Sulev. Gauntlets +2",
		legs="Pelt. Cuissots +1",
		feet="Flam. Gambieras +2",
		neck="Shulmanu Collar",
		waist="Ioskeha Belt",
		left_ear="Digni. Earring",
		right_ear="Cessance Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.soulJump

	-- Spirit link set
	sets.utility.spiritLink = {
		head="Vishap Armet +2",
		hands="Pel. Vambraces +1",
		feet={ name="Ptero. Greaves +1", augments={'Enhances "Empathy" effect',}},
	} -- end sets.utility.spiritLink

	-- Angon set
	sets.utility.angon = {
		hands={ name="Ptero. Fin. G. +1", augments={'Enhances "Angon" effect',}},
	} -- end sets.utility.angon

	-- Spirit surge set
	sets.utility.spiritSurge = {
			body={ name="Ptero. Mail +1", augments={'Enhances "Spirit Surge" effect',}},
	} -- end sets.utility.spiritSurge

	-- Call wyvern set
	sets.utility.callWyvern = {
		body={ name="Ptero. Mail +1", augments={'Enhances "Spirit Surge" effect',}},
	} -- end sets.utility.callWyvern

end -- end get_sets()


----------------------------------------------------------------------
-- Callback for when casting begins
----------------------------------------------------------------------
function precast(spell)
    if spell.action_type == 'Magic' then
		equip(sets.precast.fastCast)
	elseif spell.type == 'JobAbility' then
		if spell.name == 'Angon' then
			equip(sets.precast.angon)
		end
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

	-- Check if the action is a job ability
	elseif spell.type == 'JobAbility' then

		if spell.name == 'Jump' then
			equip(sets.utility.jump)
		elseif spell.name == 'High Jump' then
			equip(sets.utility.highJump)
		elseif spell.name == 'Spirit Jump' then
			equip(sets.utility.spiritJump)
		elseif spell.name == 'Soul Jump' then
			equip(sets.utility.soulJump)
		elseif spell.name == 'Spirit Link' then
			equip(sets.utility.spiritLink)
		elseif spell.name == 'Angon' then
			equip(sets.utility.angon)
		elseif spell.name == 'Spirit Surge' then
			equip(sets.utility.spiritSurge)
		elseif spell.name == 'Call Wyvern' then
			equip(sets.utility.callWyvern)
		end

	end

	-- Check if steady wing is being used
	if spell.name == 'Steady Wing' then
		equip(sets.utility.hp)
	end

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)

	-- Check the player status
	if player.status =='Engaged' then
		equip(sets.melee)
	else
		equip(sets.idle)
	end

end -- end aftercast()


----------------------------------------------------------------------
-- Callback for after pet casting has fired
----------------------------------------------------------------------
function pet_midcast(spell)
	equip(sets.utility.hp)
end


----------------------------------------------------------------------
-- Callback for after pet casting has fired
----------------------------------------------------------------------
function pet_aftercast(spell)

	-- Check the player status
	if player.status =='Engaged' then
		equip(sets.melee)
	else
		equip(sets.idle)
	end
	
end


----------------------------------------------------------------------
-- Callback for whenever engagment status changes
----------------------------------------------------------------------
function status_change(new,old)

	-- Check the player status
	if new == 'Idle' then
		equip(sets.idle)
	elseif new == 'Engaged' then
		equip(sets.melee)
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
	end -- end if

end -- end self_command()