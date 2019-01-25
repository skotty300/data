-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:

    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime

--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    
    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')

    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Caudata Belt"
	
	gear.tp_feet = { name="Herculean Boots", augments={'Attack+15','INT+7','Quadruple Attack +3','Accuracy+11 Attack+11',}}
	gear.ws_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	gear.tp_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind ^= gs c cycle treasuremode')
    send_command('bind !- gs c cycle targetmode')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.TreasureHunter = {head="Turms Cap",body="Emet Harness +1",hands="Plunderer's Armlets +1",
		back=gear.tp_back,waist="Chaac Belt",ring2="Defending Ring",ring1="Vocane Ring",legs="Enif Cosciales",feet="Skulk. Poulaines +1"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    sets.buff['Sneak Attack'] = {ammo="Yetshila",
        head="Pillager's Bonnet +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Pillager's Vest +1",hands="Skulker's armlets",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Toutatis's Cape",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

    sets.buff['Trick Attack'] = {ammo="Yetshila",
        head="Pillager's Bonnet +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Pillager's Vest +1",hands="Taeon gloves",ring1="Stormsoul Ring",ring2="Epona's Ring",
        back="Toutatis's Cape",waist="Patentia Sash",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter


    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {} -- {body="Raider's Vest +2"}
    sets.precast.JA['Steal'] = {head="Plunderer's Bonnet",neck="Pentalagus Charm",hands="Taeon gloves",legs="Pillager's Culottes +1",feet="Pillager's Poulaines"}
    sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {legs="Plunderer's Culottes"} 

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Whirlpool Mask",
        body="Pillager's Vest +1",hands="Taeon gloves",ring1="Asklepian Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Pillager's Culottes +1",feet="Plunderer's Poulaines +1"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {head="Haruspex Hat",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring",legs="Enif Cosciales"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    -- Ranged snapshot gear
    sets.precast.RA = {head="Aurore Beret",hands="Iuitl Wristbands",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Yamarang",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Lustratio Harness",hands="Adhemar Wristbands +1",ring1="Rajas Ring",ring2="Ifrit Ring",
        back=gear.ws_back,waist="Fotia Belt",legs="Herculean Trousers",feet="Adhemar Gamashes +1"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Letalis Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ring1="Stormsoul Ring",legs="Nahtirah Trousers"})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Letalis Mantle"})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Yamarang"})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Yamarang"})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Yamarang"})

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Honed Tathlum", back="Letalis Mantle"})
    sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Yamarang"})
    sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Yamarang"})
    sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Yamarang"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Seething Bomblet +1",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +1",hands="Adhemar Wristbands +1",ring1="Begrudging Ring",ring2="Regal Ring",
        back=gear.ws_back,waist="Fotia Belt",legs="Plunderer's Culottes",feet="Adhemar Gamashes +1"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Letalis Mantle"})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {})

    sets.precast.WS["Rudra's Storm"] = {ammo="Seething Bomblet +1",
        head="Plunderer's Bonnet",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Plunderer's Vest +1",hands="Meghanada Gloves +2",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.ws_back,waist="Fotia Belt",legs="Plunderer's Culottes",feet="Plunderer's Poulaines"}
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Letalis Mantle"})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"], {feet="Lustratio Leggings"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"], {feet="Lustratio Leggings"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"], {feet="Lustratio Leggings"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {ammo="Honed Tathlum", back="Letalis Mantle"})
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Yetshila",
        body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Yetshila",
        body="Pillager's Vest +1",legs="Pillager's Culottes +1"})
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Yetshila",
        body="Pillager's Vest +1",legs="Pillager's Culottes +1"})

    sets.precast.WS['Mandalic Stab'] = sets.precast.WS["Rudra's Storm"]
    sets.precast.WS['Mandalic Stab'].Acc = sets.precast.WS["Rudra's Storm"].Acc
    sets.precast.WS['Mandalic Stab'].SA = sets.precast.WS["Rudra's Storm"].SA
    sets.precast.WS['Mandalic Stab'].TA = sets.precast.WS["Rudra's Storm"].TA
    sets.precast.WS['Mandalic Stab'].SATA = sets.precast.WS["Rudra's Storm"].SATA

    sets.precast.WS['Aeolian Edge'] = {ammo="Jukukik Feather",
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Samnuha coat",hands="Leyline gloves",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",waist="Fotia belt",legs="Shneddick Tights +1",feet="Herculean boots"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Whirlpool Mask",ear2="Loquacious Earring",
        body="Pillager's Vest +1",hands="Taeon gloves",
        back="Canny Cape",legs="Herculean trousers",feet="Iuitl Gaiters +1"}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Whirlpool Mask",neck="Ej Necklace",ear2="Loquacious Earring",
        body="Pillager's Vest +1",hands="Taeon gloves",ring1="Beeline Ring",
        back="Canny Cape",legs="Herculean trousers",feet="Iuitl Gaiters +1"}

    -- Ranged gear
    sets.midcast.RA = {
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Hajduk Ring +1",ring2="Hajduk Ring",
        back="Libeccio Mantle",waist="Aquiline Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.midcast.RA.Acc = {
        head="Pillager's Bonnet +1",neck="Ej Necklace",ear1="Clearview Earring",ear2="Volley Earring",
        body="Iuitl Vest",hands="Buremte Gloves",ring1="Hajduk Ring +1",ring2="Hajduk Ring",
        back="Libeccio Mantle",waist="Aquiline Belt",legs="Thurandaut Tights +1",feet="Pillager's Poulaines +1"}


    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Yetshila",
        head="Turms Cap",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Emet Harness +1",hands="Iuitl Wristbands +1",ring1="Defending Ring",ring2="Vocane Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Skadi's Jambeaux +1"}

    sets.idle.Town = {main="Izhiikoh", sub="Sabebus",ammo="Yetshila",
        head="Turms Cap",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Emet Harness +1",hands="Iuitl Wristbands +1",ring1="Defending Ring",ring2="Vocane Ring",
        back="Moonbeam Cape",waist="Patentia Sash",legs="Mummu Kecks +2",feet="Skadi's Jambeaux +1"}

    sets.idle.Weak = {ammo="Yetshila",
        head="Pillager's Bonnet +1",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Emet Harness +1",hands="Iuitl Wristbands +1",ring1="Defending Ring",ring2="Vocane Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Skadi's Jambeaux +1"}


    -- Defense sets

    sets.defense.Evasion = {
        head="Pillager's Bonnet +1",neck="Ej Necklace",
        body="Qaaxo Harness",hands="Taeon gloves",ring1="Defending Ring",ring2="Beeline Ring",
        back="Canny Cape",waist="Flume Belt",legs="Herculean trousers",feet="Iuitl Gaiters +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Pillager's Bonnet +1",neck="Loricate Torque +1",
        body="Emet harness +1",hands="Taeon gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Pillager's Bonnet +1",neck="Loricate Torque +1",
        body="Emet harness +1",hands="Taeon gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Iuitl Gaiters +1"}


    --------------------------------------
    -- Melee sets
    --------------------------------------

    -- Normal melee group
	--Mecistopins Mantle
    sets.engaged = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Sherida Earring",
        body="Pillager's Vest +2",hands="Adhemar Wristbands +1",ring1="Hetairoi ring",ring2="Epona's Ring",
        back=gear.tp_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Plunderer's Poulaines"}
		
    sets.engaged.Acc = {ammo="Yamarang",
        head="Pillager's Bonnet +2",neck="Iskur Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Pillager's Vest +2",hands="Mummu Wrists +2",ring1="Regal ring",ring2="Patricius Ring",
        back=gear.tp_back,waist="Kentarch Belt +1",legs="Pillager's Culottes +2",feet="Herculean boots"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end

    
    if state.TreasureMode.value ~= 'None' and spell.skill == 'Enfeebling Magic' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end

    return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
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
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
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
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 4)
    else
        set_macro_page(1, 4)
    end
end