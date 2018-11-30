function get_sets()

	--Binds
	send_command('bind f9 gs c Toggle Idle Set')
	send_command('bind f10 gs c Toggle Melee Set')
	send_command('bind ^f10 gs c Toggle CDC Set')
	send_command('bind f11 gs c Toggle Tank Set')
	--send_command('bind ^f12 gs c Toggle Tank/Melee Mode')
	send_command('bind f12 gs c Toggle TH Set')
	
	-- Upon unloading this lua file, remove key bindings
	function file_unload()

	    send_command('unbind ^f9')
	    send_command('unbind ^f10')
	    send_command('unbind ^f11')
	    -- send_command('unbind ^f12')

	    send_command('unbind !f9')
	    send_command('unbind !f10')
	    send_command('unbind !f11')
	    -- send_command('unbind !f12')

	    send_command('unbind f9')
	    send_command('unbind f10')
	    send_command('unbind f11')
	    -- send_command('unbind f12')

	end
	
	--Idle Set (Refresh and DT)
	sets.Idle = {}
	idleSetHasBeenChanged = false
	idleSetIndex = 0
	idleSetNames = {
		[0] = 'Refresh',
		[1] = 'DT',
	}

	--1= Refresh
	sets.Idle[0] = {
	  head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
      body="Jhakri Robe +1",
      hands="Jhakri Cuffs +1",
      legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
      feet="Hippomenes Socks",
      neck="Loricate Torque +1",
      waist="Goading Belt",
      left_ear="Suppanomimi",
      right_ear="Brutal Earring",
      left_ring="Patricius Ring",
      right_ring="Defending Ring",
      back={ name="Mecisto. Mantle", augments={'Cap. Point+50%','MP+17','Rng.Atk.+3','DEF+6',}},
	}

	--2 = DT
	sets.Idle[1] = {
        head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +1",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
	}
			
	--Melee Set (Various)
	sets.Melee = {}
	meleeSetHasBeenChanged = false
	meleeSetIndex = 0
	meleeSetNames = {
		[0] = 'Haste',
		[1] = 'AccHaste',
		[2] = 'STPHaste',
		[3] = 'AccSTPHaste',
	}

	--1=Haste
	sets.Melee[0] = {
	ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Crit. hit damage +3%',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+3',}},
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Lupine Cape",
	}

	--2=ACCHaste
	sets.Melee[1] = {
		ammo="Ginsen",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body="Assim. Jubbah +3",
		hands="Assim. Bazu. +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet="Assim. Charuqs +2",
		neck="Combatant's Torque",
		waist="Kentarch Belt +1",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}

	--3=STPHaste
	sets.Melee[2] = {
	 ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Crit. hit damage +3%',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+3',}},
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Lupine Cape",
	}

	--4=ACCSTPHaste
	sets.Melee[3] = {
	 ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Crit. hit damage +3%',}},
   body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+3',}},
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Lupine Cape",
	}
	
	----Tank Set:
	sets.Tank = {}
	tankSetHasBeenChanged = false
	tankSetIndex = 0
	tankSetNames = {
	[0] = '_Tank DT_',
	[1] = '_Tank Melee_',
	}

	sets.Tank[0] = {
	 ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Crit. hit damage +3%',}},
    body="Sayadio's Kaftan",
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+3',}},
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Lupine Cape",
	}
	
	sets.Tank[1] = {
	 ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Crit. hit damage +3%',}},
    body="Sayadio's Kaftan",
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+3',}},
    neck="Lissome Necklace",
    waist="Kentarch Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Lupine Cape",
	}
	
	--Melee/Tank Toggle
	--sets.Switch = {}
	--MTSetHasBeenChanged = false
	--MTSetIndex = 0
	--MTSetNames = {
	--	[0] = 'Melee Mode Active',
	--	[1] = 'Tank Mode Active',
	--}
	
	--sets.Switch[0] = (sets.Melee[meleeSetIndex])
	
	
	--sets.Switch[1] = (sets.Tank[tankSetIndex])
	
	--Treasure Hunter Toggle
	sets.Utility = {}

	thSetEnabled = false
	sets.Utility.TH = {
		head={ name="Herculean Helm", augments={'Pet: "Dbl. Atk."+4','"Subtle Blow"+4','"Treasure Hunter"+1','Accuracy+19 Attack+19',}},
		hands={ name="Herculean Gloves", augments={'STR+9','Crit.hit rate+2','"Treasure Hunter"+1','Accuracy+16 Attack+16','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		legs={ name="Herculean Trousers", augments={'Crit.hit rate+2','"Occult Acumen"+11','"Treasure Hunter"+1',}},
		feet={ name="Herculean Boots", augments={'Rng.Atk.+21','Weapon skill damage +1%','"Treasure Hunter"+1','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
		waist="Chaac Belt"
	}
			
	--Weaponskill Sets (Sword, Club)
	sets.WS = {}
	--Sword Weaponskill
	
	--Chant Du Cygne
	sets.WS.ChantDuCygne = {}
	cdcSetHasBeenChanged = false
	wsChantDuCygneSetIndex = 0
	wsChantDuCygneSetNames = {
		[0] = 'FullDD',
		[1] = 'ACC',
	}

	sets.WS.ChantDuCygne[0] = {
		 ammo="Honed Tathlum",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Weapon skill damage +1%','DEX+13','Accuracy+4',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Ramuh Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
	}

	sets.WS.ChantDuCygne[1] = {
		ammo="Jukukik Feather",
		head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
		hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
		legs={ name="Herculean Trousers", augments={'Accuracy+29','Crit. hit damage +3%','DEX+9','Attack+5',}},
		feet="Aya. Gambieras +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Telos Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}

	--Requiescat
	sets.WS['Requiescat'] = {
		head="Jhakri Coronal +1",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Regal Earring",
		left_ring="Epona's Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}

	--Sanguine Blade
	sets.WS['Sanguine Blade'] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Jhakri Ring",
		right_ring="Archon Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}

	--Circle Blade
	sets.WS['Circle Blade'] = {
		ammo="Floestone",
		head={ name="Herculean Helm", augments={'Accuracy+23','Weapon skill damage +3%','STR+10',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Herculean Trousers", augments={'Attack+14','Weapon skill damage +4%','DEX+15','Accuracy+6',}},
		feet={ name="Herculean Boots", augments={'Attack+13','Weapon skill damage +5%','STR+8','Accuracy+7',}},
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Ifrit Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	--Expiacion
	sets.WS['Expiacion'] = {
		ammo="Floestone",
		head={ name="Herculean Helm", augments={'Accuracy+23','Weapon skill damage +3%','STR+10',}},
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs={ name="Herculean Trousers", augments={'Attack+14','Weapon skill damage +4%','DEX+15','Accuracy+6',}},
		feet={ name="Herculean Boots", augments={'Attack+16','Weapon skill damage +3%','STR+15','Accuracy+11',}},
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Shukuyu Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	--Flat Blade
	sets.WS['Flat Blade'] = {
		ammo="Floestone",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		right_ear="Regal Earring",
		left_ring="Epona's Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
					
		--Club Weaponskill
	
				--True Strike
					--sets.WS.TrueStrike = {}
					--sets.WS.TrueStrike = {
					--SET HERE
					--}
				
				--Judgment
					--sets.WS.Judgment = {}
					--sets.WS.Judgment = {
					--SET HERE
					--}
					
	--Casting: PreCast, MidCast (JA's and Spells)
	--PreCast Magic
	sets.precast = {}

	sets.precast.FC = {
	  ammo="Sapience Orb",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Helios Jacket", augments={'"Mag.Atk.Bns."+17','"Fast Cast"+5',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
	}

				
	--Blue Magic Sets for MidCast
	sets.BLU = {}

	--BlueSTR
	sets.BLU.BlueSTR = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueSTRDEX
	sets.BLU.BlueSTRDEX = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueSTRVIT
	sets.BLU.BlueSTRVIT = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueMND
	sets.BLU.BlueMND = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueAGI
	sets.BLU.BlueAGI = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueINT
	sets.BLU.BlueINT = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueDark
	sets.BLU.BlueDark = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueHeal
	sets.BLU.BlueHeal = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BluePhysDebuff
	sets.BLU.BluePhysDebuff = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueMAcc
	sets.BLU.BlueMAcc = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueMagicSkill
	sets.BLU.BlueMagicSkill = {
	ammo="Mavi Tathlum",
    head={ name="Luhlaza Keffiyeh", augments={'Enhances "Convergence" effect',}},
    body="Assim. Jubbah +1",
    hands={ name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}},
    legs="Mavi Tayt +1",
    feet={ name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}},
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--BlueConserveMP
	sets.BLU.BlueConserveMP = {
		 ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    right_ring="Shiva Ring",
    back={ name="Cornflower Cape", augments={'MP+24','DEX+2','Accuracy+4',}},
	}

	--Utility MidCast Set
	--BlueEnmity
	sets.Utility.Enmity = {
		ammo="Staunch Tathlum",
		head="Rabid Visor",
		body="Emet Harness +1",
		hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		neck="Unmoving Collar +1",
		waist="Goading Belt",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Eihwaz Ring",
		right_ring="Supershear Ring",
		back="Fravashi Mantle",
	}

	--EnhanceDuration
	sets.Utility.EnhanceDuration = {
		ammo="Pemphredo Tathlum",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'Pet: "Regen"+2','Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Pet: "Regen"+2','Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +7',}},
		neck="Incanter's Torque",
		waist="Gishdubar Sash",
		left_ear="Andoaa Earring",
		right_ear="Calamitous Earring",
		left_ring="Stikini Ring",
		right_ring="Evanescence Ring",
		back="Solemnity Cape",
	}		

	--Weather
	sets.Utility.Weather = {
		waist="Hachirin-no-obi"
	}
				
	--Magic Burst
	--sets.Utility.MB

	--Treasure Hunter
	sets.Utility.TH = {
		head={ name="Herculean Helm", augments={'Pet: "Dbl. Atk."+4','"Subtle Blow"+4','"Treasure Hunter"+1','Accuracy+19 Attack+19',}},
		hands={ name="Herculean Gloves", augments={'STR+9','Crit.hit rate+2','"Treasure Hunter"+1','Accuracy+16 Attack+16','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		legs={ name="Herculean Trousers", augments={'Crit.hit rate+2','"Occult Acumen"+11','"Treasure Hunter"+1',}},
		feet={ name="Herculean Boots", augments={'Rng.Atk.+21','Weapon skill damage +1%','"Treasure Hunter"+1','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
		waist="Chaac Belt"
	}


	--Ability Sets (Alter Sets from Magic): sets.JA
	--Diffusion
	sets.JA = {}
	sets.JA.Diffusion = {				
		feet ={name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}}
	}
	--Burst Affinity 
	sets.JA.BurstAffinity = {
		feet="Hashi. Basmak +1"
	}
	--Chain Affinity
	sets.JA.ChainAffinity = {
		feet="Assim. Charuqs +2"
	}
	--Efflux
	sets.JA.Efflux = {
		legs="Hashishin Tayt +1",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	BlueSTR = {
		["Vertical Cleave"] = true,
		["Death Scissors"] = true,
		["Empty Thrash"] = true,
		["Dimensional Death"] = true,
		["Quadrastrike"] = true,
		["Bloodrake"] = true,
		["Heavy Strike"] = true,
	}
	
	BlueSTRDEX = {
		["Disseverment"] = true,
		["Hysteric Barrage"] = true,
		["Frenetic Rip"] = true,
		["Seedspray"] = true,
		["Vanity Dive"] = true,
		["Goblin Rush"] = true,
		["Paralyzing Triad"] = true,
		["Thrashing Assault"] = true,
	}	
		
	BlueSTRVIT = {	
		["Quad. Continuum"] = true,
		["Delta Thrust"] = true,
		["CannonBall"] = true,
		["Glutinous Dart"] = true,
	}
	
	BlueSTRMND = {
		["Whirl of Rage"] = true,
	}
	
	BlueAGI = {
		["Benthic Typhoon"] = true,
		["Final Sting"] = true,
		["Spiral Spin"] = true,
	}
	
	BlueINT = {
		["Gates of Hades"] = true,
		["Lunge"] = true,
		["Swipe"] = true,
		["Leafstorm"] = true,
		["Firespit"] = true,
		["Acrid Stream"] = true,
		["Regurgitation"] = true,
		["Corrosive Ooze"] = true,
		["Thermal Pulse"] = true,
		["Magic Hammer"] = true,
		["Evryone. Grudge"] = true,
		["Water Bomb"] = true,
		["Dark Orb"] = true,
		["Thunderbolt"] = true,
		["Temp. Upheaval"] = true,
		["Embalming Earth"] = true,
		["Foul Waters"] = true,
		["Rending Deluge"] = true,
		["Droning Whirlwind"] = true,
		["Subduction"] = true,
		["Anvil Lightning"] = true,
		["Blinding Fulgor"] = true,
		["Entomb"] = true,
		["Scouring Spate"] = true,
		["Searing Tempest"] = true,
		["Silent Storm"] = true,
		["Diffusion Ray"] = true,
		["Spectral Floe"] = true,
		["Charged Whisker"] = true,
		["Crashing Thunder"] = true,
		["Polar Roar"] = true,
		["Gates of Hades"] = true,
		["Charged Whisker"] = true,
		["Droning Whirlwind"] = true,
	}	
	
	BlueDark = {
		["Tenebral Crush"] = true,
		["Palling Salvo"] = true,
	}
	
	BlueHeal = {
		["Magic Fruit"] = true,
		["Plenilune Embrace"] = true,
		["Wild Carrot"] = true,
		["Pollen"] = true,
		["White Wind"] = true,
		["Cure"] = true,
		["Cure II"] = true,
		["Cure III"] = true,
		["Cure IV"] = true,
		["Curaga"] = true,
		["Curaga II"] = true,
	}
	
	BluePhysDebuff = {
		["Head Butt"] = true,
		["Sudden Lunge"] = true,
		["Tourbillion"] = true,
		["Saurian Slide"] = true,
		["Sweeping Gouge"] = true,
		["Frypan"] = true,
	}
	
	BlueMAcc = {
		["Frightful Roar"] = true,
		["Infrasonics"] = true,
		["Chaotic Eye"] = true,
		["Auroral Drape"] = true,
		["Sheep Song"] = true,
		["Barbed Crescent"] = true,
		["Cimicine Discharge"] = true,
		["Sub-zero smash"] = true,
		["Filamented Hold"] = true,
		["Mind Blast"] = true,
		["Sandspin"] = true,
		["Hecatomb Wave"] = true,
		["Blank Gaze"] = true,
		["Cold Wave"] = true,
		["Terror Touch"] = true,
		["Retinal Glare"] = true,
		["Dream Flower"] = true,
		["Geist Wall"] = true,
		["Absolute Terror"] = true,
		["Blistering Roar"] = true,
		["Yawn"] = true,
		["Soporific"] = true,
		["Actinic Burst"] = true,
		["Bilgestorm"] = true,
		["Cruel Joke"] = true,
	}
	
	BlueMagicSkill = {
		["MP Drainkiss"] = true,
		["Digest"] = true,
		["Blood Saber"] = true,
		["Blood Drain"] = true,
		["Osmosis"] = true,
		["Occultation"] = true,
		["Magic Barrier"] = true,
		["Diamondhide"] = true,
		["Metallic Body"] = true,
	}
		
	BlueEnmity = {
		["Fantod"] = true,
		["Jettatura"] = true,
		["Wind Breath"] = true,
		["Exuviation"] = true,
		["Provoke"] = true,
	}
		
	BlueConserveMP = {
		["Mighty Guard"] = true,
		["Erratic Flutter"] = true,
		["Nat. Meditation"] = true,
		["Uproot"] = true,
		["Saline Coat"] = true,
		["Barrier Tusk"] = true,
		["Winds of Promy"] = true,
		["Carcharian Verve"] = true,
		["Battery Charge"] = true,
		["Cocoon"] = true,
		["Harden Shell"] = true,
		["Regeneration"] = true,
	}
	
	EnhanceDuration = {
		["Refresh"] = true,
		["Phalanx"] = true,
		["Blink"] = true,
		["Stoneskin"] = true,
		["Regen"] = true,
		["Regen II"] = true,
		["Flurry"] = true,
		["Aquaveil"] = true,
	}

end -- end get_sets()

				
--Functions:

--Casting Functions:

--PreCast Functions
function precast(spell)
	if spell.action_type == 'Magic' then
		equip(sets.precast.FC)
	end -- end if
end -- end precast()

--MidCast Functions (Blue Magic, Utility, includes abilities and from subs)
function midcast(spell)

	if BlueSTR[spell.english] then
		equip(sets.BLU.BlueSTR)
	elseif BlueSTRDEX[spell.english] then
		equip(sets.BLU.BlueSTRDEX)
	elseif BlueSTRVIT[spell.english] then
		equip(sets.BLU.BlueSTRVIT)
	elseif BlueSTRMND[spell.english] then
		equip(sets.BLU.BlueSTRMND)
	elseif BlueAGI[spell.english] then
		equip(sets.BLU.BlueAGI)
	elseif BlueINT[spell.english] then
		equip(sets.BLU.BlueINT)
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.Utility.Weather)
		end -- end if
	elseif BlueDark[spell.english] then
		equip(sets.BLU.BlueDark)
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.Utility.Weather)
		end -- end if
	elseif BlueHeal[spell.english] then
		equip(sets.BLU.BlueHeal)
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.Utility.Weather)
		end -- end if
	elseif BluePhysDebuff[spell.english] then
		equip(sets.BLU.BluePhysDebuff)
	elseif BlueMAcc[spell.english] then
		equip(sets.BLU.BlueMAcc)
		if spell.element == world.day_element or spell.element == world.weather_element then
			equip(sets.Utility.Weather)
		end
	elseif BlueMagicSkill[spell.english] then
		equip(sets.BLU.BlueMagicSkill)
	elseif BlueConserveMP[spell.english] then
		equip(sets.BLU.BlueConserveMP)
	elseif EnhanceDuration[spell.english] then
		equip(sets.Utility.EnhanceDuration)
	elseif BlueEnmity[spell.english] then
		equip(sets.Utility.Enmity)
	end -- end if

	-- Check for burst affinity
	if buffactive['Burst Affinity'] then
		equip(sets.JA.BurstAffinity)
	end -- end if

	-- Check for chain affinity
	if buffactive['Chain Affinity'] then
		equip(sets.JA.ChainAffinity)
	end -- end if

	-- Check for diffusion
	if buffactive['Diffusion'] then
		equip(sets.JA.Diffusion)
	end

	--Treasure Hunter Subduction
	if spell.english == 'Subduction' and thSetEnabled == true then
		equip(sets.Utility.TH)
	end

	--WS Functions
	if spell.name == 'Chant du Cygne' then
		equip(sets.WS.ChantDuCygne[wsChantDuCygneSetIndex])
	elseif sets.WS[spell.name] then
		equip(sets.WS[spell.name])
	end

end --end MidCast Function

--Melee and Idle Phase Determination Functions (Post Cast, Engagement Change, Forced Toggle)
--Post Cast
function aftercast(spell)
	if player.status =='Engaged' then
		equip(sets.Melee[meleeSetIndex])
		if tankSetHasBeenChanged == true then
		equip(sets.Tank[tankSetIndex])
		end
		end
	if player.status =='Idle' then
		equip(sets.Idle[idleSetIndex])
		if tankSetHasBeenChanged == true then
		equip(sets.Tank[tankSetIndex])
		end
		end
end -- end aftercast()

--Engagement Change
function status_change(new,old)
	if new == 'Idle' then
		equip(sets.Idle[idleSetIndex])
	elseif new == 'Engaged' then
		equip(sets.Melee[meleeSetIndex])
	if tankSetHasBeenChanged == true then
		equip(sets.Tank[tankSetIndex])	
		end
	end
end -- end status_change()

--Forced Toggle
function self_command(command)

	-- Equip the idle set
	if command == 'Toggle Idle Set' then
		if idleSetHasBeenChanged == false then
			idleSetHasBeenChanged = true
		elseif idleSetIndex > (table.getn(sets.Idle) - 1) then
			idleSetIndex = 0
		else
			idleSetIndex = idleSetIndex + 1
		end
		equip(sets.Idle[idleSetIndex])
		send_command('@input /echo Idle Mode ' .. idleSetNames[idleSetIndex])
	end -- end if

	-- Equip the melee set
	if command == 'Toggle Melee Set' then
		if meleeSetHasBeenChanged == false then
		meleeSetHasBeenChanged = true
		elseif meleeSetIndex > (table.getn(sets.Melee) - 1) then
			meleeSetIndex = 0
		else
			meleeSetIndex = meleeSetIndex + 1
		end
		equip(sets.Melee[meleeSetIndex])
		send_command('@input /echo Melee Mode ' .. meleeSetNames[meleeSetIndex])
		elseif meleeSetHasBeenChanged == true then
		send_command('@input /echo <----- Melee Disabled ----->')
			meleeSetHasBeenChanged = false
			equip(sets.Tank[tankSetIndex])
	end -- end if

	-- Equip the CDC set
	if command == 'Toggle CDC Set' then
		if cdcSetHasBeenChanged == false then
			cdcSetHasBeenChanged = true
		elseif wsChantDuCygneSetIndex > (table.getn(sets.WS.ChantDuCygne) - 1) then
			wsChantDuCygneSetIndex = 0
		else
			wsChantDuCygneSetIndex = wsChantDuCygneSetIndex + 1
		end
		send_command('@input /echo CDC Mode ' .. wsChantDuCygneSetNames[wsChantDuCygneSetIndex])
	end -- end if

	
	--Tank Mode
	if command == 'Toggle Tank Set' then
		if tankSetHasBeenChanged == false then
			tankSetHasBeenChanged = true
		elseif tankSetIndex > (table.getn(sets.Tank) - 1) then
			tankSetIndex = 0
		else
			tankSetIndex = tankSetIndex + 1
		end
		send_command('@input /echo Tank Mode ' .. tankSetNames[tankSetIndex])
		equip(sets.Tank[tankSetIndex])
		elseif tankSetHasBeenChanged == true then
		send_command('@input /echo <----- Tank Disabled ----->')
			
			tankSetHasBeenChanged = false
			equip(sets.Melee[meleeSetIndex])
	end -- end if
	
	--Melee/Tank Mode
	--if command == 'Toggle Tank/Melee Mode' then
		--if MTSetHasBeenChanged == false then
		--	MTSetHasBeenChanged = true
	--	elseif MTSetIndex > (table.getn(sets.Switch) - 1) then
			MTSetIndex = 0
	--	else
	--		MTSetIndex = MTSetIndex + 1
	--	end
	--	send_command('@input /echo Tank/Melee: ' .. MTSetNames[MTSetIndex] .. tankSetNames[tankSetIndex] .. meleeSetNames[meleeSetIndex])
	--	equip(sets.Switch[MTSetIndex])
	--end -- end if
	
	-- Equip the TH set
	if command == 'Toggle TH Set' then
		if thSetEnabled then
			thSetEnabled = false
			send_command('@input /echo TH Mode OFF')
		else
			thSetEnabled = true
			send_command('@input /echo TH Mode On')
		end
	end -- end if

end -- end self_command()