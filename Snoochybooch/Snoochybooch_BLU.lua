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
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb'
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Learning')

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind !` input /ja "Efflux" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')

    update_combat_form()
    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @`')
end


-- Set up gear sets.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah"}
    sets.buff.Efflux = {legs="Mavi Tayt +2"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Uk'uxkaj Cap",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Amar Cluster",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
}
        
    sets.precast.FC['Blue Magic'] = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Amar Cluster",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Hetairoi Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Buremte Gloves"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="Jukukik Feather",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Herculean Gloves",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back="Rancorous Mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Thereoid Greaves"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Jukukik Feather",
        head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Herculean Gloves",ring1="Petrov Ring",ring2="Epona's Ring",
		back="Rancorous Mantle",waist="Fotia Belt",legs="Herculean Trousers",feet="Thereoid Greaves"}
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Amar Cluster",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Sanctity Necklace",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Swith Cape",
}
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalStr = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalDex = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalVit = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalAgi = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalInt = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalMnd = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalChr = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}

    sets.midcast['Blue Magic'].PhysicalHP = {ammo="Amar Cluster",
        head="Adhemar Bonnet",neck="ASperity Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body="Despair Mail",hands="Despair Fin. Gaunt.",ring1="Petrov Ring",ring2="Epona's Ring",
        back="Cornflower Cape",waist="Kentarch Belt",legs="Rawhide Trousers",feet="Despair Greaves"}


    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    sets.midcast['Blue Magic'].Magical.Resistant = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}
    
    sets.midcast['Blue Magic'].MagicalMnd = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    sets.midcast['Blue Magic'].MagicalChr = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    sets.midcast['Blue Magic'].MagicalVit = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    sets.midcast['Blue Magic'].MagicalDex = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    sets.midcast['Blue Magic'].MagicAccuracy = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Strophadic Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Seshaw Cape",
}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
        {waist="Chaac Belt"})
        
    sets.midcast['Blue Magic']['White Wind'] = {
        head="Whirlpool Mask",neck="Lavalier +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Meridian Ring",
        back="Fravashi Mantle",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Hagondes Sabots"}

    sets.midcast['Blue Magic'].Healing = {
        head="Uk'uxkaj Cap",ear1="Lifestorm Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Aquasoul Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh",
        body="Assimilator's Jubbah",
        back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs"}

    sets.midcast['Blue Magic'].Buff = {}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    

    
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {ammo="Mavi Tathlum",hands="Assimilator's Bazubands +1"}
        --head="Luhlaza Keffiyeh",  
        --body="Assimilator's Jubbah",hands="Assimilator's Bazubands +1",
        --back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs"}


    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Staunch Tathlum +1",
    head="Rawhide Mask",
    body="Jhakri Robe +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}
    
    -- Idle sets
    sets.idle = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Staunch Tathlum +1",
    head="Rawhide Mask",
    body="Jhakri Robe +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}

    sets.idle.PDT = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Staunch Tathlum +1",
    head="Rawhide Mask",
    body="Jhakri Robe +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}

    sets.idle.Town = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Staunch Tathlum +1",
    head="Rawhide Mask",
    body="Jhakri Robe +2",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonlight Cape",
}

    sets.idle.Learning = set_combine(sets.idle, sets.Learning)

    
    -- Defense sets
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Bloodgem Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bloodgem Earring",
        body="Hagondes Coat",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.Kiting = {legs="Crimson Cuisses"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

    sets.engaged.Acc = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

    sets.engaged.Refresh = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

    sets.engaged.DW = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

    sets.engaged.DW.Acc = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

    sets.engaged.DW.Refresh = {
    main={ name="Colada", augments={'Crit.hit rate+3','DEX+1','Accuracy+10','Attack+7','DMG:+16',}},
    sub={ name="Colada", augments={'"Dbl.Atk."+4','DEX+6','Accuracy+15','Attack+12','DMG:+3',}},
    ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+20','"Triple Atk."+4','DEX+2','Attack+15',}},
    feet={ name="Herculean Boots", augments={'Accuracy+13 Attack+13','"Triple Atk."+4','DEX+10','Attack+15',}},
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Ilabrat Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)


    sets.self_healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
	
	organizer_items = {
		echos="Echo Drops",
		Swor="Colada",
		Colad="Colada",
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
		Holla="Dim. Ring (Holla)"
	}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 16)
    else
        set_macro_page(1, 16)
    end
end

