-- RDM TODO List (updated 10/21/2018)

-- Weapons : Almace R15, Seq R15, Crocea Mors B?, Excalibur?, Raetic Staff +1?
-- TP : N/A
-- WS : AMAN Ring, AMAN Orpheus Sash
-- Enfeeb :  Regal Cuffs
-- Enhancing : Colada Aug for Enh Duration.  Try for +10 Enh Dur Telchine Head, Legs (w/ Duskdim)
-- Nuking : Amalric Nails +1?
-- Healing: Enmity-, Healing Magic Skill, Cure Pot II

-- Subtle Blow Set : Crocea Mors B, Chirich Ring +1 x2, Bathy Choker +1 (Max possible I+II for RDM 55%, unless w/ Crocea B, can reach full 75% cap)
  -- /NIN : 15 SB
  -- Ternion +1 : 9 SB
  -- Digni Ear : 5 SB
  -- Volte Harness : 10 SB
  -- Volte Tights : 8 SB
  -- Bathy Choker +1 : 11 SB
  -- Chirich Ring +1 (x2) : 10 SB
  -- Sherida Ear : 5 SB II
  -- Crocea Mors B : 25 SB II
  
-- Tanking Gear Set :
  -- Theoretical Enmity + for RDM Set TODO...
    --Main  ?? Mafic Cugdel - +6
    --Sub   Evalach +1 - +6
    --Range/Ammo  Paeapua - +2 (GOT)
    --Head  Halitus Helm - +8 (GOT)
    --Neck  Unmoving Collar +1 - +10
    --Ear1  Cryptic Earring +4 (GOT)
    --Ear2  Trux Earring +5
    --Body  Emet Harness +1 - +10 (GOT)
    --Hands ?? - N/A at iLvl
    --Ring1 Provocare Ring - +5 (GOT)
    --Ring2 Supershear Ring - +5 (GOT)
    --Back  Ambu - +10
    --Waist Trance Belt - +4, Kasiri Belt, Sulla Belt, Goading Belt. Warwolf Belt +3
    --Legs  Zoar Subligar +1 - +6
    --Feet  Rager Ledelsens +1 - +7 (GOT)
    -- Theoretically Possible: +93 ENM (+87 if not swapping weapon, 84 not including rare waist and WoE feet)
  -- Tanking Enmity+ Cure Set
    
-- Tanking /BLU Spell List:
  -- Important : Cocoon (Def), Geist Wall (Enm AoE), Sheep Song(Enm AoE), Blank Gaze(Enm), Jettatura (Enm), Soporific (Enm AoE), Healing Breeze (CuragaII, works w/ Cure Potency/MND)
  -- Suggested options for remaining points:
  -- Trait Bonus Options : 
  --   Cursed Sphere 2 Sound Blast 1 Magic Attack Bonus
  --   Wild Oats (HP+10) 3 Sprout Smack	2 Beast Killer
  --   Foot Kick (AGI +1) 2 Claw Cyclone (VIT +1) 2 Lizard Killer
  --   Power Attack 1 Mandibular Bite 2 Plantoid Killer
  --   Bludgeon 2 Smite of Rage (AGI +3) 3 Undead Killer
  -- Stat Boost Options : Screwdriver (VIT +1 HP +10) Feather Storm (HP +5) 3 Helldive (HP +5) 2 Magnetite Cloud (VIT +2) Sandspin (VIT +1) 2 3 Mysterious Light (AGI +3) 4 Chaotic Eye (AGI +1) 2 Stinking Gas (AGI +1) 2

-- Self SCs of Relevance
--  : CDC > CDC (Light Lv4)
--  : Savage > CDC (Distortion) [> Req (Darkness)]
--  : Sequence only [Req 300% aftermath] : Savage > CDC (Distortion) > Req (Darkness 3-step) > Req (Umbra 4-step)
--  : Rapier only : CDC > Swift (Darkness)
--  : Rapier only : Savage > CDC (Distortion) > Swift (Darkness 3-step)
--  : (w/Qultada) : CDC > Detonator (Fusion) > Savage (Light 3-step)
--  : (w/Qultada) : Savage > Burning Blade (Liquefaction) > Savage (Scission)
-- NOTE : Need Excalibur to do Fusion and/or Light multi-step w/ KoR

-- w/ GS (WAR, DRK, RUN)
-- : Resolution > CDC (Distortion) [> Scourge (Fusion) > Savage (Light)]
-- : Resolution > CDC (Distortion) [> Scourge (Fusion) > Savage (Light)]
-- : Savage > Torcleaver (Distortion) [> Scourge (Fusion) > Savage (Light)]
-- : Torcleaver or Dimidation > CDC (Light Lv4)
-- : CDC > Torcleaver or Dimidation (Light Lv4)
-- : Swift > Resolution (Fragmentation) [> Scourge (Light)]
-- : Swift > Torcleaver (Darkness)

-- w/ GA (WAR)
-- : Savage > Upheaval (Light) [> CDC (Light Lv4)]
-- : Upheaval > Savage (Light) [> CDC (Light Lv4)]
-- : CDC > Upheaval (Fusion) [> Savage (Light)]

-- w/ GK (SAM)
-- Savage > Tachi Fudo (Distortion)
-- Savage > Tachi Kasha (Light) > Tachi Fudo (Light Lv4)
-- CDC > Tachi Kasha (Fusion) > Savage (Light) > Tachi Fudo (Light Lv4)

-- w/ Dagger (THF)
-- : Savage > Rudra's (Distortion) [> Req (Darkness) or Evis (Darkness)]
-- : Swift > Rudra's (Darkness) > Rudra's (Darkness Lv4)

-- w/ Polearm (DRG)
-- : CDC > Camlann's (Light Lv4)
-- : CDC > Stardiver (Darkness)

-- Initialization function for this job file.
function get_sets()
   mote_include_version = 2
   include('Mote-Include.lua')
end
     
-- Setup vars that are user-independent.
function job_setup()
   state.Buff.Saboteur = buffactive.saboteur or false
   event_list = L{}
   event_list:append(windower.register_event('time change', time_change))
end
     
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

   state.CombatMode = M{['description'] = 'Combat Mode'}

   state.CombatMode:options('Frontline', 'Backline')
   state.OffenseMode:options('MaxHaste', 'MaxHasteMidAcc', 'MaxHasteHiAcc', 'MaxHasteMaxAcc', 'TH', 'LowHaste', 'Tank', 'TankAcc', 'MaxHasteCroceaC')
   state.WeaponskillMode:options('Normal', 'Acc', 'TH')
   state.CastingMode:options('Normal', 'MB', 'HiAcc')
   state.IdleMode:options('Normal','DT')
   state.RestingMode:options('Normal')
   state.PhysicalDefenseMode:options('PDT')
   state.MagicalDefenseMode:options('MDT')

   state.CombatForm:reset()
   
   if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
      state.CombatForm:set('DW')
   else
      state.CombatForm:reset()
   end

   if S{'WAR', 'THF', 'PLD', 'DRK', 'BST', 'RNG', 'SAM', 'NIN', 'BLU', 'DNC', 'RUN'}:contains(player.sub_job) then
      state.CombatMode:set('Frontline')
      send_command('wait 0.1; gs disable main sub range')
   else
      state.CombatMode:set('Backline')
   end
           
   EnhancingDurationSpells = S{'Haste', 'Haste II', 'Flurry', 'Flurry II', 'Invisible', 'Sneak', 'Regen', 'Regen II', 'Sandstorm', 'Rainstorm', 'Windstorm', 'Firestorm', 'Hailstorm', 'Thunderstorm', 'Aurorastorm', 'Voidstorm', 'Klimaform'}
   EnhancingPotencySpells = S{'Temper II', 'Temper', 'Enstone', 'Enwater', 'Enaero', 'Enfire', 'Enblizzard', 'Enthunder', 'Enstone II', 'Enwater II', 'Enaero II', 'Enfire II', 'Enblizzard II', 'Enthunder II'}
   GainSpells = S{'Gain-STR', 'Gain-DEX', 'Gain-AGI', 'Gain-VIT', 'Gain-MND', 'Gain-INT', 'Gain-CHR'}
   EnfeebMNDPotencySpells = S{'Poison', 'Poisonga', 'Poison II', 'Addle', 'Addle II', 'Distract', 'Distract II', 'Distract III', 'Frazzle', 'Frazzle III'}
   MNDPotencySpells = S{'Paralyze', 'Paralyze II', 'Slow', 'Slow II'}
   MNDAccuracySpells = S{'Frazzle II', 'Silence'}
   INTAccuracySpells = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Break', 'Breakga', 'Blind', 'Bind', 'Dispel', 'Gravity', 'Gravity II'}
   EnmitySpells = S{'Jettatura', 'Blank Gaze', 'Sheep Song', 'Geist Wall', 'Soporific'}
   
   send_command('wait 0.1; unbind !f11; wait 0.1; bind !f11 gs c cycle CombatMode')
   send_command('wait 0.1; unbind !f9; wait 0.1; bind !f9 gs c cycleback OffenseMode')
   
   TaeonHeadTP = { name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+6 DEX+6',}}
   TaeonHeadWS = { name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}}
   TaeonHeadPhalanx = { name="Taeon Chapeau", augments={'Phalanx +3',}}
   TaeonBodyTP = { name="Taeon Tabard", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+6 DEX+6',}}
   TaeonBodyWS = { name="Taeon Tabard", augments={'Accuracy+18 Attack+18','Crit.hit rate+3','Crit. hit damage +3%',}}
   TaeonBodyPhalanx = { name="Taeon Tabard", augments={'Phalanx +3',}}
   TaeonHandsTP = { name="Taeon Gloves", augments={'Accuracy+19 Attack+19','"Triple Atk."+2','STR+7 DEX+7',}}
   TaeonHandsWS = { name="Taeon Gloves", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}}
   TaeonHandsPhalanx = { name="Taeon Gloves", augments={'Phalanx +3',}}
   TaeonLegsTP = { name="Taeon Tights", augments={'Accuracy+18 Attack+18','"Triple Atk."+2','DEX+10',}}
   TaeonLegsWS = { name="Taeon Tights", augments={'Accuracy+20 Attack+20','Crit.hit rate+3','Crit. hit damage +3%',}}
   TaeonLegsPhalanx = { name="Taeon Tights", augments={'Phalanx +3',}}
   TaeonFeetTP = { name="Taeon Boots", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','STR+7 DEX+7',}}
   TaeonFeetPhalanx = { name="Taeon Boots", augments={'Phalanx +3',}}
   GrioEnfeeb = { name="Grioavolr", augments={'Enfb.mag. skill +15','MND+11','Mag. Acc.+30','"Mag.Atk.Bns."+27','Magic Damage +2',}}
   GrioNuke = { name="Grioavolr", augments={'Magic burst dmg.+5%','INT+10','Mag. Acc.+30','"Mag.Atk.Bns."+24','Magic Damage +9',}}
   DarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -5%','Spell interruption rate down -3%',}}
   CarmineBodyMND = {name="Carm. Scale Mail", augments={'Accuracy+10','DEX+10','MND+15',}}
   CarmineBodyMAtt = {name="Carm. Scale Mail", augments={'Attack+15','"Mag.Atk.Bns."+10','"Dbl.Atk."+2',}}
   ChironicTH = {name="Chironic Gloves", augments={'"Mag.Atk.Bns."+7','Accuracy+18 Attack+18','"Treasure Hunter"+2','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}
   ChironicRefreshHands = { name="Chironic Gloves", augments={'CHR+1','Accuracy+2','"Refresh"+1','Accuracy+13 Attack+13','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
   ChironicMAccHands = { name="Chironic Gloves", augments={'Mag. Acc.+30','"Fast Cast"+4','Magic Damage +6','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
   ChironicDTHands = { name="Chironic Gloves", augments={'MND+1','"Dbl.Atk."+3','Damage taken-4%','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
   ChironicDTFeet = { name="Chironic Slippers", augments={'"Dbl.Atk."+1','MND+5','Damage taken-4%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
   ChironicWSDFeet = { name="Chironic Slippers", augments={'MND+6','Pet: Crit.hit rate +1','Weapon skill damage +7%','Accuracy+17 Attack+17',}}
   MerlinicNuke = { name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+9%','MND+9','"Mag.Atk.Bns."+6',}}
   MerlinicRefreshFeet = { name="Merlinic Crackows", augments={'Attack+3','Pet: INT+4','"Refresh"+1','Accuracy+9 Attack+9',}}
   SucellosDW={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}}
   SucellosCrit={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
   SucellosReq={ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','"Dbl.Atk."+10',}}
   SucellosINT={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
   SucellosMND={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10',}}
   SucellosSTP={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
   SucellosSTR={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
   SucellosINTWS={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}}
end
     
     
    -- Called when this job file is unloaded (eg: job change)
    function file_unload()
    --        if binds_on_unload then
    --                binds_on_unload()
    --        end
    --    event_list:map(unregister_event)
    end     
     
    -- Define sets and vars used by this job file.
    function init_gear_sets()
           
			sets.obi = {
			   Fire = {waist="Hachirin-no-Obi"},
			   Earth = {waist="Hachirin-no-Obi"},
			   Water = {waist="Hachirin-no-Obi"},
			   Wind = {waist="Hachirin-no-Obi"},
			   Ice = {waist="Hachirin-no-Obi"},
			   Lightning = {waist="Hachirin-no-Obi"},
			   Light = {waist="Hachirin-no-Obi"},
			   Dark = {waist="Hachirin-no-Obi"},
			}
			
            -- Precast Sets
           
            -- Precast sets to enhance JAs
            sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
                
            -- Waltz set (chr and vit)
            --sets.precast.Waltz = {}
     
            -- Fast Cast 50% needed (+ RDM Trait 30% >= 80%)
			-- Atrophy Chapeau +3 +16%
         -- Etiolation Earring +1%
			-- Viti. Tabard +3 +15%
			-- Gende. Gages +1 +7%
			-- Witful Belt +3%
			-- Weatherspoon Ring +5%
			-- Psycloth Lappas +7%
			-- Carmine Greaves +1 +8%
			-- >50% Fast Cast
			-- Quick Cast 10% cap
			-- Impatiens +2%
			-- Witful Belt +3%
			-- Weatherspoon Ring +3%
			-- Opapepo Cape +2%
			-- 10% QC = 10% cap
			sets.precast.FC = {ammo="Impatiens",
                    head="Atrophy Chapeau +3",ear1="Etiolation Earring",
                    body="Viti. Tabard +3",hands="Gende. Gages +1",ring1="Weatherspoon Ring",
                    back="Ogapepo Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}
     
            sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

            -- Weaponskill sets
            -- Default set for any weaponskill that isn't any more specifically defined
            sets.precast.WS = {ammo="Ginsen",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosCrit,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

            sets.precast.WS.Acc = {ammo="Ginsen",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
                    back=SucellosCrit,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
                   
            sets.precast.WS.TH = {ammo="Ginsen",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosCrit,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
			
            sets.precast.WS['Requiescat'] = {ammo="Regal Gem",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Viti. Tabard +3",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Rufescent Ring",
                    back=SucellosReq,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Carmine Greaves +1"}
                   
            sets.precast.WS['Requiescat'].Acc = {ammo="Hasty Pinion +1",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Rufescent Ring",
                    back=SucellosReq,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Carmine Greaves +1"}

			   sets.precast.WS['Savage Blade'] = {ammo="Floestone",
                    head="Viti. Chapeau +3",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
                    body="Viti. Tabard +3",hands="Jhakri Cuffs +2",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosSTR,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet=ChironicWSDFeet}
                   
            sets.precast.WS['Savage Blade'].Acc = {ammo="Floestone",
                    head="Viti. Chapeau +3",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosSTR,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

			   sets.precast.WS['Swift Blade'] = {ammo="Floestone",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Viti. Tabard +3",hands="Jhakri Cuffs +2",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosSTR,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
                   
            sets.precast.WS['Swift Blade'].Acc = {ammo="Floestone",
                    head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosSTR,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
                    
            sets.precast.WS['Vorpal Blade'] = {ammo="Floestone",
                    head=TaeonHeadWS,neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Ayanmo Corazza +2",hands="Atrophy Gloves +3",ring1="Ilabrat Ring",ring2="Begrudging Ring",
                    back=SucellosSTR,waist="Fotia Belt",legs=TaeonLegsWS,feet="Thereoid Greaves"}
                   
            sets.precast.WS['Vorpal Blade'].Acc = {ammo="Floestone",
                    head=TaeonHeadWS,neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Ayanmo Corazza +2",hands="Atrophy Gloves +3",ring1="Ilabrat Ring",ring2="Begrudging Ring",
                    back=SucellosSTR,waist="Fotia Belt",legs=TaeonLegsWS,feet="Thereoid Greaves"}
                   
            --sets.precast.WS['Knights of Round'] = {}
            --sets.precast.WS['Knights of Round'].Acc = {}
                   
            sets.precast.WS['Death Blossom'] = {ammo="Floestone",
                    head="Jhakri Coronal +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosSTR,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
					
            sets.precast.WS['Death Blossom'].Acc = {ammo="Floestone",
                    head="Jhakri Coronal +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
                    body="Jhakri Robe +2",hands="Atrophy Gloves +3",ring1="Shukuyu Ring",ring2="Rufescent Ring",
                    back=SucellosSTR,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
                    
            -- WSD bug patched, using original crit-based set.
            sets.precast.WS['Chant du Cygne'] = {ammo="Yetshila",
                    head=TaeonHeadWS,neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
                    body="Ayanmo Corazza +2",hands="Jhakri Cuffs +2",ring1="Ilabrat Ring",ring2="Begrudging Ring",
                    back=SucellosCrit,waist="Fotia Belt",legs="Viti. Tights +3",feet="Thereoid Greaves"}

            sets.precast.WS['Chant du Cygne'].Acc = {ammo="Jukukik Feather",
                    head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Mache Earring",ear2="Moonshade Earring",
                    body="Ayanmo Corazza +2",hands="Atrophy Gloves +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
                    back=SucellosCrit,waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Aya. Gambieras +2"}
            
            sets.precast.WS['Aeolian Edge'] = {ammo="Ghastly Tathlum +1",
                    head="Merlinic Hood",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
                    body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
                    back=SucellosINTWS,waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Vitiation Boots +3"}
					
            sets.precast.WS['Aeolian Edge'].TH = {ammo="Ghastly Tathlum +1",
                    head="Merlinic Hood",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
                    body="Amalric Doublet +1",hands=ChironicTH,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
                    back=SucellosINTWS,waist="Chaac Belt",legs="Amalric Slops +1",feet="Vitiation Boots +3"}			

            sets.precast.WS['Red Lotus Blade'] = {ammo="Pemphredo Tathlum",
                    head="Merlinic Hood",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
                    body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
                    back=SucellosINTWS,waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Vitiation Boots +3"}
            
            sets.precast.WS['Red Lotus Blade'].TH = sets.precast.WS['Red Lotus Blade']

            sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
                    head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
                    body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Archon Ring",ring2="Shiva Ring +1",
                    back=SucellosINTWS,waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Vitiation Boots +3"}
            
            sets.precast.WS['Sanguine Blade'].TH = sets.precast.WS['Sanguine Blade']
            
            -- Midcast Sets

            sets.midcast.FastRecast = {ammo="Impatiens",
                    head="Atrophy Chapeau +3",
                    body="Viti. Tabard +3",hands="Gende. Gages +1",ring1="Weatherspoon Ring",
                    back="Swith Cape",waist="Pya'ekue Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}
                    
            -- Cure
            sets.midcast.FrontlineCure = {ammo="Regal Gem",
                    head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enervating Earring",ear2="Loquac. Earring",
                    body="Chironic Doublet",hands="Kaykaus Cuffs +1",ring1="Sirona's Ring",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Luminary Sash",legs="Atrophy Tights +3",feet="Kaykaus Boots"}                   

            -- CP: (90)/72 (50% cap)
            -- Healing: 45 (Vanya Veet 40, Viti Body 19)
            -- MND: 205
            -- Enmity: -41 (Malison -2, Sangoma Ring -2)
            sets.midcast.BacklineCure = {main="Tefnut Wand",sub="Sors Shield",ammo="Regal Gem",
                    head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enervating Earring",ear2="Loquac. Earring",
                    body="Chironic Doublet",hands="Kaykaus Cuffs +1",ring1="Sirona's Ring",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Luminary Sash",legs="Atrophy Tights +3",feet="Kaykaus Boots"}

            -- Enhancing Duration Math:
            
            -- Enhancing Duration Info (Self) : [Base + 20s (JP)] * (Gear 1) * (Gear 2) * (3.0x)
            -- Enhancing Duration Info (Others) : [Base + 20s (JP)] * (Enhance Composure) * (Gear 1) * (Gear 2)           
            
            -- Duration = Gear 1 Term Non-Aug : Sucellos 20%, Relic Body +3 15%, Empy Feet +1 30%, AF Hands +3 20%, Ammurapi Shield 10%
            --            Gear 2 Term Aug : Dls Torque +2 24%, Ghostfyre Cape 20%, Telchine Head/Legs (Both +9%)
            
            -- Self uses: Gear 1: Relic Body +3 15%, Empy Feet +1 30%, AF Hands +3 20%, Ammurapi Shield 10%
            -- Self uses: Gear 2: Dls Torque +2 24%, Ghostfyre Cape 20%, Telchine Head/Legs 9%, 9%
            -- Others uses: Enhance Composure: Empy Head +1, Empy Body +1, Empy Legs +1, Empy Feet +1 (4pieces = 35%)
            -- Others uses: Gear 1: Empy Feet +1 30%, AF Hands +3 20%, Ammurapi Shield 10%
            -- Others uses: Gear 2: Dls Torque +2 24%, Ghostfyre Cape 20%
            -- Haste Self = (180 + 20) * (1 + 0.15 + 0.3 + 0.2 + 0.1) * (1 + 0.24 + 0.2 + 0.18) ~= 567s (9:27) TESTED: 9:27 (Optimum 9:51)
            -- Haste Comp Self = (180 + 20) * (1 + 0.15 + 0.3 + 0.2 + 0.1) * (1 + 0.24 + 0.2 + 0.18) * (3.0) ~= 1701 (28:21) TESTED: 28:22 (Optimum 29:33)
            -- Haste Comp Others = (180 + 20) * (1 + 0.35) * (1 + 0.3 + 0.2 + 0.1) * (1 + 0.24 + 0.2) ~= 622s (10:22) TESTED: 10:23 (Optimum 10:42)
            
            -- Enhancing Duration set for casting on self, which also hits 500 Skill - used for every spell except Temper and Enspell, 
            --                    Gain-X uses this set but added Relic Hands +3 for +30 effect.
            sets.midcast.EnhancingDuration = {main="Murgleis",sub="Ammurapi Shield",ammo="Impatiens",
                    head="Telchine Cap",neck="Dls. Torque +2",ear1="Augment. Earring",ear2="Loquac. Earring",
                    body="Viti. Tabard +3",hands="Atrophy Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back="Ghostfyre Cape",waist="Pya'ekue Belt",legs="Telchine Braconi",feet="Leth. Houseaux +1"}
            
            sets.midcast['Enhancing Magic'] = sets.midcast.EnhancingDuration

            -- For Casting Gain-spells (w/ Relic Hands), which caps at 500 skill
            sets.buff.Gain = set_combine(sets.midcast.EnhancingDuration, {hands="Viti. Gloves +3"})

            -- Max enhancing potency set for casting on self (Temper and Enspell), 635 Skill - Special Code to unlock weapons
            sets.buff.EnhancingPotency = {main="Pukulatmuj +1",sub="Pukulatmuj",ammo="Impatiens",
                    head="Befouled Crown",neck="Incanter's Torque",ear1="Augment. Earring",ear2="Andoaa Earring",
                    body="Viti. Tabard +3",hands="Viti. Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +3",feet="Leth. Houseaux +1"}

            -- Enhancing Duration set for casting on others (Composure up), which also hits 500 Skill
            sets.buff.ComposureOther = {main="Murgleis",sub="Ammurapi Shield",ammo="Impatiens",
                    head="Leth. Chappel +1",neck="Dls. Torque +2",ear1="Augment. Earring",ear2="Loquac. Earring",
                    body="Lethargy Sayon +1",hands="Atrophy Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back="Ghostfyre Cape",waist="Pya'ekue Belt",legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
                    
            sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"})

            -- Hits 500 skill and Phalanx +17, Special Code to unlock weapons
            sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration, {main="Egeking",head=TaeonHeadPhalanx,ear2="Andoaa Earring",body=TaeonBodyPhalanx,hands=TaeonHandsPhalanx,legs=TaeonLegsPhalanx,feet=TaeonFeetPhalanx})
         
            sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {hands="Stone Mufflers",neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
           
            sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {head="Amalric Coif +1",legs="Shedir Seraweels"})

            -- /BLU stuff
            sets.midcast.Cocoon = sets.midcast.FastRecast
            -- TODO : Build an enmity+ set for /BLU tanking
            sets.midcast.EnmityGen = sets.midcast.FastRecast
         
            sets.midcast['Healing Breeze'] = {ammo="Regal Gem",
                    head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Enervating Earring",ear2="Loquac. Earring",
                    body="Chironic Doublet",hands="Kaykaus Cuffs +1",ring1="Sirona's Ring",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Luminary Sash",legs="Atrophy Tights +3",feet="Kaykaus Boots"}

            sets.midcast.Cursna = {main="Tefnut Wand",sub="Sors Shield",ammo="Hasty Pinion +1",
                    head="Atrophy Chapeau +3",neck="Malison Medallion",ear1="Beatific Earring",ear2="Loquac. Earring",
                    body="Viti. Tabard +3",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Haoma's Ring",
                    back=SucellosMND,waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Gende. Galosh. +1"}
           
            sets.midcast['Enfeebling Magic'] = {main="Murgleis",sub="Ammurapi Shield",ammo="Regal Gem",
                    head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Atrophy Tabard +3",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
                    
            -- Poison, Addle, Distract, Frazzle
            sets.midcast.EnfeebMNDPotency = {main=GrioEnfeeb,sub="Mephitis Grip",ammo="Regal Gem",
                    head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Lethargy Sayon +1",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Rumination Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

            sets.midcast['Dia III'] = set_combine(sets.midcast.EnfeebMNDPotency, {head="Viti. Chapeau +3",ring2="Kishar Ring"})
            sets.midcast['Diaga'] = set_combine(sets.midcast.EnfeebMNDPotency, {hands=ChironicTH,waist="Chaac Belt"})
                    
            -- Slow, Paralyze
            sets.midcast.MNDPotency = {main=GrioEnfeeb,sub="Enki Strap",ammo="Regal Gem",
                    head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Lethargy Sayon +1",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
                    
            -- Silence, Frazzle II
            sets.midcast.MNDAccuracy = {main="Murgleis",sub="Ammurapi Shield",range="Kaja Bow",
                    head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Atrophy Tabard +3",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosMND,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

            sets.midcast['Enfeebling Magic'].HiAcc = sets.midcast.MNDAccuracy
                    
            sets.midcast.EnfeebMNDPotency.HiAcc = sets.midcast.MNDAccuracy
                    
            sets.midcast.MNDPotency.HiAcc = sets.midcast.MNDAccuracy
                    
            -- Not Used Currently
            sets.midcast.INTPotency = {main=GrioEnfeeb,sub="Enki Strap",ammo="Regal Gem",
                    head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Atrophy Tabard +3",hands="Kaykaus Cuffs +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
                    back=SucellosINT,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
                    
            -- Sleep, Break, Gravity, Dispel, Bind, Blind, Impact/EleEnfeeb
            sets.midcast.INTAccuracy = {main="Murgleis",sub="Ammurapi Shield",range="Kaja Bow",
                    head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Atrophy Tabard +3",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosINT,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

            sets.midcast.INTPotency.HiAcc = sets.midcast.INTAccuracy

            -- TODO : Enfeebling Acc/Duration set for Sleep, Bind, Break, etc
            
            sets.midcast['ElementalEnfeeble'] = sets.midcast.INTAccuracy
     
            sets.midcast['Elemental Magic'] = {main=GrioNuke,sub="Enki Strap",ammo="Pemphredo Tathlum",
                    head="Ea Hat +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
                    body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
                    back=SucellosINT,waist="Refoccilation Stone",legs="Merlinic Shalwar",feet="Vitiation Boots +3"}
                    
            -- Current RDM Elemental Magic MBD%/MBD2% :
            -- Grioavolr (Nuke) : 5%/0 (INT19+10 MAcc14+30, Matt30+24, MDmg9)
            -- Ea Hat +1 : 7%/7% (INT43 MAcc50, MAtt38)
            -- Mizu Kubikazari : 10%/0
            -- Ea Houppelande +1 : 9%/9% (INT48 MAcc52 MAtt44)
            -- Amalric Gages +1 (D) : 0/6% (INT36 EleSk14 MAcc20 MAtt53)
            -- Mujin Band : 0/5%
            -- Ea Slops +1 : 8%/8% (INT48 MAcc51 MAtt41)
            -- Viti +3 0%/0% (INT30 MAcc42 MAtt55)            
                  -- Merlinic 9%/0 (INT24 MAcc25 MAtt15+31)
                  -- Jhak2 : 7%/0 (INT33 MAcc42 MAtt39)
            -- Total : 39%/35%, Cap 40%/?%
            
            -- RDM INT/MAtt/MBD general guideline CLHigh : 1INT = 3.75MDmg = 0.85MAB = 0.35MBD
            
            sets.midcast['Elemental Magic'].MB = {main=GrioNuke,sub="Enki Strap",ammo="Pemphredo Tathlum",
                    head="Ea Hat +1",neck="Mizu. Kubikazari",ear1="Regal Earring",ear2="Friomisi Earring",
                    body="Ea Houppe. +1",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Shiva Ring +1",
                    back=SucellosINT,waist="Refoccilation Stone",legs="Ea Slops +1",feet="Vitiation Boots +3"}
                    
            sets.midcast['Elemental Magic'].HiAcc = {main=GrioNuke,sub="Clerisy Strap +1",ammo="Pemphredo Tathlum",
                    head="Ea Hat +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosINT,waist="Refoccilation Stone",legs="Ea Slops +1",feet="Vitiation Boots +3"}
                    
            sets.midcast.Impact = set_combine(sets.midcast['ElementalEnfeeble'], {head=empty,body="Twilight Cloak",ear2="Gwati Earring"})
     
            sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",
                    head="Atrophy Chapeau +3",neck="Erra Pendant",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Atrophy Tabard +3",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Evanescence Ring",
                    back=SucellosINT,waist="Porous Rope",legs="Chironic Hose",feet="Vitiation Boots +3"}

            sets.midcast['Bio III'] = set_combine(sets.midcast['Dark Magic'], {legs="Viti. Tights +3"})
                    
            sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",range="Kaja Bow",
                    head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
                    body="Chironic Doublet",hands=ChironicMAccHands,ring1="Archon Ring",ring2="Evanescence Ring",
                    back=SucellosINT,waist="Fucho-no-Obi",legs="Chironic Hose",feet=MerlinicNuke}

            sets.midcast.Aspir = sets.midcast.Drain                    
     
            -- Lower Recast, for normal use
            --sets.midcast.Stun = {main=GrioNuke,sub="Clerisy Strap +1",ammo="Impatiens",
            --        head="Atrophy Chapeau +3",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
            --        body="Viti. Tabard +3",hands="Gende. Gages +1",ring1="Weather. Ring",ring2="Stikini Ring +1",
            --        back="Swith Cape",waist="Witful Belt",legs="Psycloth Lappas",feet=MerlinicNuke}
            -- For High tier, CS/Stun HiAcc
            sets.midcast.Stun = {main="Murgleis",sub="Ammurapi Shield",range="Kaja Bow",
                    head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
                    body="Atrophy Tabard +3",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosINT,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
                    
            sets.buff.Saboteur = {hands="Leth. Gantherots +1"}

            -- Resting sets
            sets.resting = {main="Bolelabunga",sub="Beatific Shield +1",ammo="Homiliary",
                    head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Loquac. Earring",
                    body="Jhakri Robe +2",hands=ChironicRefreshHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet=MerlinicRefreshFeet}

            -- Idle sets
            sets.idle.Town = {main="Crocea Mors",sub="Kaja Knife",ammo="Ginsen",
                    head=TaeonHeadTP,neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    body="Volte Harness",hands="Aya. Manopolas +2",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    back=SucellosSTP,waist="Reiki Yotai",legs="Volte Tights",feet="Carmine Greaves +1"}
            --sets.idle.Town = {main="Murgleis",sub="Ammurapi Shield",range="Kaja Bow",
            --        head="Atrophy Chapeau +3",neck="Dls. Torque +2",ear1="Digni. Earring",ear2="Regal Earring",
            --        body="Atrophy Tabard +3",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
            --        back=SucellosMND,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

            -- Normal Idle : Refresh + Movement
            sets.idle.Normal = {main="Bolelabunga",sub="Beatific Shield +1",ammo="Homiliary",
                    head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Loquac. Earring",
                    body="Jhakri Robe +2",hands=ChironicRefreshHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet=MerlinicRefreshFeet}
                         
            -- "idle.DT"  A set for aggroing/tanking unengaged (Assuming ShellV 24%) 
            -- Main Sequence                                          [Mafic Cudgel? (10% PDT)]
            -- *Evalach +1 - 4% PDT, 4% MDT                           [Genmei Shield (10% PDT)]
            -- Staunch Tathlum - 2% PDT, 2% MDT, Status -10%
            -- Ea Hat +1 - 109 MEva / 6 MDB
            -- Loricate Torque +1 - 6% PDT, 6% MDT
            -- Etiolation Earring - 0% / 3% MDT
            -- Static Earring - 2 MDB
            -- Ayanmo Corazza +2 - 6% PDT / 6% MDT / 64 MEva / 6 MDB  [Shamash Robe (10% PDT)]
            -- Aya. +2 Hands - 3% PDT, 3% MDT, 37 MEVa / 2 MDB
            -- Defending Ring - 10% PDT, 10% MDT
            -- Gelatinous Ring +1 - 7% PDT, -1% MDT
            -- Ambu Cape w/Resin - 10% PDT
            -- Flume Belt - 4% PDT / 0% MDT, 2% DT to MP
            -- Carmine Cuisses +1  80 MEva / 4 MDB
            -- Volte Boots - 102 MEva / 7 MDB / Status -10%            
            -- Totals : 52% PDT / 57% MDT / ?? MEva / ?? MDB / Status -20%
            sets.idle.DT = {main="Bolelabunga",sub="Beatific Shield +1",ammo="Staunch Tathlum",
                    head="Ea Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Static Earring",
                    body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
                    back=SucellosSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Volte Boots"}
                    
            sets.idle.Weak = {main="Bolelabunga",sub="Beatific Shield +1",ammo="Homiliary",
                    head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Loquac. Earring",
                    body="Jhakri Robe +2",hands=ChironicRefreshHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
                    back=SucellosSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet=MerlinicRefreshFeet}
           
            -- Melee/Defense sets
            
            -- "PDT" A hybrid set for DW melee that caps both PDT and MDT (Assuming ShellV 24%) and maintains as much dmg as possible
            -- Main Some sword                                          [Mafic Cudgel? (10% PDT)]
            -- Sub Some sword/shield                                    [*Evalach +1 - (4% PDT, 4% MDT)] [Genmei Shield (10% PDT)]
            -- Staunch Tathlum - 2% PDT, 2% MDT, Status -10%
            -- Aya. Zucchetto +2 - 3% PDT / 3% MDT / 53 MEva / 3 MDB
            -- Loricate Torque +1 - 6% PDT, 6% MDT
            -- Sherida Earring
            -- Suppanomimi                                            [Telos Earring]
            -- Ayanmo Corazza +2 - 6% PDT / 6% MDT / 64 MEva / 6 MDB  [Shamash Robe (10% PDT)]
            -- Aya. +2 Hands - 3% PDT, 3% MDT, 37 MEVa / 2 MDB
            -- Defending Ring - 10% PDT, 10% MDT
            -- Gelatinous Ring +1 - 7% PDT, -1% MDT
            -- Ambu Cape w/Resin - 10% PDT
            -- Flume Belt - 4% PDT, 2% DT to MP
            -- Carmine Cuisses +1  80 MEva / 4 MDB                    [TaeonLegsTP 69 MEva / 5 MDB]
            -- Carmine Greaves +1 80 MEva / 3 MDB
            -- Totals : 51% PDT / 53% MDT / 303 MEva / 19 MDB / Status -10%
            sets.defense.PDT = {main="Murgleis",sub="Beatific Shield +1",ammo="Staunch Tathlum",
                    head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Suppanomimi",
                    body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
                    back=SucellosSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
                    
            -- "MDT" : A set for that caps both PDT and MDT (Assuming ShellV 24%) and gives MDB / MEva / -Status
            -- Terra's Staff : 20% PDT
            -- Enki Strap : 10 MEva
            -- Staunch Tathlum - 2% PDT, 2% MDT, Status -10%               - Demonry Stone 0/2, Vanir Battery 0/4
            -- Ea Hat +1 - 109 MEva / 6 MDB
            -- Loricate Torque +1 - 6% PDT, 6% MDT                         - Inq. Bead Necklace 0/8
            -- Etiolation Earring - 0% / 3% MDT                            - Eabani 8/0, Sanare 6/4
            -- Static Earring - 2 MDB
            -- Ea Houppelande +1 - 128 MEva / 9 MDB
            -- Volte Bracers -102 MEva / 7 MDB / Status -10%
            -- Defending Ring - 10% PDT, 10% MDT
            -- Dark Ring - 4% PDT, 5% MDT
            -- Ambu Cape w/Resin - 10% PDT
            -- Flume Belt - 4% PDT, 2% DT to MP
            -- Ea Slops +1 - 147 MEva / 8 MDB
            -- Volte Boots - 102 MEva / 7 MDB / Status -10%
            -- Totals : 56% PDT (36 w/o staff) / 50% MDT / 598 MEva (588 w/o grip) / 39 MDB / Status -30%
            sets.defense.MDT = {main="Terra's Staff",sub="Enki Strap",ammo="Staunch Tathlum",
                    head="Ea Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Static Earring",
                    body="Ea Houppe. +1",hands="Volte Bracers",ring1=DarkRing,ring2="Defending Ring",
                    back=SucellosSTP,waist="Flume Belt",legs="Ea Slops +1",feet="Volte Boots"}
     
            -- TP Sets
            
            sets.engaged = {main="Sequence",sub="Beatific Shield +1",ammo="Ginsen",
                    head=TaeonHeadTP,neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    --body="Ayanmo Corazza +2"
                    body="Volte Harness",hands=TaeonHandsTP,ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    --legs=TaeonLegsTP,                    
                    back=SucellosSTP,waist="Windbuffet Belt +1",legs="Volte Tights",feet="Carmine Greaves +1"}

			   sets.engaged.DW = set_combine(sets.engaged.MaxHaste, {main="Sequence",sub="Ternion Dagger +1",waist="Reiki Yotai",feet=TaeonFeetTP})

            sets.engaged.LowHaste = {main="Sequence",sub="Beatific Shield +1",ammo="Ginsen",
                    head=TaeonHeadTP,neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    --body="Ayanmo Corazza +2"
                    body="Volte Harness",hands=TaeonHandsTP,ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    --legs=TaeonLegsTP,
                    back=SucellosSTP,waist="Windbuffet Belt +1",legs="Volte Tights",feet="Carmine Greaves +1"}

			   sets.engaged.DW.LowHaste = set_combine(sets.engaged.LowHaste, {main="Sequence",sub="Ternion Dagger +1",ear1="Sherida Earring",ear2="Suppanomimi",back=SucellosDW,waist="Reiki Yotai",feet=TaeonFeetTP})
                    
            sets.engaged.MaxHaste = {main="Sequence",sub="Beatific Shield +1",ammo="Ginsen",
                    head=TaeonHeadTP,neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    --body="Ayanmo Corazza +2"
                    body="Volte Harness",hands=TaeonHandsTP,ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    --legs=TaeonLegsTP,
                    back=SucellosSTP,waist="Windbuffet Belt +1",legs="Volte Tights",feet="Carmine Greaves +1"}
            
            sets.engaged.DW.MaxHaste = set_combine(sets.engaged.MaxHaste, {main="Sequence",sub="Ternion Dagger +1",waist="Reiki Yotai",feet=TaeonFeetTP})
                    
   			sets.engaged.MaxHasteMidAcc = {main="Almace",sub="Beatific Shield +1",ammo="Ginsen",
                    head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    --body="Ayanmo Corazza +2"
                    body="Volte Harness",hands="Atrophy Gloves +3",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    back=SucellosSTP,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
                    
            sets.engaged.DW.MaxHasteMidAcc = set_combine(sets.engaged.MaxHasteMidAcc, {main="Almace",sub="Sequence",ear2="Suppanomimi"})

   			sets.engaged.MaxHasteHiAcc = {main="Almace",sub="Beatific Shield +1",ammo="Ginsen",
                    head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
                    --body="Ayanmo Corazza +2"
                    body="Volte Harness",hands="Atrophy Gloves +3",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    back=SucellosSTP,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
			
            sets.engaged.DW.MaxHasteHiAcc = set_combine(sets.engaged.MaxHasteHiAcc, {main="Almace",sub="Colada",ear2="Suppanomimi"})

   			sets.engaged.MaxHasteMaxAcc = {main="Almace",sub="Beatific Shield +1",ammo="Hasty Pinion +1",
                    head="Carmine Mask +1",neck="Combatant's Torque",ear1="Regal Earring",ear2="Telos Earring",
                    body="Ayanmo Corazza +2",hands="Atrophy Gloves +3",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
                    back=SucellosSTP,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Atro. Boots +3"}
			
            sets.engaged.DW.MaxHasteMaxAcc = set_combine(sets.engaged.MaxHasteMaxAcc, {main="Almace",sub="Colada",ear2="Suppanomimi"})

   			sets.engaged.Tank = {main="Sequence",sub="Beatific Shield +1",ammo="Staunch Tathlum",
                    head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
                    body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
                    back=SucellosSTP,waist="Windbuffet Belt +1",legs=TaeonLegsTP,feet="Carmine Greaves +1"}
                    
            sets.engaged.DW.Tank = sets.engaged.Tank

   			sets.engaged.TankAcc = {main="Sequence",sub="Beatific Shield +1",ammo="Staunch Tathlum",
                    head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Telos Earring",
                    body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
                    back=SucellosSTP,waist="Kentarch Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
            
            sets.engaged.DW.TankAcc = sets.engaged.TankAcc
            
   			sets.engaged.TH = {main="Almace",sub="Beatific Shield +1",ammo="Ginsen",
                    head="Aya. Zucchetto +2",neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    body="Ayanmo Corazza +2",hands=ChironicTH,ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    back=SucellosSTP,waist="Chaac Belt",legs="Carmine Cuisses +1",feet="Volte Boots"}  --feet="Carmine Greaves +1"
			
            sets.engaged.DW.TH = set_combine(sets.engaged.TH, {main="Sequence",sub="Ternion Dagger +1",ear2="Suppanomimi"})
            
            sets.engaged.MaxHasteCroceaC = {main="Crocea Mors",sub="Beatific Shield +1",ammo="Ginsen",
                    head=TaeonHeadTP,neck="Anu Torque",ear1="Sherida Earring",ear2="Telos Earring",
                    --body="Ayanmo Corazza +2",
                    body="Volte Harness",hands="Aya. Manopolas +2",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
                    --legs=TaeonLegsTP,
                    back=SucellosSTP,waist="Windbuffet Belt +1",legs="Volte Tights",feet="Carmine Greaves +1"}
            
            sets.engaged.DW.MaxHasteCroceaC = set_combine(sets.engaged.MaxHasteCroceaC, {main="Crocea Mors",sub="Kaja Knife",waist="Reiki Yotai",feet=TaeonFeetTP})
            
            sets.TempGear = {}
            --sets.FrontlineWeapons = {main="Sequence",sub="Ternion Dagger +1"}
            sets.FrontlineWeapons = {main="Crocea Mors",sub="Kaja Knife"}
            sets.BacklineWeapons = {main="Bolelabunga",sub="Beatific Shield +1"}
            
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Job-specific hooks that are called to process player actions at specific points in time.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_precast(spell, action, spellMap, eventArgs)
        -- Handle storing gear for Enhancing Potency Frontline Special Case if needed
        if spell.skill == 'Enhancing Magic' then
            if spell.target.type == 'SELF' then
                if EnhancingPotencySpells:contains(spell.english) or spell.english == 'Phalanx' then
                    if state.CombatMode.value == 'Frontline' then
                        --add_to_chat(122,'job_precast store gear')
                        sets.TempGear = {main=player.equipment.main,sub=player.equipment.sub,range=player.equipment.range,ammo=player.equipment.ammo,
                                         head=player.equipment.head,neck=player.equipment.neck,ear1=player.equipment.ear1,ear2=player.equipment.ear2,
                                         body=player.equipment.body,hands=player.equipment.hands,ring1=player.equipment.ring1,ring2=player.equipment.ring2,
                                         back=player.equipment.back,waist=player.equipment.waist,legs=player.equipment.legs,feet=player.equipment.feet}
                    end
                end
            end
        elseif spell.english == 'Sanguine Blade' then
            if spell.element == world.day_element or spell.element == world.weather_element then
                equip(sets.obi[spell.element])
            end
        end
    end
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_midcast(spell, action, spellMap, eventArgs)
        if spell.action_type == 'Magic' then
            -- Default base equipment layer of fast recast.
            equip(sets.midcast.FastRecast)
        end
    end
     
    -- Run after the default midcast() is done.
    -- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
    function job_post_midcast(spell, action, spellMap, eventArgs)
        if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
            equip(sets.buff.Saboteur)
        elseif spell.skill == 'Enhancing Magic' then
            if spell.target.type == 'SELF' then
                 -- Handle re-enabling weapons for Enhancing Potency Frontline Special Case if needed
                if EnhancingPotencySpells:contains(spell.english) then
                    if state.CombatMode.value == 'Frontline' then
                        --add_to_chat(122,'job_post_midcast enable weapons')
                        send_command('gs enable main sub range')
                    end
                    equip(sets.buff.EnhancingPotency)
                elseif spell.english == 'Phalanx' then
                    if state.CombatMode.value == 'Frontline' then
                        --add_to_chat(122,'job_post_midcast enable weapons')
                        send_command('gs enable main sub range')
                    end
                    equip(sets.midcast.Phalanx)
                elseif GainSpells:contains(spell.english) then
                    equip(sets.buff.Gain)
                end
            else
                if buffactive.composure then        
                    equip(sets.buff.ComposureOther)
                end
            end
        elseif spell.skill == 'Elemental Magic' then
            if spell.element == world.day_element or spell.element == world.weather_element then
                equip(sets.obi[spell.element])
            end
        end
    end
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_aftercast(spell, action, spellMap, eventArgs)
        if not spell.interrupted then
            if state.Buff[spell.english] ~= nil then
                state.Buff[spell.english] = true
            end
        end
        -- Handle re-locking weapons and restoring original gear for Enhancing Potency Frontline Special Case if needed
        -- This is the only way this worked, by overriding the aftercast default gearswap
        if EnhancingPotencySpells:contains(spell.english) or spell.english == 'Phalanx' then
            if state.CombatMode.value == 'Frontline' then
                --add_to_chat(122,'job_aftercast restore gear enable weapons')
                equip(sets.TempGear)
                send_command('gs disable main sub range')
                eventArgs.handled = true                
            end
        end
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Customization hooks for idle and melee sets, after they've been automatically constructed.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Custom spell mapping.
    function job_get_spell_map(spell, default_spell_map)
        if spell.action_type == 'Magic' then
            if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') then
                if state.CombatMode.value == 'Frontline' then
                    return "FrontlineCure"
                else
                    return "BacklineCure"
                end
            elseif EnfeebMNDPotencySpells:contains(spell.english) then
                return 'EnfeebMNDPotency'
            elseif MNDPotencySpells:contains(spell.english) then
                return 'MNDPotency'
            elseif MNDAccuracySpells:contains(spell.english) then
                return 'MNDAccuracy'
            elseif INTAccuracySpells:contains(spell.english) then
                return 'INTAccuracy'
            elseif EnhancingDurationSpells:contains(spell.english) then
                return 'EnhancingDuration'
            elseif EnmitySpells:contains(spell.english) then
                return 'EnmityGen'
            end
        end
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- General hooks for other events.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called when a player gains or loses a buff.
    -- buff == buff gained or lost
    -- gain == true if the buff was gained, false if it was lost.
    function job_buff_change(buff, gain)
        if state.Buff[buff] ~= nil then
            state.Buff[buff] = gain
        end
    end
     
    function get_custom_wsmode(spell, action, spellMap, default_wsmode)
        --if default_wsmode == 'Acc' and classes.Daytime then
        --    return 'DaytimeAcc'
        --end
    end
     
    function job_time_change(new_time, old_time)
        --classes.CustomMeleeGroups:clear()
        --if classes.Daytime then
        --    classes.CustomMeleeGroups:append('Daytime')
        --end
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- User code that supplements self-commands.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called by the 'update' self-command, for common needs.
    -- Set eventArgs.handled to true if we don't want automatic equipping of gear.
    function job_update(cmdParams, eventArgs)
        if weapons then
            equip(weapons)
            weapons = nil
            eventArgs.handled = true
        end
    end
     
     
    function job_state_change(stateField, newValue, oldValue)
        if stateField == 'Combat Mode' then
            if newValue == 'Frontline' then
                weapons = sets.FrontlineWeapons
                send_command('wait 0.1; gs disable main sub range')
            else
                weapons = sets.BacklineWeapons
                send_command('wait 0.1; gs enable main sub range')
            end
        end
    end
     
    -- Set eventArgs.handled to true if we don't want the automatic display to be run.
    function display_current_job_state(eventArgs)
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Utility functions specific to this job.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Select default macro book on initial load or subjob change.
    function select_default_macro_book()
        -- Default macro set/book
        --set_macro_page(1, 5)

        -- Default macro set/book
        --if player.sub_job == 'BLM' then
            --set_macro_page(2, 5)
        --elseif player.sub_job == 'NIN' then
            --set_macro_page(8, 5)
        --elseif player.sub_job == 'DNC' then
            --set_macro_page(6, 5)
        --end
    end

