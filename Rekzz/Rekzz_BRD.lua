function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f10 gs c toggle instrument set')


	----------------------------------------------------------------------
	-- Instrument sets
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.instruments = {}
	instrumentSetIndex = 0

	-- Weapon: Index Names
	instrumentSetNames = {
		[0] = 'Gjallarhorn',
		[1] = 'Daurdabla',
	}

	-- Instrument : Horn
	sets.instruments[0] = {
	    range="Gjallarhorn",
	}

	-- Instrument : Harp
	sets.instruments[1] = {
	    range="Daurdabla",
	}


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- Idle : Default
	sets.idle = {
	    main="Carnwenhan",
	    sub="Ammurapi Shield",
	    head="Inyanga Tiara +2",
	    body="Inyanga Jubbah +2",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Fili Cothurnes +1",
        neck="Loricate Torque +1",
	    waist="Channeler's Stone",
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
	    main="Carnwenhan",
	    sub="Ammurapi Shield",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Asperity Necklace",
        waist="Grunfeld Rope",
        left_ear="Brutal Earring",
	    right_ear="Cessance Earring",
        left_ring="Rajas Ring",
        right_ring="Petrov Ring",
	    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}
	sets.precast.fastCast = {}

	-- Precast : fastCast Song
	sets.precast.fastCast.song = {
	    head="Fili Calot +1",
	    body="Inyanga Jubbah +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	    legs="Aya. Cosciales +2",
	    feet={ name="Bihu Slippers +1", augments={'Enhances "Nightingale" effect',}},
	    neck="Voltsurge Torque",
	    waist="Witful Belt",
	    left_ear="Loquac. Earring",
        right_ear="Aoidos' Earring",
	    left_ring="Prolix Ring",
        right_ring="Kishar Ring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.precast.fastCast.song

	-- Precast : fastCast Magic
	sets.precast.fastCast.magic = {
        head="Nahtirah Hat",
        body="Inyanga Jubbah +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Aya. Cosciales +2",
        feet="Navon Crackows",
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.precast.fastCast.magic


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}
	sets.midcast.buffSong = {}

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.default = {
	    head="Aya. Zucchetto +2",
	    body="Ayanmo Corazza +2",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Asperity Necklace",
        waist="Grunfeld Rope",
	    left_ear="Telos Earring",
	    right_ear="Suppanomimi",
	    left_ring="Rajas Ring",
	    right_ring="Petrov Ring",
	    back="Atheling Mantle",
	} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Rudra's Storm
	sets.midcast.ws["Rudra's Storm"] = {
	    head="Aya. Zucchetto +2",
	    body="Ayanmo Corazza +2",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Asperity Necklace",
	    waist="Grunfeld Rope",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Ramuh Ring",
	    right_ring="Begrudging Ring",
	    back="Atheling Mantle",
	} -- end sets.midcast.ws["Rudra's Storm"]

	-- Midcast : Weapon Skill : Evisceration
	sets.midcast.ws['Evisceration'] = {
	    head="Aya. Zucchetto +2",
	    body="Ayanmo Corazza +2",
	    hands="Aya. Manopolas +2",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Telos Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	    left_ring="Ramuh Ring",
	    right_ring="Begrudging Ring",
	    back="Atheling Mantle",
	} -- end sets.midcast.ws['Evisceration']

	-- Midcast : Buff Song for Daurdabla
	sets.midcast.buffSong["Daurdabla"] = {
	    head="Brioso Roundlet +3",
	    body="Fili Hongreline +1",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        waist="Kobo Obi",
	    left_ear="String Earring",
	    right_ear="Darkside Earring",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.midcast.buffSong["Daurdabla"]

	-- Midcast : Buff Song for Gjallarhorn
	sets.midcast.buffSong["Gjallarhorn"] = {
	    head="Brioso Roundlet +3",
	    body="Fili Hongreline +1",
	    hands="Inyan. Dastanas +2",
	    legs="Inyanga Shalwar +2",
	    feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        waist="Kobo Obi",
	    right_ear="Darkside Earring",
        back={ name="Rhapsode's Cape", augments={'HP+25','Mag. Acc.+4','Enmity-8',}},
	} -- end sets.midcast.buffSong["Gjallarhorn"]

	-- Midcast : Buff Song for Gjallarhorn
	sets.midcast.buffSong["Marsyas"] = sets.midcast.buffSong["Gjallarhorn"]
	-- end sets.midcast.buffSong["Marsyas"]

	-- Midcast : Enfeeble Song set
	sets.midcast.enfeebleSong = {
	    head="Brioso Roundlet +3",
	    body="Fili Hongreline +1",
        hands="Inyan. Dastanas +2",
        legs="Inyanga Shalwar +2",
	    feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
        waist="Kobo Obi",
	    left_ear="Regal Earring",
	    right_ear="Darkside Earring",
        left_ring="Metamorph Ring",
	    right_ring="Metamor. Ring +1",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.midcast.enfeebleSong

	-- Midcast : Magic
	sets.midcast.magic = {
	    head="Brioso Roundlet +3",
        body="Brioso Justau. +2",
        hands="Brioso Cuffs +2",
        legs="Brioso Cannions +2",
        feet="Brioso Slippers +3",
        neck="Mnbw. Whistle +1",
	    waist="Porous Rope",
	    left_ear="Lifestorm Earring",
	    right_ear="Psystorm Earring",
        left_ring="Metamorph Ring",
	    right_ring="Metamor. Ring +1",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.midcast.magic

	-- Midcast : Cure Potency
	sets.midcast.curePotency = {
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body="Chironic Doublet",
        hands="Inyan. Dastanas +2",
        legs="Gyve Trousers",
        feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Lifestorm Earring",
        right_ear="Static Earring",
        left_ring="Vertigo Ring",
        right_ring="Lebeche Ring",
        back={ name="Intarabus's Cape", augments={'MND+20','"Cure" potency +10%',}},
	} -- end sets.midcast.curePotency


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Ballad Song set
	sets.utility.ballad = {
	    legs="Fili Rhingrave +1",
	} -- end sets.utility.ballad

	-- Cure Casting Time set
	sets.utility.cureCastingTime = {
        main={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}},
        legs="Doyen Pants",
	} -- end sets.utility.ballad

	-- Honor March Song set
	sets.utility.honorMarch = {
	    range="Marsyas",
	} -- end sets.utility.honorMarch

	-- Lullaby Song set
	sets.utility.lullaby = {
        hands="Brioso Cuffs +2",
	} -- end sets.utility.lullaby

	-- Madrigal Song set
	sets.utility.madrigal = {
	    head="Fili Calot +1",
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.utility.madrigal

	-- March Song set
	sets.utility.march = {
        hands="Fili Manchettes +1",
	} -- end sets.utility.march

	-- Minne Song set
	sets.utility.minne = {
	} -- end sets.utility.minne

	-- Minuet Song set
	sets.utility.minuet = {
	    body="Fili Hongreline +1",
	} -- end sets.utility.minuet

	-- Paeon Song set
	sets.utility.paeon = {
	    head="Brioso Roundlet +3",
	} -- end sets.utility.paeon

	-- Prelude Song set
	sets.utility.prelude = {
	    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	} -- end sets.utility.prelude

	-- Scherzo Song set
	sets.utility.scherzo = {
        feet="Fili Cothurnes +1",
	} -- end sets.utility.scherzo


	----------------------------------------------------------------------
	-- Job ability Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.jobAbilities = {}

	-- Soul Voice
	sets.jobAbilities.soulVoice = {
	    legs={ name="Bihu Cannions +1", augments={'Enhances "Soul Voice" effect',}},
	} -- end sets.jobAbilities.soulVoice

	-- Nightingale
	sets.jobAbilities.nightingale = {
	} -- end sets.jobAbilities.nightingale

	-- Troubadour
	sets.jobAbilities.troubadour = {
	} -- end sets.jobAbilities.troubadour


	----------------------------------------------------------------------
	-- Spell arrays
	----------------------------------------------------------------------
	CureSpells = {
		["Cure"] = true,
		["Cure II"] = true,
		["Cure III"] = true,
		["Cure IV"] = true,
		["Curaga"] = true,
		["Curaga II"] = true,
	}


	----------------------------------------------------------------------
	-- Song arrays
	----------------------------------------------------------------------
	BalladSongs = {
		["Mage's Ballad"] = true,
		["Mage's Ballad II"] = true,
		["Mage's Ballad III"] = true,
	}

	HonorMarchSong = {
		["Honor March"] = true,
	}

	LullabySongs = {
		["Foe Lullaby"] = true,
		["Foe Lullaby II"] = true,
		["Horde Lullaby"] = true,
		["Horde Lullaby II"] = true,
	}

	MadrigalSongs = {
		["Sword Madrigal"] = true,
		["Blade Madrigal"] = true,
	}

	MarchSongs = {
		["Advancing March"] = true,
		["Victory March"] = true,
		["Honor March"] = true,
	}

	MazurkaSongs = {
		["Raptor Mazurka"] = true,
		["Chocobo Mazurka"] = true,
	}

	MinneSongs = {
		["Knight's Minne"] = true,
		["Knight's Minne II"] = true,
		["Knight's Minne III"] = true,
		["Knight's Minne IV"] = true,
		["Knight's Minne V"] = true,
	}

	MinuetSongs = {
		["Valor Minuet"] = true,
		["Valor Minuet II"] = true,
		["Valor Minuet III"] = true,
		["Valor Minuet IV"] = true,
		["Valor Minuet V"] = true,
	}

	PaeonSongs = {
		["Army's Paeon"] = true,
		["Army's Paeon II"] = true,
		["Army's Paeon III"] = true,
		["Army's Paeon IV"] = true,
		["Army's Paeon V"] = true,
		["Army's Paeon VI"] = true,
	}

	PreludeSongs = {
		["Hunter's Prelude"] = true,
		["Archer's Prelude"] = true,
	}

	ScherzoSongs = {
		["Sentinel's Scherzo"] = true,
	}

	EnfeebleSongs = {
		["Foe Requiem"] = true,
		["Foe Requiem II"] = true,
		["Foe Requiem III"] = true,
		["Foe Requiem IV"] = true,
		["Foe Requiem V"] = true,
		["Foe Requiem VI"] = true,
		["Foe Requiem VII"] = true,
		["Foe Lullaby"] = true,
		["Foe Lullaby II"] = true,
		["Horde Lullaby"] = true,
		["Horde Lullaby II"] = true,
		["Battlefield Elegy"] = true,
		["Carnage Elegy"] = true,
		["Fire Threnody"] = true,
		["Fire Threnody II"] = true,
		["Ice Threnody"] = true,
		["Ice Threnody II"] = true,
		["Wind Threnody"] = true,
		["Wind Threnody II"] = true,
		["Earth Threnody"] = true,
		["Earth Threnody II"] = true,
		["Ltng. Threnody"] = true,
		["Ltng. Threnody II"] = true,
		["Water Threnody"] = true,
		["Water Threnody II"] = true,
		["Light Threnody"] = true,
		["Light Threnody II"] = true,
		["Dark Threnody"] = true,
		["Dark Threnody II"] = true,
		["Magic Finale"] = true,
		["Pining Nocturne"] = true,
	}

end -- end get_sets()


----------------------------------------------------------------------
-- Callback for when casting begins
----------------------------------------------------------------------
function precast(spell)
    if spell.type == 'BardSong' then
		equip(sets.precast.fastCast.song)
		-- Check if Honor March is being cast and equip Marsyas
		if HonorMarchSong[spell.english] then
			equip(sets.utility.honorMarch)
		end
    elseif spell.action_type == 'Magic' then
		equip(sets.precast.fastCast.magic)
    	-- Check if this is a cure spell
    	if CureSpells[spell.english] then
			equip(sets.utility.cureCastingTime)
    	end
	end
end -- end precast()


----------------------------------------------------------------------
-- Callback for after casting begins, but before it fires
----------------------------------------------------------------------
function midcast(spell)

	-- Equip any specific named sets
    if spell.type == 'WeaponSkill' then

    	-- Check if a specified weapon skill set exists
    	if sets.midcast.ws[spell.english] then
    		equip(sets.midcast.ws[spell.english])
    	else
    		-- Equip the default weapon skill set
    		equip(sets.midcast.ws.default)
    	end

    elseif spell.type == 'BardSong' then

    	-- Priority 1: Base gear
    	--
    	-- Set the base gear depending on if this is an enfeebling song
    	-- or buffsong
    	if EnfeebleSongs[spell.english] then
			equip(sets.midcast.enfeebleSong)
    	else
    		-- Set the gear based on which instrument is equipped
			equip(sets.midcast.buffSong[player.equipment.range])
		end -- end if

    	-- Priority 2: Song type+++
    	--
		-- Now check if there are specific gear for this type of song
    	if BalladSongs[spell.english] then
    		equip(sets.utility.ballad)
    	elseif LullabySongs[spell.english] then
    		equip(sets.utility.lullaby)
    	elseif MadrigalSongs[spell.english] then
    		equip(sets.utility.madrigal)
    	elseif MarchSongs[spell.english] then
    		equip(sets.utility.march)
    	elseif MinneSongs[spell.english] then
    		equip(sets.utility.minne)
    	elseif MinuetSongs[spell.english] then
    		equip(sets.utility.minuet)
    	elseif PaeonSongs[spell.english] then
    		equip(sets.utility.paeon)
    	elseif PreludeSongs[spell.english] then
    		equip(sets.utility.prelude)
    	elseif ScherzoSongs[spell.english] then
    		equip(sets.utility.scherzo)
    	end

    elseif spell.action_type == 'Magic' then

    	-- Check if the spell if a cure
    	if CureSpells[spell.english] then
			equip(sets.midcast.curePotency)
    	else
			equip(sets.midcast.magic)
		end

	elseif spell.type == 'JobAbility' then

		if spell.english == 'Soul Voice' then
			equip(sets.jobAbilities.soulVoice)
		elseif spell.english == 'Nightingale' then
			equip(sets.jobAbilities.nightingale)
		elseif spell.english == 'Troubadour' then
			equip(sets.jobAbilities.troubadour)
		end -- end if

	end
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

	-- Switch back to the appropriate instrument after casting Honor March
	if HonorMarchSong[spell.english] then
		equip(sets.instruments[instrumentSetIndex])
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
		send_command('@input /echo <----- Idle: Default Set Equipped ----->')
		equip(set_combine(sets.idle, sets.instruments[instrumentSetIndex]))
	end -- end if

	-- Toggle the instrument sets
	if command == 'toggle instrument set' then
		-- Increment the instrument index
		instrumentSetIndex = instrumentSetIndex + 1
		-- Check if the instrument index is out of range
		if instrumentSetIndex > table.getn(sets.instruments) then
			instrumentSetIndex = 0
		end
		-- Equip the appropriate set
		equip(sets.instruments[instrumentSetIndex])
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Instrument: '..instrumentSetNames[instrumentSetIndex]..' Equipped ----->')
	end -- end if

end -- end self_command()