-- WHM TODO List (updated 3/27/2018)

-- Cap JP
-- Erase +1 Relic Neck (NQ or better)
-- FC Neck (Orunmilla's Torque, etc)
-- Cursna set : Vanya Hood?, **Debilis Medallion, Healing Earring, Bishop's Sash, **AF+3 legs, Vanya feet B DO LAST?
-- Cure set : Bishop's Sash, AF+3 hands, HQ Kaykaus pieces
-- Regen : AF+3 legs, Relic +3 Body
-- Enhancing : Telchine for duration, only needs 500 skill.  Gada (have 5% -> Fern Stone +6%), AF+3 feet,
--             Relic +3 legs for Bar spells
-- Pro/Shell : Sheltered Ring
-- Melee Clubs (finish Yagrush, etc)
-- More Refresh+ Idle Gear

-- Initialization function for this job file.
function get_sets()
   mote_include_version = 2
   include('Mote-Include.lua')
end
     
-- Setup vars that are user-independent.
function job_setup()
   event_list = L{}
   event_list:append(windower.register_event('time change', time_change))
end
     
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

   -- States
   state.IdleMode:options('Normal', 'PDT')
   state.CastingMode:options('Normal', 'MB')   
   state.RestingMode:options('Normal')
   state.PhysicalDefenseMode:options('PDT')
   state.MagicalDefenseMode:options('MDT')
   
   CursnaAOE         = false
   DoomAOE           = false

   -- Specific spell sets
   -- TODO
   CureSpells        = S{'Cure','Cure II','Cure III','Cure IV','Cure V','Cure VI'}
   CuragaSpells      = S{'Curaga','Curaga II','Curaga III','Curaga IV','Curaga V','Cura','Cura II','Cura III'}
   LynaSpells        = S{'Paralyna','Silena','Viruna','Erase','Stona','Blindna','Poisona'}
   BarElementSpells  = S{'Barfira','Barfire','Barwater','Barwatera','Barstone','Barstonra','Baraero','Baraera','Barblizzara','Barblizzard','Barthunder','Barthundra'}
   BarStatusSpells   = S{'Baramnesia','Baramnesra','Barvirus','Barvira','Barparalyze','Barparalyzra','Barsilence','Barsilencera','Barpetrify','Barpetra','Barpoison','Barpoisonra','Barblind','Barblindra','Barsleep','Barsleepra'}
   ProShellSpells    = S{'Protectra V','Shellra V','Protect V','Shell V'}
   CursnaSpells      = S{'Cursna'}
   RegenSpells       = S{'Regen','Regen II','Regen III','Regen IV','Regen V'}
   EnhancingSpells   = S{'Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'}
   BanishSpells      = S{'Banish','Banish II','Banish III','Banishga','Banishga II'}
   HolySpells        = S{'Holy','Holy II'}
   MAccSpells        = S{'Repose','Flash','Slow','Paralyze','Silence','Distract','Frazzle','Addle'}
   StoneskinSpells   = S{'Stoneskin'}

   -- Augmented gear pieces
   QuellerCure = { name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}
   QuellerCuraga = { name="Queller Rod", augments={'MND+15','Mag. Acc.+15','"Cure" potency +15%',}}
   GrioEnfeeb = { name="Grioavolr", augments={'Enfb.mag. skill +15','MND+11','Mag. Acc.+30','"Mag.Atk.Bns."+27','Magic Damage +2',}}
   GrioNuke = { name="Grioavolr", augments={'Magic burst mdg.+5%','INT+10','Mag. Acc.+30','"Mag.Atk.Bns."+24','Magic Damage +9',}}
   DarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -5%','Spell interruption rate down -3%',}}
   ChironicRefreshHands = { name="Chironic Gloves", augments={'CHR+1','Accuracy+2','"Refresh"+1','Accuracy+13 Attack+13','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
   ChironicMAccHands = { name="Chironic Gloves", augments={'Mag. Acc.+30','"Fast Cast"+4','Magic Damage +6','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}   
   ChironicDTHands = { name="Chironic Gloves", augments={'MND+1','"Dbl.Atk."+3','Damage taken-4%','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
   ChironicDTFeet = { name="Chironic Slippers", augments={'"Dbl.Atk."+1','MND+5','Damage taken-4%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
   AlaunusMND = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}}
   AlaunusFC = { name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}

end
     
-- Called when this job file is unloaded (eg: job change)
function file_unload()
   -- if binds_on_unload then
   --    binds_on_unload()
   -- end
   -- event_list:map(unregister_event)
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
   
   -- Idle/Resting sets
   sets.idle.Town = {main=QuellerCure,sub="Ammurapi Shield",ammo="Homiliary",
      head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Static Earring",
      body="Ebers Bliaud +1",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Stikini Ring +1",
      back="Solemnity Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

   sets.idle.Field = {main=QuellerCure,sub="Ammurapi Shield",ammo="Homiliary",
      head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Static Earring",
      body="Ebers Bliaud +1",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Stikini Ring +1",
      back="Solemnity Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"} 
      
   sets.idle.Weak = sets.idle.Field
   sets.resting = sets.idle.Field

   -- Precast Sets
           
   -- Precast sets to enhance JAs
   sets.precast.JA['Devotion'] = {body="Piety Cap +1"}
   sets.precast.JA['Benediction'] = {body="Piety Briault +1"}
   sets.precast.JA['Martyr'] = {body="Piety Mitts +1"}
                
   -- Fast Cast 80% needed (or as much as possible)
   -- Grio +4% - TRY TO USE CLUB if possible to avoid blinking
   -- Clerisy Strap +3%
   -- Nahtirah Hat +10%
   -- Orunmilla's Torque NEED 5%
   -- Loquac. Earring +2%
   -- Enchntr. Earring +1 +2%
	-- Inyanga Jubbah +2 14%
   -- Gende. Gages +1 +7%
   -- Weather. Ring +5%
   -- Kishar Ring +4%
   -- Alaunus FC +10%
   -- Witful Belt +3%
   -- Aya. Cosciales +2 +6%
   -- Regal Pumps +1 5%-7%
   
   -- 73-75% Fast Cast, can get 78-80 w/ neck, and cap from +2 gears or ammo
   
   -- Quick Cast 10% cap
   -- Impatiens +2%
   -- Weather. Ring +3%
   -- 5% QC < 10% cap
   
   sets.precast.FC = {main=GrioEnfeeb,sub="Clerisy Strap +1",ammo="Impatiens",
      head="Nahtirah Hat",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
      body="Inyanga Jubbah +2",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Weather. Ring",
      back=AlaunusFC,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
      
   sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, 
      {legs="Ebers Pant. +1"})  
     
   -- Midcast Sets

   sets.midcast.FastRecast = {ammo="Hasty Pinion +1",
      head="Nahtirah Hat",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
      body="Inyanga Jubbah +2",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Weather. Ring",
      back=AlaunusFC,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Regal Pumps +1"}
  
   sets.midcast.Cure = {main=QuellerCure,sub="Sors Shield",ammo="Quartz Tathlum +1",
      head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Glorious Earring",ear2="Regal Earring",
      body="Ebers Bliaud +1",hands="Theophany Mitts +2",ring1="Lebeche Ring",ring2="Stikini Ring +1",
      back=AlaunusMND,waist="Luminary Sash",legs="Ebers Pant. +1",feet="Kaykaus Boots"}

   sets.midcast.Curaga = {main=QuellerCuraga,sub="Sors Shield",ammo="Quartz Tathlum +1",
      head="Gende. Caubeen +1",neck="Nuna Gorget +1",ear1="Glorious Earring",ear2="Regal Earring",
      body="Theo. Briault +1",hands="Theophany Mitts +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
      back=AlaunusMND,waist="Luminary Sash",legs="Ebers Pant. +1",feet="Kaykaus Boots"}
      
   -- Includes Torque for Erase   
   sets.midcast.Lyna = {main="Yagrush",sub="Thuellaic Ecu +1",ammo="Hasty Pinion +1",
      head="Nahtirah Hat",neck="Cleric's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
      body="Inyanga Jubbah +2",hands="Ebers Mitts +1",ring1="Kishar Ring",ring2="Weather. Ring",
      back="Mending Cape",waist="Witful Belt",legs="Ebers Pant. +1",feet="Gende. Galosh. +1"}
   
   sets.midcast.Cursna = {main="Gada",  -- needs augs .. FC, ConserveMP, -Enmity
      sub="Sors Shield",
      ammo="Hasty Pinion +1",
                                        -- head="Vanya Hood",   NEED?
      neck="Malison Medallion",         -- neck="Debilis Medallion"   NEED
      ear1="Beatific Earring",
                                        -- ear2="Healing Earring"   NEED
      body="Ebers Bliaud +1",
      hands="Fanatic Gloves",
      ring1="Haoma's Ring",        
      ring2="Haoma's Ring",
      back=AlaunusFC,
                                        -- waist="Bishop's Sash",   NEED
      legs="Th. Pantaloons +2",         -- legs="Th. Pant. +3",     NEED
      feet="Gende. Galosh. +1"          -- Vanya at high cursna%??
   }

   sets.midcast.DoomAOE = set_combine(sets.midcast.Cursna,{main="Yagrush"})
   sets.midcast.CursnaAOE = sets.midcast.Lyna
   
   sets.midcast.BarElement = {main="Beneficus",sub="Ammurapi Shield",
      head="Ebers Cap +1",neck="Incanter's Torque",
      body="Ebers Bliaud +1",hands="Ebers Mitts +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
      back=AlaunusMND,waist="Luminary Sash",legs="Piety Pantaln. +1",feet="Ebers Duckbills +1"}

   sets.midcast.BarStatus = {main="Gada",sub="Ammurapi Shield",
      head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",
      ring1="Stikini Ring +1",ring2="Stikini Ring +1",
      legs="Piety Pantaln. +1",feet="Theo. Duckbills +1"}

   sets.midcast.Enhancing = {main="Gada",sub="Ammurapi Shield",
      head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",
      ring1="Stikini Ring +1",ring2="Stikini Ring +1",
      legs="Piety Pantaln. +1",feet="Theo. Duckbills +1"}
      
   sets.midcast.Haste = set_combine(sets.midcast.Enhancing, {head="Telchine Cap",legs="Telchine Braconi"})
   sets.midcast.Flurry = sets.midcast.Haste
   sets.midcast.Refresh = sets.midcast.Haste
  
   sets.midcast.ProShell = set_combine(sets.midcast.Enhancing, 
      {legs="Piety Pantaln. +1",feet="Piety Duckbills +1"})
   
   sets.midcast.Auspice = set_combine(sets.midcast.Enhancing, 
      {feet="Ebers Duckbills +1"})  

   sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, 
      {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})  

   sets.midcast.Regen = set_combine(sets.midcast.Enhancing, 
      {main="Bolelabunga",sub="Sors Shield",head="Inyanga Tiara +2",body="Piety Briault +1",hands="Ebers Mitts +1",legs="Th. Pantaloons +2",feet="Telchine Pigaches"})

   sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing,  
      {head="Chironic Hat",legs="Shedir Seraweels"})
      
   sets.midcast.MagicAcc = {main=GrioEnfeeb,sub="Clerisy Strap +1",ammo="Pemphredo Tathlum",
      head="Chironic Hat",neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
      body="Chironic Doublet",hands=ChironicMAccHands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
      back=AlaunusMND,waist="Luminary Sash",legs="Chironic Hose",feet="Aya. Gambieras +2"}
      
   --- PDT / MDT / MEva / MDB (Cap : 50%, 50%)
   -- (Shell V) 0% / 29%
   -- Terra's Staff 20% / 0% /  0 /  0  PDT
   -- Enki Strap 0%/ 0% / 10 / 0
   -- Staunch Tathlum 
   -- Inyanga Tiara +2 - 0% / 5% / 114 / 8     (Aya. Zucchetto +2 - 2% / 2% / 53 / 3)
   -- Loricate Torque +1 - 6% / 6%
   -- Etiolation Earring - 0% / 3%
   -- Static Earring - 0% / 0% / 0% / 2
   -- Ayanmo Corazza +2 - 6% / 6% / 64 / 6     (Inyanga +1 114 meva 7 mdt 11 mdb)
   -- Chironic DT Gloves - 4% / 4% / 48 / 3    (Inyanga +1 71 meva, 5 mdt 5 mdb)
   -- Left Dark Ring - 4% / 5%
   -- Right Dark Ring - 4% / 4%
   -- Solemnity Cape - 4% / 4%
   -- Inyanga Shalwar +2 - 0% / 4% / 147 / 9
   -- Chironic DT Feet - 6% / 4% / 118 / 6
   -- Totals 54% / >50% / 495 / 34
   
   sets.defense.PDT = {main="Terra's Staff",sub="Enki Strap",ammo="Staunch Tathlum",
      head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Static Earring",
      body="Ayanmo Corazza +2",hands=ChironicDTHands,ring1="Defending Ring",ring2=DarkRing,
      back="Solemnity Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet=ChironicDTFeet}

   --- PDT / MDT / MEva (Cap : 50%, 50%)
   -- (Shell V) 0% / 29%
   -- Terra's Staff 20% / 0% /  0 /  0  PDT
   -- Enki Strap 0% / 0% / 10 / 0
   -- Staunch Tathlum 
   -- Inyanga Tiara +2 - 0% / 5% / 114 / 8
   -- Loricate Torque +1 - 6% / 6%
   -- Etiolation Earring - 0% / 3%
   -- Static Earring - 0% / 0% / 0% / 2
   -- Inyanga Jubbah +2 - 0% / 8% / 120 / 11
   -- Inyan. Dastanas +2 - 0% / 4% / 77 / 5
   -- Inyanga Ring - 0% / 2% / 12
   -- Right Dark Ring - 4% / 4%
   -- Solemnity Cape - 4% / 4%
   -- Inyanga Shalwar +2 - 0% / 6% / 147 / 9
   -- Inyan. Crackows +2 - 0% / 3% / 147 / 8
   -- Totals 34% / >50% / 627 / 43
           
   sets.defense.MDT = {main="Terra's Staff",sub="Enki Strap",ammo="Staunch Tathlum",
      head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Static Earring",
      body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Defending Ring",
      back="Solemnity Cape",waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
   
   -- Basic Melee Sets
   sets.engaged = {ammo="Jukukik Feather",
      head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Dedition Earring",ear2="Suppanomimi",
      body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
      back="Solemnity Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

   sets.precast.WS = {ammo="Quartz Tathlum +1",
      head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
      body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Stikini Ring +1",ring2="Rufescent Ring",
      back=AlaunusMND,waist="Fotia Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
      
   sets.precast.WS['Realmrazer'] = {ammo="Quartz Tathlum +1",
      head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
      body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Stikini Ring +1",ring2="Rufescent Ring",
      back=AlaunusMND,waist="Fotia Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

   sets.precast.WS['Mystic Boon'] = {ammo="Quartz Tathlum +1",
      head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
      body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Stikini Ring +1",ring2="Rufescent Ring",
      back=AlaunusMND,waist="Fotia Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
        
end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Job-specific hooks that are called to process player actions at specific points in time.
    -------------------------------------------------------------------------------------------------------------------
     
    function job_self_command(cmdParams, eventArgs)
        if cmdParams[1] == 'cursnaAOE' then
             --add_to_chat(122,'cursnaAOE cmd')
             CursnaAOE = true
             send_command('@input /ma "Cursna" <t>')
        elseif cmdParams[1] == 'doomAOE' then 
             --add_to_chat(122,'doomAOE cmd')
             DoomAOE = true
             send_command('@input /ma "Cursna" <t>')
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
         --add_to_chat(122,'job_post_midcast')
         if spell.english == "Cursna" and DoomAOE == true then
            --add_to_chat(122,'job_post_midcast equipping DoomAOE')
            equip(sets.midcast.DoomAOE)
         elseif spell.english == "Cursna" and CursnaAOE == true then
            --add_to_chat(122,'job_post_midcast equipping CursnaAOE')
            equip(sets.midcast.CursnaAOE)
         end
         DoomAOE = false
         CursnaAOE = false
    end
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_aftercast(spell, action, spellMap, eventArgs)
        if not spell.interrupted then
            if state.Buff[spell.english] ~= nil then
                state.Buff[spell.english] = true
            end
        end
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Customization hooks for idle and melee sets, after they've been automatically constructed.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Custom spell mapping.
    function job_get_spell_map(spell, default_spell_map)
       if spell.action_type == 'Magic' then
          if CureSpells:contains(spell.english) then
             return 'Cure'
          elseif CuragaSpells:contains(spell.english) then
             return 'Curaga'
          elseif LynaSpells:contains(spell.english) then
             return 'Lyna'
          elseif CursnaSpells:contains(spell.english) then
             return 'Cursna' 
          elseif ProShellSpells:contains(spell.english) then
             return 'ProShell'
          elseif BarElementSpells:contains(spell.english) then             
             return 'BarElement'
          elseif BarStatusSpells:contains(spell.english) then         
             return 'BarStatus'
          elseif EnhancingSpells:contains(spell.english) then
             return 'Enhancing'
          elseif StoneskinSpells:contains(spell.english) then
             return 'Stoneskin'
          elseif RegenSpells:contains(spell.english) then
             return 'Regen'
          elseif MAccSpells:contains(spell.english) then
             return 'MagicAcc'
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
    end
     
    function job_time_change(new_time, old_time)
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
        local defenseString = ''

        if state.Defense.Active then
            local defMode = state.Defense.PhysicalMode

            if state.Defense.Type == 'Magical' then
                defMode = state.Defense.MagicalMode
            end

            defenseString = 'Defense: '..state.Defense.Type..' '..defMode..', '
        end
     
        local meleeString = ''
        if state.OffenseMode == 'Normal' then
            --meleeString = 'Melee: Weapons locked, '
        end
     
        add_to_chat(122,'Combat ['..state.CombatMode..'], '..meleeString..'Casting ['..state.CastingMode..'], '..meleeString..
         'Idle ['..state.IdleMode..'], '..defenseString..'Kiting: '..on_off_names[state.Kiting])
     
        eventArgs.handled = true
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

