function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f10 gs c toggle death mode')
	send_command('bind f11 gs c toggle burst mode')


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- idle : Default
	sets.idle = {
	    main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
	    sub="Niobid Strap",
	    ammo="Hydrocera",
	    head="Befouled Crown",
	    body="Jhakri Robe +2",
	    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+9%','MND+6','Mag. Acc.+14',}},
	    legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
	    feet="Tutyr Sabots",
        neck="Loricate Torque +1",
        waist="Fucho-no-Obi",
	    left_ear="Etiolation Earring",
	    right_ear="Static Earring",
        left_ring="Defending Ring",
	    right_ring="Vocane Ring",
        back="Solemnity Cape",
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : Default
	sets.melee = {
	    main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
	    sub="Niobid Strap",
	    ammo="Hydrocera",
	    head={ name="Merlinic Hood", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','Magic burst dmg.+10%','Mag. Acc.+8','"Mag.Atk.Bns."+3',}},
	    body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
        hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+9%','MND+6','Mag. Acc.+14',}},
        legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+1%','INT+9','Mag. Acc.+11','"Mag.Atk.Bns."+11',}},
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Magic burst dmg.+9%','Mag. Acc.+13',}},
        neck="Loricate Torque +1",
        waist="Chaac Belt",
	    left_ear="Etiolation Earring",
	    right_ear="Static Earring",
        left_ring="Defending Ring",
	    right_ring="Vocane Ring",
        back="Solemnity Cape",
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : FastCast
	sets.precast.fastCast = {
        main="Oranyan",
	    sub="Niobid Strap",
        ammo="Sapience Orb",
        head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
        body="Zendik Robe",
        hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+18','"Fast Cast"+4','CHR+8','"Mag.Atk.Bns."+7',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+26','"Fast Cast"+6','"Mag.Atk.Bns."+5',}},
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back={ name="Taranus's Cape", augments={'"Fast Cast"+10',}},
	} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.magic = {}

	-- Midcast : Magic : Dark
	sets.midcast.magic.dark = {
	    main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
	    sub="Ammurapi Shield",
        body="Shango Robe",
	    neck="Erra Pendant",
        waist="Fucho-no-Obi",
	    left_ring="Evanescence Ring",
		right_ring="Archon Ring",
	    back="Perimede Cape",
	} -- end sets.midcast.magic.dark

	-- Midcast : Magic : Death
	deathMode = false
	sets.midcast.magic.death = {
	    main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
	    sub="Niobid Strap",
	    ammo="Hydrocera",
	    head="Pixie Hairpin +1",
	    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    neck="Eddy Necklace",
	    waist="Refoccilation Stone",
	    left_ear="Loquac. Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Mephitas's Ring",
	    right_ring="Mephitas's Ring +1",
	    back="Izdubar Mantle",
	} -- end sets.midcast.magic.elemental

	-- Midcast : Magic : Elemental
	sets.midcast.magic.elemental = {
	    main={ name="Lathi", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
	    sub="Niobid Strap",
	    ammo="Pemphredo Tathlum",
	    head={ name="Merlinic Hood", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','Magic burst dmg.+10%','Mag. Acc.+8','"Mag.Atk.Bns."+3',}},
	    body="Jhakri Robe +2",
	    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+9%','MND+6','Mag. Acc.+14',}},
	    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+1%','INT+9','Mag. Acc.+11','"Mag.Atk.Bns."+11',}},
	    feet="Jhakri Pigaches +2",
	    neck="Eddy Necklace",
	    waist="Refoccilation Stone",
	    left_ear="Friomisi Earring",
	    right_ear="Regal Earring",
	    left_ring="Acumen Ring",
	    right_ring="Shiva Ring",
	    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.midcast.magic.elemental


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Magic burst
	burstMode = false
	sets.utility.magicBurst = {
	    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+9%','MND+6','Mag. Acc.+14',}},
        neck="Mizu. Kubikazari",
        left_ring="Mujin Band",
        right_ring="Locus Ring",
	} -- end sets.utility.magicBurst


	----------------------------------------------------------------------
	-- Spell arrays
	----------------------------------------------------------------------
	ElementalSpells = {
		["Fire"] = true,
		["Fire II"] = true,
		["Fire III"] = true,
		["Fire IV"] = true,
		["Fire V"] = true,
		["Fire VI"] = true,
		["Blizzard"] = true,
		["Blizzard II"] = true,
		["Blizzard III"] = true,
		["Blizzard IV"] = true,
		["Blizzard V"] = true,
		["Blizzard VI"] = true,
		["Aero"] = true,
		["Aero II"] = true,
		["Aero III"] = true,
		["Aero IV"] = true,
		["Aero V"] = true,
		["Aero VI"] = true,
		["Stone"] = true,
		["Stone II"] = true,
		["Stone III"] = true,
		["Stone IV"] = true,
		["Stone V"] = true,
		["Stone VI"] = true,
		["Thunder"] = true,
		["Thunder II"] = true,
		["Thunder III"] = true,
		["Thunder IV"] = true,
		["Thunder V"] = true,
		["Thunder VI"] = true,
		["Water"] = true,
		["Water II"] = true,
		["Water III"] = true,
		["Water IV"] = true,
		["Water V"] = true,
		["Water VI"] = true,
		["Firaga"] = true,
		["Firaga II"] = true,
		["Firaga III"] = true,
		["Blizzaga"] = true,
		["Blizzaga II"] = true,
		["Blizzaga III"] = true,
		["Aeroga"] = true,
		["Aeroga II"] = true,
		["Aeroga III"] = true,
		["Stonega"] = true,
		["Stonega II"] = true,
		["Stonega III"] = true,
		["Thundaga"] = true,
		["Thundaga II"] = true,
		["Thundaga III"] = true,
		["Waterga"] = true,
		["Waterga II"] = true,
		["Waterga III"] = true,
		["Firaja"] = true,
		["Blizzaja"] = true,
		["Aeroja"] = true,
		["Stoneja"] = true,
		["Thundaja"] = true,
		["Waterja"] = true,
		["Flare"] = true,
		["Flare II"] = true,
		["Freeze"] = true,
		["Freeze II"] = true,
		["Tornado"] = true,
		["Tornado II"] = true,
		["Quake"] = true,
		["Quake II"] = true,
		["Burst"] = true,
		["Burst II"] = true,
		["Flood"] = true,
		["Flood II"] = true,
		["Comet"] = true,
		["Burn"] = true,
		["Frost"] = true,
		["Rasp"] = true,
		["Shock"] = true,
		["Drown"] = true,
	}

	DarkSpells = {
		["Aspir"] = true,
		["Aspir II"] = true,
		["Aspir III"] = true,
		["Drain"] = true,
	}

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

	-- Check if the action is a specified weapon skill
	if spell.action_type == 'Magic' then

		-- 1. Check if the spell is dark magic
		if DarkSpells[spell.english] then
			equip(sets.midcast.magic.dark)
		elseif ElementalSpells[spell.english] then
			equip(sets.midcast.magic.elemental)
		end

		-- 2. Check if burst mode is on
		if burstMode == true then
			equip(sets.utility.magicBurst)
		end

    end -- end if

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)
	if player.status =='Engaged' then
		equip(sets.melee)
	else
		equip(set_combine(sets.melee, sets.idle))
	end
end -- end aftercast()


----------------------------------------------------------------------
-- Callback for whenever engagment status changes
----------------------------------------------------------------------
function status_change(new,old)
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

	-- Equip the idle set
	if command == 'toggle death mode' then
		-- Check status of deathMode
		if deathMode == false then
			-- Toggle deathMode on
			deathMode = true
			-- Equip death set
			equip(sets.midcast.magic.death)
			-- Lock all slots
			send_command('gs disable all')
			-- Alert the user which set is currently being equipped
			send_command('@input /echo <----- Death Mode On ----->')
		else
			-- Toggle deathMode off
			deathMode = false
			-- Lock all slots
			send_command('gs enable all')
			-- Alert the user which set is currently being equipped
			send_command('@input /echo <----- Death Mode Off ----->')
		end
	end -- end if

	-- Equip the idle set
	if command == 'toggle burst mode' then
		if burstMode == false then
			burstMode = true
			send_command('@input /echo <----- Burst Mode On ----->')
		else
			burstMode = false
			send_command('@input /echo <----- Burst Mode Off ----->')
		end
	end -- end if


end -- end self_command()