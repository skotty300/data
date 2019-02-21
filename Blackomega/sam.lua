function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f10 gs c toggle tp set')
	send_command('bind f11 gs c toggle accuracy set')
    send_command('bind f12 gs c toggle bow set')


	----------------------------------------------------------------------
	-- Unload key bindings upon file unload
	----------------------------------------------------------------------
	function file_unload()

	    send_command('unbind ^f9')
	    send_command('unbind ^f10')
	    send_command('unbind ^f11')
	    send_command('unbind ^f12')

	    send_command('unbind !f9')
	    send_command('unbind !f10')
	    send_command('unbind !f11')
	    send_command('unbind !f12')

	    send_command('unbind f9')
	    send_command('unbind f10')
	    send_command('unbind f11')
	    send_command('unbind f12')

	end    


	----------------------------------------------------------------------
	-- Idle set
	----------------------------------------------------------------------
	-- Initializes an array to begin storing set data
	sets.idle = {}

	-- idle : Default
	sets.idle.default = {
	    ammo="staunch Tathlum",
		head="Wakido Kabuto +3",
	    body="Wakido Domaru +2",
	    hands="Wakido Kote +3",
	    legs="Arjuna Breeches",
	    feet="Danzo Sune-Ate",
	    neck="Loricate torque +1",
	    waist="Flume Belt",
	    left_ear="Cessance Earring",
	    right_ear="Infused Earring",
	    left_ring="Defending Ring",
	    right_ring="Karieyh Ring",
	    back="moonbeam Cape",
	} -- end sets.idle.default


	----------------------------------------------------------------------
	-- TP set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.tp = {}

	-- TP : Default
	sets.tp.default = {
	    ammo="Ginsen",
     head="Flam. Zucchetto +2",
    body="Ken. Samue +1",
    hands="Wakido Kote +3",
    legs="Ken. Hakama +1",
    feet="Flam. Gambieras +2",
    neck="Sam. Nodowa +1",
    waist="Ioskeha Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10',}},
	} -- end sets.tp.default
    
	----------------------------------------------------------------------
     -- Weapon sets
    ----------------------------------------------------------------------
    -- Initializes an array to begin storing set data
    sets.weapon = {}

    -- Weapon : Bow
    bowEnabled = false
    sets.weapon.bow = {
	    range="Yoichinoyumi",
        ammo="Eminent Arrow",
	 } --end sets.bow.default


	----------------------------------------------------------------------
	-- Weapon Skill sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.ws = {}

	-- Weaponskill : Default
	sets.ws.default = {
	    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+14','Weapon skill damage +4%','STR+9','Attack+1',}},
    body="Sakonji Domaru +3",
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +4%','VIT+9','Accuracy+12','Attack+6',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+30','Weapon skill damage +4%','Accuracy+3',}},
    neck="Sam. Nodowa +1",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+7','Weapon skill damage +10%',}},
	} -- end sets.ws.default

	-- Weaponskill : Tachi: Fudo
	sets.ws['Tachi: Fudo'] = {
	   ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+14','Weapon skill damage +4%','STR+9','Attack+1',}},
    body="Sakonji Domaru +3",
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +4%','VIT+9','Accuracy+12','Attack+6',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+30','Weapon skill damage +4%','Accuracy+3',}},
    neck="Sam. Nodowa +1",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+7','Weapon skill damage +10%',}},
	} -- end sets.ws['Tachi: Fudo']

	-- Weaponskill : Tachi: Shoha
	sets.ws['Tachi: Shoha'] = {
	    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+14','Weapon skill damage +4%','STR+9','Attack+1',}},
    body="Sakonji Domaru +3",
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +4%','VIT+9','Accuracy+12','Attack+6',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+30','Weapon skill damage +4%','Accuracy+3',}},
    neck="Sam. Nodowa +1",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+7','Weapon skill damage +10%',}},
	} -- end sets.ws['Tachi: Shoha']
 
    -- Weaponskill : Tachi: Kasha
	sets.ws['Tachi: Kasha'] = {
	   ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+14','Weapon skill damage +4%','STR+9','Attack+1',}},
    body="Sakonji Domaru +3",
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +4%','VIT+9','Accuracy+12','Attack+6',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+30','Weapon skill damage +4%','Accuracy+3',}},
    neck="Sam. Nodowa +1",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Karieyh Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+7','Weapon skill damage +10%',}},
	} -- end sets.ws['Tachi: Kasha']

    
    -- Weaponskill : Namas Arrow
	sets.ws['Namas Arrow'] = {
      range="Yoichinoyumi",
      ammo="Eminent Arrow",
      head="Ken. Jinpachi",
      body="Kyujutsugi",
      hands={ name="Despair Fin. Gaunt.", augments={'Rng.Acc.+25','Rng.Atk.+20','"Recycle"+10',}},
      legs="Wakido Haidate +3",
      feet="Wakido Sune. +3",
      neck="Fotia Gorget",
      waist="Fotia Belt",
      left_ear="Flame Pearl",
      right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
      left_ring="Karieyh Ring",
      right_ring="Regal Ring",
      back={ name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	} -- end sets.ws['Namas Arrow'] 
	
	-- Weaponskill : Apex Arrow
	sets.ws['Apex Arrow'] = {
	  range="Yoichinoyumi",
      ammo="Eminent Arrow",
      head="Ken. Jinpachi",
      body="Kyujutsugi",
      hands={ name="Despair Fin. Gaunt.", augments={'Rng.Acc.+25','Rng.Atk.+20','"Recycle"+10',}},
      legs="Wakido Haidate +3",
      feet="Wakido Sune. +3",
      neck="Fotia Gorget",
      waist="Fotia Belt",
      left_ear="Drone Earring",
      right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
      left_ring="Karieyh Ring",
      right_ring="Regal Ring",
      back={ name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	} -- end sets.ws['Apex Arrow'] 
	
	-- Weaponskill : Tachi: Ageha
	sets.ws['Tachi: Ageha'] = {
	   ammo="Hydrocera",
       head="Flam. Zucchetto +1",
       body="Flamma Korazin +1",
       hands="Flam. Manopolas +1",
       legs="Flamma Dirs +1",
       feet="Flam. Gambieras +1",
       neck="Fotia Gorget",
       waist="Fotia Belt",
       left_ear="Ishvara Earring",
       right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
       left_ring="Karieyh Ring",
       right_ring="Regal Ring",
       back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.ws['Tachi: Ageha']
	
	-- Weaponskill : Tachi: Jinpu
	sets.ws['Tachi: Jinpu'] = {
	   ammo="Knobkierrie",
       head={ name="Valorous Mask", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +1%','DEX+9','Attack+4',}},
       body={ name="Found. Breastplate", augments={'Accuracy+11','Mag. Acc.+10','Attack+10','"Mag.Atk.Bns."+9',}},
       hands={ name="Founder's Gauntlets", augments={'STR+8','Attack+15','"Mag.Atk.Bns."+13','Phys. dmg. taken -3%',}},
       legs="Wakido Haidate +3",
       feet={ name="Founder's Greaves", augments={'VIT+9','Accuracy+14','"Mag.Atk.Bns."+13','Mag. Evasion+15',}},
       neck="Fotia Gorget",
       waist="Fotia Belt",
       left_ear="Ishvara Earring",
       right_ear="Friomisi Earring",
       left_ring="Karieyh Ring",
       right_ring="Regal Ring",
       back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	} -- end sets.ws['Tachi: Jinpu']
	
	----------------------------------------------------------------------
	-- Utility sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Utility : Accuracy
	accuracyOn = false;
	sets.utility.accuracy = {
	    ammo="Ginsen",
		head="Wakido Kabuto +3",
		body="Wakido Domaru +2",
		hands="Wakido Kote +3",
		legs="Wakido Haidate +3",
		feet="Flam. Gambieras +2",
		neck="Sam. Nodowa +1",
		waist="Ioskeha Belt +1",
		left_ear="Zennaroi Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Regal Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	} -- end sets.utility.accuracy

end -- end get_sets()


----------------------------------------------------------------------
-- Callback for after casting or weapon skilling begins
----------------------------------------------------------------------
function midcast(spell)
	if sets.ws[spell.name] then
		equip(sets.ws[spell.name])
    elseif spell.type == 'WeaponSkill' then
		equip(sets.ws.default)
	end
end -- end midcast()


----------------------------------------------------------------------
-- Callback for after casting or weapon skilling is finished
----------------------------------------------------------------------
function aftercast(spell)
	if player.status =='Engaged' then
		-- Check if accuracy is on
		if accuracyOn == true then
			equip(sets.utility.accuracy)
		else
			equip(sets.tp.default)
		end
	else
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
		-- Check if accuracy is on
		if accuracyOn == true then
			send_command('@input /echo <----- You have engaged a mob in your accuracy set ----->')
			equip(sets.utility.accuracy)
		else
			equip(sets.tp.default)
		end
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

	-- Equip the tp set
	if command == 'toggle tp set' then
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- TP: Default Set Equipped ----->')
		-- Equip the set
		equip(sets.tp.default)
	end -- end if

	-- Toggle the accuracy set
	if command == 'toggle accuracy set' then
		-- Check the status of the accuracy set
		if accuracyOn == false then
			-- Toggle the accuracy variable
			accuracyOn = true
			-- Alert the user which set is currently being equipped
			send_command('@input /echo <----- Accuracy: ON ----->')
			-- Equip the set if we're engaged
			if player.status == "Engaged" then
				equip(sets.utility.accuracy)
			end
		else
			-- Toggle the accuracy variable
			accuracyOn = false
			-- Alert the user which set is currently being equipped
			send_command('@input /echo <----- Accuracy: OFF ----->')
			-- Equip the set if we're engaged
			if player.status == "Engaged" then
				equip(sets.utility.accuracy)
			end
		end
	end -- end if

	-- Equip the bow set
	if command == 'toggle bow set' then
		-- Check if the bow set is currently enabled
		if bowEnabled then
			-- Alert the user which set is currently being equipped
			send_command('@input /echo <----- Weapon: Bow Unlocked ----->')
			-- Lock the bow and ammo
			enable('main', 'ammo')
			-- Toggle the bowEnabled variable
			bowEnabled = false
		else
			-- Alert the user which set is currently being equipped
			send_command('@input /echo <----- Weapon: Bow Equipped and Locked ----->')
			-- Equip the set
			equip(sets.weapon.bow)
			-- Lock the bow and ammo
			disable('main', 'ammo')
			-- Toggle the bowEnabled variable
			bowEnabled = true
		end
	end -- end if

end -- end self_command()