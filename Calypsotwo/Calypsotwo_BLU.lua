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
        'Uppercut','Vertical Cleave','Saurian Slide'
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
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb','Searing Tempest',
		'Blinding Fulgor','Spectral Floe','Scouring Spate','Anvil Lightning','Silent Storm',
		'Entomb','Tenebral Crush','Palling Salvo'
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
        'Thunderbolt','Whirl of Rage',
		'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Crashing Thunder',
		'Droning Whirlwind','Gates of Hades','Polar Roar','Pyric Bulwark','Thunderbolt',
		'Tourbillion','Uproot'
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
        'Zephyr Mantle','Mighty Guard'
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
    state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Learning')

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
	gear.magic_head = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+24','INT+12','Mag. Acc.+9',}}
	--gear.physical_head = { name="Herculean Helm", augments={'Weapon skill damage +3%','Accuracy+14',}}
	gear.physical_head = "Lilitu Headpiece"
	gear.cdc_body = { name="Herculean Vest", augments={'Attack+26','Crit. hit damage +4%','DEX+2',}}
	gear.cdc_cape = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.wsd_head = { name="Herculean Helm", augments={'Attack+15','Weapon skill damage +4%','AGI+5',}}
	gear.wsd_body = { name="Herculean Vest", augments={'Attack+29','Weapon skill damage +4%','STR+12','Accuracy+4',}}
	gear.savage_cape = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.melee_cape = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	gear.magic_cape = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	--gear.tp_feet = { name="Herculean Boots", augments={'"Triple Atk."+4','Accuracy+10','Attack+1',}}
    gear.melee_hands = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
	gear.tp_feet = { name="Herculean Boots", augments={'Attack+15','INT+7','Quadruple Attack +3','Accuracy+11 Attack+11',}}

    update_combat_form()
    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
end

-- Set up gear sets.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Hashishin Basmak +1"}
    sets.buff['Chain Affinity'] = {head="Hashishin Kavuk", feet="Assimilator's Charuqs +1"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah"}
    sets.buff.Efflux = {back=gear.savage_cape,legs="Hashishin Tayt +1"}
	
	-- Salvage Weapons Sets
	sets.swords = {main={ name="Almace"},
		sub={ name="Naegling"}}
		
	sets.clubs = {main={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}},
		sub={ name="Nibiru Cudgel", augments={'MP+50','INT+10','"Mag.Atk.Bns."+15',}}}
		
	sets.h2h = {main=empty,sub=empty}
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Uk'uxkaj Cap",
        body="Vanir Cotehardie",hands="Leyline Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
        head="Carmine Mask",ear2="Loquacious Earring",ear1="Enchanter Earring +1",
        body="Jhakri Robe +2",hands="Leyline Gloves",ring1="Kishar Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Jhakri Pigaches +2"}
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan",hands="Hashishin Bazubands"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Adhemar Bonnet +1",neck=gear.ElementalGorget,ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Adhemar Jacket",hands=gear.melee_hands,ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Fotia Belt",legs="Herculean Trousers",feet="Adhemar Gamashes +1"}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Buremte Gloves"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="Quartz Tathlum +1",
        head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Rufescent Ring",ring2="Epona's Ring",
        back=gear.savage_cape,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Jhakri Pigaches +2"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Grenade Core",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Acumen Ring",ring2="Archon Ring",
        back=gear.magic_cape,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
    sets.precast.WS['Savage Blade'] = {ammp="Floestone",
        head=gear.physical_head,neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Assimilator's Jubbah +2",hands="Jhakri Cuffs +2",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.savage_cape,waist="Fotia Belt",legs="Herculean Trousers",feet="Adhemar Gamashes +1"}
		
    sets.precast.WS['Expiacion'] = {ammp="Floestone",
        head=gear.physical_head,neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Assimilator's Jubbah +2",hands="Jhakri Cuffs +2",ring1="Rajas Ring",ring2="Epona's Ring",
        back=gear.savage_cape,waist="Fotia Belt",legs="Herculean Trousers",feet="Adhemar Gamashes +1"}
		
    sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik Feather",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Abnoba Kaftan",hands=gear.melee_hands,ring1="Begrudging Ring",ring2="Epona's Ring",
        back=gear.cdc_cape,waist="Fotia Belt",legs="Herculean Trousers",feet="Thereoid Greaves"}
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask",ear2="Loquacious Earring",ear1="Enchanter Earring +1",
        body="Luhlaza Jubbah",hands="Mavi Bazubands +2",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Hurch'lan Sash",legs="Ayanmo Cosciales +2",feet="Iuitl Gaiters +1"}
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {ammo="Floestone",
        head=gear.physical_head,neck="Caro Necklace",ear1="Heartseeker Earring",ear2="Steelflash Earring",
        body=gear.cdc_body,hands=gear.melee_hands,ring1="Rajas Ring",ring2="Ifrit Ring",
        back=gear.savage_cape,waist="Caudata Belt",legs="Herculean Trousers",feet=gear.tp_feet}

    sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical,
		{ammo="Jukukik Feather",body="Ayanmo Corazza +2",ring2="Chirich Ring"})

    sets.midcast['Blue Magic'].PhysicalStr = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalDex = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalVit = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalAgi = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalInt = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalMnd = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalChr = sets.midcast['Blue Magic'].Physical

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical,
		{back="Moonbeam Cape"})

    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
        head=gear.magic_head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Icesoul Ring",ring2="Acumen Ring",
        back=gear.magic_cape,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    sets.midcast['Blue Magic'].Magical.Resistant = sets.midcast['Blue Magic'].Magical
    
    sets.midcast['Blue Magic'].MagicalMnd = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicalChr = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicalVit = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicalDex = sets.midcast['Blue Magic'].Magical

    sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Pemphredo Tathlum",
        head="Carmine Mask",neck="Erra Pendant",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Icesoul Ring",ring2="Acumen Ring",
        back=gear.magic_cape,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = {ammo="Pemphredo Tathlum",
        head="Luhlaza Keffiyeh",neck="Sanctity Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Vanir Cotehardie",hands="Assimilator's Bazubands +2",ring1="K'ayres Ring",ring2="Beeline Ring",
        back=gear.magic_cape,legs="Enif Cosciales",feet="Iuitl Gaiters +1"}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
        {ammo="Falcon Eye",neck="Sanctity Necklace",waist="Chaac Belt"})
	
	sets.midcast['Blue Magic']['Tenebral Crush'] = {ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Regal Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Archon Ring",ring2="Acumen Ring",
        back=gear.magic_cape,waist="Eschan Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
        
    sets.midcast['Blue Magic']['White Wind'] = {
        head="Whirlpool Mask",neck="Lavalier +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="K'ayres Ring",ring2="Meridian Ring",
        back="Fravashi Mantle",waist="Hurch'lan Sash",legs="Enif Cosciales",feet="Medium's Sabots"}

    sets.midcast['Blue Magic'].Healing = {
        head="Carmine Mask",ear1="Lifestorm Earring",ear2="Loquacious Earring",
        body="Emet Harness +1",hands="Buremte Gloves",ring1="Aquasoul Ring",ring2="Sirona's Ring",
        back="Solemnity Cape",waist="Chuq'aba Belt",legs="Jhakri Slops +2",feet="Medium's Sabots"}

    sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Pemphredo Tathlum",
        head="Luhlaza Keffiyeh",neck="Incanter's Torque",body="Assimilator's Jubbah +2",
        back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

    sets.midcast['Blue Magic'].Buff = {}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {ammo="Pemphredo Tathlum",hands="Assimilator's Bazubands +2"}
        --head="Luhlaza Keffiyeh",  
        --body="Assimilator's Jubbah",hands="Assimilator's Bazubands +1",
        --back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {
        head="Ocelomeh Headpiece +1",neck="Loricate Torque +1",
        body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Defending Ring",ring2="Vocane Ring +1",
        waist="Austerity Belt",feet="Chelona Boots +1"}
    
    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum +1",
        head="Taeon Chapeau",neck="Loricate Torque +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Assimilator's Bazubands +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Adhemar Gamashes +1"}

    sets.idle.PDT = {ammo="Staunch Tathlum +1",
        head="Taeon Chapeau",neck="Loricate Torque +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Emet Harness +1",hands="Assimilator's Bazubands +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Iuitl Gaiters +1"}

    sets.idle.Town = {ammo="Staunch Tathlum +1",
        head="Taeon Chapeau",neck="Loricate Torque +1",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Jhakri Robe +2",hands="Assimilator's Bazubands +2",ring1="Sheltered Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Adhemar Gamashes +1"}

    sets.idle.Learning = set_combine(sets.idle, sets.Learning)
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Whirlpool Mask",neck="Loricate Torque +1",
        body="Ayanmo Corazza +2",hands="Assimilator's Bazubands +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +2",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Whirlpool Mask",neck="Loricate Torque +1",
        body="Hagondes Coat",hands="Assimilator's Bazubands +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
        head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar Jacket +1",hands=gear.melee_hands,ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.tp_feet}

    sets.engaged.Acc = {ammo="Honed Tathlum",
        head="Carmine Mask",neck="Sanctity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Assimilator's Jubbah +2",hands="Assimilator's Bazubands +2",ring1="Chirich Ring",ring2="Mars's Ring",
        back=gear.melee_cape,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet=gear.tp_feet}

    sets.engaged.Refresh = {ammo="Ginsen",
        head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Jhakri Robe +2",hands=gear.melee_hands,ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.tp_feet}
		
    sets.engaged.PDT = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Ayanmo Corazza +2",hands="Assimilator's Bazubands +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +2",feet="Iuitl Gaiters +1"}

    sets.engaged.DW = {ammo="Ginsen",
        head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Dedition Earring",
        body="Adhemar Jacket +1",hands=gear.melee_hands,ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.tp_feet}

    sets.engaged.DW.Acc = {ammo="Honed Tathlum",
        head="Dampening Tam",neck="Sanctity Necklace",ear1="Suppanomimi",ear2="Telos Earring",
        body="Adhemar Jacket +1",hands="Assimilator's Bazubands +2",ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Reiki Yotai",legs="Carmine Cuisses +1",feet=gear.tp_feet}

    sets.engaged.DW.Refresh = {ammo="Ginsen",
        head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Jhakri Robe +2",hands=gear.melee_hands,ring1="Petrov Ring",ring2="Epona's Ring",
        back=gear.melee_cape,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.tp_feet}
		
    sets.engaged.DW.PDT = {ammo="Staunch Tathlum +1",
        head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Ayanmo Corazza +2",hands="Assimilator's Bazubands +2",ring1="Defending Ring",ring2="Vocane Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +2",feet="Iuitl Gaiters +1"}

    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)

    sets.self_healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
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
        set_macro_page(2, 7)
    else
        set_macro_page(1, 7)
    end
end
