function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f10 gs c toggle weapon set')


	----------------------------------------------------------------------
	-- Weapon sets
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.weapons = {}
	weaponSetIndex = table.getn(sets.weapons) + 1

	-- Weapon: Index Names
	weaponSetNames = {
		[0] = 'Melee',
		[1] = 'Magic',
	}

	-- Weapon : Melee
	sets.weapons[0] = {
	    main="Sequence",
	    sub={ name="Colada", augments={'Crit.hit rate+3','DEX+13','Accuracy+18','Attack+12','DMG:+12',}},
	}

	-- Weapon : Magic
	sets.weapons[1] = {
	    main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
	    sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
	}

	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- Idle : Default
	sets.idle.default = {
	    ammo="Mantoptera Eye",
	    head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
	    body="Jhakri Robe +2",
	    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
        legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
	    feet="Tutyr Sabots",
        neck="Loricate Torque +1",
        waist="Fucho-no-Obi",
	    left_ear="Etiolation Earring",
	    right_ear="Static Earring",
        left_ring="Defending Ring",
	    right_ring="Vocane Ring",
	    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	} -- end sets.idle.default


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : Default
	sets.melee.default = {
	    ammo="Ginsen",
	    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
	    feet={ name="Herculean Boots", augments={'Accuracy+24 Attack+24','"Triple Atk."+2','DEX+6','Accuracy+7','Attack+14',}},
	    neck="Ainia Collar",
	    waist="Windbuffet Belt +1",
	    left_ear="Suppanomimi",
	    right_ear="Telos Earring",
	    left_ring="Epona's Ring",
	    right_ring="Petrov Ring",
	    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	} -- end sets.melee.default


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fastcast
	sets.precast.fastcast = {
        ammo="Sapience Orb",
        head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
        body={ name="Luhlaza Jubbah +1", augments={'Enhances "Enchainment" effect',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
	    feet="Carmine Greaves",
	    neck="Voltsurge Torque",
	    waist="Witful Belt",
	    left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
	    left_ring="Prolix Ring",
	    right_ring="Kishar Ring",
        back={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}},
	} -- end sets.precast.fastcast


	----------------------------------------------------------------------
	-- Magic set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.magic = {}

	-- Magic : Default
	sets.magic.default = {
	    ammo="Pemphredo Tathlum",
	    head="Jhakri Coronal +2",
	    body="Jhakri Robe +2",
	    hands="Jhakri Cuffs +2",
	    legs="Jhakri Slops +2",
	    feet="Jhakri Pigaches +2",
	    neck="Sanctity Necklace",
        waist="Yamabuki-no-Obi",
	    left_ear="Friomisi Earring",
        right_ear="Regal Earring",
        left_ring="Shiva Ring",
        right_ring="Shiva Ring",
        back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.magic.default


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}

	-- Midcast : Weaponskill : Default
	sets.midcast.ws.default = {
        ammo="Honed Tathlum",
	    head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
	    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    hands={ name="Herculean Gloves", augments={'Accuracy+20 Attack+20','"Store TP"+1','DEX+7','Accuracy+12','Attack+3',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Herculean Boots", augments={'Accuracy+24 Attack+24','"Triple Atk."+2','DEX+6','Accuracy+7','Attack+14',}},
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Epona's Ring",
	    right_ring="Begrudging Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Weaponskill : Chant du Cygne
	sets.midcast.ws['Chant du Cygne'] = {
        ammo="Falcon Eye",
	    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
        body="Abnoba Kaftan",
	    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet="Thereoid Greaves",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Epona's Ring",
	    right_ring="Begrudging Ring",
        back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	} -- end sets.midcast.ws['Chant du Cygne']

	-- Midcast : Weaponskill : Expiacion
	sets.midcast.ws['Expiacion'] = {
        ammo="Mantoptera Eye",
	    head={ name="Lilitu Headpiece", augments={'STR+10','DEX+10','Attack+15','Weapon skill damage +3%',}},
	    body="Assim. Jubbah +2",
	    hands="Jhakri Cuffs +2",
	    legs="Jhakri Slops +2",
	    feet="Jhakri Pigaches +2",
	    neck="Caro Necklace",
	    waist="Grunfeld Rope",
	    left_ear="Ishvara Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
	    left_ring="Shukuyu Ring",
	    right_ring="Rufescent Ring",
	    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	} -- end sets.midcast.ws['Expiacion']

	-- Midcast : Weaponskill : Requiescat
	sets.midcast.ws['Requiescat'] = {
	    ammo="Hydrocera",
	    head="Jhakri Coronal +2",
	    body="Jhakri Robe +2",
	    hands="Jhakri Cuffs +2",
	    legs="Jhakri Slops +2",
	    feet="Jhakri Pigaches +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Brutal Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
	    left_ring="Epona's Ring",
	    right_ring="Rufescent Ring",
	    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
	} -- end sets.midcast.ws['Requiescat']

	-- Midcast : Weaponskill : Savage Blade
	sets.midcast.ws['Savage Blade'] = {
        ammo="Mantoptera Eye",
	    head={ name="Lilitu Headpiece", augments={'STR+10','DEX+10','Attack+15','Weapon skill damage +3%',}},
	    body="Assim. Jubbah +2",
	    hands="Jhakri Cuffs +2",
	    legs="Jhakri Slops +2",
	    feet="Jhakri Pigaches +2",
	    neck="Caro Necklace",
	    waist="Grunfeld Rope",
	    left_ear="Ishvara Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
	    left_ring="Shukuyu Ring",
	    right_ring="Rufescent Ring",
	    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	} -- end sets.midcast.ws['Savage Blade']

	-- Midcast : Weaponskill : Red Lotus Blade
	sets.midcast.ws['Red Lotus Blade'] = sets.magic.default
	-- end sets.midcast.ws['Savage Blade']

	-- Midcast : Weaponskill : Seraph Blade
	sets.midcast.ws['Seraph Blade'] = sets.magic.default
	-- end sets.midcast.ws['Seraph Blade']

	-- Midcast : Weaponskill : Sanguine Blade
	sets.midcast.ws['Sanguine Blade'] = sets.magic.default
	-- end sets.midcast.ws['Sanguine Blade']


	----------------------------------------------------------------------
	-- Job ability Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.jobAbilities = {}

	-- Chain affinity
	sets.jobAbilities.chainAffinity = {
	    left_ring="Mujin Band",
	    right_ring="Begrudging Ring",
	} -- end sets.jobAbilities.chainAffinity

	-- Burst affinity
	sets.jobAbilities.burstAffinity = {
		feet="Hashishin Basmak +1",
        right_ear="Static Earring",
	    right_ring="Locus Ring",
	    left_ring="Mujin Band",
	} -- end sets.jobAbilities.burstAffinity

	-- Diffusion
	sets.jobAbilities.diffusion = {
        feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
	} -- end sets.jobAbilities.diffusion


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Blue magic skill
	sets.utility.blueMagicSkill = {
		ammo="Mavi tathlum",
        head={ name="Luh. Keffiyeh +1", augments={'Enhances "Convergence" effect',}},
		body="Assim. Jubbah +2",
	    hands="Rawhide Gloves",
        legs="Hashishin Tayt +1",
        feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
	    neck="Incanter's Torque",
        back={ name="Cornflower Cape", augments={'MP+17','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	} -- end sets.Utility.blueMagicSkill

	-- Dark magic
	sets.utility.darkMagic = {
	    head="Pixie Hairpin +1",
        waist="Fucho-no-Obi",
		right_ring="Archon Ring",
	} -- end sets.Utility.darkMagic


end -- end get_sets()


----------------------------------------------------------------------
-- Callback for when casting begins
----------------------------------------------------------------------
function precast(spell)
    if spell.action_type == 'Magic' then
		equip(sets.precast.fastcast)
	end
end -- end precast()


----------------------------------------------------------------------
-- Callback for after casting begins, but before it fires
----------------------------------------------------------------------
function midcast(spell)

	-- Check if the action is a specified weapon skill
	if sets.midcast.ws[spell.name] then

		-- Equip the appropriate ws specific set
		equip(sets.midcast.ws[spell.name])

		-- Crank up the chain affinity effect
		if buffactive['Chain Affinity'] then
			equip(sets.jobAbilities.chainAffinity)
		end -- end if

    elseif spell.type == 'WeaponSkill' then

    	-- Equip default ws set
		equip(sets.midcast.ws.default)

		-- Crank up the chain affinity effect
		if buffactive['Chain Affinity'] then
			equip(sets.jobAbilities.chainAffinity)
		end -- end if

	elseif spell.action_type == 'Magic' then

    	-- Equip base magic set
		equip(sets.magic.default)

		-- Crank up the dark elemental magic
		if spell.english == 'Tenebral Crush'
			or spell.english == 'MP Drainkiss' then
			equip(sets.utility.darkMagic)
		end -- end if

		-- Crank up the blue magic skill for enhancement magic
		if spell.english == 'Barrier Tusk'
			or spell.english == 'Cocoon'
			or spell.english == 'Erratic Flutter'
			or spell.english == 'Occultation'
			or spell.english == 'Magic Barrier'
			or spell.english == 'Mighty Guard' then
			equip(sets.utility.blueMagicSkill)
		end -- end if

		-- Crank up the burst affinity effect
		if buffactive['Burst Affinity'] then
			equip(sets.jobAbilities.burstAffinity)
		end -- end if

		-- Crank up the diffusion effect
		if buffactive['Diffusion'] then
			equip(sets.jobAbilities.diffusion)
		end -- end if

    end -- end if

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)
	if player.status =='Engaged' then
		equip(sets.melee.default)
	else
		equip(sets.melee.default)
		equip(sets.idle.default)
	end
end -- end aftercast()


----------------------------------------------------------------------
-- Callback for whenever engagment status changes
----------------------------------------------------------------------
function status_change(new,old)
	if new == 'Idle' then
		equip(sets.idle.default)
	elseif new == 'Engaged' then
		equip(sets.melee.default)
	end
end -- end status_change()


----------------------------------------------------------------------
-- In game alerts to gear set changes
----------------------------------------------------------------------
function self_command(command)

	-- Equip the idle set
	if command == 'toggle idle set' then
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Idle: Default Set Equipped ----->')
		-- Equip the set
		equip(sets.idle.default)
	end -- end if

	-- Toggle the weapon sets
	if command == 'toggle weapon set' then
		-- Increment the weapon index
		weaponSetIndex = weaponSetIndex + 1
		-- Check if the weaopn index is out of range
		if weaponSetIndex > table.getn(sets.weapons) then
			weaponSetIndex = 0
		end
		-- Equip the appropriate set
		equip(sets.weapons[weaponSetIndex])
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Weapon: '..weaponSetNames[weaponSetIndex]..' Set Equipped ----->')
	end -- end if

end -- end self_command()