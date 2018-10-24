function get_sets()

	----------------------------------------------------------------------
	-- Bind the keys you wish to use with GearSwap
	----------------------------------------------------------------------
	send_command('bind f9 gs c toggle idle set')
	send_command('bind f11 gs c toggle capacity set')


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
	ammo="Seething Bomblet",
	head="Sulevia's Mask +2",
    body="Sulevia's Plate. +2",
    hands="Sulevia's Gauntlets +2",
    legs="Carmine Cuisses",
    feet="Sulevia's Leggings",
    neck="Twilight torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Infused Earring",
    left_ring="Karieyh Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
	} -- end sets.idle.default


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : Default
	sets.melee.default = {
     ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Flamma korazin +2",
    hands="Sulev. Gauntlets +2",
    legs="Flamma dirs +1",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt",
    left_ear="Brutal Earring",
    right_ear="Cessance Earring",
    left_ring="Petrov Ring",
    right_ring="Flamma Ring",
    back="Atheling mantle",
	} -- end sets.melee.default

    ----------------------------------------------------------------------
	-- Weapon Skill sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.ws = {}

	-- Weaponskill : Default
	sets.ws.default = {
	ammo="Knobkierrie",
    head="Flam. Zucchetto +2",
    body="Flamma korazin +1",
    hands="Regal Cpt. Gloves",
    legs="Flamm dirs +1",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Regal Ring",
    right_ring="Flamma Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.ws.default
	
	
	-- Weaponskill :Catastrophe
	sets.ws['Catastrophe'] = {
	ammo="Knobkierrie",
    head="Ratri Sallet",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	} -- end sets.ws['Catastrophe'] 
	
	-- Weaponskill :Cross Reaper
	sets.ws['Cross Reaper'] = {
	ammo="Knobkierrie",
    head="Ratri Sallet",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	} -- end sets.ws['Cross Reaper'] 
	
	-- Weaponskill :Quietus
	sets.ws['Quietus'] = {
	ammo="Knobkierrie",
    head="Ratri Sallet",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings",
    legs="Ratri Cuisses",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	} -- end sets.ws['Quietus'] 
	
	-- Weaponskill :Insurgency
	sets.ws['Insurgency'] = {
    ammo="Knobkierrie",
    head="Ratri Sallet",
    body="Ignominy Cuirass +3",
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.ws['Insurgency'] 
	
	-- Weaponskill :Entropy
	sets.ws['Entropy'] = {
	ammo="Floestone",
    head="Ig. Burgonet +2",
    body="Ignominy Cuirass +3",
    hands="Regal Cpt. Gloves",
    legs="Ig. Flanchard +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Shiva Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	} -- end sets.ws['Entropy'] 
	
	--Weaponskill :Resolution
	sets.ws['Resolution'] ={
	ammo="Knobkierrie",
    head="Ig. Burgonet +2",
    body="Ignominy Cuirass +3",
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
    } -- end sets.ws['Resolution'] 
	
	-- Weaponskill :Torcleaver
	sets.ws['Torcleaver'] = {
	ammo="Knobkierrie",
    head="Ig. Burgonet +2",
    body="Ignominy Cuirass +3",
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +2",
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	} -- end sets.ws['Torcleaver'] 
	
	
	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fastcast
	sets.precast.fastcast = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Odyss. Chestplate", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+5','Mag. Acc.+1',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Baetyl pendant",
    waist="Ioskeha Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Weather. Ring",
    back="Repulse Mantle",
	} -- end sets.precast.fastcast


	----------------------------------------------------------------------
	-- Magic set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.magic = {}

	-- Magic : Default
	sets.default = {
	 ammo="Pemphredo Tathlum",
    head="Ig. Burgonet +2",
    body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
    hands={ name="Fall. Fin. Gaunt. +1", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+16','"Conserve MP"+3','"Fast Cast"+3',}},
    feet="Flam. Gambieras +1",
    neck="Erra Pendant",
    waist="Casso Sash",
    left_ear="Hirudinea Earring",
    right_ear="Dark Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back={ name="Niht Mantle", augments={'Attack+15','Dark magic skill +10','"Drain" and "Aspir" potency +17',}},
	} -- end sets.default


	
	sets.midcast = {}
    sets.midcast.AbsorbSpells = {}
	sets.midcast.darkMagic = {} 
	sets.midcast.DreadSpikes ={}
	sets.midcast.drain = {}
	
	-- Absorb magic spells
	sets.midcast.AbsorbSpells = {
     ammo="Pemphredo Tathlum",
    head="Ig. Burgonet +2",
    body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
    hands="Pavor Gauntlets",
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+16','"Conserve MP"+3','"Fast Cast"+3',}},
    feet="Ratri Sollerets",
    neck="Erra Pendant",
    waist="Casso Sash",
    left_ear="Loquac. Earring",
    right_ear="Dark Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back="Chuparrosa Mantle",
	} -- end sets.AbsorbSpells
	
	-- Dark magic
	sets.midcast.darkMagic = {
	 head="Ig. Burgonet +2",
    body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
    hands={ name="Fall. Fin. Gaunt. +1", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+16','"Conserve MP"+3','"Fast Cast"+3',}},
    feet="Ratri Sollerets",
    neck="Incanter's Torque",
    waist="Casso Sash",
    left_ear="Loquac. Earring",
    right_ear="Dark Earring",
    left_ring="Kishar Ring",
    right_ring="Evanescence Ring",
    back={ name="Niht Mantle", augments={'Attack+15','Dark magic skill +10','"Drain" and "Aspir" potency +17',}}, 
	} -- end sets.darkMagic
	
	-- Dread Spikes
	sets.midcast.DreadSpikes = {
    ammo="Egoist's Tathlum",
    head="Ratri Sallet",
    body="Heathen's Cuirass +1",
    hands="Ratri Gadlings",
    legs="Ratri Cuisses",
    feet="Ratri Sollerets",
    neck="Dualism Collar +1",
    waist="Oneiros Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Meridian Ring",
    right_ring="K'ayres Ring",
    back="Moonbeam Cape",
	} -- end sets.DreadSpikes

	sets.midcast.drain = {
	 ammo="Pemphredo Tathlum",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Carm. Scale Mail", augments={'MP+60','INT+10','MND+10',}},
    hands={ name="Fall. Fin. Gaunt. +1", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
    feet="Ratri Sollerets",
    neck="Erra Pendant",
    waist="Austerity Belt +1",
    left_ear="Hirudinea Earring",
    right_ear="Dark Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back={ name="Niht Mantle", augments={'Attack+15','Dark magic skill +10','"Drain" and "Aspir" potency +17',}},
}
	
	
	--Utility
	sets.Utility = {}
	
			--Capacity Points
			CPSetEnabled = false
			sets.Utility.capacityPoints = {
			back={ name="Mecisto. Mantle", augments={'Cap. Point+50%','MP+17','Rng.Atk.+3','DEF+6',}},

			}
	
	
	-- Spell Arrays
	darkMagic = {	
		["Endark"] = true,
		["Endark II"] = true,
	}
	
	AbsorbSpells = {
		["Absorb-STR"] = true,
		["Absorb-DEX"] = true,
		["Absorb-VIT"] = true,
		["Absorb-AGI"] = true,
		["Absorb-INT"] = true,
		["Absorb-MND"] = true,
		["Absorb-CHR"] = true,
		["Absorb-TP"] = true,
		["Absorb-ACC"] = true,
		["Absorb-Attri"] = true,
	}
		
	DreadSpikes = {
	    ["Dread Spikes"] = true,	
		}
	
	drain ={
	   ["Drain"] = true,
	   ["Drain II"] = true,
	   ["Drain III"] = true,
	   ["Aspir"] = true,
	   ["Aspir"] = true,
	   }
	   
end -- end get_sets() 





----------------------------------------------------------------------
-- Callback for after casting begins, but before it fires
----------------------------------------------------------------------
function midcast(spell)

	-- Check if the action is a specified weapon skill
	

		-- Check if this is  magic
		if AbsorbSpells[spell.english] then 
			equip(sets.midcast.AbsorbSpells)
		elseif darkMagic[spell.english] then
			equip(sets.midcast.darkMagic)
		elseif DreadSpikes[spell.english] then
			equip(sets.midcast.DreadSpikes)
		elseif drain[spell.english] then
		     equip(sets.midcast.drain)
			 
			equip(sets.midcast.default)
		end -- if

       if sets.ws[spell.name] then
		equip(sets.ws[spell.name])
    elseif spell.type == 'WeaponSkill' then
		equip(sets.ws.default)
	end
	
	
	
	
	
			

end -- end midcast()



----------------------------------------------------------------------
-- Callback for when casting begins
----------------------------------------------------------------------
function precast(spell)
    if spell.action_type == 'Magic' then
		equip(sets.precast.fastcast)
	 end	
		
		
		
end -- end precast()




----------------------------------------------------------------------
-- Callback for after casting or weapon skilling begins
----------------------------------------------------------------------



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
-- Callback for after casting has fired
----------------------------------------------------------------------
function aftercast(spell)
	if player.status =='Engaged' then
		equip(sets.melee.default)
		-- Check if capacity points is enabled
		if capacityPoints == true then
			equip(sets.utility.capacityPoints)
		end
	else
		equip(sets.melee.default)
		equip(sets.idle.default)
		-- Check if capacity points is enabled
		if capacityPoints == true then
			equip(sets.utility.capacityPoints)
		end
	end
end -- end aftercast()


----------------------------------------------------------------------
-- Callback for whenever engagment status changes
----------------------------------------------------------------------
function status_change(new,old)
	if new == 'Idle' then
		equip(sets.idle.default)
		-- Check if capacity points is enabled
		if capacityPoints == true then
			equip(sets.utility.capacityPoints)
		end
	elseif new == 'Engaged' then
		equip(sets.melee.default)
		-- Check if capacity points is enabled
		if capacityPoints == true then
			equip(sets.utility.capacityPoints)
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

	-- Equip the melee set
	if command == 'toggle melee set' then
		-- Alert the user which set is currently being equipped
		send_command('@input /echo <----- Melee: Default Set Equipped ----->')
		-- Equip the set
		equip(sets.melee.default)
	end -- end if

	-- Toggle on or off the capacity points utility set
	if command == 'toggle capacity set' then
		if CPSetEnabled then
		CPSetEnabled = false
			send_command('@input /echo CP OFF')
		else CPSetEnabled = true
			send_command('@input /echo <----- Capacity Points Enabled ----->')
			equip(sets.Utility.capacityPoints)
		end

	end -- end if

end -- end self_command()