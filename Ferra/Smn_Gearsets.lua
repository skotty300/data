-- Setup your Key Bindings here:  
    windower.send_command('bind f7 gs c toggle mb')
    windower.send_command('bind f9 gs c avatar mode')
    windower.send_command('bind f10 gs c toggle auto')
    windower.send_command('bind f11 gs c toggle melee')
     
     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
      
    -- Your idle set when you DON'T have an avatar out
    sets.me.idle = {main="Nirvana",sub="Elan strap +1",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",ear1="Evans Earring",ear2="Gelos Earring",neck="Sanctity Necklace",
		body="Shomonjijoe +1",hands="Asteria mitts +1",ring1="Evoker's Ring",ring2="Varar Ring +1",
        back="Campestres's Cape",waist="Lucidity Sash",legs="Assiduity pants +1",feet="Baayami Sabots +1"}
		
	      
          
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = {main="Nirvana",sub="Elan strap +1",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="Evans Earring",ear2="Gelos Earring",
		body="Shomonjijoe +1",hands="Asteria mitts +1",ring1="Evoker's Ring",ring2="Varar Ring +1",
        back="Campestres's Cape",waist="Lucidity Sash",legs="Assiduity pants +1",feet="Baayami Sabots +1"}
  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Asteria Mitts +1"}
	
	sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
      
    -- When we want our avatar to shred
    
      
    -- When we want our avatar to hit
    sets.avatar.melee = {main="Was +1",sub="Vox Grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",ear1="Evans Earring",ear2="Gelos Earring",
		body="Shomonjijoe +1",hands="Merlinic Dastanas",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Campestres's Cape",waist="Incarnation Sash",legs="Apogee Slacks +1",feet="Helios Boots"}
      
    -- When Avatar's Favor is active
    
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {main="Was +1",sub="Vox Grip",ammo="Sancus Sachet +1",
        head="Baayami Hat",neck="Melic Torque",ear1="Gelos Earring",ear2="Smn. Earring",
        body="Baayami Robe",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2="Stikini Ring",
        back="Conveyance Cape",waist="Lucidity Sash",legs="Baayami Slops",feet="Baayami Sabots +1"}
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk = {main="Was +1",sub="Elan strap +1",ammo="Sancus Sachet +1",
        head="Helios Band",neck="Summoner's Collar +2",ear1="Kyrene's Earring",ear2="Gelos Earring", 
        body="Convoker's Doublet +3",hands="Merlinic Dastanas",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Campestres's Cape",waist="Incarnation sash",legs="Apogee Slacks +1",feet="Helios Boots"}
    
      
    -- Magic Attack
    sets.avatar.mab = set_combine(sets.avatar.skill,{main="Espiritus",sub="Elan strap +1",ammo="Sancus Sachet +1",
        head="Apogee Crown +1",neck="Summoner's Collar +2",ear1="Kyrene's Earring",ear2="Gelos Earring",
        body="Convoker's Doublet +3",hands="Merlinic Dastanas",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Campestres's Cape",waist="Regal Belt",legs="Enticer's Pants",feet="Apogee Pumps +1"})
    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers +1"})
    -- Hybrid
    sets.avatar.hybrid = {main="Was +1",
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Apogee Crown +1",
    body="Con. Doublet +3",
    hands="Merlinic Dastanas",
    legs="Apogee Slacks +1",
    feet="Apogee Pumps +1", 
    neck="Summoner's Collar +2",
    waist="Regal Belt",
    left_ear="Kyrene's Earring",
    right_ear="Gelos Earring",
    left_ring="Varar Ring +1",
    right_ring="Varar Ring +1",
    back="Campestres's Cape"}
        
      
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{main="Espiritus",sub="Elan strap +1",ammo="Sancus Sachet +1",
        head="Apogee Crown +1",neck="Summoner's Collar +2"
		,ear1="Smn.Earring",ear2="Gelos Earring",
        body="Convoker's Doublet +3",hands="Merlinic Dastanas",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Campestres's Cape",waist="Regal Belt",legs="Apogee Slacks +1",feet="Apogee Pumps +1"})
    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers +1"})
      
    -- Buffs
    sets.avatar.buff = sets.avatar.skill
      
    -- Other
    sets.avatar.other = sets.avatar.skill
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = sets.avatar.perp
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {main="Was +1",head="Sukeroku Hachimaki",neck="Combatant's Torque",
	ear1="Friomisi Earring",ear2="Tati Earring",body='Onca suit',ring1="Shiva Ring",ring2="Rajas Ring"}
    sets.me["Garland of Bliss"] = {main="Espiritus",head="Sukeroku Hachimaki",neck="Combatant's Torque",ear1="Friomisi Earring",ear2="Tati Earring",
    body='Onca suit',ring1="Shiva Ring",ring2="Rajas Ring"}
      
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
    sets.precast.casting = {main="Was +1",head="Psycloth Tiara",body="Baayami Robe",ear1="Loquac. Earring",hands="Glyphic Bracers +1",
		ring1="Prolix Ring",ring2="Weatherspoon Ring",back="Swith Cape",waist="Witful Belt",legs="Psycloth lappas",
		feet="Merlinic Crackows"}   
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = sets.precast.casting
        
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = sets.precast.casting
       
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin =  sets.precast.casting
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = sets.precast.casting
      
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp = {main="Was +1",ammo="Sancus Sachet +1",head="Convoker's Horn +1",ear1="Evans Earring",body="Convoker's Doublet +3",
		ear2="Smn. Earring",back="Conveyance Cape",legs="Baayami Slops",hands="Glyphic Bracers +1",feet="Glyphic Pigaches +1"}

    
      
    -- Mana Cede
    sets.precast["Mana Cede"] = {hands="Callers Bracers +1"}
        
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {head="Glyphic Horn +1",}
	
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    
      
    -- Enhancing
    
        
      
    -- Stoneskin
    
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = sets.avatar.skill
        
    -- Cure Potency
    
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end

