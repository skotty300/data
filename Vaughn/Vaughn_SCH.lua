-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
		In-game macro: /console gs c scholar xxx

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
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
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    state.MagicBurst = M(false, 'Magic Burst')
	
    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder", 
	                   "Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II"}
    info.mid_nukes = S{}
    info.high_nukes = S{"Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
					    "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
	                    "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    send_command('bind  input /ma Stun <t>; wait 0.5; input /p Casting STUN on <t>.')
	send_command('bind ^` gs c toggle MagicBurst')
	send_command('bind !` gs c scholar skillchain')
	send_command('bind ^- gs c scholar light')
	send_command('bind ^= gs c scholar dark')
	send_command('bind delete gs c scholar speed')
	send_command('bind Home gs c scholar duration')
	send_command('bind End gs c scholar aoe')

    select_default_macro_book()
end

function user_unload()
	send_command('unbind `')
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind ^-')
	send_command('unbind ^=')
	send_command('unbind delete')
	send_command('unbind end')
	send_command('unbind home')
end
-- Define sets and vars used by this job file.

function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


    -- Fast cast sets for spells

    sets.precast.FC = {main="Akademos",
	sub="Vivid Strap",
	ammo="Impatiens",
        head="Amalric coif",
		neck="Baetyl pendant",
		ear1="Loquacious Earring",ear2="Etiolation Earring",
        body="Shango robe",
		hands="Gendewitha gages",
		ring1="Kishar Ring",ring2="Weatherspoon ring",
        back="Swith Cape",
		waist="Witful Belt",
		legs="Psycloth lappas",
		feet="Amalric nails"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {head="Umuthi hat",waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",ear1="Mendicant's earring",back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})


    -- Midcast Sets

    sets.midcast.FastRecast = {ammo="Sapience orb",
        head="Amalric coif",
		neck="Baetyl pendant",
		ear1="Loquacious Earring",ear2="Etiolation Earring",
        body="Helios jacket",
		hands="Helios gloves",
		ring1="Kishar Ring",ring2="Weatherspoon ring",
        back="Swith Cape",
		waist="Goading Belt",
		legs="",
		feet="Academic's Loafers +1"}

    sets.midcast.Cure = {main="Akademos",sub="Niobid Strap",ammo="Sapience orb",
        head="Gendewitha Caubeen",
		neck="Colossus's Torque",
		ear1="Mendicant's earring",ear2="Loquacious Earring",
        body="Vanya robe",
		hands="Telchine Gloves",
		ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Solemnity Cape",
		waist="Gishdubar sash",
		legs="Gyve trousers",
		feet="Chironic slippers"}

    sets.midcast.CureWithLightWeather = {main="Akademos",sub="Niobid Strap",ammo="Sapience orb",
        head="Vanya hood",neck="Colossus's Torque",ear1="Lifestorm Earring",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Telchine gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Assiduity pants +1",feet="Academic's Loafers +1"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Regen = {main="Bolelabunga",
	head="Arbatel Bonnet",
	body="Telchine Chasuble",
	hands="Telchine gloves",
        waist="Olympus Sash",
		legs="Telchine Braconi",
		feet="Telchine pigaches"}
	
	sets.midcast.Refresh = {waist="Gishdubar Sash",head="Amalric coif"}

    sets.midcast.Cursna = {
        neck="Malison Medallion",
        hands="Hieros Mittens",ring1="Ephedra Ring",
        feet="Gendewitha Galoshes"}

    sets.midcast['Enhancing Magic'] = {ammo="Savant's Treatise",
        head="Arbatel Bonnet",neck="Colossus's Torque",
        body="Telchine Chasuble",hands="Telchine gloves",
        waist="Olympus Sash",legs="Telchine Braconi"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {head="Umuthi hat",waist="Siegel Sash"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers +1"})

    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
	main="Akademos",
	sub="Niobid Strap",
	ammo="Kalboron stone",
        head="Amalric coif",
		neck="Imbodla necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
        body="Vanya Robe",
		hands="Chironic gloves",
		ring1="Vertigo Ring",
		ring2="Weatherspoon Ring",
        back="Aurist's cape",
		waist="Eschan stone",
		legs="Chironic hose",
		feet="Chironic slippers"}

    sets.midcast.IntEnfeebles = {
	main="Akademos",
	sub="Niobid Strap",
	ammo="Kalboron stone",
        head="Amalric coif",
		neck="Imbodla necklace",
		ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Vanya Robe",
		hands="Chironic gloves",
		ring1="Vertigo Ring",ring2="Weatherspoon Ring",
        back="Aurist's cape",
		waist="Eschan stone",
		legs="Chironic hose",
		feet="Chironic slippers"}

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = {main="Akademos",
	sub="Niobid Strap",ammo="Kalboron stone",
        head="Merlinic hood",
		neck="Sanctity necklace",
		ear1="Barkarole Earring",ear2="Gwati earring",
        body="Psycloth vest",
		hands="Chironic gloves",
		ring1="Vertigo Ring",ring2="Evanescence Ring",
        back="Refraction Cape",
		waist="Eschan stone",
		legs="Chironic hose",
		feet="Chironic slippers"}

    sets.midcast.Kaustra = {
	main="Akademos",
	sub="Niobid Strap",
	ammo="Ghastly tathlum +1",
        head="Merlinic Hood",
		neck="Sanctity Necklace",
		ear1="Regal Earring",ear2="Friomisi Earring",
        body="Amalric doublet",
		hands="Amalric gages",
		ring1="Vertigo Ring",ring2="Acumen Ring",
        back="Toro Cape",
		waist="Refoccilation Stone",
		legs="Merlinic Shalwar",
		feet="Chironic slippers"}

    sets.midcast.Drain = {
	main="Akademos",
	sub="Niobid Strap",
	ammo="Sapience orb",
        head="Merlinic hood",
		neck="Sanctity necklace",
		ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Amalric doublet",
		hands="Chironic Gloves",
		ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Bookworm's Cape",
		waist="Fucho-no-obi",
		legs="Chironic hose",
		feet="Chironic slippers"}

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
	main="Akademos",
	sub="Niobid Strap",
	ammo="Kalboron stone",
        head="Merlinic hood",
		neck="Sanctity necklace",
		ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Amalric doublet",
		hands="Amalric gages",
		ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Refraction Cape",
		waist="Witful Belt",
		legs="Pedagogy Pants",
		feet="Academic's Loafers +1"}

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Akademos"})


    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
	main="Raetic Staff +1",sub="Mephitis Strap",
	ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Baetyl Pendant",
		waist="Yamabuki-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back="Seshaw cape",}

    sets.midcast['Elemental Magic'].Resistant = {
	main="Raetic Staff +1",sub="Mephitis Strap",
	ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Baetyl Pendant",
		waist="Yamabuki-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back="Seshaw cape",
		}

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})

    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {sub="Wizzan Grip"})

    sets.midcast.Impact = {main="Raetic Staff +1",sub="Mephitis Strap",
	ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
		neck="Baetyl Pendant",
		waist="Yamabuki-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back="Seshaw cape",0}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	
    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Niobid Strap",
        head="Orvail Corona +1",neck="Eidolon Pendant",
        body="Chelona Blazer",hands="Serpentes Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        waist="Austerity Belt",legs="Assiduity pants +1",feet="Chelona Boots"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = {
	main="Akademos",sub="Niobid Strap",
	ammo="Homiliary",
        head="Befouled Crown",
		neck="Sanctity necklace",
		ear1="Infused Earring",ear2="Etiolation Earring",
        body="Jhakri Robe +1",
		hands="Serpentes cuffs",
		ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Cheviot Cape",
		waist="Hierarch Belt",
		legs="Assiduity pants +1",
		feet="Serpentes Sabots"}

    sets.idle.Field = {
	main="Akademos",sub="Niobid Strap",ammo="Homiliary",
        head="Befouled Crown",
		neck="Sanctity necklace",
		ear1="Infused Earring",ear2="Etiolation Earring",
        body="Jhakri Robe +1",
		hands="Serpentes cuffs",
		ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Solemnity cape",
		waist="Hierarch Belt",
		legs="Assiduity pants +1",
		feet="Serpentes Sabots"}

    sets.idle.Field.PDT = {main="Akademos",sub="Niobid Strap",ammo="Homiliary",
        head="Amalric coif",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Gendewitha Gages +1",ring1="Defending Ring",ring2="Paguroidea Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs="Assiduity pants +1",feet="Herald's Gaiters"}

    sets.idle.Field.Stun = {main="Akademos",sub="Niobid Strap",ammo="Sapience orb",
        head="Pedagogy mortarboard +1",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Jhakri Robe +1",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Sangoma Ring",
        back="Swith Cape",waist="Ninurta's Sash",legs="Psycloth Lappas",feet="Academic's Loafers +1"}

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Amalric coif",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +1",hands="Chironic Gloves",ring1="Sheltered Ring",ring2="Meridian Ring",
        back="Cheviot Cape",waist="Hierarch Belt",legs="Assiduity pants +1",feet="Herald's Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main="Akademos",sub="Niobid Strap",ammo="Homiliary",
        head="Amalric coif",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Gendewitha Gages +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Cheviot Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {main="Akademos",sub="Niobid Strap",ammo="Homiliary",
        head="Amalric coif",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Helios jacket",hands="Chironic Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Psycloth Lappas",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}
	
	    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {head="Zelus Tiara",ear1="Zennaroi earring",ear2="Steelflash earring",neck="Subtlety spectacles",
        body="Ischemia chasuble",hands="Chironic Gloves",ring1="Rajas Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Telchine Braconi",feet="Chironic slippers"}



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Merlinic Hood"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants"}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
    sets.buff['Alacrity'] = {feet="Pedagogy Loafers +1"}

    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1",waist="Hachirin-no-Obi"}

    sets.buff.FullSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring",body="Pedagogy Gown"}
    sets.buff.PDTSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring"}
	
	sets.magic_burst = {head="Merlinic hood",neck="Mizu. Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
							body="Amalric doublet",hands="Amalric gages",ring1="Mujin Band",ring2="Locus ring",
							back="Seshaw Cape",waist="Refoccilation stone",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
	
	organizer_items = {
		echos="Echo Drops",
		Kera="Akademos",
		Boon="Boonwell Staff",
		Sole="Sole Sushi",
		Squid="Squid Sushi",
		RCurry="Red Curry Bun",
		HSquid="Squid Sushi +1",
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
		CrepeB="Crepe B. Helene",
		Pear="Pear Crepe",
}	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
	if spell.element == world.day_element or spell.element == world.weather_element then
        if info.low_nukes:contains(spell.english) then 
		equip(sets.midcast['Elemental Magic'], {ring1="Zodiac Ring",back="Twilight Cape"})
		    elseif info.high_nukes:contains(spell.english) then
		    equip(sets.midcast['Elemental Magic'].HighTierNuke, {ring1="Zodiac Ring",back="Twilight Cape"})
		end
    end
	if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value then
        equip(sets.magic_burst)
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
    if buff == "Sublimation: Activated" then
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

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' then
            if info.low_nukes:contains(spell.english) then
                return 'LowTierNuke'
            elseif info.mid_nukes:contains(spell.english) then
                return 'MidTierNuke'
            elseif info.high_nukes:contains(spell.english) then
                return 'HighTierNuke'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


function display_current_caster_state()
	local msg = ''

	if state.OffenseMode.value ~= 'None' then
		msg = msg .. 'Melee'

		if state.CombatForm.has_value then
			msg = msg .. ' (' .. state.CombatForm.value .. ')'
		end
        
		msg = msg .. ', '
	end

	msg = msg .. 'Idle ['..state.IdleMode.value..'], Casting ['..state.CastingMode.value..']'

	add_to_chat(122, msg)
	local currentStrats = get_current_strategem_count()
	local arts
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		arts = 'Light Arts'
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		arts = 'Dark Arts'
	else
		arts = 'No Arts Activated'
	end
	add_to_chat(122, 'Current Available Strategems: ['..currentStrats..'], '..arts..'')
end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
	function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use
	end
function handle_strategems(cmdParams)
    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
 
    local currentStrats = get_current_strategem_count()
    local newStratCount = currentStrats - 1
    if currentStrats > 0 then
        add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
    else
        add_to_chat(122, '***Out of strategems! Canceling...***')
        return
    end
 
    local strategem = cmdParams[2]:lower()
 
    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('@input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('@input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('@input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('@input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('@input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('@input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('@input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('@input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('@input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('@input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('@input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('@input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('@input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('@input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('@input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('@input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

function get_current_strategem_count()
	local allRecasts = windower.ffxi.get_ability_recasts()
	local stratsRecast = allRecasts[231]

	local maxStrategems = math.floor(player.main_job_level + 10) / 20

	local fullRechargeTime = 5*33

	local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
	
	return currentCharges
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 17)
    elseif player.sub_job == 'BLM' then
        set_macro_page(1, 17)	
    elseif player.sub_job == 'WHM' then
        set_macro_page(1, 17)
	end	
end
