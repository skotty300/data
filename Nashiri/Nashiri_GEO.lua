function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')


	----------------------------------------------------------------------
	-- Idle sets
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- Default idle set
	sets.idle = {
	    main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
	    sub="Culminus",
	    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
	    head="Azimuth Hood +1",
        body="Jhakri Robe +2",
        hands="Geo. Mitaines +1",
	    legs="Assid. Pants +1",
        feet="Bagua sandals +1",
        neck="Bagua Charm +1",
        waist="Fucho-no-Obi",
	    left_ear="Handler's Earring",
	    right_ear="Handler's Earring +1",
        left_ring="Jhakri Ring",
	    right_ring="Vocane Ring",
	    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -2%',}},
	} -- end sets.idle.default


	----------------------------------------------------------------------
	-- Melee sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Default melee set
	sets.melee = {
	    main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
	    sub="Culminus",
	    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Jhakri Coronal +1",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +1",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +1",
        neck="Asperity Necklace",
        waist="Grunfeld Rope",
        left_ear="Brutal Earring",
        right_ear="Cessance Earring",
        left_ring="Rajas Ring",
        right_ring="Jhakri Ring",
        back="Solemnity Cape",
	} -- end sets.melee.default


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Fast cast set
	sets.precast.fastCast = {
        head="Amalric coif",
        body="Shango Robe",
        hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+18','"Fast Cast"+4','CHR+8','"Mag.Atk.Bns."+7',}},
        legs="Geomancy pants +1",
        feet={ name="Merlinic Crackows", augments={'"Fast Cast"+5','CHR+7','Mag. Acc.+13',}},
        neck="Voltsurge Torque",
        waist="Witful Belt",
        left_ear="Loquac. Earring",
        right_ear="Etiolation Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back="Swith Cape",
	} -- end sets.precast.fastcast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}

	-- Magic : Default
	sets.midcast.magic = {
	    main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
        head="Ea Hat +1",
	    body="Ea Houppelande +1",
	    hands="Ea Cuffs +1",
        legs="Ea Slops +1",
        feet="Ea Pigaches +1",
	    neck="Mizu. Kubikazari",
	    waist="Refoccilation Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Mujin Band",
        right_ring="Locus Ring",
        back="Izdubar Mantle",
	} -- end sets.magic.default

	-- Midcast : Cure Potency
	sets.midcast.curePotency = {
        main={ name="Nibiru Cudgel", augments={'MND+10','Mag. Acc.+15','"Cure" potency +15%',}},
        sub="Sors Shield",
        ammo="Hydrocera",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands="Telchine Gloves",
        legs="Gyve Trousers",
        feet="Vanya Clogs",
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Lifestorm Earring",
        right_ear="Mendi. Earring",
        left_ring="Vertigo Ring",
        right_ring="Lebeche Ring",
        back="Solemnity Cape",
	} -- end sets.midcast.curePotency


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Dark magic
	sets.utility.darkMagic = {
	    main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
        body="Shango Robe",
	    neck="Erra Pendant",
        waist="Fucho-no-Obi",
	    left_ring="Evanescence Ring",
		right_ring="Archon Ring",
	    back="Perimede Cape",
	} -- end sets.utility.darkMagic

	-- Geomancer magic skill
	sets.utility.geoSkill = {
	    head="Azimuth Hood +1",
	    body={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}},
	    hands="Geo. Mitaines +1",
		legs="Bagua pants +1",
	    feet={ name="Medium's Sabots", augments={'MP+50','MND+8','"Conserve MP"+6','"Cure" potency +3%',}},
        neck="Bagua Charm +1",
	    waist="Kobo Obi",
	    back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +19','Pet: Damage taken -2%',}},
	} -- end sets.utility.geoSkill


	----------------------------------------------------------------------
	-- Spell arrays
	----------------------------------------------------------------------
	CureSpells = {
		["Cure"] = true,
		["Cure II"] = true,
		["Cure III"] = true,
		["Cure IV"] = true,
	}

	DarkSpells = {
		["Aspir"] = true,
		["Aspir II"] = true,
		["Aspir III"] = true,
		["Drain"] = true,
	}

end -- end get_sets()


----------------------------------------------------------------------
-- Callback function for when the lua is unloaded
----------------------------------------------------------------------
function file_unload()

	-- Upon unloading this lua file, remove commonly used key binds
    send_command('unbind f9')

end    


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
	if spell.action_type == 'Magic' then

		-- Check if the spell is a geo spell
		if spell.skill == 'Geomancy' or spell.skill == 'Handbell' then
			equip(sets.utility.geoSkill)
		-- Check if the spell is a cure
    	elseif CureSpells[spell.english] then
			equip(sets.midcast.curePotency)
		-- Check if the spell is dark magic
		elseif DarkSpells[spell.english] then
			equip(set_combine(sets.midcast.magic, sets.utility.darkMagic))
		-- For all other spells that do not meet the above conditions
		else
			equip(sets.midcast.magic)
		end

    end -- end if

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)
	-- Check if the player is still engaged after the cast
	if player.status =='Engaged' then
		equip(sets.melee)
	-- Check if the player is not still engaged after the cast
	else
		equip(sets.idle)
	end
end -- end aftercast()


----------------------------------------------------------------------
-- Callback for whenever engagment status changes
----------------------------------------------------------------------
function status_change(newStatus, oldStatus)
	-- Check if player status has switched to engaged
	if newStatus == 'Engaged' then
		equip(sets.melee)
	-- Check if player status has switched to idle
	else
		equip(sets.idle)
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
		equip(sets.idle)
	end -- end if

end -- end self_command()