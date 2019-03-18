-- Setup your Key Bindings here:  
    windower.send_command('bind f7 gs c toggle mb')
    windower.send_command('bind f9 gs c avatar mode')
    windower.send_command('bind f10 gs c toggle auto')
    windower.send_command('bind f12 gs c toggle melee')
     
     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
      
    -- Your idle set when you DON'T have an avatar out
    sets.me.idle = {
	body="Shomonjijoe +1",
	legs="Assiduity pants +1",
    }
      
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 
    }
      
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = {
    main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus sachet",
    sub="Elan Strap +1",
    ammo="Sancus sachet +1",
    head="Beckoner's horn +1",
    body={ name="Glyphic Doublet +1", augments={'Reduces Sp. "Blood Pact" MP cost',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Blood Pact Dmg.+9','Pet: Mag. Acc.+3',}},
    legs="Assid. Pants +1",
    feet="Convoker's pigaches +2",
    feet="Convoker's pigaches +3",
    neck="Caller's pendant",
    waist="Isa Belt",
    left_ear="Enmerkar earring",
    right_ear="Lugalbanda earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Campestres's Cape",
    }
  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Asteria Mitts +1"}
    sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{
    })
      
    -- When we want our avatar to shred
    sets.avatar.melee = set_combine(sets.avatar.perp,{
    })
      
    -- When we want our avatar to hit
    sets.avatar.acc = set_combine(sets.avatar.perp,{
    main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
    sub="Elan Strap",
    ammo="Sancus sachet",
--    head={ name="Apogee Crown", augments={'MP+60','Pet: Attack+30','Blood Pact Dmg.+7',}},
    head={ name="Helios Band", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
--    body="Tali'ah Manteel",
	body="Convoker's doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Blood Pact Dmg.+9','Pet: Mag. Acc.+3',}},
--    legs="Beckoner's spats +1",
--	legs="Tali'ah seraweels",
--    feet={ name="Apogee Pumps", augments={'MP+60','Pet: Attack+30','Blood Pact Dmg.+7',}},
--	feet="Tali'ah Crackows +1",
    legs="Apogee Slacks +1",
	feet="Convoker's pigaches +2",
	neck="Shulmanu collar",
    waist="Isa Belt",
    left_ear="Gelos Earring",
    right_ear="Lugalbanda earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
      })
      
    -- When Avatar's Favori s active
    sets.avatar.favor = set_combine(sets.avatar.perp,{
        head="Beckoner's horn +1",
    })
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {
    }
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk = set_combine(sets.avatar.skill,{
    main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
--	main="Was",
	sub="Elan Strap",
    ammo="Sancus sachet",
    head="Apogee Crown +1", 
--    head={ name="Helios Band", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
--    body="Tali'ah Manteel",
	body="Convoker's doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Blood Pact Dmg.+9','Pet: Mag. Acc.+3',}},
--    legs="Enticer's pants",
--	legs="Tali'ah seraweels",
--    feet={ name="Apogee Pumps", augments={'MP+60','Pet: Attack+30','Blood Pact Dmg.+7',}},
--	feet="Tali'ah Crackows +1",
    legs="Apogee Slacks +1",
	feet="Convoker's pigaches +2",
	neck="Shulmanu collar",
    waist="Incarnation sash",
    left_ear="Gelos Earring",
    right_ear="Lugalbanda earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
 -- briga's stuff
--	main="Nirvana",
 --   sub="Elan Strap +1",
--    ammo="Sancus Sachet +1",
--    body="Con. Doublet +3",
--    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+10 Pet: Rng. Acc.+10','Blood Pact Dmg.+10','Pet: AGI+5','Pet: "Mag.Atk.Bns."+12',}},
--    legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
--    left_ear="Lugalbanda Earring",
--	feet="Convoker's pigaches +3",
--    left_ring="Varar Ring +1",
--    right_ring="Varar Ring +1",
--    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
 })
    sets.avatar.pacc = set_combine(sets.avatar.atk,{
    })
      
    -- Magic Attack
    sets.avatar.mab = set_combine(sets.avatar.skill,{
    main="Espiritus",
    sub="Elan Strap",
    ammo="Sancus sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
	body="Convoker's doublet +2",
--    body="Shomonjijoe +1",
    hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+25 Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+1','Pet: "Mag.Atk.Bns."+14',}},
--    legs="Apogee Slacks",
--    legs="Helios Spats",
    legs="Enticer's pants",
	feet="Convoker's pigaches +2",
--    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Adad amulet",
    waist="Incarnation sash",
    left_ear="Gelos Earring",
    right_ear="Lugalbanda earring",
    left_ring="Speaker's ring",
--	left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
-- briga's stuff
    main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+3','Pet: "Mag.Atk.Bns."+22',}},
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+8','Pet: Mag. Acc.+11',}},
    legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Adad Amulet",
    waist="Regal Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
  })
    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers +1"})
    -- Hybrid
    sets.avatar.hybrid = set_combine(sets.avatar.skill,{
    main="Espiritus",
    sub="Elan Strap",
    ammo="Sancus sachet",
    head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
--    body="Shomonjijoe +1",
	body="Convoker's doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+25 Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+1','Pet: "Mag.Atk.Bns."+14',}},
--    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Blood Pact Dmg.+9','Pet: Mag. Acc.+3',}},
    legs="Apogee Slacks +1",
--    legs="Beckoner's spats +1",
--    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
	feet="Convoker's pigaches +2",
    neck="Shulmanu collar",
    waist="Incarnation sash",
    left_ear="Gelos Earring",
    right_ear="Lugalbanda earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
-- briga's stuff
    main="Nirvana",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+8','Pet: Mag. Acc.+11',}},
    legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
    neck="Adad Amulet",
    waist="Regal Belt",
    left_ear="Lugalbanda Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
    })
      
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{
    })
      
    -- Buffs
    sets.avatar.buff = set_combine(sets.avatar.skill,{
    })
      
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{
    })
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = set_combine(sets.avatar.perp,{
    })
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {
    }
    sets.me["Garland of Bliss"] = {
    }
      
    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
	main={ name="Grioavolr", augments={'Magic burst dmg.+8%','Mag. Acc.+18','"Mag.Atk.Bns."+19','Magic Damage +1',}},
    sub="Vivid Strap",
    ammo="Sancus Sachet",
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+27','"Fast Cast"+6','MND+8','Mag. Acc.+11',}},
    body="Zendik robe",
    hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Blood Pact Dmg.+9','Pet: Mag. Acc.+3',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+30','"Fast Cast"+6','CHR+8',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",

    }   
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = set_combine(sets.precast.casting,{
    })
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{
    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{
    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
 	main="Serenity",
    hands="Bokwus gloves",
	feet="Skaoi Boots",
	})
      
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp = {
    main="Espiritus",
    sub="Elan Strap",
        ranged="",
        ammo="Sancus sachet",
        head="Beckoner's horn +1",
--        body="Glyphic doublet +1",
		body="Shomonjijoe +1",
		hands="Glyphic bracers +1",
        lring="Lugalbanda earring",
        feet="Glyphic pigaches +1"
    }
      
    -- Mana Cede
    sets.precast["Mana Cede"] = {
    }
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
    }
      
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
    }
      
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.midcast.casting,{
    })
      
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{
    })
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = set_combine(sets.avatar.skill,{
    })
        
    -- Cure Potency
    sets.midcast.cure = set_combine(sets.midcast.casting,{
    })
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end
