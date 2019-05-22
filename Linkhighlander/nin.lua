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
        ammo="Yamarang",
        head="Mummu Bonnet +2",
        body="Hiza. Haramaki +2",
        hands="Mummu Wrists +2",
        legs="Mummu Kecks +2",
        feet="Danzo Sune-Ate",
        neck="Loricate Torque +1",
        waist="Flume Belt +1",
        left_ear="Odnowa Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Defending Ring",
        right_ring="Warden's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : default
	sets.melee = {
	    ammo="Yamarang",
	    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
	    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+1','STR+9','Accuracy+9','Attack+14',}},
	    neck="Clotharius Torque",
	    waist="Windbuffet Belt +1",
	    left_ear="Telos Earring",
	    right_ear="Brutal Earring",
	    left_ring="Epona's Ring",
	    right_ring="Ilabrat Ring",
	    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fast Cast
	sets.precast.fastCast = {
	    head={ name="Herculean Helm", augments={'Rng.Atk.+21','Crit.hit rate+3','STR+9','Rng.Acc.+8',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+1','STR+9','Accuracy+9','Attack+14',}},
	    neck="Orunmila's Torque",
	    left_ear="Loquac. Earring",
	    right_ear="Etiolation Earring",
	    right_ring="Prolix Ring",
	} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}

	-- Midcast : Magic
	sets.midcast.magic = {
	} -- end sets.midcast.magic

	-- Midcast : Weapon Skill : Default
	sets.midcast.ws.default = {
	    ammo="Yamarang",
	    head="Mummu Bonnet +2",
	    body="Mummu Jacket +2",
	    hands="Mummu Wrists +2",
	    legs="Mummu Kecks +2",
	    feet="Mummu Gamash. +1",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Ishvara Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
	    left_ring="Regal Ring",
	    right_ring="Begrudging Ring",
	    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Blade: Hi
	sets.midcast.ws["Blade: Hi"] = {
	    ammo="Yamarang",
	    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	    body="Abnoba Kaftan",
	    hands="Kobo Kote",
	    legs="Jokushu Haidate",
	    feet="Mummu Gamash. +2",
	    neck="Fotia Gorget",
	    waist="Fotia Belt",
	    left_ear="Ishvara Earring",
	    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
	    left_ring="Regal Ring",
	    right_ring="Begrudging Ring",
	    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.midcast.ws["Blade: Hi"]


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Futae set
	sets.utility.futae = {
	} -- end sets.utility.futae

	-- Innin set
	sets.utility.innin = {
	} -- end sets.utility.innin

	-- Migawari set
	sets.utility.migawari = {
	} -- end sets.utility.migawari

	-- Utsusemi set
	sets.utility.utsusemi = {
        feet="Iga Kyahan +2",
	} -- end sets.utility.utsusemi

	-- Yonin set
	sets.utility.yonin = {
	} -- end sets.utility.yonin


	----------------------------------------------------------------------
	-- Spell arrays
	----------------------------------------------------------------------
	MigawariSpells = {
		["Migawari: Ichi"] = true,
	}

	UtsusemiSpells = {
		["Utsusemi: Ichi"] = true,
		["Utsusemi: Ni"] = true,
		["Utsusemi: San"] = true,
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

	-- Check if the action is a weapon skill
    if spell.type == 'WeaponSkill' then
		-- Check if the action is a specified weapon skill
		if sets.midcast.ws[spell.name] then
			equip(sets.midcast.ws[spell.name])
		-- If not, use the default weapon skill set
	    else
			equip(sets.midcast.ws.default)
		end
	-- Check if the action is a magic spell
    elseif spell.action_type == 'Magic' then
    	-- Check if the spell is migawari
    	if MigawariSpells[spell.name] then
			equip(sets.utility.migawari)
    	-- Check if the spell is utsusemi
    	elseif UtsusemiSpells[spell.name] then
			equip(sets.utility.utsusemi)
    	-- Equip the catch all magic set
    	else
			equip(sets.midcast.magic)
		end
	-- Check if the action is a job ability
	elseif spell.type == 'JobAbility' then
		if spell.name == 'Futae' then
			equip(sets.utility.futae)
		elseif spell.name == 'Innin' then
			equip(sets.utility.innin)
		elseif spell.name == 'Yonin' then
			equip(sets.utility.yonin)
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