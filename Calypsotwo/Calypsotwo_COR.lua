-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    gs c toggle LuzafRing -- Toggles use of Luzaf Ring on and off
    
    Offense mode is melee or ranged.  Used ranged offense mode if you are engaged
    for ranged weaponskills, but not actually meleeing.
    
    Weaponskill mode, if set to 'Normal', is handled separately for melee and ranged weaponskills.
--]]


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    -- Whether to use Luzaf's Ring
    state.LuzafRing = M(false, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo
    state.warned = M(false)

    define_roll_values()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Melee', 'Acc', 'DW', 'DWAcc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Att', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	
    gear.snapshot_head = { name="Taeon Chapeau", augments={'Rng.Acc.+18','"Snapshot"+5','"Snapshot"+5',}}
    gear.magic_hands = { name="Herculean Gloves", augments={'Mag. Acc.+17','Weapon skill damage +5%','INT+6',}}
    gear.magic_legs = { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +4%',}}
    gear.melee_hands = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
    gear.ranged_hands = { name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}}
	gear.melee_feet = { name="Herculean Boots", augments={'Attack+15','INT+7','Quadruple Attack +3','Accuracy+11 Attack+11',}}
	gear.ls_cape = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.melee_cape = { name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.LastStand_cape = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
    gear.ranged_cape = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}}
    gear.snapshot_cape = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet"
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 10

    -- Additional local binds
    send_command('bind ^` input /ja "Double-up" <me>')
    send_command('bind !` input /ja "Bolter\'s Roll" <me>')

    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	sets.Obi = {waist='Hachirin-no-obi'}
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    
    sets.precast.CorsairRoll = {head="Lanun Tricorne +2",neck="Regal Necklace",hands="Chasseur's Gants +1",back=gear.ls_cape}    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chasseur's Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}
    
    -- Waltz set (chr and vit) TODO
    sets.precast.Waltz = {
        head="Whirlpool Mask",
        body="Meghanada Cuirie +2",hands="Laskamana's Gants +2",
        legs="Laksamana's Trews +3",feet="Laksamana's Boots +2"}

    -- Fast cast sets for spells    
    sets.precast.FC = {head="Carmine Mask",ear1="Etiolation Earring",ear2="Loquacious Earring",
		hands="Leyline Gloves",ring1="Kishar Ring"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head=gear.snapshot_head,body="Laksamana's Frac +3",hands="Carmine Finger Gauntlets +1",
        back=gear.snapshot_cape,waist="Impulse Belt",legs="Laksamana's Trews +3",feet="Meghanada Jambeaux +2"}
		
    sets.precast.RA.Flurry = set_combine(sets.precast.RA, {head="Chasseur's Tricorne +1"})

    sets.precast.RA.Flurry2 = set_combine(sets.precast.Flurry, {waist="Yemaya Belt",feet="Pursuer's Gaiters"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Laksamana's Frac +3",hands="Leyline Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.LastStand_cape,waist="Fotia Belt",legs="Laksamana's Trews +3",feet="Adhemar Gamashes +1"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Evisceration'] = sets.precast.WS

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ring2="Rufescent Ring"})

    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Lanun Tricorne +2",neck=gear.ElementalGorget,ear1="Telos Earring",ear2="Moonshade Earring",
        -- head="Lanun Tricorne +2",neck=gear.ElementalGorget,ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksamana's Frac +3",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.LastStand_cape,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Lanun Bottes +3"}
    
    sets.precast.WS['Savage Blade'] = {
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksamana's Frac +3",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.LastStand_cape,waist="Metalsinger Belt",legs="Meghanada Chausses +2",feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Chasseur's Tricorne +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
        body="Lanun Frac +3",hands=gear.magic_hands,ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.ls_cape,waist="Eschan Stone",legs=gear.magic_legs,feet="Lanun Bottes +3"}
    
    sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS['Wildfire'], {head="Pixie Hairpin +1",
		ear2="Moonshade Earring",ring1="Archon Ring"})
    
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Leaden Salute'], {ring1="Dingir Ring",back=gear.ls_cape})
    
    
    -- Midcast Sets TODO
    sets.midcast.FastRecast = {head="Whirlpool Mask",
        body="Laksamana's Frac +3",hands="Leyline Gloves",legs="Carmine Cuisses +1",feet="Laksamana's Boots +2"}
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.CorsairShot = {ammo=gear.QDbullet,
        head="Laksamana's Tricorne +2",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.ls_cape,waist="Eschan Stone",legs="Meghanada Chausses +2",feet="Lanun Bottes +3"}

    sets.midcast.CorsairShot.Acc = {ammo=gear.QDbullet,
        head="Laksamana's Tricorne +2",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Hecate's Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Regal Ring",ring2="Stikini Ring",
        back=gear.ranged_cape,waist="Eschan Stone",legs="Mummu Kecks +2",feet="Laksamana's Boots +2"}

    sets.midcast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Laksamana's Tricorne +2",neck="Sanctity Necklace",ear1="Enervating Earring",ear2="Psystorm Earring",
        body="Mummu Jacket +2",hands="Laskamana's Gants +2",ring1="Regal Ring",ring2="Stikini Ring",
        back=gear.ranged_cape,waist="Eschan Stone",legs="Mummu Kecks +2",feet="Laksamana's Boots +2"}

    sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Dedition Earring",
        body="Mummu Jacket +2",hands=gear.ranged_hands,ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.ranged_cape,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhemar Gamashes +1"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Laksamana's Frac +3",hands="Meghanada Gloves +2",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.ranged_cape,waist="Yemaya Belt",legs="Laksamana's Trews +3",feet="Meghanada Jambeaux +2"}
	
	-- SJ WAR 1268 RAcc / 1131 RAtt (w/ Fettering, Nusku, Fomalhaut, Chrono), TS +36% (96%) +10 DMG, 32 STP, 8 Crit%
    sets.midcast.TS = set_combine(sets.midcast.RA, { 
        body="Chasseur's Frac +1",hands="Lanun Gants +3" })

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Sanctity Necklace",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    
    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Lanun Tricorne +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Lanun Frac +3",hands="Meghanada Gloves +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Lanun Bottes +3"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Mummu Kecks +2",feet="Lanun Bottes +3"}

    sets.defense.MDT = {
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Mummu Kecks +2",feet="Lanun Bottes +3"}
    
    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged.Melee = {ammo=gear.RAbullet,
        head="Adhemar Bonnet",neck="Iskur Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands=gear.melee_hands,ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.melee_feet}
    
    sets.engaged.Acc = {ammo=gear.RAbullet,
        head="Dampening Tam",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands=gear.melee_hands,ring1="Chirich Ring",ring2="Ilabrat Ring",
        back=gear.melee_cape,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet=gear.melee_feet}

    sets.engaged.DW = {ammo=gear.RAbullet,
        head="Adhemar Bonnet",neck="Iskur Gorget",ear1="Telos Earring",ear2="Suppanomimi",
        body="Adhemar Jacket +1",hands=gear.melee_hands,ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.melee_feet}
    
    sets.engaged.DWAcc = {ammo=gear.RAbullet,
        head="Dampening Tam",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Suppanomimi",
        body="Adhemar Jacket +1",hands=gear.melee_hands,ring1="Chirich Ring",ring2="Ilabrat Ring",
        back=gear.melee_cape,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet=gear.melee_feet}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)	
    -- Check that proper ammo is available if we're using ranged attacks or similar.
    if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        do_bullet_checks(spell, spellMap, eventArgs)
    end

    -- gear sets
    if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
        equip(sets.precast.LuzafRing)
    elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
        classes.CustomClass = 'Acc'
    elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
        if sets.precast.FoldDoubleBust then
            equip(sets.precast.FoldDoubleBust)
            eventArgs.handled = true
        end
    end
end

function job_post_precast(spell, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
		if sets.precast.RA.Flurry and buffactive['Flurry'] then
			equip(sets.precast.RA.Flurry)
		elseif sets.precast.RA.Flurry2 and buffactive['Flurry II'] then
            equip(sets.precast.RA.Flurry2)
        else
			equip(sets.precast.RA)
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        if buffactive['Triple Shot'] then
              equip(sets.midcast.TS)
        end
    end
	
	-- Equip obis for weaponskills that use obis and quick draw
    if spell.english == 'Leaden Salute' then
      if spell.element == world.day_element or spell.element == world.weather_element then
        equip(sets.Obi)
      end
    elseif spell.english == 'Wildfire' then
      if spell.element == world.day_element or spell.element == world.weather_element then
        equip(sets.Obi)
      end
    elseif spell.type == 'CorsairShot' then
      if spell.element == world.day_element or spell.element == world.weather_element then
        equip(sets.Obi)
      end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'CorsairRoll' and not spell.interrupted then
        display_roll_info(spell)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
    if buffactive['Transcendancy'] then
        return 'Brew'
    end
end


-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
        state.OffenseMode:set('Ranged')
    end
end


-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = ''
    
    msg = msg .. 'Off.: '..state.OffenseMode.current
    msg = msg .. ', Rng.: '..state.RangedMode.current
    msg = msg .. ', WS.: '..state.WeaponskillMode.current
    msg = msg .. ', QD.: '..state.CastingMode.current

    if state.DefenseMode.value ~= 'None' then
        local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
        msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end
    
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value then
        msg = msg .. ', Target NPCs'
    end

    msg = msg .. ', Roll Size: ' .. ((state.LuzafRing.value and 'Large') or 'Small')
    
    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
    rolls = {
        ["Corsair's Roll"]    = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]        = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]     = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]        = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]      = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]     = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Drachen Roll"]      = {lucky=4, unlucky=8, bonus="Pet Accuracy"},
        ["Choral Roll"]       = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]       = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]        = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]      = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]     = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]      = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]    = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]    = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Puppet Roll"]       = {lucky=3, unlucky=7, bonus="Pet Magic Accuracy/Attack"},
        ["Gallant's Roll"]    = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]     = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]     = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]    = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Naturalist's Roll"] = {lucky=3, unlucky=7, bonus="Enhancing Magic Duration"},
        ["Runeist's Roll"]    = {lucky=4, unlucky=8, bonus="Magic Evasion"},
        ["Bolter's Roll"]     = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]     = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]    = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]    = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"]  = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies's Roll"]     = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]      = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"]  = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]    = {lucky=4, unlucky=8, bonus="Counter Rate"},
    }
end

function display_roll_info(spell)
    rollinfo = rolls[spell.english]
    local rollsize = (state.LuzafRing.value and 'Large') or 'Small'

    if rollinfo then
        add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'.  Roll size: '..rollsize)
        add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
    end
end


-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
    local bullet_name
    local bullet_min_count = 1
    
    if spell.type == 'WeaponSkill' then
        if spell.skill == "Marksmanship" then
            if spell.element == 'None' then
                -- physical weaponskills
                bullet_name = gear.WSbullet
            else
                -- magical weaponskills
                bullet_name = gear.MAbullet
            end
        else
            -- Ignore non-ranged weaponskills
            return
        end
    elseif spell.type == 'CorsairShot' then
        bullet_name = gear.QDbullet
    elseif spell.action_type == 'Ranged Attack' then
        bullet_name = gear.RAbullet
        if buffactive['Triple Shot'] then
            bullet_min_count = 3
        end
    end
    
    local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
    
    -- If no ammo is available, give appropriate warning and end.
    if not available_bullets then
        if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
            add_to_chat(104, 'No Quick Draw ammo left.  Using what\'s currently equipped ('..player.equipment.ammo..').')
            return
        elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
            add_to_chat(104, 'No weaponskill ammo left.  Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
            return
        else
            add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
            eventArgs.cancel = true
            return
        end
    end
    
    -- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
    if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
        add_to_chat(104, 'No ammo will be left for Quick Draw.  Cancelling.')
        eventArgs.cancel = true
        return
    end
    
    -- Low ammo warning.
    if spell.type ~= 'CorsairShot' and state.warned.value == false
        and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
        local msg = '*****  LOW AMMO WARNING: '..bullet_name..' *****'
        --local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end
        
        add_to_chat(104, border)
        add_to_chat(104, msg)
        add_to_chat(104, border)

        state.warned:set()
    elseif available_bullets.count > options.ammo_warning_limit and state.warned then
        state.warned:reset()
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 5)
end
