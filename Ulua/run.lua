function get_sets()

--Binds
		send_command('bind f2 gs c Toggle PDT Set')
		send_command('bind f3 gs c Toggle MDT Set')
		send_command('bind f4 gs c Toggle Resist Set')
		send_command('bind f9 gs c Toggle Idle Set')
		send_command('bind f11 gs c Toggle Tank Set')
		send_command('bind f10 gs c Toggle Melee Set')
		send_command('bind ^f10 gs c Toggle Multi-Hit WS Mode')
		send_command('bind ^f11 gs c Toggle Nuke Mode')
		--send_command('bind ^f11 gs c Toggle Dark Nuke Mode')
		--send_command('bind f12 gs c Toggle Tank/Melee Mode')
		
	---- Upon unloading this lua file, remove key bindings
	function file_unload()

	    send_command('unbind ^f9')
	    send_command('unbind ^f10')
	    send_command('unbind ^f11')
	    send_command('unbind ^f12')

	    send_command('unbind !f9')
	    send_command('unbind !f10')
	    send_command('unbind !f11')
	    send_command('unbind !f12')
		
		send_command('unbind f2')
	    send_command('unbind f3')
	    send_command('unbind f4')
	    send_command('unbind f12')
	    send_command('unbind f9')
	    send_command('unbind f10')
	    send_command('unbind f11')
	    send_command('unbind f12')

	end
			
--Idle Set (Refresh, DT, Refresh DT << to be added later )
	sets.idle = {}
	idleSetHasBeenChanged = false
	idleSetEnabled = false
	idleSetIndex = 0
	idleSetNames = {
		[0] = 'Refresh',
		[1] = 'DT',
	}
	
	--1= Refresh
	sets.idle[0] = {
		  ammo="Homiliary",
    head="Erilaz Galea",
    body="Runeist Coat +1",
    hands={ name="Herculean Gloves", augments={'MND+5','CHR+5','"Refresh"+1','Accuracy+15 Attack+15',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Sherida Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
		
	--2 = DT
	sets.idle[1] = {
			  ammo="Homiliary",
    head="Erilaz Galea",
    body="Runeist Coat +1",
    hands={ name="Herculean Gloves", augments={'MND+5','CHR+5','"Refresh"+1','Accuracy+15 Attack+15',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Meg. Jam. +2",
    neck="Sanctity Necklace",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Sherida Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
		
	----Melee Set: 1=Melee
	sets.melee = {}
	meleeSetHasBeenChanged = false
	meleeSetEnabled = false
	meleeSetIndex = 0
	meleeSetNames = {
		[0] = 'Haste',
		[1] = 'Melee Low DT',
		[2] = 'Melee High DT',
	}
	sets.melee[0] = {
   ammo="Yamarang",
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Crit. hit damage +3%',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+3',}},
    neck="Lissome Necklace",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.melee[1] = {
		ammo="Staunch Tathlum",
		head={ name="Herculean Helm", augments={'Accuracy+17 Attack+17','"Triple Atk."+4','DEX+4','Accuracy+15','Attack+11',}},
		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+23','"Triple Atk."+4','Attack+6',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Accuracy+29','"Triple Atk."+4','AGI+7',}},
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Defending Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}
	
	sets.melee[2] = {
		ammo="Staunch Tathlum",
	    head="Aya. Zucchetto +1",
	    body="Ayanmo Corazza +1",
	    hands={ name="Herculean Gloves", augments={'INT+13','Pet: Mag. Acc.+21','Damage taken-5%','Accuracy+18 Attack+18',}},
	    legs="Aya. Cosciales +1",
	    feet="Aya. Gambieras +1",
	    neck="Loricate Torque +1",
	    waist="Flume Belt +1",
	    left_ear="Telos Earring",
	    right_ear="Sherida Earring",
	    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
	    right_ring="Defending Ring",
	    back="Moonbeam Cape",
	}
	
	----PDT Sets
	sets.PDT = {}
	PDTSetHasBeenChanged = false
	PDTSetEnabled = false
	PDTSetIndex = 0
	PDTSetNames = {
		[0] = 'Full PDT',
		[1] = 'Enmity Maint PDT',
		[2] = 'Absorb PDT',
		[3] = 'DT Max',
	}
	
	sets.PDT[0] = {
    ammo="Staunch Tathlum",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.PDT[1] = {
  ammo="Staunch Tathlum",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.PDT[2] = {
    ammo="Staunch Tathlum",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.PDT[3] = {
    ammo="Staunch Tathlum",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	----MDT Sets
	sets.MDT = {}
	MDTSetHasBeenChanged = false
	MDTSetEnabled = false
	MDTSetIndex = 0
	MDTSetNames = {
		[0] = 'Full MDT',
		[1] = 'Absorb MDT',
		[2] = 'DT Max',
	}
	sets.MDT[0] = {
		ammo="Vanir Battery",
	    head="Aya. Zucchetto +1",
	    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	    hands={ name="Herculean Gloves", augments={'INT+13','Pet: Mag. Acc.+21','Damage taken-5%','Accuracy+18 Attack+18',}},
	    legs="Aya. Cosciales +1",
	    feet="Aya. Gambieras +1",
	    neck="Loricate Torque +1",
	    waist="Lieutenant's Sash",
	    left_ear="Odnowa Earring +1",
	    right_ear="Etiolation Earring",
	    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
	    right_ring="Defending Ring",
	    back="Moonbeam Cape",
	}
	
	
	sets.MDT[1] = {
		ammo="Vanir Battery",
	    head="Erilaz Galea +1",
	    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	    hands="Erilaz Gauntlets +1",
	    legs="Eri. Leg Guards +1",
	    feet="Erilaz Greaves +1",
	    neck="Loricate Torque +1",
	    waist="Lieutenant's Sash",
	    left_ear="Odnowa Earring +1",
	    right_ear="Etiolation Earring",
	    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
	    right_ring="Defending Ring",
	    back="Moonbeam Cape",
	}
	
	sets.MDT[2] = {
		ammo="Staunch Tathlum",
	    head="Aya. Zucchetto +1",
	    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	    hands={ name="Herculean Gloves", augments={'INT+13','Pet: Mag. Acc.+21','Damage taken-5%','Accuracy+18 Attack+18',}},
	    legs="Eri. Leg Guards +1",
	    feet="Aya. Gambieras +1",
	    neck="Loricate Torque +1",
	    waist="Lieutenant's Sash",
	    left_ear="Odnowa Earring +1",
	    right_ear="Etiolation Earring",
	    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%',}},
	    right_ring="Defending Ring",
	    back="Moonbeam Cape",
	}
	
	----Resist Sets
	sets.resist = {}
	resistSetHasBeenChanged = false
	resistSetEnabled = false
	resistSetIndex = 0
	resistSetNames = {
		[0] = 'Resist All',
		[1] = 'Resist Charm',
	}
	
	sets.resist[0] = {
		
	}
	
	sets.resist[1] = {
		
	}
	
	----Tank Set:
	sets.tank = {}
	tankSetHasBeenChanged = false
	tankSetEnabled = false
	tankSetIndex = 0
	tankSetNames = {
		[0] = '_Tank PDT_',
		[1] = '_Tank DT_',
		--[2] = 'Parry DT',
		[2] = '_Resist DT_',
		[3] = 'Melee High DT',
		[4] = 'HP DT',
	}
	
	
	sets.tank[0] = {
    ammo="Staunch Tathlum",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.tank[1] = {
    ammo="Staunch Tathlum",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Flume Belt +1",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.tank[2] = {
		
	}
	
	sets.tank[3] = {
		
	  
	}
	
	sets.tank[4] = {
		
	}
	
	--Melee/Tank Toggle
	--sets.Switch = {}
	--MTSetHasBeenChanged = false
	--MTSetIndex = 0
	--MTSetNames = {
	--	[0] = 'Melee Mode Active',
	--	[1] = 'Tank Mode Active',
	--}
	
	--sets.Switch[0] = (sets.melee[meleeSetIndex])
	
	
	--sets.Switch[1] = (sets.tank[tankSetIndex])
	
	
	
	----Weaponskill Sets
	sets.WS = {}

	--Multi Hit WS
	sets.WS.multi = {}
	multiWSSetHasBeenChanged = false
	multiWSSetEnabled = false
	multiWSSetIndex = 0
	multiWSSetNames = {
		[0] = 'Full Multi WS',
		[1] = 'ACC Multi WS',
	}
	
	sets.WS.multi[0] = {
		ammo="Knobkierrie",
    head="Meghanada Visor +2",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	sets.WS.multi[1] = {
		ammo="Knobkierrie",
    head="Meghanada Visor +2",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	
	
	--WSDMG WS
	sets.WS.Single = {
		ammo="Knobkierrie",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Weapon skill damage +1%','DEX+13','Accuracy+4',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Regal Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}

	--Nuke Mode Toggle
	sets.nuke = {}
	nukeSetHasBeenChanged = false
	nukeSetIndex = 0
	nukeSetNames = {
		[0] = 'Standard',
		[1] = 'Magic Burst',
	}
	
	--0=Standard Nuke Mode
	sets.nuke[0] = {
		ammo="Pemphredo Tathlum",
	    head={ name="Herculean Helm", augments={'Accuracy+17 Attack+17','"Triple Atk."+4','DEX+4','Accuracy+15','Attack+11',}},
	    body={ name="Samnuha Coat", augments={'Mag. Acc.+12','"Mag.Atk.Bns."+12','"Dual Wield"+3',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	    legs="Aya. Cosciales +1",
	    feet={ name="Adhemar Gamashes", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    neck="Sanctity Necklace",
	    waist="Eschan Stone",
	    left_ear="Friomisi Earring",
	    right_ear="Digni. Earring",
	    left_ring="Arvina Ringlet +1",
	    right_ring="Locus Ring",
	    back="Fravashi Mantle",
	}
	
	--1=Magic Burst
	sets.nuke[1] = {
		ammo="Pemphredo Tathlum",
	    head={ name="Herculean Helm", augments={'Accuracy+17 Attack+17','"Triple Atk."+4','DEX+4','Accuracy+15','Attack+11',}},
	    body={ name="Samnuha Coat", augments={'Mag. Acc.+12','"Mag.Atk.Bns."+12','"Dual Wield"+3',}},
	    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	    legs="Aya. Cosciales +1",
	    feet={ name="Adhemar Gamashes", augments={'DEX+10','AGI+10','Accuracy+15',}},
	    neck="Sanctity Necklace",
	    waist="Eschan Stone",
	    left_ear="Friomisi Earring",
	    right_ear="Digni. Earring",
	    left_ring="Mujin Band",
	    right_ring="Locus Ring",
	    back="Fravashi Mantle",
	}
	
	

	
	
	----Casting: PreCast MidCast
	--PreCast
	sets.precast = {}
	sets.precast.fastCast = {
		 ammo="Sapience Orb",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
     legs="Aya. Cosciales +1",
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Ioskeha Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}

	--MidCast
	sets.magic = {}

	--Cure
	sets.magic.cure = {
		
	}

	--Curaga
	sets.magic.curaga = {
		

	}

	--BarElement
	sets.magic.barElement = {
		
	}

	--Enhance Duration
	sets.magic.enhanceDuration = {
		head="Erilaz Galea",
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
    feet="Erilaz Greaves +1",
    neck="Incanter's Torque",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Evanescence Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}

	--Cursna
	sets.magic.cursna = {
		
	}

	--Regen
	sets.magic.regen = {
		ammo="Staunch Tathlum",
	    head="Rune. Bandeau +1",
	    body="Emet Harness +1",
	    hands="Runeist Mitons +1",
	    legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
	    feet="Erilaz Greaves +1",
	    neck="Incanter's Torque",
	    waist="Goading Belt",
	    left_ear="Andoaa Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Conserve MP
	sets.magic.conserveMP = {
		
	}


	--Phalanx
	sets.magic.phalanx = {
		  head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
    hands="Kurys Gloves",
    legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}
	----Ability MidCast Sets
	sets.JA = {}

	--Valiance/Vallation
	sets.JA.valianceVallation = {
		ammo="Staunch Tathlum",
	    head="Halitus Helm",
	    body="Runeist Coat +2",
	    hands="Kurys Gloves",
	    legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
	    feet="Erilaz Greaves +1",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Odnowa Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Gambit
	sets.JA.gambit = {
		ammo="Staunch Tathlum",
	    head="Halitus Helm",
	    body="Emet Harness +1",
	    hands="Runeist Mitons +1",
	    legs="Eri. Leg Guards +1",
	    feet="Erilaz Greaves +1",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Odnowa Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Pflug
	sets.JA.pflug = {
		ammo="Staunch Tathlum",
	    head="Halitus Helm",
	    body="Emet Harness +1",
	    hands="Kurys Gloves",
	    legs="Eri. Leg Guards +1",
	    feet="Runeist Bottes",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Cryptic Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Battuta
	sets.JA.battuta = {
		ammo="Staunch Tathlum",
	    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
	    body="Emet Harness +1",
	    hands="Kurys Gloves",
	    legs="Eri. Leg Guards +1",
	    feet="Erilaz Greaves +1",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Cryptic Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Liement
	sets.JA.liement = {
		ammo="Staunch Tathlum",
	    head="Halitus Helm",
	    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	    hands="Kurys Gloves",
	    legs="Eri. Leg Guards +1",
	    feet="Erilaz Greaves +1",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Cryptic Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Swordplay
	sets.JA.swordplay = {
		ammo="Staunch Tathlum",
	    head="Halitus Helm",
	    body="Emet Harness +1",
	    hands="Kurys Gloves",
	    legs="Eri. Leg Guards +1",
	    feet="Erilaz Greaves +1",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Cryptic Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Supershear Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}
		
	--Elemental Sforzo
	sets.JA.elementalSforzo = {
		ammo="Staunch Tathlum",
	    head="Halitus Helm",
	    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	    hands="Kurys Gloves",
	    legs="Eri. Leg Guards +1",
	    feet="Erilaz Greaves +1",
	    neck="Unmoving Collar +1",
	    waist="Goading Belt",
	    left_ear="Cryptic Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Defending Ring",
	    back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}


	--Rayke
	sets.JA.rayke = {
		ammo="Staunch Tathlum",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet={ name="Futhark Boots", augments={'Enhances "Rayke" effect',}},
		neck="Unmoving Collar +1",
		waist="Goading Belt",
		left_ear="Cryptic Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Eihwaz Ring",
		right_ring="Supershear Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
	}

	--Vivacious Pulse
	sets.JA.vivaciousPulse = {
		ammo="Staunch Tathlum",
	    head="Erilaz Galea +1",
	    body="Emet Harness +1",
	    hands="Kurys Gloves",
	    legs="Rune. Trousers +1",
	    feet={ name="Futhark Boots", augments={'Enhances "Rayke" effect',}},
	    neck="Incanter's Torque",
	    waist="Bishop's Sash",
	    left_ear="Cryptic Earring",
	    right_ear="Odnowa Earring +1",
	    left_ring="Eihwaz Ring",
	    right_ring="Stikini Ring",
	    back="Altruistic Cape",
	}


	--Embolden
	sets.JA.embolden = {
		back={ name="Evasionist's Cape", augments={'Enmity+5','"Embolden"+15','"Dbl.Atk."+2',}},
	}

	--Utility
	sets.utility = {}
	
	--Enmity
	sets.utility.enmity = {
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body="Emet Harness",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Warder's Charm",
    waist="Goading Belt",
    left_ear="Telos Earring",
    right_ear="Etiolation Earring",
    left_ring="Petrov Ring",
    right_ring="Patricius Ring",
    back={ name="Evasionist's Cape", augments={'Enmity+1','"Embolden"+11','"Dbl.Atk."+4','Damage taken-2%',}},
	}

	
	--Weather
	sets.utility.weather = {
		waist="Hachirin-no-obi"
	}


	----Arrays
	Cure = {
		["Cure"] = true,
		["Cure II"] = true,
		["Cure III"] = true,
		["Cure IV"] = true,
		["Cure V"] = true,
		["Cure VI"] = true,
		["Full Cure"] = true,
	}

	Curaga = {
		["Curaga"] = true,
		["Curaga II"] = true,
		["Curaga III"] = true,
		["Curaga IV"] = true,
		["Curaga V"] = true,
		["Cura"] = true,
		["Cura II"] = true,
		["Cura III"] = true,
	}

	MAcc = {
		["Silence"] = true,
		["Addle"] = true,
		["Repose"] = true,
		["Frazzle"] = true,
		["Distract"] = true,
		["Blind"] = true,
		["Paralyze"] = true,
		["Paralyze II"] = true,
		["Poison"] = true,
		["Poisonga"] = true,
		["Repose"] = true,
		["Bind"] = true,
		["Gravity"] = true,
		["Sleep"] = true,
		["Sleepga"] = true,
		["Sleep II"] = true,
		["Sleepga II"] = true,
		["Break"] = true,
		["Breakga"] = true,
		["Frost"] = true,
		["Shock"] = true,
		["Burn"] = true,
		["Drown"] = true,
		["Choke"] = true,
		["Rasp"] = true,
		["Dispel"] = true,
		["Dia"] = true,
		["Diaga"] = true,
		["Dia II"] = true,
		["Bio"] = true,
		["Bio II"] = true,
	}

	MATK = {
		["Banish"] = true,
		["Banishga"] = true,
		["Banish II"] = true,
		["Banishga II"] = true,
		["Banish III"] = true,
		["Holy"] = true,
		["Holy II"] = true,
		["Stone"] = true,
		["Stone II"] = true,
		["Stone III"] = true,
		["Stone IV"] = true,
		["Stone V"] = true,
		["Stone VI"] = true,
		["Water"] = true,
		["Water II"] = true,
		["Water III"] = true,
		["Water IV"] = true,
		["Water V"] = true,
		["Water VI"] = true,
		["Aero"] = true,
		["Aero II"] = true,
		["Aero III"] = true,
		["Aero IV"] = true,
		["Aero V"] = true,
		["Aero VI"] = true,
		["Fire"] = true,
		["Fire II"] = true,
		["Fire III"] = true,
		["Fire IV"] = true,
		["Fire V"] = true,
		["Fire VI"] = true,
		["Blizzard"] = true,
		["Blizzard II"] = true,
		["Blizzard III"] = true,
		["Blizzard IV"] = true,
		["Blizzard V"] = true,
		["Blizzard VI"] = true,
		["Thunder"] = true,
		["Thunder II"] = true,
		["Thunder III"] = true,
		["Thunder IV"] = true,
		["Thunder V"] = true,
		["Thunder VI"] = true,
		["Stonega"] = true,
		["Stonega II"] = true,
		["Stonega III"] = true,
		["Stoneja"] = true,
		["Stonera"] = true,
		["Stonera II"] = true,
		["Waterga"] = true,
		["waterga II"] = true,
		["Waterga III"] = true,
		["Waterja"] = true,
		["Watera"] = true,
		["Watera II"] = true,
		["Aeroga"] = true,
		["Aeroga II"] = true,
		["Aeroga III"] = true,
		["Aeroja"] = true,
		["Firaga"] = true,
		["Firaga II"] = true,
		["Firaga III"] = true,
		["Firaja"] = true,
		["Fira"] = true,
		["Fira II"] = true,
		["Blizzaga"] = true,
		["Blizzaga II"] = true,
		["Blizzaga III"] = true,
		["Blizzaja"] = true,
		["Blizzara"] = true,
		["Blizzara II"] = true,
		["Thundaga"] = true,
		["Thundaga II"] = true,
		["Thundaga III"] = true,
		["Thundaja"] = true,
		["Thundara"] = true,
		["Thundara II"] = true,
		["Geohelix"] = true,
		["Geohelix II"] = true,
		["Hydrohelix"] = true,
		["Hydrohelix II"] = true,
		["Anemohelix"] = true,
		["Anemohelix II"] = true,
		["Pyrohelix"] = true,
		["Pyrohelix II"] = true,
		["Cryohelix"] = true,
		["Cryohelix II"] = true,
		["Ionohelix"] = true,
		["Ionohelix II"] = true,
		["Luminohelix"] = true,
		["Luminohelix II"] = true,
		["Meteor"] = true,
		["Quake"] = true,
		["Quake II"] = true,
		["Flood"] = true,
		["Flood II"] = true,
		["Tornado"] = true,
		["Tornado II"] = true,
		["Flare"] = true,
		["Flare II"] = true,
		["Freeze"] = true,
		["Freeze II"] = true,
		["Burst"] = true,
		["Burst II"] = true,
		["Swipe"] = true,
		["Lunge"] = true,
	}

	DarkMATK = {
		["Noctohelix"] = true,
		["Noctohelix II"] = true,
		["Kaustra"] = true,
		["Comet"] = true,
		["Death"] = true,
	}


	BarElement = {
		["Barstonra"] = true,
		["Barstone"] = true,
		["Barwatera"] = true,
		["Barwater"] = true,
		["Baraera"] = true,
		["Baraero"] = true,
		["Barfira"] = true,
		["Barfire"] = true,
		["Barblizzara"] = true,
		["Barblizzard"] = true,
		["Barthundra"] = true,
		["Barthunder"] = true,
	}

	EnhanceDuration = {
		["Barpoionra"] = true,
		["Barpoison"] = true,
		["Barblindra"] = true,
		["Barblind"] = true,
		["Barsilencera"] = true,
		["Barsilence"] = true,
		["Barparalyzra"] = true,
		["Barparalyze"] = true,
		["Barvira"] = true,
		["Barvirus"] = true,
		["Barpetra"] = true,
		["Barpetrify"] = true,
		["Baramnesra"] = true,
		["Baramnesia"] = true,
		["Blink"] = true,
		["Stoneskin"] = true,
		["Aquaveil"] = true,
		["Haste"] = true,
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
		["Aurorastorm"] = true,
		["Aurorastorm II"] = true,
		["Voidstorm"] = true,
		["Voidstorm II"] = true,
		["Phalanx"] = true,
		["Refresh"] = true,
		["Boost-STR"] = true,
		["Boost-DEX"] = true,
		["Boost-AGI"] = true,
		["Boost-VIT"] = true,
		["Boost-INT"] = true,
		["Boost-MND"] = true,
		["Boost-CHR"] = true,
		["Protect"] = true,
		["Protectra"] = true,
		["Protect II"] = true,
		["Protectra II"] = true,
		["Protect III"] = true,
		["Protectra III"] = true,
		["Protect IV"] = true,
		["Protectra IV"] = true,
		["Protect V"] = true,
		["Protectra V"] = true,
		["Shell"] = true,
		["Shellra"] = true,
		["Shell II"] = true,
		["Shellra II"] = true,
		["Shell III"] = true,
		["Shellra III"] = true,
		["Shell IV"] = true,
		["Shellra IV"] = true,
		["Shell V"] = true,
		["Shellra V"] = true,
		["Auspice"] = true,
		["Blaze Spikes"] = true,
		["Shock Spikes"] = true,
		["Ice Spikes"] = true,
		["Sneak"] = true,
		["Invisible"] = true,
		["Deodorize"] = true,
		["Animus Augeo"] = true,
		["Anmius Minuo"] = true,
		["Adloquium"] = true,
		["Flurry"] = true,
		["Temper"] = true,
	}


	Enmity = {
		["Flash"] = true,
		["Foil"] = true,
		--["Swordplay"] = true,
		--["Elemental Sforzo"] = true,
		["Odyllic Subterfuge"] = true,
		--["Vallation"] = true,
		--["Embolden"] = true,
		["One for All"] = true,
		--["Pflug"] = true,
		--["Battuta"] = true,
		--["Rayke"] = true,
		--["Liement"] = true,
		--["Gambit"] = true,
		--["Vivacious Pulse"] = true,
		["Provoke"] = true,
		["Warcry"] = true,
		["Seigan"] = true,
		["Third Eye"] = true,
		["Warding Circle"] = true,
		["Meditate"] = true,
		["Lux"] = true,
		["Ignis"] = true,
		["Gelus"] = true,
		["Flabra"] = true,
		["Tellus"] = true,
		["Sulpor"] = true,
		["Unda"] = true,
		["Tenebrae"] = true,
		["Crusade"] = true,
		["Stun"] = true,
	}

	Cursna = {
		["Cursna"] = true,
	}

	DebuffRemoval = {
		["Poisona"] = true,
		["Blindna"] = true,
		["Silena"] = true,
		["Erase"] = true,
		["Stona"] = true,
		["Viruna"] = true,	
	}

	Regen = {
		["Regen"] = true,
		["Regen II"] = true,
		["Regen III"] = true,
		["Regen IV"] = true,
		["Regen V"] = true,
	}

	ConserveMP = {
		["Teleport-Holla"] = true,
		["Teleport-Dem"] = true,
		["Teleport-Mea"] = true,
		["Teleport-Altep"] = true,
		["Teleport-vhazl"] = true,
		["Recall-Jugner"] = true,
		["Recall-Pashh"] = true,
		["Recall-Meriph"] = true,
		["Reraise"] = true,
		["Reraise II"] = true,
		["Reraise III"] = true,
		["Reraise IV"] = true,
		["Sacrifice"] = true,
		["Esuna"] = true,
		["Warp"] = true,
		["Warp II"] = true,
		["Raise"] = true,
		["Raise II"] = true,
		["Raise III"] = true,
		["Arise"] = true,
		["Klimaform"] = true,
		["Escape"] = true,
		["Tractor"] = true,
		["Retrace"] = true,
	}

	DrainAspir = {
		["Drain"] = true,
		["Aspir"] = true,
		["Aspir II"] = true,
		["Aspir III"] = true,
	}

	MagicWS = {
		["Vidohunir"] = true,
		["Earthcrusher"] = true,
		["Cataclysm"] = true,
		["Omniscience"] = true,
	}

	multiWS = {
		["Resolution"] = true,
	}

	WSDMGWS = {
		["Dimidiation"] = true,
		["Shockwave"] = true,
		["Spinning Slash"] = true,
		["Ground Strike"] = true,
		["Fell Cleave"] = true,
	}

end -- end get_sets()
			
----Functions
--Casting Functions
function precast(spell)
	if spell.action_type == 'Magic' then
		equip(sets.precast.fastCast)
	end -- end if
end -- end precast

--MidCast
function midcast(spell)

	if spell.action_type == 'Magic' then

		-- If cure is cast
		if Cure[spell.english] then
			equip(sets.magic.cure)
			if spell.element == world.day_element or spell.element == world.weather_element then
				equip(sets.utility.weather)
			end --end weather
		elseif Curaga[spell.english] then
			equip(sets.magic.curaga)
			if spell.element == world.day_element or spell.element == world.weather_element then
				equip(sets.utility.weather)
			end --end weather
		elseif MAcc[spell.english] then
			equip(sets.magic.MAcc)
			if spell.element == world.day_element or spell.element == world.weather_element then
				equip(sets.utility.weather)
			end --end weather
		elseif BarElement[spell.english] then
			equip(sets.magic.barElement)
		elseif EnhanceDuration[spell.english] then
			equip(sets.magic.enhanceDuration)
		elseif Enmity[spell.english] then
			equip(sets.utility.enmity)
		elseif Regen[spell.english] then
			equip(sets.magic.regen)
		elseif ConserveMP[spell.english] then
			equip(sets.magic.conserveMP)
		elseif Cursna[spell.english] then
			equip(sets.magic.cursna)
		elseif DebuffRemoval[spell.english] then
			equip(sets.magic.DebuffRemoval)
		----Nuking Functions
		elseif MATK[spell.english] then
			equip(sets.nuke[nukeSetIndex])
			if spell.element == world.day_element or spell.element == world.weather_element then
				equip(sets.utility.weather)
			end
		----Ability Functions
		elseif Enmity[spell.english] then
			equip(sets.utility.enmity)
		elseif spell.name == 'Valiance' or spell.name == 'Vallation' then
			equip(sets.JA.valianceVallation)
		elseif spell.name == 'Gambit' then
			equip(sets.JA.gambit)
		elseif spell.name == 'Pflug' then
			equip(sets.JA.pflug)
		elseif spell.name == 'Battuta' then
			equip(sets.JA.battuta)
		elseif spell.name == 'Liement' then
			equip(sets.JA.liement)
		elseif spell.name == 'Swordplay' then
			equip(sets.JA.swordplay)
		elseif spell.name == 'Elemental Sforzo' then
			equip(sets.JA.elementalSforzo)
		elseif spell.name == 'Rayke' then
			equip(sets.JA.rayke)
		elseif spell.name == 'Vivacious Pulse' then
			equip(sets.JA.vivaciousPulse)
		end

		----BuffActive Functions
		if buffactive['Embolden'] then
			equip(sets.JA.embolden)
		end -- Embolden

    elseif spell.type == 'WeaponSkill' then
		
		----WS Functions
		if multiWS[spell.english] then
			equip(sets.WS.multi[multiWSSetIndex])
		elseif WSDMGWS[spell.english] then
			equip(sets.WS.Single)
		end

	end

end --midcast()



--MeleeIdle Phase
--PostCast
function aftercast(spell)

	if player.status == 'Idle' then
		equip(sets.idle[idleSetIndex])
	else
		equip(sets.melee[meleeSetIndex])
	end

	if PDTSetEnabled == true then
		equip(sets.PDT[PDTSetIndex])
	elseif MDTSetEnabled == true then
		equip(sets.MDT[MDTSetIndex])
	elseif tankSetEnabled == true then
		equip(sets.tank[tankSetIndex])
	elseif resistSetEnabled == true then
		equip(sets.resist[resistSetIndex])
	end

end --aftercast()


--Engagement Change
function status_change(new,old)

	if new == 'Idle' then
		equip(sets.idle[idleSetIndex])
	else
		equip(sets.melee[meleeSetIndex])
	end

	if PDTSetEnabled == true then
		equip(sets.PDT[PDTSetIndex])
	elseif MDTSetEnabled == true then
		equip(sets.MDT[MDTSetIndex])
	elseif tankSetEnabled == true then
		equip(sets.tank[tankSetIndex])
	elseif resistSetEnabled == true then
		equip(sets.resist[resistSetIndex])
	end

end --status_change()

		
--Toggles	
function self_command(command)

	-- Idle toggle
	if command == 'Toggle Idle Set' then

		-- Begin by toggling the "enabled" variable
		idleSetEnabled = true

		-- Incremnt the set index
		idleSetIndex = idleSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if idleSetIndex > (table.getn(sets.idle)) then
			-- Reset the index back to zero
			idleSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if idleSetHasBeenChanged == false then
			idleSetHasBeenChanged = true
			idleSetIndex = 0
		end

		-- Equip the appropriate set and alert the player
		equip(sets.idle[idleSetIndex])
		send_command('@input /echo Idle Mode ' .. idleSetNames[idleSetIndex])

	end -- end if


	-- Melee toggle
	if command == 'Toggle Melee Set' then

		-- Begin by toggling the "enabled" variable
		meleeSetEnabled = true

		-- Incremnt the set index
		meleeSetIndex = meleeSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if meleeSetIndex > (table.getn(sets.melee)) then
			-- Reset the index back to zero
			meleeSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if meleeSetHasBeenChanged == false then
			meleeSetHasBeenChanged = true
			meleeSetIndex = 0
		end

		-- Equip the appropriate set and alert the player
		equip(sets.melee[meleeSetIndex])
		send_command('@input /echo Melee Mode ' .. meleeSetNames[meleeSetIndex])

	end -- end if


	-- PDT toggle
	if command == 'Toggle PDT Set' then

		-- Begin by toggling the "enabled" variable
		PDTSetEnabled = true
		MDTSetEnabled = false
		tankSetEnabled = false
		resistSetEnabled = false

		-- Incremnt the set index
		PDTSetIndex = PDTSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if PDTSetIndex > (table.getn(sets.PDT)) then
			-- Reset the index back to zero
			PDTSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if PDTSetHasBeenChanged == false then
			PDTSetHasBeenChanged = true
			PDTSetIndex = 0
		end

		-- Equip the appropriate set and alert the player
		equip(sets.PDT[PDTSetIndex])
		send_command('@input /echo PDT Mode ' .. PDTSetNames[PDTSetIndex])

	end -- end if


	-- MDT toggle
	if command == 'Toggle MDT Set' then

		-- Begin by toggling the "enabled" variable
		PDTSetEnabled = false
		MDTSetEnabled = true
		tankSetEnabled = false
		resistSetEnabled = false

		-- Incremnt the set index
		MDTSetIndex = MDTSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if MDTSetIndex > (table.getn(sets.MDT)) then
			-- Reset the index back to zero
			MDTSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if MDTSetHasBeenChanged == false then
			MDTSetHasBeenChanged = true
			MDTSetIndex = 0
		end

		-- Equip the appropriate set and alert the player
		equip(sets.MDT[MDTSetIndex])
		send_command('@input /echo MDT Mode ' .. MDTSetNames[MDTSetIndex])

	end -- end if


	-- Tank toggle
	if command == 'Toggle Tank Set' then

		-- Begin by toggling the "enabled" variable
		PDTSetEnabled = false
		MDTSetEnabled = false
		tankSetEnabled = true
		resistSetEnabled = false

		-- Incremnt the set index
		tankSetIndex = tankSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if tankSetIndex > (table.getn(sets.tank)) then
			-- Reset the index back to zero
			tankSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if tankSetHasBeenChanged == false then
			tankSetHasBeenChanged = true
			tankSetIndex = 0
		end

		-- Equip the appropriate set and alert the player
		equip(sets.tank[tankSetIndex])
		send_command('@input /echo Tank Mode ' .. tankSetNames[MDTSetIndex])

	end -- end if


	-- Resist toggle
	if command == 'Toggle Resist Set' then

		-- Begin by toggling the "enabled" variable
		PDTSetEnabled = false
		MDTSetEnabled = false
		tankSetEnabled = false
		resistSetEnabled = true

		-- Incremnt the set index
		resistSetIndex = resistSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if resistSetIndex > (table.getn(sets.resist)) then
			-- Reset the index back to zero
			resistSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if resistSetHasBeenChanged == false then
			resistSetHasBeenChanged = true
			resistSetIndex = 0
		end

		-- Equip the appropriate set and alert the player
		equip(sets.resist[resistSetIndex])
		send_command('@input /echo Resist Mode ' .. resistSetNames[resistSetIndex])

	end -- end if


	-- Nuke toggle
	if command == 'Toggle Nuke Mode' then

		-- Incremnt the set index
		nukeSetIndex = nukeSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if nukeSetIndex > (table.getn(sets.nuke)) then
			-- Reset the index back to zero
			nukeSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if nukeSetHasBeenChanged == false then
			nukeSetHasBeenChanged = true
			nukeSetIndex = 0
		end

		-- Alert the player as to which set is enabled
		send_command('@input /echo Nuke Mode ' .. nukeSetNames[nukeSetIndex])

	end -- end if


	-- MultiWS toggle
	if command == 'Toggle Multi-Hit WS Mode' then

		-- Begin by toggling the "enabled" variable
		multiWSSetEnabled = true

		-- Incremnt the set index
		multiWSSetIndex = multiWSSetIndex + 1

		-- Check if the current index is higher than the existing sets
		if multiWSSetIndex > (table.getn(sets.WS.multi)) then
			-- Reset the index back to zero
			multiWSSetIndex = 0
		end

		-- Check if this is the first time the set has been changed
		if multiWSSetHasBeenChanged == false then
			multiWSSetHasBeenChanged = true
			multiWSSetIndex = 0
		end

		-- Alert the player as to which set is enabled
		send_command('@input /echo Multi-Hit WS Mode ' .. multiWSSetNames[multiWSSetIndex])

	end -- end if

end --  send commands