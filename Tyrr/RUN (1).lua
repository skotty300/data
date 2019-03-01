-------------------------------------------------------------------------------------------------------------------
-- (Original: Motenten / Modified: Arislan)
-------------------------------------------------------------------------------------------------------------------

--[[	Custom Features:

		Rune Selector		Cycle through available runes and trigger with a single macro [Ctl-`]
		Knockback Mode		Equips knockback prevention gear (Ctl-[)
		Death Mode			Equips death prevention gear (Ctl-])
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
	include('organizer-lib')
end

-- Setup vars that are user-independent.
function job_setup()
	-- /BLU Spell Maps
	blue_magic_maps = {}

	blue_magic_maps.Enmity = S{'Blank Gaze', 'Jettatura', 'Soporific',
		'Poison Breath', 'Blitzstrahl', 'Sheep Song', 'Chaotic Eye'}
	blue_magic_maps.Cure = S{'Wild Carrot'}
	blue_magic_maps.Buffs = S{'Refueling'}

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
	state.IdleMode:options('Normal', 'DT', 'Refresh')
	state.PhysicalDefenseMode:options('PDT', 'HP', 'Critical')
	state.MagicalDefenseMode:options('MDT', 'Status')
	
	state.WeaponLock = M(false, 'Weapon Lock')	
	state.Knockback = M(false, 'Knockback')
	state.Death = M(false, "Death Resistance")
	state.CP = M(false, "Capacity Points Mode")

	state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}
	
	send_command('bind ^` input //gs c rune')
	send_command('bind !` input /ja "Vivacious Pulse" <me>')
	send_command('bind ^- gs c cycleback Runes')
	send_command('bind ^= gs c cycle Runes')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind ^[ gs c toggle Knockback')
	send_command('bind ^] gs c toggle Death')
	send_command('bind ^\ gs c toggle Charm')
	send_command('bind !q input /ma "Temper" <me>')
	send_command('bind !w input /ma "Cocoon" <me>')
	send_command('bind !e input /ma "Refueling" <me>')
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
	send_command('unbind ^[')
	send_command('unbind !]')
	send_command('unbind !q')
	send_command('unbind !w')
	send_command('bind !e input /ma Haste <stpc>')
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
		-- Aettir 10 / Alber Strap 5
		ammo="Sapience Orb", --2
		head="Halitus Helm", --8
		body="Emet Harness +1", --10
		hands="Kurys Gloves", --9
		legs="Eri. Leg Guards +1", --7
		feet="Rager ledelsens +1",--7
		neck="Unmoving Collar +1", --10
		ear1="Cryptic Earring", --4
		ear2="Friomisi Earring", --2
		ring1="Provocare Ring", --5
		ring2="Eihwaz Ring", --5
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}}, --10
		waist="Kasiri Belt", --3
		}

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = {body="Runeist Coat +3", legs="Futhark Trousers +1", back="Ogma's Cape"}
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	sets.precast.JA['Pflug'] = {feet="Runeist Bottes +1"}
	sets.precast.JA['Battuta'] = {head="Fu. Bandeau +3"}
	sets.precast.JA['Liement'] = {body="Futhark Coat +1"}

	sets.precast.JA['Lunge'] = {
		ammo="Seeth. Bomblet +1",
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+29','Mag. Acc.+14','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
		body="Samnuha Coat",
		hands="Leyline Gloves",
		legs={ name="Herculean Trousers", augments={'INT+15','"Mag.Atk.Bns."+23','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
		neck="Sanctity Necklace",
		ear1="Hecate's Earring",
		ear2="Friomisi Earring",
		ring1="Acumen Ring",
		ring2="Shiva Ring +1",
		back="Argocham. Mantle",
		waist="Eschan Stone",
		}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	sets.precast.JA['Gambit'] = {hands="Runeist's Mitons +3"}
	sets.precast.JA['Rayke'] = {feet="Futhark Boots +1"}
	sets.precast.JA['Elemental Sforzo'] = {body="Futhark Coat +1"}
	sets.precast.JA['Swordplay'] = {hands="Futhark Mitons +1"}
	sets.precast.JA['Embolden'] = {back="Evasionist's Cape"}
	sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1", neck="Incanter's Torque", legs="Rune. Trousers +1"}
	sets.precast.JA['One For All'] = {}
	sets.precast.JA['Provoke'] = sets.Enmity

	sets.precast.Waltz = {
		hands="Slither Gloves +1",
		ring1="Asklepian Ring",
		ring2="Valseur's Ring",
		}

	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	sets.precast.FC = {
		ammo="Sapience Orb", --2
		head="Carmine Mask", --12
		body="Samnuha coat", --5
		hands="Leyline Gloves", --7
		legs="Rawhide Trousers", --5
		feet="Carmine Greaves +1", --8
		neck="Voltsurge Torque", --4
		ear1="Etiolation Earring", --1
		ear2="Loquacious Earring", --2
		ring1="Prolix Ring", --2
		ring2="Kishar ring", --4
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}, --10
		waist="Ninurta's Sash",
		}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		legs="Futhark Trousers +1",
		waist="Siegel Sash",
		})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ammo="Impatiens", ear2="Mendi. Earring"})

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		ammo="Impatiens",
		neck="Magoraga Beads",
		ring1="Lebeche Ring",
		})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo="Seeth. Bomblet +1",
		head="Lilitu Headpiece",
		body=gear.Herc_TA_body,
		hands="Meg. Gloves +1",
		legs=gear.Herc_WS_legs,
		feet=gear.Herc_TA_feet,
		neck="Fotia Gorget",
		ear1="Sherida Earring",
		ear2="Moonshade earring",
		ring1="Ifrit Ring +1",
		ring2="Ifrit Ring +1",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
		waist="Fotia Belt",
		}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		hands=gear.Herc_WS_hands,
		legs="Meg. Chausses +1",
		ear2="Telos Earring",
		})


	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		head="Adhemar Bonnet",
		hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+4','Accuracy+14','Attack+13',}},
		legs="Samnuha Tights",
		ring1="Niqmaddu ring",
		ring2="Epona's Ring",
		ammo="Knobkierrie"
		})
		
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {
		head="Dampening Tam",
		legs="Adhemar Kecks",
		feet=gear.Herc_Acc_feet,
		ear2="Telos Earring",
		ring1="Rufescent Ring",
		})
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS['Resolution'], {
		
		hands="Adhemar Wristbands",
		legs="Lustratio Subligar +1",
		feet="Lustratio Leggings",
		ring1="Niqmaddu Ring",
		ring2="Ilabrat Ring",
		waist="Fotia Belt",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
		ammo="Knobkierrie"
		})
		
	sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'], {
		hands=gear.Herc_WS_hands,
		legs="Samnuha Tights",
		feet=gear.Herc_Acc_feet,
		ear2="Telos Earring",
		ring1="Ramuh Ring +1",
		})

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
		})

	sets.precast.WS['Sanguine Blade'] = {
		ammo="Seeth. Bomblet +1",
		head="Pixie Hairpin +1",
		body="Samnuha Coat",
		hands="Carmine Fin. Ga. +1",
		legs=gear.Herc_MAB_legs,
		feet=gear.Herc_MAB_feet,
		neck="Sanctity Necklace",
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
		ring2="Shiva Ring +1",
		})

	--------------------------------------
	-- Midcast Sets
	--------------------------------------
	
	sets.midcast.FastRecast = {
		ear1="Etiolation Earring",
		ear2="Loquacious Earring",
		}

	sets.midcast.Cure = {
		sub="Mensch Strap +1",
		ammo="Staunch Tathlum",
		head=gear.Herc_DT_head,
		body="Vrikodara Jupon", -- 13
		hands="Buremte Gloves", --(13)
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Phalaina Locket", -- 4(4)
		ear1="Roundel Earring", -- 5
		ear2="Mendi. Earring", -- 5
		ring1="Lebeche Ring", -- 3
		ring2="Defending Ring",
		back="Solemnity Cape", -- 7
		waist="Flume Belt",
		}

	sets.midcast['Enhancing Magic'] = {
		head="Carmine Mask",
		body="Manasa Chasuble",
		hands="Regal Gauntlets",
		legs="Carmine Cuisses +1",
		neck="Incanter's Torque",
		ear2="Andoaa Earring",
		ring1="Moonbeam Ring",
		ring2="Stikini Ring",
		waist="Olympus Sash",
		}

	sets.midcast.EnhancingDuration = {
		head="Erilaz Galea +1",
		legs="Futhark Trousers +1",
		}

	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		head="Fu. Bandeau +3",
		body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -8%','Phalanx +2',}},
		})

	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
		head="Runeist Bandeau +1",
		})
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Erilaz galea +1",
		waist="Gishdubar Sash",
		})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		ammo="Staunch Tathlum",
		head={ name="Taeon Chapeau", augments={'Spell interruption rate down -9%',}},
		body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
		hands="Regal Gauntlets",
		legs="Carmine Cuisses +1",
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -8%','Phalanx +2',}},
		neck="Moonbeam Necklace",
		ear1="Halasz Earring",
		ring1="Evanescence Ring",
		back="Moonbeam Cape",
		waist="Rumination Sash",
		})
		
	sets.midcast.Cocoon = set_combine(sets.midcast['Enhancing Magic'], {
		ammo="Staunch Tathlum",
		head={ name="Taeon Chapeau", augments={'Spell interruption rate down -9%',}},
		body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
		hands="Regal Gauntlets",
		legs="Carmine Cuisses +1",
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -8%','Phalanx +2',}},
		neck="Moonbeam Necklace",
		ear1="Halasz Earring",
		ring1="Evanescence Ring",
		back="Moonbeam Cape",
		waist="Rumination Sash",
		})
		
			
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash",
		})

	sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {
		ring2="Sheltered Ring",
		})

	sets.midcast.Shell = sets.midcast.Protect

	sets.midcast['Divine Magic'] = {
		legs="Runeist Trousers +1",
		neck="Incanter's Torque",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
		waist="Bishop's Sash",
		}

	sets.midcast.Flash = sets.Enmity

	sets.midcast.Foil = sets.Enmity

	sets.midcast.Utsusemi = {
		waist="Ninurta's Sash",
		}
	
	sets.midcast['Blue Magic'] = {
		ammo="Staunch Tathlum",
		head={ name="Taeon Chapeau", augments={'Spell interruption rate down -9%',}},
		body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
		hands="Regal Gauntlets",
		legs="Carmine Cuisses +1",
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -8%','Phalanx +2',}},
		neck="Moonbeam Necklace",
		ear1="Halasz Earring",
		ring1="Evanescence Ring",
		back="Moonbeam Cape",
		waist="Rumination Sash",
		}
	sets.midcast['Blue Magic'].Enmity = sets.Enmity
	sets.midcast['Blue Magic'].Cure = sets.midcast.Cure
	sets.midcast['Blue Magic'].Buff = sets.midcast['Enhancing Magic']
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.idle = {
		sub="Mensch Strap +1",
		ammo="Homiliary",
		head="Rawhide Mask",
		body="Runeist's coat +3",
		hands="Regal Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +1",
		neck="Sanctity Necklace",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
		ring1="Paguroidea Ring",
		ring2="Sheltered Ring",
		back="Moonbeam Cape",
		waist="Flume Belt",
		}

	sets.idle.DT = {
		-- Aettir (+5 PDTII)
		sub="Utu Grip", --3/3
		ammo="Staunch Tathlum", --2/2
		head="Erilaz Galea +1",
		body="Erilaz Surcoat +1",
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear2="Odnowa Earring", --0/1
		ear2="Odnowa Earring +1", --0/2
		ring1="Moonbeam Ring", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Evasionist's Cape", --7/4
		waist="Flume Belt", --4/0
		}

	sets.idle.Refresh = set_combine(sets.idle, {
		head="Rawhide Mask",
		body="Runeist Coat +1",
		waist="Fucho-no-obi",
		})

	sets.idle.Town = set_combine(sets.idle, {
		ammo="Staunch Tathlum",
		head="Carmine Mask",
		body="Erilaz Surcoat +1",
		feet="Carmine Greaves +1",
		neck="Loricate Torque +1",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
		ring1="Moonbeam Ring",
		ring2="Defending Ring",
		})

	sets.idle.Weak = sets.idle.DT

	sets.Kiting = {legs="Carmine Cuisses +1"}


    --------------------------------------
    -- Defense sets
    --------------------------------------

	sets.defense.Knockback = {back="Repulse Mantle"}

	sets.defense.Death = {
		body="Samnuha Coat",
		ring1="Warden's Ring",
		ring2="Eihwaz Ring",
		}

	sets.defense.PDT = {
		-- Aettir (+5 PDTII)
		sub="Utu Grip", --3/3
		ammo="Staunch Tathlum", --2/2
		head="Futhark bandeau +3", --4/0
		body="Runeist's coat +3",
		hands="Runeist's Mitons +3", --5/3
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Odnowa Earring", --2/0
		ear2="Odnowa Earring +1",
		ring1="Moonbeam Ring", --4/4
		ring2="Defending Ring", --10/10
		back="Moonbeam Cape",
		waist="Flume Belt", --4/0
		}
	
	sets.defense.MDT = {
		-- Aettir (+5 PDTII)
		sub="Refined Grip +1", --3/3
		ammo="Iron Gobbet",
		head="Erilaz Galea +1",
		body="Futhark Coat +1", --7/7
		hands="Erilaz Gauntlets +1",
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1",--5/0
		neck="Warder's Charm +1",
		ear2="Odnowa Earring", --0/1
		ear2="Odnowa Earring +1", --0/2
		ring1="Vocane Ring", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Moonbeam Cape",
		waist="Flume Belt", --4/0
		}

	sets.defense.Status = {
		-- Aettir (+5 PDTII)
		sub="Refined Grip +1", --3/3
		ammo="Staunch Tathlum", --2/2
		head=gear.Herc_DT_head, --3/3
		body="Erilaz Surcoat +1",
		hands="Erilaz Gauntlets +1",
		legs="Rune. Trousers +1", --3/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Hearty Earring",
		ear2="Ethereal Earring",
		ring1="Vocane Ring", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Evasionist's Cape", --7/4
		waist="Flume Belt", --4/0
		}
	
	sets.defense.HP = {
		-- Aettir (+5 PDTII)
		sub="Refined Grip +1", --3/3
		ammo="Staunch Tathlum", --2/2
		head="Erilaz Galea +1",
		body="Erilaz Surcoat +1",
		hands="Runeist Mitons +1", --2/0
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Odnowa Earring", --0/1
		ear2="Odnowa Earring +1", --0/2
		ring1="Vocane Ring", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Evasionist's Cape", --7/4
		waist="Flume Belt", --4/0
		}

	sets.defense.Critical = {
		-- Aettir (+5 PDTII)
		sub="Refined Grip +1", --3/3
		ammo="Iron Gobbet", --(2)
		head="Fu. Bandeau +3", -- 4/0
		body="Futhark Coat +1", --7/7
		hands="Runeist Mitons +1", --2/0
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Loricate Torque +1", --6/6
		ear1="Genmei Earring", --2/0
		ear2="Ethereal Earring",
		ring1="Fortified Ring", --0/5(7)
		ring2="Defending Ring", --10/10
		back=gear.RUN_HP_Cape,
		waist="Flume Belt", --4/0
		}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		sub="Utu Grip",
		ammo="Yamarang",
		head="Dampening Tam",
		body={ name="Herculean Vest", augments={'"Store TP"+1','VIT+1','Quadruple Attack +2','Accuracy+13 Attack+13',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+4','Accuracy+14','Attack+13',}},
		legs="Samnuha Tights",
		feet="Herculean boots",
		neck="Asperity Necklace",
		ear1="Sherida Earring",
		ear2="Brutal Earring",
		ring1="Niqmaddu Ring",
		ring2="Epona's Ring",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+1','"Store TP"+10',}},
		waist="Windbuffet Belt +1",
		}

	sets.engaged.LowAcc = set_combine(sets.engaged, {
		hands=gear.Herc_TA_hands,
		neck="Combatant's Torque",
		ring1="Chirich Ring",
		})

	sets.engaged.MidAcc = set_combine(sets.engaged.LowAcc, {
		ammo="Falcon Eye",
		legs="Adhemar Kecks",
		ear2="Telos Earring",
		})

	sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
		head="Carmine Mask",
		legs="Carmine Cuisses +1",
		feet=gear.Herc_Acc_feet,
		ring1="Ramuh Ring +1",
		ring2="Ramuh Ring +1",
		ear1="Mache Earring",
		waist="Kentarch Belt +1",
		})

	sets.engaged.STP = set_combine(sets.engaged, {
		feet="Carmine Greaves +1",
		neck="Ainia Collar",
		ear1="Brutal Earring",
		ear2="Telos Earring",
		waist="Kentarch Belt +1",
		})

	-- Custom buff sets
	sets.buff.Doom = {ring1="Saida Ring", ring2="Saida Ring", waist="Gishdubar Sash"}

	sets.CP = {back="Mecisto. Mantle"}
	sets.Reive = {neck="Ygnas's Resolve +1"}
	
	organizer_items = {
		echos="Echo Drops",
		shihei="Shihei",
		main="Epeolatry",
		Sole="Sole Sushi",
		Squid="Squid Sushi",
		miso="Miso Ramen",
		HSquid="Squid Sushi +1",
		RCurry="Red Curry Bun",
		Silent="Silent Oil",
		Prism="Prism Powder",
		SKindred="S. Kindred Crest",
		HKindred="H. Kindred Crest",
		Kindred="Kindred's Crest",
		Seal="Kindred's Seal",
		Warp="Warp Ring",
		Exp="Echad Ring",
		HCap="Trizek Ring",
		Cap="Capacity Ring",
		Vouch="Copper Voucher",
		FRing="Facility Ring",
		ToolbagS="Toolbag (Shihe)",
		Meci="Mecisto. Mantle",
		Bei="Beitetsu",
		If="Ifritite",
		Plu="Pluton",
		Rift="Riftborn Boulder",
		Garu="Garudite",
		Fen="Fenrite",
		Flame="Flame Geode",
		Brez="Breeze Geode",
		Light="Light Geode",
		Ram="Ramuite",
		}
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
		send_command('wait '..rayke_duration..';input /p ******** Rayke: OFF ********;')
	elseif spell.name == 'Gambit' and not spell.interrupted then
		send_command('@timers c "Gambit ['..spell.target.name..']" '..gambit_duration..' down spells/00136.png')
		send_command('wait '..gambit_duration..';input /p ******** Gambit: OFF ********;')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
	classes.CustomDefenseGroups:clear()
	classes.CustomDefenseGroups:append(state.Knockback.current)
	classes.CustomDefenseGroups:append(state.Death.current)

	classes.CustomMeleeGroups:clear()
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
	if state.Knockback.value == true then
		idleSet = set_combine(idleSet, sets.defense.Knockback)
		end
	if state.Death.value == true then
		idleSet = set_combine(idleSet, sets.defense.Death)
		end	if state.Buff.Doom then
		idleSet = set_combine(idleSet, sets.buff.Doom)
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
	if state.Knockback.value == true then
		meleeSet = set_combine(meleeSet, sets.defense.Knockback)
		end
	if state.Death.value == true then
		meleeSet = set_combine(meleeSet, sets.defense.Death)
		end
	if state.Buff.Doom then
		meleeSet = set_combine(meleeSet, sets.buff.Doom)
		end 

	return meleeSet
end

function customize_defense_set(defenseSet)
	if state.Knockback.value == true then
		defenseSet = set_combine(defenseSet, sets.defense.Knockback)
		end
	if state.Death.value == true then
		defenseSet = set_combine(defenseSet, sets.defense.Death)
		end
	if state.Buff.Doom then
		defenseSet = set_combine(defenseSet, sets.buff.Doom)
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
	if player.sub_job == 'WAR' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 20)
	else
		set_macro_page(2, 20)
	end
end

function set_lockstyle()
	send_command('wait 2; input /lockstyleset 1')
end