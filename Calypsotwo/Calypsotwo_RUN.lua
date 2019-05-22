-------------------------------------------------------------------------------------------------------------------
-- (Original: Motenten / Modified: Arislan)
-------------------------------------------------------------------------------------------------------------------

--[[	Custom Features:
		Rune Selector		Cycle through available runes and trigger with a single macro [Ctl-`]
		Reive Detection		Automatically equips Reive bonus gear
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
	state.OffenseMode:options('Normal', 'HighAcc', 'MDT', 'DPS', 'PDT', 'MEva')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'DT')
	state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT', 'MEva')
	
	state.Runes = M{['description']='Runes', "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae"}

	gear.magic_head = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+24','INT+12','Mag. Acc.+9',}}
	gear.physical_head = "Lilitu Headpiece"
	gear.tp_feet = { name="Herculean Boots", augments={'Attack+15','INT+7','Quadruple Attack +3','Accuracy+11 Attack+11',}}
	gear.wsd_head = { name="Herculean Helm", augments={'Attack+15','Weapon skill damage +4%','AGI+5',}}
	gear.wsd_body = { name="Herculean Vest", augments={'Attack+29','Weapon skill damage +4%','STR+12','Accuracy+4',}}
	gear.wsd_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	gear.pdt_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.melee_cape = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.fast_cape = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.phalanx_body = { name="Taeon Tabard", augments={'Accuracy+20','Spell interruption rate down -3%','Phalanx +3',}}
	gear.phalanx_hands = { name="Herculean Gloves", augments={'Rng.Acc.+2 Rng.Atk.+2','MND+8','Phalanx +4',}}
	gear.phalanx_legs = { name="Herculean Trousers", augments={'INT+3','Pet: "Mag.Atk.Bns."+16','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	gear.phalanx_feet = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Phalanx +3',}}
	
	send_command('bind ^` input //gs c rune')
	send_command('bind ^- gs c cycleback Runes')
	send_command('bind ^= gs c cycle Runes')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	
	select_default_macro_book()
	set_lockstyle()
end

function user_unload()
	send_command('unbind ^`')
	send_command('unbind ^-')
	send_command('unbind ^=')
	send_command('unbind ^f11')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Enmity set
	sets.Enmity = {
		ammo="Sapience Orb", --2
		head="Halitus Helm", --8
		body="Emet Harness +1", --10
		hands="Kurys Gloves", --9
		legs="Eri. Leg Guards +1", --7
		feet="Erilaz Greaves +1",--6
		neck="Moonbeam Necklace", --10
		ear1="Cryptic Earring", --4
		ear2="Friomisi Earring", --2
		ring1="Supershear Ring", --5
		ring2="Eihwaz Ring", --5
		back=gear.pdt_cape, --4
		waist="Goading Belt" --4
		}

	-- Precast sets to enhance JAs
	sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {body="Runeist's Coat +3", legs="Futhark Trousers +1", back="Ogma's Cape"})
	sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
	sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {feet="Runeist's Boots +3"})
	sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {head="Futhark Bandeau +3"})
	sets.precast.JA['Liement'] = set_combine(sets.Enmity, {body="Futhark Coat +3"})

	sets.precast.JA['Lunge'] = {
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
		waist="Eschan Stone"
		}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
	sets.precast.JA['Gambit'] = {hands="Runeist's Mitons +3"}
	sets.precast.JA['Rayke'] = {feet="Futhark Boots +2"}
	sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {body="Futhark Coat +3"})
	sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {hands="Futhark Mitons +1"})
	sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {back="Evasionist's Cape"})
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {head="Erilaz Galea +1", neck="Incanter's Torque"})
	sets.precast.JA['One For All'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Provoke'] = sets.Enmity

	sets.precast.Waltz = {
		hands="Slither Gloves +1",
		ring1="Asklepian Ring",
		ring2="Valseur's Ring"
		}

	-- Fast cast sets for spells
	sets.precast.FC = {
		ammo="Impatiens", --2
		head="Runeist's Bandeau +3", --14
		body="Adhemar Jacket", --8
		hands="Leyline Gloves", --7
		legs="Ayanmo Cosciales +2", --5
		feet="Carmine Greaves +1", --8
		neck="Orunmila's Torque", --5
		ear1="Loquacious Earring", --2
		ear2="Etiolation Earring", --2
		ring1="Kishar Ring", --4
		ring2="Rahab Ring", --5(3)
		back=gear.fast_cape, --10
		waist="Kasiri Belt"
		}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		legs="Futhark Trousers +1",
		waist="Siegel Sash"
		})
	
	sets.precast.FC['Stoneskin'] = set_combine(sets.precast.FC, {
		legs="Doyen Pants",
		waist="Siegel Sash"
		})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ammo="Impatiens", ear2="Mendi. Earring", legs="Doyen Pants"})

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		ammo="Impatiens",
		body="Passion Jacket",
		neck="Magoraga Beads",
		ring1="Lebeche Ring",
		waist="Ninurta's Sash"
		})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo="Aqreqaq Bomblet",
		head=gear.physical_head,
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Herculean Trousers",
		feet=gear.tp_feet,
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		waist="Fotia Belt"
		}

	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
		ammo="Aqreqaq Bomblet",
		head=gear.physical_head,
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Herculean Trousers",
		feet=gear.tp_feet,
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		waist="Fotia Belt"
		})

	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Lustratio Cap +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Lustratio Leggings +1",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		waist="Fotia Belt"
		})
		
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {
		ammo="Knobkierrie",
		head="Lustratio Cap +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Meg. Chausses +2",
		feet="Lustratio Leggings +1",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		waist="Fotia Belt"
		})
	
	sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS['Resolution'], {
		ammo="Knobkierrie",
		head=gear.wsd_head,
		body=gear.wsd_body,
		hands="Meg. Gloves +2",
		legs="Lustratio Subligar",
		feet="Lustratio Leggings +1",
		-- neck="Caro Necklace",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back=gear.wsd_cape,
		-- waist="Grunfeld Rope"
		waist="Fotia Belt"
		})
		
	sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'], {
		ammo="Knobkierrie",
		head=gear.wsd_head,
		body=gear.wsd_body,
		hands="Meg. Gloves +2",
		legs="Lustratio Subligar",
		feet="Lustratio Leggings +1",
		neck="Fotia Gorget",
		ear1="Moonshade Earring",
		ear2="Sherida Earring",
		ring1="Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back=gear.wsd_cape,
		waist="Fotia Belt"
		})

	sets.precast.WS['Herculean Slash'] = sets.precast.JA['Lunge']

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		body="Meg. Cuirie +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet=gear.tp_feet,
		neck="Caro Necklace",
		ring1="Ifrit Ring +1",
		ring2="Shukuyu Ring",
		waist="Prosilio Belt +1",
		back=gear.wsd_cape
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
		waist="Eschan Stone"
		}

	sets.precast.WS['True Strike']= sets.precast.WS['Resolution']

	sets.precast.WS['True Strike']= sets.precast.WS['Savage Blade']
	sets.precast.WS['Judgment'] = sets.precast.WS['Savage Blade']
	sets.precast.WS['Black Halo'] = sets.precast.WS['Savage Blade']

	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS['Sanguine Blade'], {
		head=gear.Herc_MAB_head,
		ring1="Shiva Ring +1",
		ring2="Weather. Ring"
		})

	--------------------------------------
	-- Midcast Sets
	--------------------------------------
	
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast.SpellInterrupt = {
		ammo="Staunch Tathlum +1", --10
		legs="Carmine Cuisses +1", --20
		ear1="Halasz Earring", --5
		ring1="Evanescence Ring", --5
		waist="Rumination Sash", --10
		neck="Moonbeam Necklace" --10
		}

	sets.midcast.Cure = {
		ammo="Staunch Tathlum +1",
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
		waist="Flume Belt +1"
		}

	sets.midcast['Enhancing Magic'] = {
		head="Carmine Mask",
		hands="Runeist's Mitons +3",
		legs="Carmine Cuisses +1",
		neck="Incanter's Torque",
		ear1="Augment. Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Olympus Sash",
		back="Merciful Cape"
		}

	sets.midcast.EnhancingDuration = {
		head="Erilaz Galea +1",
		hands="Regal Gauntlets",
		legs="Futhark Trousers +1"
		}

	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
		head="Futhark Bandeau +3",
		body=gear.phalanx_body,
		hands=gear.phalanx_hands,
		legs=gear.phalanx_legs,
		feet=gear.phalanx_feet
		})

	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {head="Runeist's Bandeau +3"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Erilaz Galea +1", waist="Gishdubar Sash",legs="Futhark Trousers +1"})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring2="Sheltered Ring"})
	sets.midcast.Shell = sets.midcast.Protect

	sets.midcast['Divine Magic'] = {
		legs="Rune. Trousers +2",
		neck="Incanter's Torque",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		waist="Bishop's Sash"
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
		ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",
		body="Runeist's Coat +3",
		-- body="Futhark Coat +3",
		hands="Regal Gauntlets",
		legs="Erilaz Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Vocane Ring +1",
		back=gear.pdt_cape,
		waist="Flume Belt +1"
		}

	sets.idle.Weak = sets.idle
	sets.Kiting = {legs="Carmine Cuisses +1"}

	--------------------------------------
	-- Defense sets
	--------------------------------------

	sets.defense.PDT = {
		sub="Mensch Strap",
		ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Vocane Ring +1",
		back=gear.pdt_cape,
		waist="Flume Belt +1"
		}
	
	sets.defense.MDT = {
		sub="Irenic Strap +1",
		ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",
		body="Futhark Coat +3",
		hands="Meghanada Gloves +2",
		legs="Erilaz Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Vocane Ring +1",
		back=gear.pdt_cape,
		waist="Engraved Belt"
		}

	sets.defense.MEva = {
		sub="Irenic Strap +1",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Purity Ring",
		back=gear.pdt_cape,
		waist="Engraved Belt"
		}
	
	sets.defense.HP = {
		sub="Utu Grip", --3/3
		ammo="Staunch Tathlum +1", --2/2
		head="Erilaz Galea +1",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3", --2/0
		legs="Eri. Leg Guards +1", --7/0
		feet="Erilaz Greaves +1", --5/0
		neck="Futhark Torque +1", --6/6
		ear1="Odnowa Earring", --0/1
		ear2="Odnowa Earring +1", --0/2
		ring1="Gelatinous Ring +1", --7/(-1)
		ring2="Defending Ring", --10/10
		back="Evasionist's Cape", --7/4
		waist="Flume Belt +1" --4/0
		}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
		sub="Utu Grip",
		ammo="Ginsen",
		head="Dampening Tam",
		body="Adhemar Jacket +1",
		-- hands="Herculean Gloves",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet=gear.tp_feet,
		-- neck="Anu Torque",
		neck="Asperity Necklace",
		ear1="Telos Earring",
		ear1="Brutal Earring",
		ear2="Sherida Earring",
		ring1="Epona's Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		-- waist="Ioskeha Belt",
		waist="Windbuffet Belt +1"
		}

	sets.engaged.HighAcc = {
		sub="Utu Grip",
		ammo="Yamarang",
		head="Runeist's Bandeau +3",
		body="Runeist's Coat +3",
		hands="Runeist's Mitons +3",
		legs="Carmine Cuisses +1",
		feet=gear.tp_feet,
		-- neck="Subtlety Spec.",
		neck="Sanctity Necklace",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		-- waist="Ioskeha Belt",
		waist="Windbuffet Belt +1"
		}

	sets.engaged.MDT = {
		sub="Irenic Strap +1",
		ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",
		body="Futhark Coat +3",
		hands="Meghanada Gloves +2",
		legs="Erilaz Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Warder's Charm +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Vocane Ring +1",
		back=gear.pdt_cape,
		waist="Engraved Belt"
		}

	sets.engaged.DPS = {
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		head="Ayanmo Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Meghanada Gloves +2",
		legs="Erilaz Leg Guards +1",
		feet=gear.tp_feet,
		neck="Futhark Torque +1",
		ear1="Telos Earring",
		ear2="Sherida Earring",
		ring1="Defending Ring",
		ring2="Niqmaddu Ring",
		back=gear.melee_cape,
		-- waist="Ioskeha Belt",
		waist="Windbuffet Belt +1"
		}

	sets.engaged.PDT = {
		sub="Utu Grip",
		-- sub="Mensch Strap",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		-- head="Futhark Bandeau +3",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Futhark Torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Vocane Ring +1",
		back=gear.pdt_cape,
		waist="Flume Belt +1"
		}

	sets.engaged.MEva = {
		sub="Irenic Strap +1",
		ammo="Staunch Tathlum +1",
		head="Turms Cap +1",
		body="Runeist's Coat +3",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +1",
		feet="Turms Leggings +1",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Purity Ring",
		back=gear.pdt_cape,
		waist="Engraved Belt"
		}

	-- Custom buff sets
	sets.buff.Doom = {ring1="Saida Ring", ring2="Purity Ring", waist="Gishdubar Sash"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	-- if spell.english == 'Lunge' then
		-- local abil_recasts = windower.ffxi.get_ability_recasts()
		-- if abil_recasts[spell.recast_id] > 0 then
			-- send_command('input /jobability "Swipe" <t>')
-- --			add_to_chat(122, '***Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.***')
			-- eventArgs.cancel = true
			-- return
		-- end
	-- end
	-- if spell.english == 'Valiance' then
		-- local abil_recasts = windower.ffxi.get_ability_recasts()
		-- if abil_recasts[spell.recast_id] > 0 then
			-- send_command('input /jobability "Vallation" <me>')
			-- eventArgs.cancel = true
			-- return
		-- end
	-- end	
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
	if buffactive['Embolden'] then
		equip(sets.midcast.EnhancingDuration)
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
	
	if buff == "Embolden" then
		if gain then
			equip(set_combine(sets.midcast['EnhancingDuration'], { back="Evasionist's Cape" }))
			disable('head','legs','back')
		else
			enable('head','legs','back')
			handle_equipping_gear(player.status)
		end
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
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if player.mpp < 51 then
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end

	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	return meleeSet
end

function customize_defense_set(defenseSet)
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
		set_macro_page(7, 11)
	elseif player.sub_job == 'DRK' then
		set_macro_page(7, 11)
	elseif player.sub_job == 'WHM' then
		set_macro_page(3, 11)
	else
		set_macro_page(3, 11)
	end
end

function set_lockstyle()
	send_command('wait 2; input /lockstyleset 20')
end
