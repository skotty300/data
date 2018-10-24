-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    
    gs c step
        Uses the currently configured step on the target, with either <t> or <stnpc> depending on setting.

    gs c step t
        Uses the currently configured step on the target, but forces use of <t>.
    
    
    Configuration commands:
    
    gs c cycle mainstep
        Cycles through the available steps to use as the primary step when using one of the above commands.
        
    gs c cycle altstep
        Cycles through the available steps to use for alternating with the configured main step.
        
    gs c toggle usealtstep
        Toggles whether or not to use an alternate step.
        
    gs c toggle selectsteptarget
        Toggles whether or not to use <stnpc> (as opposed to <t>) when using a step.
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
    state.Buff['Climactic Flourish'] = buffactive['climactic flourish'] or false

    state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
    state.UseAltStep = M(false, 'Use Alt Step')
    state.SelectStepTarget = M(false, 'Select Step Target')
    state.IgnoreTargetting = M(false, 'Ignore Targetting')

    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
    state.SkillchainPending = M(false, 'Skillchain Pending')

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Fodder')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')


    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Caudata Belt"
    gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}

    -- Additional local binds
    send_command('bind ^= gs c cycle mainstep')
    send_command('bind != gs c cycle altstep')
    send_command('bind ^- gs c toggle selectsteptarget')
    send_command('bind !- gs c toggle usealtstep')
    send_command('bind ^` input /ja "Chocobo Jig" <me>')
    send_command('bind !` input /ja "Chocobo Jig II" <me>')

    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^=')
    send_command('unbind !=')
    send_command('unbind ^-')
    send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"}

    sets.precast.JA['Trance'] = {head="Horos Tiara"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Horos Tiara",ear1="Roundel Earring",
        body="Maxixi Casaque",hands="Buremte Gloves",ring1="Asklepian Ring",
        back="Toetapper Mantle",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Maxixi Toe Shoes"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Samba = {head="Maxixi Tiara", back="Senuna's mantle"}

    sets.precast.Jig = {legs="Horos Tights", feet="Maxixi Toe Shoes"}

    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Step['Feather Step'] = {feet="Charis Shoes +2"}

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Horos Casaque",hands="Buremte Gloves",ring2="Sangoma Ring",
        waist="Chaac Belt",legs="Iuitl Tights",feet="Iuitl Gaiters +1"} -- magic accuracy
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="Charis Feather",
        head="Whirlpool Mask",neck="Ej Necklace",
        body="Horos Casaque",hands="Buremte Gloves",ring1="Beeline Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"} -- acc gear

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2",back="Toetapper Mantle"}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {body="Charis Casaque +2"}
    sets.precast.Flourish3['Climactic Flourish'] = {head="Maculele tiara +1"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",head="Herculean helm",neck="Voltsurge Torque",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Lebeche Ring",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Falcon eye",
        head="Adhemar bonnet +1",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
        body="Abnoba Kaftan",
		hands="Adhemar Wrist. +1",
		ring1="Rajas Ring",
		ring2="Petrov Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','Weapon skill damage +10%',}}
		,waist="Fotia belt",
		legs="Lustratio Subligar",
		feet="Lustratio Leggings"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Honed Tathlum", back="Toetapper Mantle"})
    
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {neck="Houyi's Gorget",
        hands="Iuitl Wristbands",ring1="Stormsoul Ring",
        waist="Caudata Belt",legs="Nahtirah Trousers"})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Honed Tathlum", back="Toetapper Mantle"})
    sets.precast.WS['Exenterator'].Fodder = set_combine(sets.precast.WS['Exenterator'], {waist=gear.ElementalBelt})

    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {hands="Iuitl Wristbands"})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {hands="Iuitl Wristbands"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",head="Uk'uxkaj Cap",neck="Rancor Collar"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Toetapper Mantle"})

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Charis Feather",neck="Caro Necklace",waist="Grunfeld rope",ear1="Ishvara Earring",ear2="Moonshade Earring"})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Toetapper Mantle"})

    sets.precast.WS['Aeolian Edge'] = {ammo="Charis Feather",
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",waist="Chaac Belt",legs="Shneddick Tights +1",feet="Wayfarer Clogs"}
    
    sets.precast.Skillchain = {hands="Charis Bangles +2"}
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Dampening tam",ear2="Loquacious Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",
        legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Dampening tam",neck="Ej Necklace",ear2="Loquacious Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Beeline Ring",
        back="Toetapper Mantle",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}
    

    -- Idle sets

    sets.idle = {ammo="Iron Gobbet",
        head="Dampening tam",neck="Wiglen Gorget",ear1="Infused Earring",ear2="Etiolation Earring",
        body="Samnuha Coat",hands="Leyline gloves",ring1="Sheltered Ring",ring2="Gelatinous Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Qaaxo Tights",feet="Tandava Crackows"}

    sets.idle.Town = {main="Twashtar", sub="Taming Sari",ammo="Yamarang",
        head="Dampening tam",neck="Charis Necklace",ear1="Sherida Earring",ear2="Telos Earring",
        body="Councilor's garb",hands="Leyline gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Atheling Mantle",waist="Kentarch belt +1",legs="Kaabnax Trousers",feet="Tandava Crackows"}
    
    sets.idle.Weak = {ammo="Iron Gobbet",
        head="Dampening tam",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Tandava Crackows"}
    
    -- Defense sets

    sets.defense.Evasion = {
        head="Dampening tam",neck="Ej Necklace",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2=gear.DarkRing.physical,
        back="Toetapper Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Dampening tam",neck="Twilight Torque",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Wayfarer Circlet",neck="Twilight Torque",
        body="Samnuha coat",hands="Wayfarer Cuffs",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

    sets.Kiting = {feet="Tandava Crackows"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
        head="Adhemar bonnet +1",
		neck="Lissome Necklace",
		ear1="Brutal Earring",
		ear2="Cessance Earring",
        body="Adhemar jacket",
		hands="Adhemar Wrist. +1",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		waist="Windbuffet belt +1",
		legs="Herculean trousers",
		feet="Herculean boots"}

    sets.engaged.Fodder = {ammo="Ginsen",
        head="Adhemar bonnet +1",
		neck="Asperity Necklace",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
        body="Adhemar jacket",
		hands="Adhemar Wrist. +1",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		waist="Windbuffet belt +1",
		legs="Samnuha tights",
		feet="Horos toe shoes +1"}
    sets.engaged.Fodder.Evasion = {ammo="Charis Feather",
        head="Dampening tam",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Leyline gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Kentarch belt",legs="Samnuha tights",feet="Horos Toe Shoes +1"}

    sets.engaged.Acc = {ammo="Ginsen",
        head="Dampening tam",neck="Subtlety Spectacles",ear1="Cessance Earring",ear2="Zennaroi Earring",
        body="Adhemar jacket",hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+4','Accuracy+14','Attack+13',}},ring1="Petrov Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Kentarch belt +1",legs="Meghanada chausses +1",feet="Horos toe shoes +1"}
    sets.engaged.Evasion = {ammo="Charis Feather",
        head="Dampening tam",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
    sets.engaged.PDT = {ammo="Charis Feather",
        head="Dampening tam",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Kentarch belt",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.Evasion = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Kentarch belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

    -- Custom melee group: High Haste (2x March or Haste)
    sets.engaged.HighHaste = {ammo="Ginsen",
        head="Adhemar bonnet",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Adhemar jacket",hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+4','Accuracy+14','Attack+13',}},ring1="Petrov Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Windbuffet belt +1",legs="Samnuha tights",feet="Horos toe shoes +1"}

    sets.engaged.Fodder.HighHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Charis Casaque +2",hands="Leyline gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Kentarch belt",legs="Samnuha tights",feet="Horos Toe Shoes +1"}
    sets.engaged.Fodder.Evasion.HighHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Leyline gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Kentarch belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    sets.engaged.Acc.HighHaste = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Kentarch belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.Evasion.HighHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.Evasion.HighHaste = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"}
    sets.engaged.PDT.HighHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Kentarch belt",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.PDT.HighHaste = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"}


    -- Custom melee group: Max Haste (2x March + Haste)
    sets.engaged.MaxHaste = {ammo="Ginsen",
        head="Adhemar bonnet",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Adhemar jacket",hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','"Triple Atk."+4','Accuracy+14','Attack+13',}},ring1="Petrov Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Windbuffet belt +1",legs="Samnuha tights",feet="Horos toe shoes +1"}

    -- Getting Marches+Haste from Trust NPCs, doesn't cap delay.
    sets.engaged.Fodder.MaxHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Thaumas Coat",hands="Leyline gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Kentarch belt",legs="Samnuha tights",feet="Horos Toe Shoes +1"}
    sets.engaged.Fodder.Evasion.MaxHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Samnuha coat",hands="Leyline gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Kentarch belt",legs="Kaabnax Trousers",feet="Manibozho Boots"}

    sets.engaged.Acc.MaxHaste = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
        back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Kentarch belt",legs="Qaaxo Tights",feet="Horos Toe Shoes +1"}
    sets.engaged.Evasion.MaxHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Windbuffet Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.Evasion.MaxHaste = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}
    sets.engaged.PDT.MaxHaste = {ammo="Charis Feather",
        head="Dampening tam",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Samnuha coat",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Shadow Mantle",waist="Windbuffet Belt",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}
    sets.engaged.Acc.PDT.MaxHaste = {ammo="Honed Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
        back="Toetapper Mantle",waist="Kentarch belt",legs="Qaaxo Tights",feet="Qaaxo Leggings"}



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {legs="Horos Tights"}
    sets.buff['Climactic Flourish'] = {head="Maculele tiara +1"}
	
	organizer_items = {
		echos="Echo Drops",
		Taming="Taming Sari",
		Twast="Twashtar",
		Enchu="Enchufla",
		Sole="Sole Sushi",
		Squid="Squid Sushi",
		RCurry="Red Curry Bun",
		HSquid="Squid Sushi +1",
		Silent="Silent Oil",
		Prism="Prism Powder",
		Shehe="Shihei",
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
		CBack="Mecisto. Mantle",
		BPouch="Bead Pouch",
		SPouch="Silt Pouch",
		Gsmith="Goldsmith's Apron",
		Esch="Eschalixir",
		Esc1="Eschalixir +1",
		Voc="Vocation ring"
	}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    --auto_presto(spell)
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end
        if state.SkillchainPending.value == true then
            equip(sets.precast.Skillchain)
        end
    end
end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == "Wild Flourish" then
            state.SkillchainPending:set()
            send_command('wait 5;gs c unset SkillchainPending')
        elseif spell.type:lower() == "weaponskill" then
            state.SkillchainPending:toggle()
            send_command('wait 6;gs c unset SkillchainPending')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif buff == 'Saber Dance' or buff == 'Climactic Flourish' then
        handle_equipping_gear(player.status)
    end
end


function job_status_change(new_status, old_status)
    if new_status == 'Engaged' then
        determine_haste_group()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    determine_haste_group()
end


function customize_idle_set(idleSet)
    if player.hpp < 80 and not areas.Cities:contains(world.area) then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    
    return idleSet
end

function customize_melee_set(meleeSet)
    if state.DefenseMode.value ~= 'None' then
        if buffactive['saber dance'] then
            meleeSet = set_combine(meleeSet, sets.buff['Saber Dance'])
        end
        if state.Buff['Climactic Flourish'] then
            meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
        end
    end
    
    return meleeSet
end

-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        if state.IgnoreTargetting.value == true then
            state.IgnoreTargetting:reset()
            eventArgs.handled = true
        end
        
        eventArgs.SelectNPCTargets = state.SelectStepTarget.value
    end
end


-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
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
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', ['..state.MainStep.current

    if state.UseAltStep.value == true then
        msg = msg .. '/'..state.AltStep.current
    end
    
    msg = msg .. ']'

    if state.SelectStepTarget.value == true then
        steps = steps..' (Targetted)'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'step' then
        if cmdParams[2] == 't' then
            state.IgnoreTargetting:set()
        end

        local doStep = ''
        if state.UseAltStep.value == true then
            doStep = state[state.CurrentStep.current..'Step'].current
            state.CurrentStep:cycle()
        else
            doStep = state.MainStep.current
        end        
        
        send_command('@input /ja "'..doStep..'" <t>')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Charis body, Charis neck + DW earrings, and Kentarch belt.

    -- For high haste, we want to be able to drop one of the 10% groups (body, preferably).
    -- High haste buffs:
    -- 2x Marches + Haste
    -- 2x Marches + Haste Samba
    -- 1x March + Haste + Haste Samba
    -- Embrava + any other haste buff
    
    -- For max haste, we probably need to consider dropping all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste/March + Haste Samba
    -- 2x March + Haste + Haste Samba

    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.haste or buffactive.march) and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march or buffactive['haste samba']) then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 and (buffactive.haste or buffactive['haste samba']) then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


-- Automatically use Presto for steps when it's available and we have less than 3 finishing moves
function auto_presto(spell)
    if spell.type == 'Step' then
        local allRecasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = allRecasts[236]
        local under3FMs = not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5']
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs then
            cast_delay(1.1)
            send_command('@input /ja "Presto" <me>')
        end
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'SAM' then
        set_macro_page(2, 8)
    else
        set_macro_page(1, 8)
    end
end
