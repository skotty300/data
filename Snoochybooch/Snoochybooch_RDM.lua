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
    ammo="Staunch Tathlum +1",
    head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Jhakri Robe +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Ethereal Earring",
    right_ear="Infused Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Moonlight Cape",
} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : Default
	sets.melee = {
    ammo="Ginsen",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Ayanmo Corazza +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Sherida Earring",
    left_ring="Petrov Ring",
    right_ring="Hetairoi Ring",
    back="Atheling Mantle",
} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : FastCast
	sets.precast.fastCast = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Vitiation Tabard", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs="Aya. Cosciales +2",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.magic = {}
	sets.midcast.ws = {}

	-- Midcast : Weaponskill : Default
	sets.midcast.ws.default = {
	    ammo="Hydrocera",
	    head="Pixie Hairpin +1",
	    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+1','"Mag.Atk.Bns."+11',}},
	    feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
        neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    right_ear="Regal Earring",
	    left_ring="Mephitas's Ring",
	    right_ring="Mephitas's Ring +1",
	    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Magic : Dark
	sets.midcast.magic.dark = {
	    ammo="Hydrocera",
		head="Pixie Hairpin +1",
		body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+1','"Mag.Atk.Bns."+11',}},
		feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		neck="Erra Pendant",
	    left_ring="Evanescence Ring",
		right_ring="Archon Ring",
		back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.midcast.magic.dark

	-- Midcast : Magic : Death
	deathMode = false
	sets.midcast.magic.death = {
	    ammo="Hydrocera",
	    head="Pixie Hairpin +1",
		--body="Spaekona's Coat +3",
	    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+1','"Mag.Atk.Bns."+11',}},
	    feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    neck="Sanctity Necklace",
	    waist="Refoccilation Stone",
	    left_ear="Barkaro. Earring",
	    right_ear="Regal Earring",
	    left_ring="Mephitas's Ring",
	    right_ring="Mephitas's Ring +1",
	    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.midcast.magic.elemental

	-- Midcast : Magic : Elemental
	sets.midcast.magic.elemental = {
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Seshaw Cape",
} -- end sets.midcast.magic.elemental

	-- Magic : Enhancing
	sets.midcast.magic.enhancing = {
    main="Excalibur",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Leth. Chappel +1",
    body={ name="Vitiation Tabard", augments={'Enhances "Chainspell" effect',}},
    hands="Atrophy Gloves +1",
    legs="Atrophy Tights +1",
    feet="Leth. Houseaux +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Ethereal Earring",
    right_ear="Infused Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','Attack+2','DEF+2',}},
} -- end sets.magic.enhancing
	
	-- Magic : Enfeebling
	sets.midcast.magic.enfeebling = {
	    ammo="Hydrocera",
        head={ name="Merlinic Hood", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+10%','MND+15','Mag. Acc.+15',}},
	    body="Spaekona's Coat +3",
	    hands="Spae. Gloves +2",
        legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+1','"Mag.Atk.Bns."+11',}},
	    feet="Jhakri Pigaches +2",
        neck="Sanctity Necklace",
	    waist="Eschan Stone",
        left_ear="Barkaro. Earring",
        right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Shiva Ring",
	    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	} -- end sets.magic.enfeebling
	
	-- Magic : Healing
	sets.midcast.magic.healing = {
	    ammo="Hydrocera",
	    head="Pixie Hairpin +1",
		--body="Spaekona's Coat +3",
	    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+1','"Mag.Atk.Bns."+11',}},
	    feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	    neck="Sanctity Necklace",
	    waist="Refoccilation Stone",
	    left_ear="Barkaro. Earring",
	    right_ear="Regal Earring",
	    left_ring="Mephitas's Ring",
	    right_ring="Mephitas's Ring +1",
	    back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	}-- end sets.magic.healing


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Element Bonus
	sets.utility.elementBonus = {
	    waist="Hachirin-no-Obi",
	    --back="Twilight Cape",
	} -- end sets.utility.elementBonus

	-- Magic burst
	burstMode = false
	sets.utility.magicBurst = {
		--body="Ea Houppelande",
	    hands="Spae. Gloves +2",
		legs="Ea Slops",
        neck="Mizu. Kubikazari",
        left_ring="Mujin Band",
        right_ring="Locus Ring",
	} -- end sets.utility.magicBurst
	
	-- Manawall
	sets.utility.manaWall = {
		feet="Wicce Sabots +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	} -- end sets.utility.manaWall



----------------------------------------------------------------------
-- Spell arrays
----------------------------------------------------------------------

	MagicHealing = {
		["Arise"] = true,
		["Blindna"] = true,
		["Curaga"] = true,
		["Curaga II"] = true,
		["Curaga III"] = true,
		["Curaga IV"] = true,
		["Curaga V"] = true,
		["Cure"] = true,
		["Cure II"] = true,
		["Cure III"] = true,
		["Cure IV"] = true,
		["Cure V"] = true,
		["Cure VI"] = true,
		["Cursna"] = true,
		["Esuna"] = true,
		["Full Cure"] = true,
		["Paralyna"] = true,
		["Poisona"] = true,
		["Raise"] = true,
		["Raise II"] = true,
		["Raise III"] = true,
		["Reraise"] = true,
		["Reraise II"] = true,
		["Reraise III"] = true,
		["Reraise IV"] = true,
		["Sacrifice"] = true,
		["Silena"] = true,
		["Stona"] = true,
		["Viruna"] = true,
	}
	MagicEnfeebling = {
		["Addle"] = true,
		["Addle II"] = true,
		["Bind"] = true,
		["Blind"] = true,
		["Blind II"] = true,
		["Break"] = true,
		["Breakga"] = true,
		["Dia"] = true,
		["Dia II"] = true,
		["Dia III"] = true,
		["Diaga"] = true,
		["Dispel"] = true,
		["Distract"] = true,
		["Distract II"] = true,
		["Distract III"] = true,
		["Frazzle"] = true,
		["Frazzle II"] = true,
		["Frazzle III"] = true,
		["Gravity"] = true,
		["Gravity II"] = true,
		["Paralyze"] = true,
		["Paralyze II"] = true,
		["Poison"] = true,
		["Poison II"] = true,
		["Poisonga"] = true,
		["Sleep"] = true,
		["Sleep II"] = true,
		["Sleepga"] = true,
		["Sleepga II"] = true,
		["Silence"] = true,
		["Slow"] = true,
		["Slow II"] = true,
	}

	MagicEnhancing = {
		["Adloquium"] = true,
		["Animus Augeo"] = true,
		["Animus Minuo"] = true,
		["Aquaveil"] = true,
		["Aurorastorm"] = true,
		["Aurorastorm II"] = true,
		["Auspice"] = true,
		["Baraera"] = true,
		["Baraero"] = true,
		["Baramnesia"] = true,
		["Baramnesra"] = true,
		["Barblind"] = true,
		["Barblindra"] = true,
		["Barblizzara"] = true,
		["Barblizzard"] = true,
		["Barfira"] = true,
		["Barfire"] = true,
		["Barparalyze"] = true,
		["Barparalyzra"] = true,
		["Barpetra"] = true,
		["Barpetrify"] = true,
		["Barpoison"] = true,
		["Barpoisonra"] = true,
		["Barsilence"] = true,
		["Barsilencera"] = true,
		["Barsleep"] = true,
		["Barsleepra"] = true,
		["Barstone"] = true,
		["Barstonra"] = true,
		["Barthunder"] = true,
		["Barthundra"] = true,
		["Barvira"] = true,
		["Barvirus"] = true,
		["Barwater"] = true,
		["Barwatera"] = true,
		["Blaze Spikes"] = true,
		["Blink"] = true,
		["Boost-AGI"] = true,
		["Boost-CHR"] = true,
		["Boost-DEX"] = true,
		["Boost-INT"] = true,
		["Boost-MND"] = true,
		["Boost-STR"] = true,
		["Boost-VIT"] = true,
		["Crusade"] = true,
		["Deodorize"] = true,
		["Embrava"] = true,
		["Enaero"] = true,
		["Enaero II"] = true,
		["Enblizzard"] = true,
		["Enblizzard II"] = true,
		["Enfire"] = true,
		["Enfire II"] = true,
		["Enstone"] = true,
		["Enstone II"] = true,
		["Enthunder"] = true,
		["Enthunder II"] = true,
		["Enwater"] = true,
		["Enwater II"] = true,
		["Erase"] = true,
		["Escape"] = true,
		["Firestorm"] = true,
		["Firestorm II"] = true,
		["Flurry"] = true,
		["Flurry II"] = true,
		["Foil"] = true,
		["Gain-AGI"] = true,
		["Gain-CHR"] = true,
		["Gain-DEX"] = true,
		["Gain-INT"] = true,
		["Gain-MND"] = true,
		["Gain-STR"] = true,
		["Gain-VIT"] = true,
		["Hailstorm"] = true,
		["Hailstorm II"] = true,
		["Haste"] = true,
		["Haste II"] = true,
		["Ice Spikes"] = true,
		["Invisible"] = true,
		["Phalanx"] = true,
		["Phalanx II"] = true,
		["Protect"] = true,
		["Protect II"] = true,
		["Protect III"] = true,
		["Protect IV"] = true,
		["Protect V"] = true,
		["Protectra"] = true,
		["Protectra II"] = true,
		["Protectra III"] = true,
		["Protectra IV"] = true,
		["Protectra V"] = true,
		["Rainstorm"] = true,
		["Rainstorm II"] = true,
		["Recall-Jugner"] = true,
		["Recall-Meriph"] = true,
		["Recall-Pashh"] = true,
		["Refresh"] = true,
		["Refresh II"] = true,
		["Refresh III"] = true,
		["Regen"] = true,
		["Regen II"] = true,
		["Regen III"] = true,
		["Regen IV"] = true,
		["Regen V"] = true,
		["Reprisal"] = true,
		["Retrace"] = true,
		["Sandstorm"] = true,
		["Sandstorm II"] = true,
		["Shell"] = true,
		["Shell II"] = true,
		["Shell III"] = true,
		["Shell IV"] = true,
		["Shell V"] = true,
		["Shellra"] = true,
		["Shellra II"] = true,
		["Shellra III"] = true,
		["Shellra IV"] = true,
		["Shellra V"] = true,
		["Shock Spikes"] = true,
		["Sneak"] = true,
		["Stoneskin"] = true,
		["Teleport-Altep"] = true,
		["Teleport-Dem"] = true,
		["Teleport-Holla"] = true,
		["Teleport-Mea"] = true,
		["Teleport-Vahzl"] = true,
		["Teleport-Yhoat"] = true,
		["Temper"] = true,
		["Temper II"] = true,
		["Thunderstorm"] = true,
		["Thunderstorm II"] = true,
		["Voidstorm"] = true,
		["Voidstorm II"] = true,
		["Warp"] = true,
		["Warp II"] = true,
		["Windstorm"] = true,
		["Windstorm II"] = true,
	}
	
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
		
		if MagicEnfeebling[spell.name] then
			equip(sets.midcast.magic.enfeebling)
		elseif MagicEnhancing[spell.name] then
			equip(sets.midcast.magic.enhancing)
		elseif MagicHealing[spell.name] then
			equip(sets.midcast.magic.healing)
			
		end

		-- 2. Check if burst mode is on
		if burstMode == true then
			equip(sets.utility.magicBurst)
		end

	    -- 3. Check for element bonus
	    if ElementalSpells[spell.english] then
			if spell.element == world.weather_element or spell.element == world.day_element then
				equip(sets.utility.elementBonus)
			end
		end
		elseif spell.type == 'WeaponSkill' then

    	-- Equip default ws set
		equip(sets.midcast.ws.default)

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
-- Callback fired when a buff is gained or lost
----------------------------------------------------------------------
function buff_change(buff,gain,buffDetails)

	-- Check for gaining Mana Wall
	if buff	== "Mana Wall" then
		if gain == true then
			equip(sets.utility.manaWall)
			send_command('gs disable feet back')
		else
			send_command('gs enable feet back')
		end
	end

end -- end buff_change()

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