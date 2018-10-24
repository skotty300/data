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
	    ammo="Ginsen",
        head="Wakido Kabuto +2",
        body="Hiza. Haramaki +1",
	    hands="Sakonji Kote +1",
        legs="Flamma Dirs +1",
        feet="Flam. Gambieras +2",
        neck="Twilight Torque",
        waist="Flume Belt",
        left_ear="Infused Earring",
        right_ear="Etiolation Earring",
        left_ring="Gelatinous Ring +1",
        right_ring="Vertigo Ring",
        back="Solemnity Cape",
	} -- end sets.idle


	----------------------------------------------------------------------
	-- Melee set
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.melee = {}

	-- Melee : default
	-- Store TP: 79
	-- Triple Attack: 5%
	-- Double Attack: 31%
	sets.melee = {
	    ammo="Ginsen",
	    head="Flam. Zucchetto +2",
	    body="Ken. Samue +1",
	    hands="Wakido Kote +2",
	    legs="Wakido Haidate +3",
	    feet="Flam. Gambieras +2",
	    neck="Moonbeam Nodowa",
	    waist="Ioskeha Belt",
	    left_ear="Cessance Earring",
	    right_ear="Brutal Earring",
	    left_ring="Flamma Ring",
	    right_ring="Petrov Ring",
	    back="Takaha mantle",
	} -- end sets.melee


	----------------------------------------------------------------------
	-- Precast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.precast = {}

	-- Precast : Fast Cast
	sets.precast.fastCast = {
        ammo="Sapience Orb",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Arjuna Breeches",
        neck="Baetyl Pendant",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring",
        right_ring="Prolix Ring",
	} -- end sets.precast.fastCast


	----------------------------------------------------------------------
	-- Midcast sets
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.midcast = {}
	sets.midcast.ws = {}

	-- Midcast : Weapon Skill : Default
	-- Strength: 253
	-- Weapon Skill Damage: 25%
	sets.midcast.ws.default = {
        ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
	    body="Sakonji domaru +3",
	    hands="Regal Cpt. Gloves",
        legs="Wakido haidate +3",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Zwazo Earring +1",
        left_ring="Flamma Ring",
        right_ring="Regal Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}-- end sets.midcast.ws.default

	-- Midcast : Weapon Skill : Tachi: Fudo
	sets.midcast.ws["Tachi: Fudo"] = sets.midcast.ws.default
	-- end sets.midcast.ws["Tachi: Fudo"]

	-- Midcast : Weapon Skill : Tachi: Shoha
	sets.midcast.ws["Tachi: Shoha"] = {
        ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
	    body="Sakonji domaru +3",
	    hands="Regal Cpt. Gloves",
        legs="Wakido haidate +3",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Zwazo Earring +1",
        left_ring="Flamma Ring",
        right_ring="Regal Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
	-- end sets.midcast.ws["Tachi: Shoha"]


	----------------------------------------------------------------------
	-- Utility Sets (not bound to a key)
	----------------------------------------------------------------------
	-- Initialize an array to begin storing set data
	sets.utility = {}

	-- Hasso set
	sets.utility.hasso = {
        hands="Wakido Kote +2",
	    legs="Kasuga Haidate +1",
        feet="Wakido Sune. +2",
	} -- end sets.utility.hasso

	-- Meditate set
	sets.utility.meditate = {
        head="Wakido Kabuto +2",
        hands={ name="Sakonji Kote +1", augments={'Enhances "Blade Bash" effect',}},
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Weapon skill damage +10%',}},
	} -- end sets.utility.meditate

	-- Warding Circle set
	sets.utility.wardingCircle = {
        head="Wakido Kabuto +2",
	} -- end sets.utility.wardingCircle

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
		if sets.midcast.ws[spell.english] then
			-- Equip the appropriate specific ws set
			equip(sets.midcast.ws[spell.english])
	    else
	    	-- Equip default ws set
			equip(sets.midcast.ws.default)
		end

	elseif spell.type == 'JobAbility' then

		if spell.english == 'Hasso' then
			equip(sets.utility.hasso)
		elseif spell.english == 'Meditate' then
			equip(sets.utility.meditate)
		elseif spell.english == 'Warding Circle' then
			equip(sets.utility.wardingCircle)
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

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
        -- Default macro set/book
        if player.sub_job == 'WAR' then
                set_macro_page(2, 9)
        elseif player.sub_job == 'THF' then
                set_macro_page(1, 9)
        elseif player.sub_job == 'RNG' then
                set_macro_page(5, 9)
        else
                set_macro_page(5, 9)
        end
end -- end self_command()