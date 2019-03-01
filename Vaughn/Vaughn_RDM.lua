function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- idle : Default
	sets.idle = {
	    ammo="Staunch Tathlum",
	    head="Befouled Crown",
	    body="Jhakri Robe +2",
	    hands="Aya. Manopolas +1",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +1",
        neck="Loricate Torque",
	    waist="Fucho-no-Obi",
	    left_ear="Ethereal Earring",
	    right_ear="Etiolation Earring",
	    left_ring="Gelatinous Ring",
	    right_ring="Ayanmo Ring",
        back="Moonbeam Cape",
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Default melee set
	sets.melee = {
	    ammo="Ginsen",
	    head="Aya. Zucchetto +1",
	    body="Ayanmo Corazza +2",
	    hands="Aya. Manopolas +1",
	    legs="Aya. Cosciales +2",
	    feet="Aya. Gambieras +1",
        neck="Sanctity Necklace",
	    waist="Eschan Stone",
	    left_ear="Sherida Earring",
	    right_ear="Brutal Earring",
	    left_ring="Petrov Ring",
	    right_ring="Rajas Ring",
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fastcast
	-- Fast Cast: 56%
	sets.precast.fastcast = {
		head="Amalric coif",
        body="Shango Robe",
        hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+18','"Fast Cast"+4','CHR+8','"Mag.Atk.Bns."+7',}},
        legs="Aya. Cosciales +2",
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
	-- Magic set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.magic = {}

	-- Magic : Default
	sets.midcast.magic.default = {
	    ammo="Regal Gem",
	    main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
        head="Merlinic hood",
	    body="Ea Houppelande",
	    hands="Ea Cuffs",
        legs="Ea Slops",
        feet="Ea Pigaches",
	    neck="Mizu. Kubikazari",
	    waist="Refoccilation Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Mujin Band",
        right_ring="Locus Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
	} -- end sets.magic.default

	-- Magic : Healing
		sets.midcast.magic.healing = {
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
	}-- end sets.magic.healing

	-- Magic : Enhancing
	sets.midcast.magic.enhancing = sets.midcast.magic.default
	-- end sets.magic.enhancing

	-- Magic : Enfeebling
	sets.midcast.magic.enfeebling = sets.midcast.magic.default
	-- end sets.magic.enfeebling
	

end -- end get_sets()


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

		-- Check if this is healing magic
		if MagicEnfeebling[spell.name] then
			equip(sets.midcast.magic.enfeebling)
		elseif MagicEnhancing[spell.name] then
			equip(sets.midcast.magic.enhancing)
		elseif MagicHealing[spell.name] then
			equip(sets.midcast.magic.healing)
		else
			equip(sets.midcast.magic.default)
		end

    end -- end if

end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)
	-- Check if player status has switched to engaged
	if player.status =='Engaged' then
		equip(sets.melee)
	else
		equip(sets.idle)
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
		-- Equip the set
		equip(sets.idle)
	end -- end if

end -- end self_command()