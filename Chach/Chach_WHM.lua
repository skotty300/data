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

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Impatiens",
    head="Nahtirah Hat",
    body="Inyanga Jubbah +1",
    hands="Gendewitha Gages",
    legs={ name="Kaykaus Tights", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    feet="Regal Pumps +1",
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Veneficium Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}
        
    sets.precast.FC['Enhancing Magic'] = sets.precast.FC

    sets.precast.FC.Stoneskin = sets.precast.FC

    sets.precast.FC['Healing Magic'] = sets.precast.FC

    sets.precast.FC.StatusRemoval = sets.precast.FC

    sets.precast.FC.Cure = sets.precast.FC

    sets.precast.FC.Curaga = sets.precast.FC
    
    -- Precast sets to enhance JAs//
    sets.precast.JA.Benediction = {body="Piety Briault +1"}
		

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = ""
    gear.default.weaponskill_waist = ""
    sets.precast.WS = {}
    
    sets.precast.WS['Flash Nova'] = {}
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Impatiens",
    head="Nahtirah Hat",
    body="Inyanga Jubbah +1",
    hands="Gendewitha Gages",
    legs={ name="Kaykaus Tights", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
    feet="Regal Pumps +1",
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Veneficium Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}
    
    -- Cure sets

    sets.midcast.CureSolace = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Clarus Stone",
    head="Theophany Cap +2",
    body="Ebers Bliaud +1",
    hands="Theophany Mitts +2",
    legs="Ebers Pant. +1",
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Cleric's Torque",
    waist="Penitent's Rope",
    left_ear="Glorious Earring",
    right_ear="Mendi. Earring",
    left_ring="Ephedra Ring",
    right_ring="Sirona's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    sets.midcast.Cure = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Clarus Stone",
    head="Theophany Cap +2",
    body="Ebers Bliaud +1",
    hands="Theophany Mitts +2",
    legs="Ebers Pant. +1",
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Cleric's Torque",
    waist="Penitent's Rope",
    left_ear="Glorious Earring",
    right_ear="Mendi. Earring",
    left_ring="Ephedra Ring",
    right_ring="Sirona's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    sets.midcast.Curaga = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    ammo="Clarus Stone",
    head="Theophany Cap +2",
    body="Ebers Bliaud +1",
    hands="Theophany Mitts +2",
    legs="Ebers Pant. +1",
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Cleric's Torque",
    waist="Penitent's Rope",
    left_ear="Nourish. Earring",
    right_ear="Mendi. Earring",
    left_ring="Ephedra Ring",
    right_ring="Sirona's Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    sets.midcast.CureMelee = {}

    sets.midcast.Cursna = {
    main="Yagrush",
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Fanatic Gloves",
    legs="Th. Pantaloons +2",
    feet="Gende. Galosh. +1",
    neck="Malison Medallion",
    waist="Penitent's Rope",
    left_ear="Lempo Earring",
    right_ear="Healing Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    sets.midcast.StatusRemoval = {
    main="Yagrush",
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts +1",
    legs="Ebers Pant. +1",
    feet="Ebers Duckbills +1",
    neck="Cleric's Torque",
    waist="Penitent's Rope",
    left_ear="Lempo Earring",
    right_ear="Healing Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Befouled Crown",
    body="Theo. Briault +2",
    hands="Inyan. Dastanas +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Theo. Duckbills +2",
    neck="Enhancing Torque",
    waist="Siegel Sash",
    left_ear="Lempo Earring",
    right_ear="Gwati Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.midcast.Stoneskin = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Befouled Crown",
    body="Ebers Bliaud +1",
    hands="Inyan. Dastanas +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Ebers Duckbills +1",
    neck="Reti Pendant",
    waist="Siegel Sash",
    left_ear="Lempo Earring",
    right_ear="Gwati Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Ebers Duckbills +1"}

    sets.midcast.BarElement = {
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Ebers Cap +1",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Ebers Duckbills +1",
    neck="Reti Pendant",
    waist="Penitent's Rope",
    left_ear="Lempo Earring",
    right_ear="Gwati Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}},
}

    sets.midcast.Regen = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Clarus Stone",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Ebers Mitts +1",
    legs="Th. Pantaloons +2",
    feet="Theo. Duckbills +2",
    neck="Deviant Necklace",
    waist="Penitent's Rope",
    left_ear="Lempo Earring",
    right_ear="Gwati Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.midcast.Protectra = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Befouled Crown",
    body="Theo. Briault +2",
    hands="Inyan. Dastanas +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet={ name="Piety Duckbills +1", augments={'Enhances "Protectra V" effect',}},
    neck="Enhancing Torque",
    waist="Siegel Sash",
    left_ear="Lempo Earring",
    right_ear="Gwati Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.midcast.Shellra = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Clarus Stone",
    head="Befouled Crown",
    body="Theo. Briault +2",
    hands="Inyan. Dastanas +1",
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Theo. Duckbills +2",
    neck="Enhancing Torque",
    waist="Siegel Sash",
    left_ear="Lempo Earring",
    right_ear="Gwati Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}


    sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Roundel Earring",
        body="Gendewitha Bliaut +1",hands="Chironic Gloves",ring2="Sangoma Ring",
        back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons +1",feet="Gendewitha Galoshes +1"}

    sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Roundel Earring",
        body="Gendewitha Bliaut +1",hands="Chironic Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills"}

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Roundel Earring",
        body="Gendewitha Bliaut +1",hands="Chironic Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills"}

    sets.midcast.IntEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Roundel Earring",
        body="Gendewitha Bliaut +1",hands="Chironic Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.idle.PDT = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.idle.Town = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}
    
    sets.idle.Weak = {
    main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Inyanga Tiara +2",
    body={ name="Piety Briault +3", augments={'Enhances "Benediction" effect',}},
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +2",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}
    
    -- Defense sets

    sets.defense.PDT = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Impatiens",
    head="Befouled Crown",
    body="Councilor's Garb",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.defense.MDT = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Impatiens",
    head="Befouled Crown",
    body="Councilor's Garb",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Shneddick Ring",
    right_ring="Paguroidea Ring",
    back="Moonbeam Cape",
}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="None",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Suppanomimi",
        body="Respite Cloak",hands="Chironic Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Alaunus's Cape",waist="Windbuffet belt",legs="Telchine Braconi",feet="Chironic Slippers"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}
	
	organizer_items = {
		echos="Echo Drops",
		Rubicu="Rubicundity",
		Herk="Herkuleskeule",
		Boon="Boonwell Staff",
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
		Voc="Vocation ring",
		Ilrus="Ilrusi Ledger",
		Leuja="Leujaoam Log",
		Mamo="Mamool Ja Journal",
		Periq="Periqia Diary",
		Lebro="Lebros Chronicle"
	}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 2)
end