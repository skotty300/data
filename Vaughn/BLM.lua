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

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
    
    state.MagicBurst = M(False, 'Magic Burst')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
    
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind @` gs c toggle MagicBurst')

    select_default_macro_book(6,1)
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind @`')
    send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Impatiens",
        head="Amalric coif",neck="Baetyl Pendant",ear1="Loquacious Earring",ear2="Etiolation Earring",
        body="Shango robe",hands="Helios gloves",ring1="Prolix Ring",ring2="Weatherspoon ring",
        back="Swith Cape",waist="Witful Belt",legs="Psycloth lappas",feet="Merlinic Crackows"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {head="Umuthi hat",waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Vanya robe", back="Solemnity Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Hagondes Hat +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat +1",hands="Amalric gages",ring1="Rajas Ring",ring2="Icesoul Ring",
        back="Refraction Cape",waist="Fotia Belt",legs="Lengo pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Ghastly Tathlum +1",
        head="Amalric coif",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Loquacious Earring",
        body="Helios jacket",hands="Amalric gages",ring1="Bifrost Ring",ring2="Serket Ring",
        back="Pahtli cape",waist="Fucho-no-obi",legs="Lengo pants",feet="Chelona boots"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {ammo="Sapience orb",
        head="Amalric coif",ear1="Loquacious Earring",ear2="Etiolation earring",
        body="Shango robe",hands="Helios Gloves",ring1="Prolix Ring",ring2="Weatherspoon ring",
        back="Swith Cape",waist="Goading Belt",legs="Lengo pants",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Amalric coif",neck="Colossus's Torque",ear1="Mendicant's Earring",ear2="Loquacious Earring",
        body="Vanya robe",hands="Helios Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Solemnity Cape",waist=gear.ElementalObi,legs="Gyve trousers",feet="Hagondes Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        neck="Colossus's Torque",head="Amalric coif",
        body="Telchine Chasuble",hands="Telchine gloves",
        waist="Olympus Sash",legs="Telchine Braconi"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {main="Lathi",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Merlinic hood",
		neck="Imbodla necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Vanya robe",
		hands="Amalric gages",
		ring1="Etana Ring",
		ring2="Fenrir Ring",
        back="Izdubar mantle",
		legs="Psycloth lappas",
		feet="Merlinic Crackows"}
        
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {main="Lathi",sub="Niobid Strap",ammo="Kalboron Stone",
        head="Amalric coif",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Psycloth vest",hands="Amalric gages",ring1="Etana Ring",ring2="Fenrir Ring",
        back="Mecistopins mantle",waist="Hachirin-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    sets.midcast.Drain = {main="Lathi",sub="Niobid Strap",ammo="Kalboron Stone",
        head="Amalric coif",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Psycloth vest",hands="Amalric gages",ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Mecistopins mantle",waist="Fucho-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Lathi",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Amalric coif",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanya robe",hands="Amalric gages",ring1="Etana Ring",ring2="Fenrir Ring",
        back="Mecistopins mantle",waist="Witful Belt",legs="Psycloth lappas",feet="Merlinic Crackows"}

    sets.midcast.BardSong = {main="Lathi",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="Amalric coif",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Helios jacket",hands="Amalric gages",ring1="Etana Ring",ring2="Fenrir Ring",
        back="Refraction Cape",legs="Merlinic Shalwar",feet="Merlinic Crackows"}


    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {main="Lathi",sub="Niobid Strap",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",
		neck="Sanctity Necklace",
		ear1="Barkarole Earring",
		ear2="Friomisi Earring",
        body="Ea houppelande",
		hands="Ea cuffs",
		ring1="Etana Ring",
		ring2="Resonance Ring",
        back="Toro cape",
		waist="Refoccilation Stone",
		legs="Ea slops",
		feet="Ea Pigaches"}

    sets.midcast['Elemental Magic'].Resistant = {main="Lathi",sub="Niobid Strap",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Helios jacket",hands="Amalric gages",ring1="Mujin Ring",ring2="Locus Ring",
        back="Seshaw Cape",waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})


    -- Minimal damage gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main="Lathi", sub="Niobid Strap",ammo="Ghastly Tathlum +1",
        head="Amalric coif",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Swith Cape",waist="Witful Belt",legs="Assiduity pants +1",feet="Chelona Boots"}


    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Mephitis Grip",
        head="Orvail Corona +1",neck="Eidolon Pendant",
        body="Chelona Blazer",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Angha Ring",
        back="Mecistopins mantle",waist="Austerity Belt",legs="Assiduity pants +1",feet="Serpentes sabots"}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {--main="Bolelabunga", sub="Genbu's Shield",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",neck="Sanctity necklace",ear1="Infused Earring",ear2="Barkarole Earring",
        body="Amalric doublet",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Mecistopins mantle",waist="Slipor sash",legs="Assiduity pants +1",feet="Serpentes sabots"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Lathi", sub="Niobid Strap",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",neck="Sanctity necklace",ear1="Infused Earring",ear2="Barkarole Earring",
        body="Amalric doublet",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Dark Ring",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity pants +1",feet="Serpentes sabots"}

    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {--main="Bolelabunga",sub="Genbu's Shield",ammo="Ghastly Tathlum +1",
        head="Helios band",neck="Twilight Torque",ear1="Infused Earring",ear2="Loquacious Earring",
        body="Hagondes Coat +1",hands="Amalric gages",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Hierarch Belt",legs="Assiduity pants +1",feet="Hagondes Sabots"}
    
    -- Town gear.
    sets.idle.Town = {main="Lathi", sub="Oneiros Grip",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",neck="Sanctity necklace",ear1="Infused Earring",ear2="Barkarole Earring",
        body="Amalric doublet",hands="Serpentes cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Hierarch Belt",legs="Assiduity pants +1",feet="Serpentes Sabots"}
        
    -- Defense sets

    sets.defense.PDT = {main="Lathi",sub="Niobid Strap",
        head="Amalric coif",neck="Twilight Torque",
        body="Hagondes Coat +1",hands="Amalric gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Cheviot Cape",waist="Hierarch Belt",legs="Lengo pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Amalric coif",neck="Twilight Torque",
        body="Helios jacket",hands="Amalric gages",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Merlinic Shalwar",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Serpentes Sabots"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    
    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.magic_burst = {main="Lathi",sub="Willpower Grip",ammo="Ghastly Tathlum +1",
        head="Merlinic hood",neck="Mizukage-no-Kubikazari",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Helios Jacket",hands="Amalric gages",ring1="Mujin Band",ring2="Locus Ring",
        back="Seshaw Cape",waist="Hachirin-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat +1",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Cheviot Cape",waist="Goading Belt",legs="Lengo pants",feet="Hagondes Sabots"}
		
		organizer_items = {
		echos="Echo Drops",
		mstaff="Lathi",
		Kera="Lathi",
		Boon="Boonwell Staff",
		Sole="Sole Sushi",
		Squid="Squid Sushi",
		RCurry="Red Curry Bun",
		HSquid="Squid Sushi +1",
		Pear="Pear Crepe",
		HQP="Crepe B. Helene",
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
		CBack="Mecisto. Mantle",
		BPouch="Bead Pouch",
		SPouch="Silt Pouch",
	}	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)

end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        elseif spell.skill == 'Elemental Magic' then
            state.MagicBurst:reset()
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

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

function display_current_job_state(eventArgs)
    local msg = 'Offense'
    msg = msg .. ': [' .. state.OffenseMode.value .. '], '
    msg = msg .. 'Casting'
    msg = msg .. ': [' .. state.CastingMode.value .. '], '
    msg = msg .. 'Idle'
    msg = msg .. ': [' .. state.IdleMode.value .. '], '

    if state.MagicBurst.value == true then
        msg = msg .. 'Magic Burst: [On]'
    elseif state.MagicBurst.value == false then
        msg = msg .. 'Magic Burst: [Off]'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
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
    set_macro_page(1, 15)
end
