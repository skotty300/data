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
    state.OffenseMode:options('PDT', 'Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT', 'Reraise')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Reraise', 'Charm')
    state.MagicalDefenseMode:options('MDT', 'HP', 'Reraise', 'Charm')
    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(false, 'Equip Shield w/Defense')
	
	gear.savage_cape = { name="Rudianos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.fc_cape = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}}

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
    sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +1"}
    sets.precast.JA['Shield Bash'] = {hands="Caballarius Gauntlets +2"}
    sets.precast.JA['Sentinel'] = {feet="Caballarius Leggings +1"}
    sets.precast.JA['Rampart'] = {head="Caballarius Coronet +2"}
    sets.precast.JA['Fealty'] = {body="Caballarius Surcoat +2"}
    sets.precast.JA['Divine Emblem'] = {feet="Creed Sabatons +2"}
    sets.precast.JA['Cover'] = {head="Reverence Coronet +1"}

    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        head="Reverence Coronet +1",
        body="Reverence Surcoat +3",hands="Reverence Gauntlets +1",ring1="Leviathan Ring",ring2="Aquasoul Ring",
        back="Weard Mantle",legs="Souveran Diechlings +1",feet="Whirlpool Greaves"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Reverence Coronet +1",
        body="Xaddi mail",hands="Reverence Gauntlets +1",ring2="Asklepian Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Souveran Diechlings +1",feet="Whirlpool Greaves"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells    
    sets.precast.FC = {ammo="Sapience Orb",head="Chevalier Armet",ring2="Kishar Ring",ring1="Rahab Ring",
		back=gear.fc_cape,body="Reverence Surcoat +3",hands="Leyline Gloves",legs="Enif Cosciales",feet="Carmine Greaves +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
        head="Sulevia's Mask +1",neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Moonshade Earring",
        body="Sulevia's Platemail +1",hands="Sulevia's Guantlets +1",ring1="Rajas Ring",ring2="Ifrit Ring",
        back=gear.savage_cape,waist="Fotia Belt",legs="Sulevia's Cuisses +1",feet="Sulevia's Leggings +1"}

    sets.precast.WS.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Moonshade Earring",
        body="Xaddi mail",hands="Founder's Guantlets",ring1="Rajas Ring",ring2="Patricius Ring",
        back=gear.savage_cape,waist="Fotia Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="Quartz Tathlum +1",
        head="Carmine Mask",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Sulevia's Platemail +1",hands="Carmine Finger Gauntlets +1",ring1="Rajas Ring",ring2="Rufescent Ring",
        back=gear.savage_cape,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Sulevia's Leggings +1"}

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {hands="Founder's Guantlets",waist="Zoran's Belt",feet="Thereoid Greaves"})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {waist="Zoran's Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Ginsen",
        head="Pixie Hairpin +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Moonshade's Earring",
        body="Reverence Surcoat +3",hands="Reverence Gauntlets +1",ring1="Shiva Ring",ring2="Patricius Ring",
        back="Toro Cape",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    
    sets.precast.WS['Atonement'] = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck=gear.ElementalGorget,ear1="Creed Earring",ear2="Steelflash Earring",
        body="Reverence Surcoat +3",hands="Reverence Gauntlets +1",ring1="Rajas Ring",ring2="Vexer Ring",
        back="Fierabras's Mantle",waist="Fotia Belt",legs="Reverence Breeches +1",feet="Sulevia's Leggings +1"}

    sets.precast.WS['Aeolian Edge'] = {head="Reverence Coronet +1",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Moonshade's Earring",
        body="Odyssean Chestplate",hands="Founder's Guantlets",ring1="Shiva Ring",ring2="Patricius Ring",
        back="Toro Cape",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Founder's Greaves"}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------
        
    sets.midcast.Enmity = {ammo="Paeaqua",
        head="Loess Barbuta",neck="Moonbeam Necklace",ear1="Cryptic Earring",
        body="Souveran Cuirass",hands="Caballarius Gauntlets +2",ring1="Apeile Ring +1",ring2="Apeile Ring",
        back="Weard Mantle",waist="Creed Baudrier",legs="Souveran Diechlings +1",feet="Caballarius Leggings +1"}
		
    sets.midcast.Reprisal =  {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Sanctity Necklace",ear1="Knightly earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Eihwaz Ring",ring2="Meridian Ring",
        back="Weard Mantle",waist="Creed Baudrier",legs="Souveran Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.midcast.Phalanx =  {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Incanter's Necklace",ear1="Knightly earring",ear2="Andoaa Earring",
        body="Odyssean Chestplate",hands="Souveran Handschuhs +1",ring1="Supershear Ring",ring2="Eihwaz Ring",
        back="Weard Mantle",waist="Creed Baudrier",legs="Odyssean Cuisses",feet="Souveran Schuhs +1"}

    sets.midcast.Flash = set_combine(sets.midcast.Enmity, {legs="Enif Cosciales"})
    
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Invidia Torque",ear1="Knightly earring",ear2="Nourishing Earring",
        body="Souveran Cuirass",hands="Macabre Gauntlets +1",ring1="Supershear Ring",ring2="Eihwaz Ring",
        back="Solemnity Cape",legs="Founder's Hose",feet="Odyssean Greaves"}
    
    sets.midcast.CureSelf = {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Invidia Torque",ear1="Knightly earring",ear2="Nourishing Earring",
        body="Souveran Cuirass",hands="Macabre Gauntlets +1",ring1="Vocane Ring +1",ring2="Meridian Ring",
        back="Solemnity Cape",waist="Gishdubar Sash",legs="Founder's Hose",feet="Odyssean Greaves"}

    sets.midcast['Enhancing Magic'] = {ammo="Staunch Tathlum",
		neck="Colossus's Torque",ear2="Andoaa Earring",waist="Olympus Sash",
		back=gear.fc_cape,legs="Reverence Breeches +1",feet="Odyssean Greaves"}

	--102% required  108 current
    sets.midcast['Blue Magic'] = set_combine(sets.midcast.Enmity, {
		ammo="Staunch Tathlum", --10
		head="Souveran Schaller", --15
		ear1="Knightly earring", --9
		neck="Moonbeam Necklace", --10
		back=gear.fc_cape, --4
		waist="Rumination Sash", --10
		legs="Founder's hose", --30
		feet="Odyssean Greaves" --20
	})
    
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
    -- sets.idle = {ammo="Ginsen",
        -- head="Baghere Salade",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Cassie Earring",
        -- body="Ares' Cuirass +1",hands="Souveran Handschuhs",ring1="Defending Ring",ring2="Vocane Ring +1",
        -- back="Moonbeam Cape",waist="Nierenschutz",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle = {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Nierenschutz",legs="Souveran Diechlings +1",feet="Souveran Schuhs +1"}

    sets.idle.Town = {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Souveran Cuirass",hands="Souveran Handschuhs +1",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Nierenschutz",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
    
    sets.idle.Weak = {ammo="Iron Gobbet",
        head="Baghere Salade",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Sheltered Ring",ring2="Meridian Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle"}
    sets.MP = {neck="Creed Collar",waist="Flume Belt"}
    sets.MP_Knockback = {neck="Creed Collar",waist="Flume Belt",back="Repulse Mantle"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {main="Anahera Sword",sub="Killedar Shield"} -- Ochain
    sets.MagicalShield = {main="Anahera Sword",sub="Beatific Shield +1"} -- Aegis

    -- Basic defense sets.
    
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Nierenschutz",legs="Souveran Diechlings +1",feet="Souveran Schuhs +1"}
    sets.defense.HP = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Defending Ring",ring2="Meridian Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souveran Diechlings +1",feet="Reverence Leggings +1"}
    sets.defense.Reraise = {ammo="Iron Gobbet",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Reverence Gauntlets",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Weard Mantle",waist="Nierenschutz",legs="Souveran Diechlings +1",feet="Reverence Leggings +1"}
    sets.defense.Charm = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Lavalier +1",ear1="Odnowa Earring",ear2="Steelflash Earring",
        body="Reverence Surcoat +3",hands="Reverence Gauntlets",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Reverence Breeches +1",feet="Reverence Leggings +1"}
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Nierenschutz",legs="Souveran Diechlings +1",feet="Souveran Schuhs +1"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {ammo="Ginsen",
        head="Souveran Schaller",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Emet Harness +1",hands="Acro Gauntlets",ring1="Rajas Ring",ring2="Hetairoi Ring",
        back=gear.savage_cape,waist="Zoran's Belt",legs="Acro Breeches",feet="Acro Leggings"}

    sets.engaged.Acc = {ammo="Ginsen",
        head="Souveran Schaller",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Emet Harness +1",hands="Acro Gauntlets",ring1="Mars's Ring",ring2="Patricius Ring",
        back="Weard Mantle",waist="Zoran's Belt",legs="Acro Breeches",feet="Acro Leggings"}

    sets.engaged.DW = {ammo="Ginsen",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Reverence Surcoat +3",hands="Acro Gauntlets",ring1="Rajas Ring",ring2="Hetairoi Ring",
        back=gear.savage_cape,waist="Zoran's Belt",legs="Acro Breeches",feet="Acro Leggings"}

    sets.engaged.DW.Acc = {ammo="Ginsen",
        head="Yaoyotl Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Reverence Surcoat +3",hands="Acro Gauntlets",ring1="Mars's Ring",ring2="Patricius Ring",
        back="Weard Mantle",waist="Zoran's Belt",legs="Acro Breeches",feet="Acro Leggings"}

    sets.engaged.PDT =  {ammo="Staunch Tathlum",
        head="Souveran Schaller",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Reverence Surcoat +3",hands="Souveran Handschuhs +1",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Nierenschutz",legs="Souveran Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, sets.engaged.PDT)
    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, sets.engaged.PDT)
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, sets.engaged.PDT)
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = {ring2="Saida Ring",waist="Gishdubar Sash"}
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +2"}
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
           not player.equipment.sub == 'Aegis' and not player.equipment.sub == 'Ochain' then
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
        set_macro_page(1, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 3)
    else
        set_macro_page(1, 3)
    end
end
