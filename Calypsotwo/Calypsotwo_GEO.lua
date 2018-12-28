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
    indi_timer = ''
    indi_duration = 220
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.Buff.Poison = buffactive['Poison'] or false

    state.OffenseMode:options('None', 'Normal', 'Melee')
    state.CastingMode:options('Normal', 'Resistant', 'Burst')
    state.IdleMode:options('Normal', 'PDT', 'Regen', 'Melee')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"
	gear.regen_back = { name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}

    select_default_macro_book()
end

function file_unload()
    send_command('unbind !=')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga', 
        'Stonera', 'Watera', 'Aerora', 'Fira', 'Blizzara', 'Thundara',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +3"}
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +1", body="Geomancy Tunic +3", back="Nantosuelta's Cape"}
    sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines +3"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +2"}

    -- Fast cast sets for spells
    sets.precast.FC = {
--		ammo="Impatiens",
        head="Jhakri Coronal +1",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Kishar Ring",
        back="Lifestream Cape",waist="Witful Belt",legs="Geomancy pants +2",feet="Jhakri Pigaches +2"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		body="Heka's Kalasiris",
        back="Pahtli Cape"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        neck="Stoicheion Medal",
        hands="Bagua Mitaines +3"
    })
    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        --head="Nahtirah Hat",
        neck=gear.ElementalGorget,
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        --body="Vanir Cotehardie",
        --hands="Yaoyotl Gloves",
        ring1="Karieyh Ring",
        ring2="Ifrit Ring +1",
        back="Buquwik Cape",
        waist="Fotia Belt",
    }

    sets.precast.WS['Flash Nova'] = {
        --ammo="Dosis Tathlum",
        head="Welkin Crown",
        neck="Eddy Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        --hands="Yaoyotl Gloves",
        ring1="Acumen Ring",
        --ring2="Strendu Ring",
        back="Toro Cape",
        --waist="Snow Belt"
    }

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
        ear2="Loquacious Earring",
        neck="Incanter's Torque",
        body="Azimuth Coat", -- 3%
        hands="Geomancy Mitaines +3", -- 3%
        ring1="Prolix Ring",
        back="Lifestream Cape",
        waist="Witful Belt", -- 4%
        legs="Geomancy Pants +2" -- 5%
    }

    sets.midcast.Geomancy = {
		range="Dunna",
        head="Azimuth Hood +1", -- 12
        neck="Incanter's Torque", -- 10
        ear1="Gifted Earring",
        hands="Geomancy Mitaines +3", -- 15
        body="Bagua Tunic +3", -- 14
        back="Lifestream Cape", -- 9
		ring1="Stikini Ring",
		ring2="Stikini Ring",
        legs="Bagua Pants",
        feet="Medium's Sabots"
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        head="Azimuth Hood +1",
        legs="Bagua Pants",
        feet="Azimuth Gaiters +1"
    })

    sets.midcast.Cure = {ammo="Impatiens",
        head="Vanya hood",neck="Incanter's Torque",ear1="Norishing earring +1",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Swith Cape",waist="Goading Belt",legs="Chironic hose",feet="Vanya Clogs"
	}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    
	sets.midcast.Shellra = {ring1="Sheltered Ring"}

--    sets.midcast.HighTierNuke = {ammo="Ghastly Tathlum +1",
--        head="Merlinic hood",neck="Sanctity Necklace",ear1="Novio Earring",ear2="Friomisi Earring",
--        body="Jhakri Robe +2",hands="Amalric gages",ring1="Acumen Ring",ring2="Mujin Band",
--        back="Toro Cape",waist="Eschan Stone",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    sets.midcast.HighTierNuke = {
		sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Jhakri Robe +2",hands="Amalric gages",ring1="Acumen Ring",ring2="Mujin Band",
        back="Toro Cape",waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"
	}
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
        head="Welkin Crown",
		neck="Sanctity Necklace",
        hands="Psycloth Manillas",
        back="Refraction Cape",
        legs="Jhakri Slops +2",
        feet="Helios Boots"
    })
    
    sets.midcast.HighTierNuke.Burst = set_combine(sets.midcast.HighTierNuke, {
		ring2="Mujin Band",
        waist="Mizukage-no-Kubikazari"
    })
	
    --sets.midcast['Elemental Magic'].Mindmelter = set_combine(sets.midcast.HighTierNuke, {
    --    main="Mindmelter"
    --})

    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
		sub="Ammurapi Shield",
        --sub="Giuoco Grip",
        --ear2="Crematio Earring",
        --body="Amalric doublet",
        --feet="Umbani Boots"
		legs="Merlinic Shalwar",
        feet="Merlinic Crackows"
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        head="Merlinic Hood",
		neck="Sanctity Necklace",
        legs="Jhakri Slops +2",
        ring1="Sangoma Ring",
        ring2="Resonance Ring",
        back="Toro Cape",
        feet="Merlinic Crackows"
    })
    
    sets.midcast.LowTierNuke.Burst = set_combine(sets.midcast.LowTierNuke, {
		ring2="Mujin Band",
        waist="Mizukage-no-Kubikazari"
    })

    sets.midcast.Macc = {
		sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head="Geomancy Galero +2",
        neck="Erra Pendant", 
        ear1="Lifestorm Earring", 
        ear2="Regal Earring",
        body="Geomancy Tunic +3",
        hands="Geomancy Mitaines +3",
        ring1="Stikini Ring", 
        ring2="Stikini Ring",
        back="Refraction Cape",
        legs="Geomancy Pants +2",
        waist="Yamabuki-no-obi", 
        feet="Geomancy Sandals +3"
    }
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, { 
        head="Bagua Galero",
        neck="Erra Pendant", 
        ring1="Evanescence Ring",
        ring2="Archon Ring",
        body="Geomancy Tunic +3",
        waist="Fucho-no-obi",
		back="Perimede Cape"
    })
	
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = sets.midcast.Macc
    
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        head="Nahtirah Hat",neck="Incanter's Torque",ear1="Barkarole Earring",
        body="Vanya Robe",back="Aurist's cape",waist="Ovate Rope",ring1="Stikini Ring",ring2="Stikini Ring"
    })
	
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.Macc, {
        head="Nahtirah Hat",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Vanya Robe",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Aurist's cape",waist="Ovate Rope",legs="Psycloth Lappas",feet="Uk'uxkaj boots"
    })

	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
        --sub="Fulcio Grip",
		sub="Ammurapi Shield",
        neck="Incanter's Torque", 
        --body="Anhur Robe",
        --hands="Ayao's Gloves"
	})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		back="Siegel Sash"
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Gishdubar Sash"
	})
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Mephitis Grip",
        head="Orvail Corona +1",neck="Loricate Torque +1",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Vocane Ring",
        waist="Austerity Belt",legs="Assiduity pants +1",feet="Chelona Boots"
	}

    -- Idle sets
    sets.idle = {sub="Genmei Shield",range="Dunna",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Jhakri Robe +2",hands="Bagua Mitaines +3",ring1="Defending Ring",ring2="Vocane Ring",
    	back="Moonbeam Cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Geomancy Sandals +3"
    }
	
    sets.idle.PDT = set_combine(sets.idle, {
        head="Hike Khat +1",
        hands="Geomancy Mitaines +3",
    	back="Moonbeam Cape",
        feet="Azimuth Gaiters +1"
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
        head="Azimuth Hood +1",
        hands="Geomancy Mitaines +3",
        back=gear.regen_back,
		waist="Isa Belt",
		legs="Telchine Braconi",
        feet="Bagua Sandals +2"
    })

    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
    })

    sets.idle.Melee = set_combine(sets.idle, {
        main="Malevolence"
    })

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {
        legs="Bagua Pants", 
        back="Lifestream Cape"
    })
	
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
    })
	
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {
        legs="Bagua Pants"
    })
	
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {
    })

    sets.idle.Town = set_combine(sets.idle, {
        body="Jhakri Robe +2",
        head="Welkin Crown",
        neck="Loricate Torque +1",
        ring1="Defending Ring",
        ring2="Vocane Ring",
        waist="Refoccilation Stone",
        legs="Geomancy Pants +2"
    })

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = {
        neck="Loricate Torque +1",
		ear1="Ethereal Earring",
        ear2="Etiolation Earring",
        body="Jhakri Robe +2",
        hands="Geomancy Mitaines +3",
        ring1="Defending Ring",
        ring2="Vocane Ring",
        back="Moonbeam Cape",
        feet="Azimuth Gaiters +1"
    }

    sets.defense.MDT = {
        neck="Loricate Torque +1",
		ear1="Ethereal Earring",
        ear2="Etiolation Earring",
        body="Jhakri Robe +2",
        ring1="Defending Ring",
        ring2="Vocane Ring",
        back="Moonbeam Cape"
        --legs="Bokwus Slops",
    }

    sets.Kiting = {}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Azimuth Coat",hands="Geomancy Mitaines +3",ring1="Rajas Ring",ring2="Petrov ring",
        back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Geomancy Pants +2",feet="Umbani Boots"}
		
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
    --if state.Buff.Poison then
    --    classes.CustomClass = 'Mindmelter'
    --end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
--            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
--function job_status_change(newStatus, oldStatus, eventArgs)
--    if newStatus == 'Engaged' then
--        -- nothing yet
--        elseif newStatus == 'Idle' then
--            determine_idle_group()
--    end
--end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

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

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
            if lowTierNukes:contains(spell.english) then
                return 'LowTierNuke'
            else
                return 'HighTierNuke'
            end
        end

    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.OffenseMode.value == 'Melee' then
        idleSet = set_combine(sets.idle, sets.idle.Melee)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
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
    set_macro_page(1, 8)
end
