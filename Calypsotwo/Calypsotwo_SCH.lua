function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f10 gs c print debug info')


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- idle : Default
	sets.idle = {
        main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
        sub="Enki Strap",
        ammo="Hydrocera",
        head="Befouled Crown",
	    body="Jhakri Robe +2",
	    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+9%','MND+6','Mag. Acc.+14',}},
	    legs="Assid. Pants +1",
	    feet="Herald's Gaiters",
        neck="Loricate Torque +1",
        waist="Fucho-no-Obi",
	    left_ear="Etiolation Earring",
	    right_ear="Static Earring",
        left_ring="Defending Ring",
	    right_ring="Vocane Ring +1",
        back="Lugh's Cape",
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : Default
	sets.melee = {
        main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
        sub="Enki Strap",
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
	    right_ring="Vocane Ring +1",
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
	    sub="Enki Strap",
        ammo="Sapience Orb",
        head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
        body="Zendik Robe",
	    hands={ name="Chironic Gloves", augments={'Mag. Acc.+19','"Fast Cast"+6','CHR+10','"Mag.Atk.Bns."+9',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet="Acad. Loafers +1",
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back={ name="Lugh's Cape", augments={'"Fast Cast"+10',}},
	} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Magic set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.magic = {}

	-- Midcast: Elemental Magic
	sets.midcast.magic.elemental = {
	    main="Akademos",
	    sub="Enki Strap",
	    ammo="Pemphredo Tathlum",
	    head="Merlinic Hood",
	    body="Jhakri Robe +2",
	    hands="Amalric Gages",
	    legs="Amalric Slops",
	    feet="Arbatel Loafers +1",
	    neck="Mizu. Kubikazari",
	    waist="Eschan Stone",
	    left_ear="Barkarole Earring",
	    right_ear="Regal Earring",
	    left_ring="Mujin Band",
	    right_ring="Locus Ring",
	    back="Lugh's Cape",
	} -- end sets.midcast.magic.elemental

	-- Midcast: Enfeebling Magic
	sets.midcast.magic.enfeebling = {
        main="Oranyan",
        sub="Enki Strap",
        ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",
        body="Shango Robe",
        hands="Kaykaus Cuffs",
	    legs="Arbatel Pants +1",
	    feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
        neck="Incanter's Torque",
        waist="Rumination Sash",
        left_ear="Gwati Earring",
        right_ear="Regal Earring",
        left_ring="Vertigo Ring",
        right_ring="Kishar Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.midcast.magic.enfeebling

	-- Midcast: Enhancing Magic
	sets.midcast.magic.enhancing = {
        main="Oranyan",
        sub="Enki Strap",
        ammo="Hydrocera",
        head="Befouled Crown",
        body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
        hands={ name="Chironic Gloves", augments={'Mag. Acc.+19','"Fast Cast"+6','CHR+10','"Mag.Atk.Bns."+9',}},
        legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
        feet="Regal Pumps +1",
        neck="Incanter's Torque",
	    waist="Olympus Sash",
        left_ear="Mendi. Earring",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Fi Follet Cape +1",
	} -- end sets.midcast.magic.enhancing

	-- Midcast: Healing Magic
	sets.midcast.magic.healing = {
        main={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}},
        sub="Enki Strap",
        ammo="Hydrocera",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body="Chironic Doublet",
        hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Magic burst dmg.+9%','MND+6','Mag. Acc.+14',}},
        legs="Gyve Trousers",
        feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Lifestorm Earring",
        right_ear="Static Earring",
        left_ring="Vertigo Ring",
        right_ring="Lebeche Ring",
        back={ name="Lugh's Cape", augments={'MND+20','MND+10','"Cure" potency +10%',}},
	} -- end sets.midcast.magic.healing

	-- Midcast: Dark Magic
	sets.midcast.magic.dark = set_combine(sets.midcast.magic.elemental, {
        main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
        sub="Ammurapi Shield",
        body="Shango Robe",
	    neck="Erra Pendant",
        waist="Fucho-no-Obi",
	    left_ring="Evanescence Ring",
		right_ring="Archon Ring",
	    back="Perimede Cape",
	}) -- end sets.midcast.magic.dark

	-- Midcast: Dark Magic
	sets.midcast.magic.helix = set_combine(sets.midcast.magic.elemental, {
        main="Akademos",
		sub="Niobid Strap",
		ammo="Ghastly Tathlum +1",
	    neck="Argute Stole +1",
        waist="Yamaboki-no-Obi"
	}) -- end sets.midcast.magic.dark


	----------------------------------------------------------------------
	-- Job Abilities
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.jobAbility = {}

	-- Dark Arts
	sets.jobAbility.darkArts = {
	    body="Acad. Gown +1",
	} -- end sets.jobAbility.darkArts

	-- Immanence
	sets.jobAbility.immanence = {
        hands="Arbatel Bracers +1",
	} -- end sets.jobAbility.immanence

	-- Light Arts
	sets.jobAbility.lightArts = {
	    legs="Acad. Pants +1",
	} -- end sets.jobAbility.lightArts

	-- Perpetuance
	sets.jobAbility.perpetuance = {
	    hands="Arbatel Bracers +1",
	} -- end sets.jobAbility.perpetuance

	-- Sublimation
	sublimationMode = false
	sets.jobAbility.sublimation = {
	    head="Acad. Mortar. +1",
	    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
        left_ear="Savant's Earring",
	} -- end sets.jobAbility.sublimation

	-- Tabula Rasa
	sets.jobAbility.tabulaRasa = {
        legs={ name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}},
	} -- end sets.jobAbility.tabulaRasa


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Aqyaveil
	sets.utility.aquaveil = {
        head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	} -- end sets.utility.aquaveil

	-- Element Bonus
	sets.utility.elementBonus = {
	    waist="Hachirin-no-Obi",
	    back="Twilight Cape",
	} -- end sets.utility.elementBonus

	-- Klimaform
	sets.utility.klimaform = {
        feet="Arbatel Loafers +1",
	} -- end sets.utility.klimaform

	-- Regen
	sets.utility.regen = {
        head="Arbatel Bonnet +1",
	    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	} -- end sets.utility.regen

	-- Stormsurge
	sets.utility.stormsurge = {
	    feet={ name="Peda. Loafers +1", augments={'Enhances "Stormsurge" effect',}},
	} -- end sets.utility.stormsurge


	----------------------------------------------------------------------
	-- Spell arrays
	----------------------------------------------------------------------
	DarkSpells = {
		["Aspir"] = true,
		["Aspir II"] = true,
		["Bio"] = true,
		["Bio II"] = true,
		["Drain"] = true,
		["Kaustra"] = true,
	}

	ElementalSpells = {
		["Aero"] = true,
		["Aero II"] = true,
		["Aero III"] = true,
		["Aero IV"] = true,
		["Aero V"] = true,
		["Anemohelix"] = true,
		["Anemohelix II"] = true,
		["Blizzard"] = true,
		["Blizzard II"] = true,
		["Blizzard III"] = true,
		["Blizzard IV"] = true,
		["Blizzard V"] = true,
		["Cryohelix"] = true,
		["Cryohelix II"] = true,
		["Fire"] = true,
		["Fire II"] = true,
		["Fire III"] = true,
		["Fire IV"] = true,
		["Fire V"] = true,
		["Stone"] = true,
		["Stone II"] = true,
		["Stone III"] = true,
		["Stone IV"] = true,
		["Stone V"] = true,
		["Thunder"] = true,
		["Thunder II"] = true,
		["Thunder III"] = true,
		["Thunder IV"] = true,
		["Thunder V"] = true,
		["Water"] = true,
		["Water II"] = true,
		["Water III"] = true,
		["Water IV"] = true,
		["Water V"] = true,
	}

	EnfeeblingSpells = {
		["Bind"] = true,
		["Blind"] = true,
		["Break"] = true,
		["Dia"] = true,
		["Dia II"] = true,
		["Diaga"] = true,
		["Dispel"] = true,
		["Distract"] = true,
		["Frazzle"] = true,
		["Gravity"] = true,
		["Paralyze"] = true,
		["Poison"] = true,
		["Poison II"] = true,
		["Sleep"] = true,
		["Sleep II"] = true,
		["Silence"] = true,
		["Slow"] = true,
	}

	EnhancingSpells = {
		["Adloquium"] = true,
		["Animus Augeo"] = true,
		["Animus Minuo"] = true,
		["Aquaveil"] = true,
		["Aurorastorm"] = true,
		["Aurorastorm II"] = true,
		["Baraero"] = true,
		["Barblind"] = true,
		["Barblizzard"] = true,
		["Barfire"] = true,
		["Barparalyze"] = true,
		["Barpetrify"] = true,
		["Barpoison"] = true,
		["Barsilence"] = true,
		["Barsleep"] = true,
		["Barstone"] = true,
		["Barthunder"] = true,
		["Barvirus"] = true,
		["Barwater"] = true,
		["Blaze Spikes"] = true,
		["Blink"] = true,
		["Deoderize"] = true,
		["Embrava"] = true,
		["Enaero"] = true,
		["Enblizzard"] = true,
		["Enfire"] = true,
		["Enstone"] = true,
		["Enthunder"] = true,
		["Enwater"] = true,
		["Erase"] = true,
		["Firestorm"] = true,
		["Firestorm II"] = true,
		["Flurry"] = true,
		["Hailstorm"] = true,
		["Hailstorm II"] = true,
		["Haste"] = true,
		["Ice Spikes"] = true,
		["Invisible"] = true,
		["Phalanx"] = true,
		["Protect"] = true,
		["Protect II"] = true,
		["Protect III"] = true,
		["Protect IV"] = true,
		["Protect V"] = true,
		["Rainstorm"] = true,
		["Rainstorm II"] = true,
		["Refresh"] = true,
		["Regen"] = true,
		["Regen II"] = true,
		["Regen III"] = true,
		["Regen IV"] = true,
		["Regen V"] = true,
		["Sandstorm"] = true,
		["Sandstorm II"] = true,
		["Shell"] = true,
		["Shell II"] = true,
		["Shell III"] = true,
		["Shell IV"] = true,
		["Shell V"] = true,
		["Shock Spikes"] = true,
		["Sneak"] = true,
		["Stoneskin"] = true,
		["Thunderstorm"] = true,
		["Thunderstorm II"] = true,
		["Voidstorm"] = true,
		["Voidstorm II"] = true,
		["Windstorm"] = true,
		["Windstorm II"] = true,
	}

	HealingSpells = {
		["Blindna"] = true,
		["Cure"] = true,
		["Cure II"] = true,
		["Cure III"] = true,
		["Cure IV"] = true,
		["Cursna"] = true,
		["Paralyna"] = true,
		["Poisona"] = true,
		["Raise"] = true,
		["Raise II"] = true,
		["Raise III"] = true,
		["Reraise"] = true,
		["Reraise II"] = true,
		["Reraise III"] = true,
		["Silena"] = true,
		["Stona"] = true,
		["Viruna"] = true,
	}

	RegenSpells = {
		["Regen"] = true,
		["Regen II"] = true,
		["Regen III"] = true,
		["Regen IV"] = true,
		["Regen V"] = true,
	}

	StormsurgeSpells = {
		["Sandstorm"] = true,
		["Sandstorm II"] = true,
		["Rainstorm"] = true,
		["Rainstorm II"] = true,
		["Windstorm"] = true,
		["Windstorm II"] = true,
		["Firestorm"] = true,
		["Firestorm II"] = true,
		["Hailstorm"] = true,
		["Hailstorm II"] = true,
		["Thunderstorm"] = true,
		["Thunderstorm II"] = true,
		["Voidstorm"] = true,
		["Voidstorm II"] = true,
		["Aurorastorm"] = true,
		["Aurorastorm II"] = true,
	}

	HelixSpells = {		
		["Geohelix"] = true,
		["Geohelix II"] = true,
		["Hydrohelix"] = true,
		["Hydrohelix II"] = true,
		["Ionohelix"] = true,
		["Ionohelix II"] = true,
		["Luminohelix"] = true,
		["Luminohelix II"] = true,
		["Noctohelix"] = true,
		["Noctohelix II"] = true,
		["Pyrohelix"] = true,
		["Pyrohelix II"] = true
	}

end -- end get_sets()


----------------------------------------------------------------------
-- When status changes
----------------------------------------------------------------------
function status_change(new, old)
	if new == 'Idle' then
		equip(sets.idle)
	elseif new == 'Engaged' then
		equip(sets.melee)
    end -- end if
end -- end status_change()


----------------------------------------------------------------------
-- When buffs are gained or lost
----------------------------------------------------------------------
function buff_change(buffName, gained, buffDetails)
	if buffName == "Sublimation: Activated" then
		if gained == true then
			equip(sets.jobAbility.sublimation)
			sublimationMode = true
		else
			sublimationMode = false
	    end -- end if
    elseif buffName == "Sublimation: Complete" then
    	sublimationMode = false
    end -- end if
end -- end buff_change()


----------------------------------------------------------------------
-- When casting begins
----------------------------------------------------------------------
function precast(spell)
    if spell.action_type == 'Magic' then
		equip(sets.precast.fastCast)
    end -- end if
end -- end precast()


----------------------------------------------------------------------
-- After casting begins, but before spell actually fires
----------------------------------------------------------------------
function midcast(spell)
	
	-- Check if the current action is a job ability
	if spell.type == 'JobAbility' then

		-- Check for job ability
    	if spell.name == "Tabula Rasa" then
    		equip(sets.jobAbility.tabulaRasa)
	    end -- end if

	-- Check if the current action is magic
	elseif spell.action_type == 'Magic' then

		-- 1. Check for spell type
    	if DarkSpells[spell.english] then
    		equip(sets.midcast.magic.dark)
    	elseif ElementalSpells[spell.english] then
    		equip(sets.midcast.magic.elemental)
    	elseif EnfeeblingSpells[spell.english] then
    		equip(sets.midcast.magic.enfeebling)
    	elseif EnhancingSpells[spell.english] then
    		equip(sets.midcast.magic.enhancing)
    	elseif HealingSpells[spell.english] then
    		equip(sets.midcast.magic.healing)
    	elseif HelixSpells[spell.english] then
    		equip(sets.midcast.magic.helix)
	    end -- end if

	    -- 2. Check if a grimoire is up
	    if buffactive['Light Arts'] then
	    	equip(sets.jobAbility.lightArts)
	    elseif buffactive['Dark Arts'] then
	    	equip(sets.jobAbility.darkArts)
	    end -- end if

	    -- 3. Check If any stratagems are up
		if buffactive['Immanence'] then
	    	equip(sets.jobAbility.immanence)
	    end -- end if
		if buffactive['Perpetuance'] then
	    	equip(sets.jobAbility.perpetuance)
	    end -- end if

	    -- 4. Check for specific spell buffs
	    if spell.english == "Aquaveil" then
	    	equip(sets.utility.aquaveil)
	    elseif spell.english == "Klimaform" then
	    	equip(sets.utility.klimaform)
	    elseif RegenSpells[spell.english] then
	    	equip(sets.utility.regen)
	    elseif StormsurgeSpells[spell.english] then
	    	equip(sets.utility.stormsurge)
	    end -- end if

	    -- 5. Check for element bonus
	    if ElementalSpells[spell.english] then
			if spell.element == world.weather_element or spell.element == world.day_element then
				equip(sets.utility.elementBonus)
			end
		end

    end -- end if

end -- end midcast()


----------------------------------------------------------------------
-- After casting has completed
----------------------------------------------------------------------
function aftercast(spell)
	if player.status =='Engaged' then
		if sublimationMode == true then
			equip(set_combine(sets.melee, sets.jobAbility.sublimation))
		else
			equip(sets.melee)
		end
	else
		if sublimationMode == true then
			equip(set_combine(sets.idle, sets.jobAbility.sublimation))
		else
			equip(sets.idle)
		end
	end -- end if
end -- end aftercast()


----------------------------------------------------------------------
-- Bound key commands
----------------------------------------------------------------------
function self_command(command)

	-- Equip the idle set
	if command == 'toggle idle set' then
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Idle: Default Set Equipped ----->')
		-- Equip the set
		equip(sets.idle)
	end -- end if

end -- end self_command()