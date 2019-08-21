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
	sets.idle = {Default}

	-- idle : Default
	sets.idle.default = {
	ammo="Staunch Tathlum +1",
	head="Sulevia's Mask +2",
    body="Lugra Cloak +1",
	--body="Sulevia's Plate. +2",
    hands="Sulevia's Gauntlets +2",
    legs="Carmine Cuisses +1",
	--legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +2",
    neck="Loricate torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Infused Earring",
    ring1="Stikini Ring +1",ring2="Stikini Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Damage taken-5%',}},
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
    body="Emicho Haubert +1",
    hands="Emi. Gauntlets +1",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Cessance Earring",
    left_ring="Petrov Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Damage taken-5%',}},
	} -- end sets.melee.default

    ----------------------------------------------------------------------
	-- Weapon Skill sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.ws = {}

	-- Weaponskill : Default
	sets.ws.default = {
	ammo="Knobkierrie",
    head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
    body="Ignominy Cuirass +3",
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.ws.default
	
	
	-- Weaponskill :Catastrophe
	sets.ws['Catastrophe'] = {
	ammo="Knobkierrie",
	head="Ratri Sallet +1",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings +1",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Ratri Sollerets +1",
    feet="Ratri Sollerets +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.ws['Catastrophe'] 
	
	-- Weaponskill :Cross Reaper
	sets.ws['Cross Reaper'] = {
	ammo="Knobkierrie",
    head="Ratri Sallet +1",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings +1",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Ratri Sollerets +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.ws['Cross Reaper'] 
	
	-- Weaponskill :Quietus
	sets.ws['Quietus'] = {
	ammo="Knobkierrie",
    head="Ratri Sallet +1",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings +1",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Ratri Sollerets +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.ws['Quietus'] 
	
	-- Weaponskill :Insurgency
	sets.ws['Insurgency'] = {
    ammo="Knobkierrie",
    head="Ratri Sallet +1",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings +1",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Ratri Sollerets +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.ws['Insurgency'] 
	
	-- Weaponskill :Entropy
	sets.ws['Entropy'] = {
	ammo="Knobkierrie",
    head="Ratri Sallet +1",
    body="Ignominy Cuirass +3",
    hands="Ratri Gadlings +1",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Ratri Sollerets +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Shiva Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	} -- end sets.ws['Entropy'] 
	
	--Weaponskill :Resolution
	sets.ws['Resolution'] ={
	ammo="Knobkierrie",
    head={ name="Argosy Celata +1", augments={'DEX+12','Accuracy+20','"Dbl.Atk."+3',}},
    body={ name="Argosy Hauberk +1", augments={'STR+12','DEX+12','Attack+20',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs="Ig. Flanchard +3",
    feet={ name="Argosy Sollerets +1", augments={'STR+12','DEX+12','Attack+20',}},
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
    } -- end sets.ws['Resolution'] 
	
	-- Weaponskill :Torcleaver
	sets.ws['Torcleaver'] = {
	ammo="Knobkierrie",
    head="Sulevia's Mask +2",
    body="Ignominy Cuirass +3",
    hands="Sulev. Gauntlets +2",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.ws['Torcleaver'] 
	
	-- Weaponskill :Savage Blade
	sets.ws['Savage Blade'] = {
	ammo="Knobkierrie",
    head="Sulevia's Mask +2",
    body="Ignominy Cuirass +3",
    hands="Sulev. Gauntlets +2",
    legs={ name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}},
    feet="Sulev. Leggings +2",
    neck="Abyssal Beads +2",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
	} -- end sets.ws['Savage Blade'] 
	
	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fastcast
	sets.precast.fastcast = {
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Odyss. Chestplate", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+5','Mag. Acc.+1',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}},
    feet="Carmine Greaves +1",
    neck="Baetyl pendant",
    waist="Ioskeha Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
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
    body={ name="Carm. Sc. Mail +1", augments={'Attack+20','"Mag.Atk.Bns."+12','"Dbl.Atk."+4',}},
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
    feet="Ratri Sollerets +1",
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
    feet="Ratri Sollerets +1",
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
    head="Ratri Sallet +1",
    body="Heathen's Cuirass +1",
    hands="Ratri Gadlings +1",
    legs="Ratri Cuisses",
    feet="Ratri Sollerets +1",
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
    feet="Ratri Sollerets +1",
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