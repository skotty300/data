-------------------------------------------------------------------------------------------------------------------
-- (Original: Motenten / Modified: Arislan)
-------------------------------------------------------------------------------------------------------------------

--[[	Custom Features:
		Rune Selector		Cycle through available runes and trigger with a single macro [Ctl-`]
		Charm Mode			Equips charm prevention gear (WinKey-h)
		Knockback Mode		Equips knockback prevention gear (WinKey-k)
		Death Mode			Equips death prevention gear (WinKey-d)
		Auto. Doom			Automatically equips cursna received gear on doom status
		Capacity Pts. Mode	Capacity Points Mode Toggle [WinKey-C]
		Reive Detection		Automatically equips Reive bonus gear
		Auto. Lockstyle		Automatically locks specified equipset on file load
--]]


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
	mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	-- /BLU Spell Maps
	blue_magic_maps = {}

	blue_magic_maps.Enmity = S{'Blank Gaze', 'Geist Wall', 'Jettatura', 'Soporific',
		'Poison Breath', 'Blitzstrahl', 'Sheep Song', 'Chaotic Eye'}
	blue_magic_maps.Cure = S{'Wild Carrot'}
	blue_magic_maps.Buffs = S{'Cocoon', 'Refueling'}

	rayke_duration = 47
	gambit_duration = 92

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
	state.OffenseMode:options('STP', 'Normal', 'LowAcc', 'MidAcc', 'HighAcc')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'DT')
	state.PhysicalDefenseMode:options('PDT', 'HP', 'Critical')
	state.MagicalDefenseMode:options('MDT', 'Status')
	
	state.WeaponLock = M(false, 'Weapon Lock')	
	state.Charm = M(false, 'Charm')
	state.Knockback = M(false, 'Knockback')
	state.Death = M(false, "Death Resistance")
	state.CP = M(false, "Capacity Points Mode")

	state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
	
	send_command('bind ^` input //gs c rune')
	send_command('bind !` input /ja "Vivacious Pulse" <me>')
	send_command('bind ^- gs c cycleback Runes')
	send_command('bind ^= gs c cycle Runes')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @h gs c toggle Charm')
	send_command('bind @k gs c toggle Knockback')
	send_command('bind @d gs c toggle Death')
	send_command('bind !q input /ma "Temper" <me>')

	if player.sub_job == 'BLU' then
		send_command('bind !w input /ma "Cocoon" <me>')
	elseif player.sub_job == 'WAR' then
		send_command('bind !w input /ja "Defender" <me>')
	elseif player.sub_job == 'DRK' then
		send_command('bind !w input /ja "Last Resort" <me>')
	elseif player.sub_job == 'SAM' then
		send_command('bind !w input /ja "Hasso" <me>')
	end

	send_command('bind !o input /ma "Regen IV" <stpc>')
	send_command('bind !p input /ma "Shock Spikes" <me>')
	
	if player.sub_job == 'DNC' then
		send_command('bind ^, input /ja "Spectral Jig" <me>')
		send_command('unbind ^.')
	else
		send_command('bind ^, input /item "Silent Oil" <me>')
		send_command('bind ^. input /item "Prism Powder" <me>')
	end
	
	send_command('bind @w gs c toggle WeaponLock')
	send_command('bind @c gs c toggle CP')
	
	select_default_macro_book()
	set_lockstyle()
end

function user_unload()
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind ^-')
	send_command('unbind ^=')
	send_command('unbind ^f11')
	send_command('unbind @h')
	send_command('unbind @k')
	send_command('unbind @d')
	send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !o')
	send_command('unbind !p')
	send_command('unbind ^,')
	send_command('unbind @w')
	send_command('unbind @c')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Enmity set
	sets.Enmity = {
    main="",
    sub="Utu Grip",
    ammo="Sapience Orb",
    head="Halitus Helm",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Eri. Leg Guards +1",
    feet="Erilaz Greaves +1",
    neck="Moonbeam Necklace",
    waist="Goading Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Cryptic Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {body="Runeist's Coat +2", legs="Futhark Trousers +1", back="Ogma's Cape"})
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {feet="Runeist Bottes +2"})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {head="Fu. Bandeau +1"})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity, {body="Futhark Coat +1"})

	sets.precast.JA['Lunge'] = {
		sub="Utu Grip",
		ammo="Seeth. Bomblet +1",
		head=gear.Herc_MAB_head,
		body="Samnuha Coat",
		hands="Carmine Fin. Ga. +1",
		legs=gear.Herc_MAB_legs,
		feet=gear.Herc_MAB_feet,
		neck="Baetyl Pendant",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
		ring1="Fenrir Ring +1",
		ring2="Fenrir Ring +1",
		back="Argocham. Mantle",
		waist="Eschan Stone",
		}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	sets.precast.JA['Gambit'] = {hands="Runeist Mitons +2"}
	sets.precast.JA['Rayke'] = {feet="Futhark Boots +1"}
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {body="Futhark Coat +1"})
	sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {hands="Futhark Mitons +1"})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {back="Evasionist's Cape"})
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {head="Erilaz Galea +1", neck="Incanter's Torque", legs="Rune. Trousers +2"})
	sets.precast.JA['One For All'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Provoke'] = sets.Enmity

	sets.precast.Waltz = {
		hands="Slither Gloves +1",
		ring1="Asklepian Ring",
		ring2="Valseur's Ring",
		}

	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	sets.precast.FC = {
    main="",
    sub="Utu Grip",
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Runeist's Coat +2",
    hands="Regal Gauntlets",
    legs="Aya. Cosciales +2",
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Dualism Collar",
    waist="Flume Belt +1",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Moonlight Cape",
}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		head="Erilaz Galea +1",
		legs="Futhark Trousers +1",
		hands="Regal Gauntlets",
		waist="Siegel Sash",
		})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ammo="Impatiens", ear2="Mendi. Earring", legs="Doyen Pants"})

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		ammo="Impatiens",
		body="Passion Jacket",
		neck="Magoraga Beads",
		ring1="Lebeche Ring",
		waist="Ninurta's Sash",
		})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo="Aqreqaq Bomblet",
		sub="Utu Grip",
		head="Herculean Helm",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back="Ogma's Cape",
		waist="Fotia Belt",
		}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ammo="Aqreqaq Bomblet",
		sub="Utu Grip",
		head="Herculean Helm",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back="Ogma's Cape",
		waist="Fotia Belt",})

	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		ammo="Seeth. Bomblet +1",
		sub="Utu Grip",
		head="Herculean Helm",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back="Ogma's Cape",
		waist="Fotia Belt",})
		
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {
		ammo="Aqreqaq Bomblet",
		sub="Utu Grip",
		head="Herculean Helm",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Meg. Chausses +1",
		feet="Herculean Boots",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Hetairoi Ring",
		ring2="Niqmaddu Ring",
		back="Ogma's Cape",
		waist="Fotia Belt",})
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS['Resolution'], {
		ammo="Knobkierrie",
		sub="Utu Grip",
		head="Herculean Helm",
		body="Ayanmo Corazza +1",
		hands="Meg. Gloves +1",
		legs="Lustratio Subligar",
		feet="Lustratio Leggings",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back="Ogma's Cape",
		waist="Grunfeld Rope",})
		
	sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'], {
		ammo="Knobkierrie",
		sub="Utu Grip",
		head="Herculean Helm",
		body="Ayanmo Corazza +1",
		hands="Meg. Gloves +1",
		legs="Lustratio Subligar",
		feet="Lustratio Leggings",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back="Ogma's Cape",
		waist="Grunfeld Rope",})

	sets.precast.WS['Herculean Slash'] = sets.precast.JA['Lunge']

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		body="Meg. Cuirie +1",
		hands="Meg. Gloves +1",
		legs="Meg. Chausses +1",
		feet=gear.Herc_TA_feet,
		neck="Caro Necklace",
		ring1="Ifrit Ring +1",
		ring2="Shukuyu Ring",
		waist="Prosilio Belt +1",
		back=gear.RUN_WS1_Cape,
		})

	sets.precast.WS['Sanguine Blade'] = {
		ammo="Seeth. Bomblet +1",
		head="Pixie Hairpin +1",
		body="Samnuha Coat",
		hands="Carmine Fin. Ga. +1",
		legs=gear.Herc_MAB_legs,
		feet=gear.Herc_MAB_feet,
		neck="Baetyl Pendant",
		ear1="Moonshade Earring",
		ear2="Friomisi Earring",
		ring1="Archon Ring",
		ring2="Levia. Ring +1",
		back="Argocham. Mantle",
		waist="Eschan Stone",
		}

	sets.precast.WS['True Strike']= sets.precast.WS['Resolution']

	sets.precast.WS['True Strike']= sets.precast.WS['Savage Blade']
	sets.precast.WS['Judgment'] = sets.precast.WS['Savage Blade']
	sets.precast.WS['Black Halo'] = sets.precast.WS['Savage Blade']

	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS['Sanguine Blade'], {
		head=gear.Herc_MAB_head,
		ring1="Shiva Ring +1",
		ring2="Weather. Ring",
		})

	--------------------------------------
	-- Midcast Sets
	--------------------------------------
	
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.SpellInterrupt = {
    main="",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Rune. Bandeau +2",
    body="Runeist's Coat +2",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Runeist's Boots +2",
    neck="Moonbeam Necklace",
    waist="Chuq'aba Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

	sets.midcast.Cure = {
    main="",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Rune. Bandeau +2",
    body="Runeist's Coat +2",
    hands="Regal Gauntlets",
    legs="Eri. Leg Guards +1",
    feet="Runeist's Boots +2",
    neck="Loricate Torque +1",
    waist="Chuq'aba Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

	sets.midcast['Enhancing Magic'] = {
		head="Carmine Mask +1",
		hands="Runeist Mitons +2",
		legs="Carmine Cuisses +1",
		neck="Incanter's Torque",
		ear1="Augment. Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Olympus Sash",
		}

	sets.midcast.EnhancingDuration = {
		head="Erilaz Galea +1",
		legs="Futhark Trousers +1",
		hands="Regal Gauntlets",
		}

	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		main="Deacon Sword",
		sub="Chanter's Shield",
		head="Fu. Bandeau +1",
		body=gear.Taeon_FC_body,
		feet=gear.Taeon_PH_feet,
		})

	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {head="Runeist Bandeau +2"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {waist="Gishdubar Sash"})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring2="Sheltered Ring"})
	sets.midcast.Shell = sets.midcast.Protect

	sets.midcast['Divine Magic'] = {
		legs="Rune. Trousers +2",
		neck="Incanter's Torque",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		waist="Bishop's Sash",
		}

	sets.midcast.Flash = sets.Enmity
	sets.midcast.Foil = sets.Enmity
	sets.midcast.Diaga = sets.Enmity
	sets.midcast.Utsusemi = sets.midcast.SpellInterrupt
	
	sets.midcast['Blue Magic'] = {}
	sets.midcast['Blue Magic'].Enmity = sets.Enmity
	sets.midcast['Blue Magic'].Cure = sets.midcast.Cure
	sets.midcast['Blue Magic'].Buff = sets.midcast['Enhancing Magic']
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.idle = {
    main="",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Rawhide Mask",
    body="Runeist's Coat +2",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

	sets.idle.DT = {
    main="",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Rawhide Mask",
    body="Runeist's Coat +2",
    hands="Regal Gauntlets",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Erilaz Greaves +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

	sets.idle.Weak = sets.idle.DT
	sets.Kiting = {legs="Carmine Cuisses +1"}


	--------------------------------------
	-- Defense sets
	--------------------------------------

	sets.defense.Charm = {neck="Unmoving Collar +1", ring1="Wuji Ring", back="Solemnity Cape"}
	sets.defense.Knockback = {back="Repulse Mantle"}
	sets.defense.Death = {body="Samnuha Coat", ring1="Warden's Ring", ring2="Eihwaz Ring"}

	sets.defense.PDT = {
    main="",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	hands="Turms Mittens",
	legs="Erilaz Leg Guards +1",
	feet="Turms Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
	
	sets.defense.MDT = {
		main="Epeolatry", --(25)/0
--		main="Aettir", --(5)/0
		sub="Utu Grip", --3/3
		ammo="Staunch Tathlum", --2/2
		head="Erilaz Galea +1",
		body="Runeist's Coat +2",
		hands="Erilaz Gauntlets +1", --6/4
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1",--5/0
		neck="Warder's Charm +1",
		ear1="Odnowa Earring", --0/1
		ear2="Odnowa Earring +1", --0/2
		ring1="Gelatinous Ring +1", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Xucau Mantle", --7/4
		waist="Flume Belt +1", --4/0
		}

	sets.defense.Status = {
		main="Epeolatry", --(25)/0
--		main="Aettir", --(5)/0
		sub="Utu Grip", --3/3
		ammo="Staunch Tathlum", --2/2
		head=gear.Herc_DT_head, --3/3
		body="Runeist's Coat +2",
		hands="Erilaz Gauntlets +1",
		legs="Rune. Trousers +2", --4/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Hearty Earring",
		ear2="Impreg. Earring",
		ring1="Gelatinous Ring +1", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Evasionist's Cape", --7/4
		waist="Flume Belt +1", --4/0
		}
	
	sets.defense.HP = {
		main="Epeolatry", --(25)/0
		sub="Utu Grip", --3/3
		ammo="Staunch Tathlum", --2/2
		head="Erilaz Galea +1",
		body="Runeist's Coat +2",
		hands="Runeist Mitons +1", --2/0
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Odnowa Earring", --0/1
		ear2="Odnowa Earring +1", --0/2
		ring1="Gelatinous Ring +1", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Evasionist's Cape", --7/4
		waist="Flume Belt +1", --4/0
		}

	sets.defense.Critical = {
		-- Aettir (+5 PDTII)
		main="Epeolatry", --(25)/0
		sub="Utu Grip", --3/3
		ammo="Iron Gobbet", --(2)
		head="Fu. Bandeau +1", -- 4/0
		body="Futhark Coat +1", --7/7
		hands="Runeist Mitons +1", --2/0
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Genmei Earring", --2/0
		ear2="Impreg. Earring",
		ring1="Fortified Ring", --0/5(7)
		ring2="Defending Ring", --10/10
		back=gear.RUN_HP_Cape,
		waist="Flume Belt +1", --4/0
		}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
    main="",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +1", augments={'Enhances "Battuta" effect',}},
    body={ name="Futhark Coat +1", augments={'Enhances "Elemental Sforzo" effect',}},
	hands="Turms Mittens",
	legs="Erilaz Leg Guards +1",
	feet="Turms Leggings",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

	sets.engaged.LowAcc = {
    main="",
    sub="Utu Grip",
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	sets.engaged.MidAcc = {
    main="",
    sub="Utu Grip",
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	sets.engaged.HighAcc = {
    main="",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Rune. Bandeau +2",
    body="Runeist's Coat +2",
    hands="Runeist's Mitons +2",
    legs="Rune. Trousers +2",
    feet="Runeist's Boots +2",
    neck="Anu Torque",
    waist="Ioskeha Belt +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	sets.engaged.STP = {}

	-- Custom buff sets
	sets.buff.Doom = {ring1="Saida Ring", ring2="Saida Ring", waist="Gishdubar Sash"}

	sets.CP = {back="Mecisto. Mantle"}
	sets.Reive = {neck="Ygnas's Resolve +1"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	if spell.english == 'Lunge' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
			send_command('input /jobability "Swipe" <t>')
--			add_to_chat(122, '***Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.***')
			eventArgs.cancel = true
			return
		end
	end
	if spell.english == 'Valiance' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if abil_recasts[spell.recast_id] > 0 then
			send_command('input /jobability "Vallation" <me>')
			eventArgs.cancel = true
			return
		end
	end	
	if spellMap == 'Utsusemi' then
		if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
			cancel_spell()
			add_to_chat(123, '**!! '..spell.english..' Canceled: [3+ IMAGES] !!**')
			eventArgs.handled = true
			return
		elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
			send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
		end
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.english == 'Lunge' or spell.english == 'Swipe' then
		local obi = get_obi(get_rune_obi_element())
		if obi then
			equip({waist=obi})
		end
	end
	if spell.skill == 'Enhancing Magic' and classes.NoSkillSpells:contains(spell.english) then
		equip(sets.midcast.EnhancingDuration)
		if spellMap == 'Refresh' then
			equip(sets.midcast.Refresh)
		end
	end
	-- If DefenseMode is active, apply that gear over midcast
	-- choices.  Precast is allowed through for fast cast on
	-- spells, but we want to return to def gear before there's
	-- time for anything to hit us.
	-- Exclude Job Abilities from this restriction, as we probably want
	-- the enhanced effect of whatever item of gear applies to them,
	-- and only one item should be swapped out.
	if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
		handle_equipping_gear(player.status)
		eventArgs.handled = true
	end
	if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
		equip(sets.Reive)
	end
end

function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.name == 'Rayke' and not spell.interrupted then
		send_command('@timers c "Rayke ['..spell.target.name..']" '..rayke_duration..' down spells/00136.png')
		send_command('wait '..rayke_duration..';input /echo < Rayke: OFF ')
	elseif spell.name == 'Gambit' and not spell.interrupted then
		send_command('@timers c "Gambit ['..spell.target.name..']" '..gambit_duration..' down spells/00136.png')
		send_command('wait '..gambit_duration..';input /echo Gambit: OFF ')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	classes.CustomDefenseGroups:clear()
	classes.CustomDefenseGroups:append(state.Charm.current)
	classes.CustomDefenseGroups:append(state.Knockback.current)
	classes.CustomDefenseGroups:append(state.Death.current)

	classes.CustomMeleeGroups:clear()
	classes.CustomMeleeGroups:append(state.Charm.current)
	classes.CustomMeleeGroups:append(state.Knockback.current)
	classes.CustomMeleeGroups:append(state.Death.current)
end

function job_buff_change(buff,gain)
	-- If we gain or lose any haste buffs, adjust which gear set we target.
	if buffactive['Reive Mark'] then
		equip(sets.Reive)
		disable('neck')
	else
		enable('neck')
	end

	if buff == "doom" then
		if gain then		   
			equip(sets.buff.Doom)
			send_command('@input /p Doomed.')
			disable('ring1','ring2','waist')
		else
			enable('ring1','ring2','waist')
			handle_equipping_gear(player.status)
		end
	end

end
	
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
	if state.WeaponLock.value == true then
		disable('main','sub')
	else
		enable('main','sub')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if player.mpp < 51 then
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end
	if state.Charm.value == true then
		idleSet = set_combine(idleSet, sets.defense.Charm)
	end	
	if state.Knockback.value == true then
		idleSet = set_combine(idleSet, sets.defense.Knockback)
	end
	if state.Death.value == true then
		idleSet = set_combine(idleSet, sets.defense.Death)
	end
	if state.CP.current == 'on' then
		equip(sets.CP)
		disable('back')
	else
		enable('back')
	end

	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	if state.Charm.value == true then
		meleeSet = set_combine(meleeSet, sets.defense.Charm)
	end
	if state.Knockback.value == true then
		meleeSet = set_combine(meleeSet, sets.defense.Knockback)
	end
	if state.Death.value == true then
		meleeSet = set_combine(meleeSet, sets.defense.Death)
	end

	return meleeSet
end

function customize_defense_set(defenseSet)
	if state.Charm.value == true then
		defenseSet = set_combine(defenseSet, sets.defense.Charm)
	end
	if state.Knockback.value == true then
		defenseSet = set_combine(defenseSet, sets.defense.Knockback)
	end
	if state.Death.value == true then
		defenseSet = set_combine(defenseSet, sets.defense.Death)
	end

	return defenseSet
end

-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	local msg = '[ Melee'
	
	if state.CombatForm.has_value then
		msg = msg .. ' (' .. state.CombatForm.value .. ')'
	end
	
	msg = msg .. ': '
	
	msg = msg .. state.OffenseMode.value
	if state.HybridMode.value ~= 'Normal' then
		msg = msg .. '/' .. state.HybridMode.value 
	end
	msg = msg .. ' ][ WS: ' .. state.WeaponskillMode.value .. ' ]'
	
	if state.DefenseMode.value ~= 'None' then
		msg = msg .. '[ Defense: ' .. state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ' ]'
	end
	
	if state.Charm.value == true then
		msg = msg .. '[ Charm: ON ]'
	end

	if state.Knockback.value == true then
		msg = msg .. '[ Knockback: ON ]'
	end
	
	if state.Death.value == true then
		msg = msg .. '[ Death: ON ]'
	end

	if state.Kiting.value then
		msg = msg .. '[ Kiting Mode: ON ]'
	end
	
	msg = msg .. '[ *Rune: '..state.Runes.current .. '* ]'
	
	add_to_chat(060, msg)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Blue Magic' then
		for category,spell_list in pairs(blue_magic_maps) do
			if spell_list:contains(spell.english) then
				return category
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
function job_self_command(cmdParams, eventArgs)
	if cmdParams[1]:lower() == 'rune' then
		send_command('@input /ja '..state.Runes.value..' <me>')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function get_rune_obi_element()
	weather_rune = buffactive[elements.rune_of[world.weather_element] or '']
	day_rune = buffactive[elements.rune_of[world.day_element] or '']
	
	local found_rune_element
	
	if weather_rune and day_rune then
		if weather_rune > day_rune then
			found_rune_element = world.weather_element
		else
			found_rune_element = world.day_element
		end
	elseif weather_rune then
		found_rune_element = world.weather_element
	elseif day_rune then
		found_rune_element = world.day_element
	end
	
	return found_rune_element
end

function get_obi(element)
	if element and elements.obi_of[element] then
		return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
	end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book: (set, book)
	if player.sub_job == 'BLU' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 10)
	else
		set_macro_page(1, 10)
	end
end

function set_lockstyle()
	send_command('wait 2; input /lockstyleset 14')
end