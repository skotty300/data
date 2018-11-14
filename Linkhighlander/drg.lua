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
		head="Valorous Mask",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Arke Gambieras",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
		--back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','CHR+1','Accuracy+2','DEF+8',}},
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
		body={ name="Valorous Mail", augments={'Accuracy+26','"Store TP"+7','AGI+7','Attack+10',}},
		hands="Flam. Manopolas +2",
		--hands="Sulev. Gauntlets +2",
		legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
		--legs={ name="Valor. Hose", augments={'Accuracy+16','"Dbl.Atk."+4','DEX+12','Attack+8',}},
		feet="Flam. Gambieras +2",
		neck="Shulmanu Collar",
		--neck="Ganesha's Mala",
		waist="Ioskeha Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
		--back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','CHR+1','Accuracy+2','DEF+8',}},
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fast Cast
	sets.precast.fastCast = {
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
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
		ammo="Knobkierrie",
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
		body="Sulevia's Plate. +2",
		hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
		legs="Vishap Brais +3",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Stardiver
	sets.midcast.ws["Stardiver"] = {
		ammo="Knobkierrie",
		--head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','Weapon skill damage +2%','AGI+13',}},
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
		--body="Sulevia's Plate. +2",
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
		--hands="Sulev. Gauntlets +2",
		legs="Vishap Brais +3",
		--legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
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
		head="Flam. Zucchetto +2",
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		hands="Vis. Fng. Gaunt. +2",
		legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
		feet="Ostro Greaves",
		neck="Anu Torque",
		waist="Ioskeha Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.jump

	-- High jump set
	sets.utility.highJump = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		hands="Vis. Fng. Gaunt. +2",
		legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
		feet="Ostro Greaves",
		neck="Anu Torque",
		waist="Ioskeha Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.highJump

	-- Spirit jump set
	sets.utility.spiritJump = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		hands="Vis. Fng. Gaunt. +2",
		legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
		feet="Ostro Greaves",
		neck="Anu Torque",
		waist="Ioskeha Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.spiritJump

	-- Soul jump set
	sets.utility.soulJump = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		hands="Vis. Fng. Gaunt. +2",
		legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
		feet="Ostro Greaves",
		neck="Anu Torque",
		waist="Ioskeha Belt",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Flamma Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.soulJump

	-- Spirit link set
	sets.utility.spiritLink = {
		head="Vishap Armet +2",
		hands="Pel. Vambraces +1",
		feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
	} -- end sets.utility.spiritLink

	-- Angon set
	sets.utility.angon = {
		hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
	} -- end sets.utility.angon

	-- Ancient Circle set
	sets.utility.ancientCircle = {
		legs="Vishap Brais +3",
	} -- end sets.utility.ancientCircle
	
	-- Spirit surge set
	sets.utility.spiritSurge = {
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
		hands="Despair Fin. Gaunt.",
		legs="Vishap Brais +3",
		feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck="Chanoix's Gorget",
		left_ear="Lancer's Earring",
		back={ name="Updraft Mantle", augments={'STR+2','Pet: Breath+10','Pet: Damage taken -4%',}},
	} -- end sets.utility.spiritSurge

	-- Call wyvern set
	sets.utility.callWyvern = {
		body={ name="Ptero. Mail +3", augments={'Enhances "Spirit Surge" effect',}},
	} -- end sets.utility.callWyvern

	-- Steady wing
	sets.utility.steadyWing = {
		body={ name="Emicho Haubert", augments={'Pet: HP+100','Pet: INT+15','Pet: "Regen"+2',}},
		hands="Despair Fin. Gaunt.",
		legs="Vishap Brais +3",
		feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		waist="Glassblower's Belt",
		left_ear="Lancer's Earring",
		right_ear="Enmerkar Earring",
		back={ name="Updraft Mantle", augments={'STR+2','Pet: Breath+10','Pet: Damage taken -4%',}},
	} -- end sets.utility.steadyWing

	-- Healing breath
	sets.utility.healingBreath = {
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
		body={ name="Emicho Haubert", augments={'Pet: HP+100','Pet: INT+15','Pet: "Regen"+2',}},
		hands="Despair Fin. Gaunt.",
		legs="Vishap Brais +3",
		feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck="Chanoix's Gorget",
		waist="Glassblower's Belt",
		left_ear="Lancer's Earring",
		right_ear="Enmerkar Earring",
		back={ name="Updraft Mantle", augments={'STR+2','Pet: Breath+10','Pet: Damage taken -4%',}},
	} -- end sets.utility.healingBreath

	-- Elemental breath
	sets.utility.elementalBreath = {
		head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
		body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Breath+8',}},
		hands={ name="Acro Gauntlets", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Breath+8','STR+7 VIT+7',}},
		legs={ name="Acro Breeches", augments={'Pet: Mag. Acc.+22','Pet: Breath+8',}},
		feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+21','Pet: Breath+8',}},
		waist="Glassblower's Belt",
		right_ear="Enmerkar Earring",
		back={ name="Updraft Mantle", augments={'STR+2','Pet: Breath+10','Pet: Damage taken -4%',}},
	} -- end sets.utility.elementalBreath

end -- end get_sets()


----------------------------------------------------------------------
-- Callback for when casting begins
----------------------------------------------------------------------
function precast(spell)

	-- Check if the action is magic
    if spell.action_type == 'Magic' then
		equip(sets.precast.fastCast)

	-- Check if the action is a job ability
	elseif spell.type == 'JobAbility' then
		if spell.name == 'Angon' then
			equip(sets.precast.angon)
		elseif spell.name == 'Steady Wing' then
			equip(sets.utility.steadyWing)
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
		elseif spell.name == 'Steady Wing' then
			equip(sets.utility.steadyWing)
		elseif spell.name == 'Ancient Circle' then
			equip(sets.utility.ancientCircle)
		end

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

	-- Check which breath
	if spell.name == 'Healing Breath IV' then
		equip(sets.utility.healingBreath)
	else
		equip(sets.utility.elementalBreath)
	end

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