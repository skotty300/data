-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
    state.Buff.Doom = buffactive.Doom or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Reraise', 'Charm')
    state.MagicalDefenseMode:options('MDT', 'HP', 'Reraise', 'Charm')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')

    update_defense_mode()
    
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
    send_command('bind @f10 gs c toggle EquipShield')
    send_command('bind @f11 gs c toggle EquipShield')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = {legs="Caballarius Breeches +1"}
    sets.precast.JA['Holy Circle'] = {feet="Rev. Leggings +2"}
    sets.precast.JA['Shield Bash'] = {hands="Caballarius Gauntlets +1"}
    sets.precast.JA['Sentinel'] = {ammo="Paeapua",
        head="Souv. Schaller +1",neck="Unmoving Collar",ear1="Odnowa Earring +1",ear2="Cryptic Earring",
        body="Souveran Cuirass +1",hands="Souv. Handsch. +1",ring1="Apeile Ring",ring2="Apeile ring +1",
        back="Weard Mantle",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Caballarius Leggings +1"}
    sets.precast.JA['Rampart'] = {ammo="Paeapua",
        head="Caballarius Coronet +1",neck="Unmoving Collar",ear1="Odnowa Earring +1",ear2="Cryptic Earring",
        body="Souveran Cuirass +1",hands="Souv. Handsch. +1",ring1="Apeile Ring",ring2="Apeile ring +1",
        back="Weard Mantle",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souvran Schuhs +1"}
    sets.precast.JA['Fealty'] = {body="Caballarius Surcoat +1"}
    sets.precast.JA['Divine Emblem'] = {feet="Chev. Sabatons +1"}
    sets.precast.JA['Cover'] = {head="Rev. Coronet +2"}
	sets.precast.JA['Provoke'] = {ammo="Paeapua",
        head="Souv. Schaller +1",neck="Unmoving Collar",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Souveran Cuirass +1",hands="Souv. Handsch. +1",ring1="Apeile Ring +1",ring2="Apeile ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
    main="",
    sub="",
    ammo="Paeapua",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Cab. Gauntlets +1", augments={'Enhances "Chivalry" effect',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Dualism Collar",
    waist="Creed Baudrier",
    left_ear="Nourish. Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Paeapua",
        head="Souv. Schaller +1",neck="Unmoving Collar",ear1="Odnowa Earring +1",ear2="Cryptic Earring",
        body="Souveran Cuirass +1",hands="Souv. Handsch. +1",ring1="Apeile Ring",ring2="Apeile ring +1",
        back="Weard Mantle",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souvran Schuhs +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    main="",
    sub="Aegis",
    ammo="Impatiens",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Baetyl Pendant",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Cheruski Needle",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Begrudging Ring",ring2="Ifrit Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}

    sets.precast.WS.Acc = {ammo="Cheruski Needle",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Begrudging Ring",ring2="Ifrit Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="Cheruski Needle",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Begrudging Ring",ring2="Ifrit Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}
    
	sets.precast.WS['Requiescat'].Acc = {ammo="Cheruski Needle",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Begrudging Ring",ring2="Ifrit Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}
    
	sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Ramuh Ring",ring2="Ramuh Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}
    
	sets.precast.WS['Chant du Cygne'].Acc = {ammo="Jukukik Feather",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Ramuh Ring",ring2="Ramuh Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}

    sets.precast.WS['Savage Blade'] = {ammo="Cheruski Needle",
        head="Lustratio Cap",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Lustratio Harness",hands="Lustratio Mittens",ring1="Begrudging Ring",ring2="Ifrit Ring",
        back={name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		waist="Fotia Belt",legs="Lustratio Subligar",feet="Lustratio Leggings"}
    
    sets.precast.WS['Atonement'] = {ammo="Paeapua",
        head="Souv. Schaller +1",neck="Unmoving Collar",ear1="Cryptic Earring",ear2="Friomisi Earring",
        body="Souveran Cuirass",hands="Souv. Handsch. +1",ring1="Apeile Ring",ring2="Apeile ring +1",
        back="Weard Mantle",waist="Goading Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
    main="",
    sub="Aegis",
    ammo="Impatiens",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Baetyl Pendant",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}},
}
        
    sets.midcast.Enmity = {
    main="",
    sub="Aegis",
    ammo="Paeapua",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Unmoving Collar",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring +1",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring +1",
    right_ring="Apeile Ring",
    back={ name="Weard Mantle", augments={'VIT+4','Enmity+4','Phalanx +3',}},
}

    sets.midcast.Flash = {
    main="",
    sub="",
    ammo="Paeapua",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Unmoving Collar",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring +1",
    right_ear="Cryptic Earring",
    left_ring="Apeile Ring +1",
    right_ring="Apeile Ring",
    back={ name="Weard Mantle", augments={'VIT+4','Enmity+4','Phalanx +3',}},
}
    
    sets.midcast.Reprisal = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Dualism Collar",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
	
	sets.midcast.Phalanx = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Dualism Collar",
    waist="Creed Baudrier",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Weard Mantle", augments={'VIT+4','Enmity+4','Phalanx +3',}},
}
    
    sets.midcast.Cure = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Dualism Collar",
    waist="Creed Baudrier",
    left_ear="Nourish. Earring",
    right_ear="Nourish. Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

    sets.midcast['Enhancing Magic'] = {neck="Colossus's Torque",hands="Regal Gauntlets",waist="Olympus Sash",legs="Rev. Breeches +2",
		back="Weard Mantle", feet="Souveran Schuhs +1"}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
    sets.resting = {neck="Creed Collar",
        ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt"}
    

    -- Idle sets
    sets.idle = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

    sets.idle.Town = {
    main="",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Sanctity Necklace",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Infused Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    
    sets.idle.Weak = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Sanctity Necklace",ear1="Odnowa Earring +1",ear2="Infused Earring",
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},hands="Regal Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    sets.Kiting = {legs="Carmine Cuisses +1"}



    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle"}
    sets.MP = {neck="Creed Collar",waist="Flume Belt"}
    sets.MP_Knockback = {neck="Creed Collar",waist="Flume Belt",back="Repulse Mantle"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {main="",sub="Ochain"} -- Ochain
    sets.MagicalShield = {main="",sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {
    main="",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.HP = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.Reraise = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head="Twilight Helm",
    body="Twilight Mail",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    sets.defense.Charm = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {
    main="",
    sub="",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {
    main="",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Loricate Torque",
    waist="Flume Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",
}

    sets.engaged.Acc = {
    main="",
    sub="",
    ammo="Ginsen",
    head="Rev. Coronet +2",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Rev. Gauntlets +2",
    legs="Rev. Breeches +2",
    feet="Rev. Leggings +2",
    neck="Subtlety Spec.",
    waist="Eschan Stone",
    left_ear="Odnowa Earring +1",
    right_ear="Odnowa Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

    sets.engaged.DW = {ammo="Ginsen",
        head="Valorous Mask",neck="Subtlety Spec.",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Valorous Mail",hands="Valorous Mitts",ring1="Defending Ring",ring2="Vocane Ring",
        back="Rudianos's Mantle",waist="Eschan Stone",legs="Odyssean Cuisses",feet="Valorous Greaves"}

    sets.engaged.DW.Acc = {ammo="Ginsen",
        head="Valorous Mask",neck="Subtlety Spec.",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Valorous Mail",hands="Valorous Mitts",ring1="Defending Ring",ring2="Vocane Ring",
        back="Rudianos's Mantle",waist="Eschan Stone",legs="Odyssean Cuisses",feet="Valorous Greaves"}

    sets.engaged.PDT = set_combine(sets.engaged, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = {ring2="Saida Ring",ring1="Saida Ring", legs="Shabti Cuisses +1"}
    sets.buff.Cover = {head="Rev. Coronet +2", body="Cab. Surcoat +1"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_midcast(spell, action, spellMap, eventArgs)
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
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    if state.EquipShield.value == true then
        classes.CustomDefenseGroups:append(state.DefenseMode.current .. 'Shield')
    end

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    
    return meleeSet
end

function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
    
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
    
    if state.Buff.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end
    
    return defenseSet
end


function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.ExtraDefenseMode.value ~= 'None' then
        msg = msg .. ', Extra: ' .. state.ExtraDefenseMode.value
    end
    
    if state.EquipShield.value == true then
        msg = msg .. ', Force Equip Shield'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and
           player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 2)
    else
        set_macro_page(1, 2)
    end
end

function set_lockstyle()
	send_command('wait 2; input /lockstyleset 3')
end
