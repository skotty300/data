------------------------------------------------------------------------------------------------------------------
-- Thief Lua :: Hopefulki :: Base by Motenten --
------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
function get_sets()
	mote_include_version = 2
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false
	include('Mote-TreasureHunter')

--Haste Toggle, so you can activate if you are receiving Haste I or II--
	state.HasteMode = M{['description']='Haste Mode','Haste I','Haste II'}
	
-- TH mode handling
	-- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
	tag_with_th = false	
	
	tp_on_engage = 0
	
-- Calls Haste Function--
	determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','Crit')
	state.DefenseMode:options('None','Physical','Magical','Evasion')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.RestingMode:options('Normal')
	state.RangedMode:set('Normal')
	state.IdleMode:options('Normal', 'Regen')
	state.FrenzyMode:options('Off','On')
	
    -- Additional local binds
	send_command('bind ^` input /ja "Flee" <me>')
	send_command('bind !c gs c cycle IdleMode')
	send_command('bind !q gs c cycle treasuremode')
	send_command('bind !w gs c cycle FrenzyMode')
	send_command('bind !a gs c cycle HasteMode')	
	send_command('bind !z gs c cycle OffenseMode')
	send_command('bind !x gs c cycle WeaponskillMode')
	
	send_command('bind f2 gs c set DefenseMode Physical')
	send_command('bind f3 gs c set DefenseMode Evasion')
	send_command('bind f4 gs c set DefenseMode Magical')
	send_command('bind f5 gs c reset DefenseMode')
	
	send_command('bind !d gs c update user')
	send_command('bind ^q fillmode 1')
	send_command('bind ^w fillmode 0')
	select_default_macro_book()
	
	-- Individual Gear Pieces --
	
	TaeonFeet = {}
	TaeonFeet.DW = {name="Taeon Boots", augments={'Accuracy+25','"Dual Wield"+5','STR+6 DEX+6',}}
	
	TaeonBody = {}
	TaeonBody.FC ={name="Taeon Tabard", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','"Fast Cast"+5','Pet: Damage taken -3%',}}
	
	HerculeanHelm = {}
	HerculeanHelm.DW = {name="Herculean Helm", augments={'Rng.Atk.+12','"Dual Wield"+5','AGI+2','Accuracy+15',}}
	
	HerculeanHands = {}
	HerculeanHands.DW = {name="Herculean Gloves", augments={'Attack+20','"Dual Wield"+5','DEX+1','Accuracy+7',}}
	
	HerculeanLegs = {}
	HerculeanLegs.MAB ={name="Herculean Trousers", augments={'Weapon skill damage +4%','INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+10'}}
	
	HerculeanVest = {}
    HerculeanVest.CDC  = {name="Herculean Vest", augments={'Attack+11','Weapon skill damage +4%','DEX+10','Accuracy+1',}}
	HerculeanVest.RSUS = {name="Herculean Vest", augments={'Attack+13','Weapon skill damage +4%','DEX+12','Accuracy+7',}}
	
	HerculeanFeet = {}
    HerculeanFeet.TA = {name="Herculean Boots", augments={'Attack+26','"Triple Atk."+4','DEX+6','Accuracy+14',}}
	HerculeanFeet.WSD = {name="Herculean Boots", augments={'Mag. Acc.+9 "Mag.Atk.Bns."+9','Weapon skill damage +3%','STR+1','Mag. Acc.+1','"Mag.Atk.Bns."+15',}}
	HerculeanFeet.MAB = {name="Herculean Boots", augments={'Mag. Acc.+9 "Mag.Atk.Bns."+9','Weapon skill damage +3%','STR+1','Mag. Acc.+1','"Mag.Atk.Bns."+15',}}
	
	Toutatis = {}
	Toutatis.DW = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}}
	Toutatis.STP = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	Toutatis.WS = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
			
	RawhideRefresh ={name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}}
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !c')
    send_command('unbind !q')
    send_command('unbind !w')
    send_command('unbind !a')
    send_command('unbind !z')
    send_command('unbind !x')
    send_command('unbind !d')
    send_command('unbind ^q')
    send_command('unbind ^w')
	send_command('unbind f2')
	send_command('unbind f3')
	send_command('unbind f4')
	
end

-- Define sets and vars used by this job file.
function init_gear_sets()
------------------------------------------------------------------------------------------------
---------------------------------------- Precast/JA Sets ---------------------------------------
------------------------------------------------------------------------------------------------

	--sets.organizer ={"Kaja Knife"}

    sets.TreasureHunter = {hands="Plunderer's Armlets +1", waist="Chaac Belt", feet="Skulk. Poulaines +1"}
	sets.FrenzySallet = {head="Frenzy Sallet"}
	sets.Kiting = {feet="Jute Boots +1"}

	sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet +1"}
	sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet +1"}
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
	sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
	sets.precast.JA['Conspirator'] = {body="Raider's Vest +2"}
	sets.precast.JA['Steal'] = {hands="Pillager's Armlets +1",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
	sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Skulk. Poulaines +1"}
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {legs="Plun. Culottes +3",}

	sets.precast.Step = set_combine(sets.TreasureHunter, {})
    sets.precast.Flourish1 = set_combine(sets.TreasureHunter, {})
    sets.precast.JA.Provoke = set_combine(sets.TreasureHunter, {})
	
	sets.precast.JA['Sneak Attack'] = {}

	sets.precast.JA['Trick Attack'] = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
	ammo="Yamarang",
	body="Passion Jacket", --13%
	}
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells

	sets.precast.FC = { --35% (Cap 80)
	left_ring="Prolix Ring", --2%
	neck="Orunmila's Torque", --5%
	body=TaeonBody.FC, --9%
	right_ring="Weather. Ring", --5%	
	right_ear="Enchntr. Earring +1", --2% 
	left_ear="Loquac. Earring", --2%
	ammo="Sapience Orb", --2%
	hands="Leyline Gloves", --7%
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
	neck="Magoraga Beads", --10% (Net 5 Gain)
	body="Passion Jacket" --10%
	})

-- Ranged snapshot gear
	sets.precast.RA = {}
       
-- Ranged gear
	sets.midcast.RA = {}

	sets.midcast.RA.Acc = {}

	sets.midcast.RA.TH = set_combine(sets.midcast.RA, sets.TreasureHunter)

	sets.midcast.RA.TH.Acc = set_combine(sets.midcast.RA.Acc, sets.TreasureHunter)
	
------------------------------------------------------------------------------------------------
---------------------------------------- Resting/Idle Sets -------------------------------------
------------------------------------------------------------------------------------------------

	sets.resting = {}
	
-- Refresh sets	
	sets.latent_refresh = {left_ring ="Stikini Ring +1", right_ring = "Stikini Ring +1",head=RawhideRefresh}
	
-- Idle Sets --
	
	sets.idle.Town = {ammo="Yetshila +1",
    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
    body={ name="Plunderer's Vest +3", augments={'Enhances "Ambush" effect',}},
    hands="Turms Mittens +1",
    legs="Plun. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}
	
	sets.idle.Town.Regen = set_combine(sets.idle.Town, {})
	
	sets.idle.Field = {ammo="Staunch Tathlum +1",
    head="Turms Cap +1",
    body="Tu. Harness +1",
    hands="Turms Mittens +1",
    legs="Turms Subligar +1",
    feet="Jute Boots +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Infused Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}
	
	sets.idle.Weak = {ammo="Staunch Tathlum +1",
    head="Turms Cap +1",
    body="Tu. Harness +1",
    hands="Turms Mittens +1",
    legs="Turms Subligar +1",
    feet="Jute Boots +1",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Infused Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}

	sets.idle.Field.Regen = set_combine(sets.idle.Field, {
    ammo="Staunch Tathlum +1",
    head="Turms Cap +1",
    body="Tu. Harness +1",
    hands="Turms Mittens +1",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Bathy Choker +1",
    waist="Flume Belt +1",
    left_ear="Dawn Earring",
    right_ear="Infused Earring",
    left_ring="Defending Ring",
    right_ring="Sheltered Ring",
    back="Moonlight Cape",})
	
-- Midcast Sets --

	sets.midcast.FastRecast = set_combine(sets.defense.Evasion, {
	left_ring="Prolix Ring", --2%
	neck="Orunmila's Torque", --5%
	body=TaeonBody.FC, --9%
	right_ring="Weather. Ring", --5%	
	right_ear="Enchntr. Earring +1", --2% 
	left_ear="Loquac. Earring", --2%
	ammo="Sapience Orb", --2%
	hands="Leyline Gloves", --7%
	})

	-- Specific spells
	
	sets.midcast.Utsusemi = set_combine(sets.defense.Evasion, {})

	sets.ExtraRegen =  {
    head="Turms Cap +1",
    body="Tu. Harness +1",
    hands="Turms Mittens +1",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Bathy Choker +1",
    left_ear="Dawn Earring",
    right_ear="Infused Earring",
	right_ring="Sheltered Ring",}

	
------------------------------------------------------------------------------------------------
---------------------------------------- Engaged Sets ------------------------------------------
------------------------------------------------------------------------------------------------	
 -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- * THF Native DW IV Trait w/ Gift: 30% DW

	--Haste 0% = 44 DW
	--Haste 10% = 40 DW
	--Haste 15% = 37 DW
	--Haste 30% = 26 DW
	--Haste Cap = 6 DW
	
-- No Magic Haste (44% DW to cap) [Currently @ 41%]

sets.engaged = {ammo="Yamarang",
    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Pill. Culottes +3",
    feet=TaeonFeet.DW, --9%
    neck="Asn. Gorget +2",
    waist="Reiki Yotai", --7%
    left_ear="Eabani Earring", --4%
    right_ear="Suppanomimi", --5%
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back=Toutatis.DW, --10%
	}
	
	sets.engaged.Acc = set_combine(sets.engaged,{
    ammo="Yamarang",
    head="Pill. Bonnet +3",
    body="Pillager's Vest +3",
    hands="Turms Mittens +1",
    legs="Pill. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.STP, --10%
	})	
		
	sets.engaged.Crit = set_combine(sets.engaged,{ 
	ammo="Yetshila +1",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
	right_ring="Hetairoi Ring",})
	
	sets.engaged.PDT = {--48% PDT and 30% MDT
	ammo="Staunch Tathlum +1", --3% DT
	head="Turms Cap +1",
    body="Meg. Cuirie +2", --8% PDT
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2", --6% PDT
    feet="Turms Leggings +1",
    neck="Loricate Torque +1", --6% DT
    waist="Flume Belt +1", --4% PDT
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring", --10% DT
    right_ring="Moonlight Ring", --5% DT
    back="Moonlight Cape" --6% DT
	}
	
	sets.engaged.MDT = { --Assumes Shellra V from Trust (-24% MDT) + 29% = Over Cap
	ammo="Staunch Tathlum +1", --3% DT
    head="Turms Cap +1",
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands="Meg. Gloves +2",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Warder's Charm +1",
    waist="Reiki Yotai", --Engraved Belt
    left_ear="Etiolation Earring", --3%
    right_ear="Odnowa Earring +1", --2%
    left_ring="Defending Ring", --10%
    right_ring="Moonlight Ring", --5%
    back="Moonlight Cape"--6%
	}


-- Low Haste Sets --
-- 10% Magic Haste (40% DW to cap) [Currently @ 41%, over cap by 1]
	
	sets.engaged.LowHaste = {ammo="Yamarang",
    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Pill. Culottes +3",
    feet=TaeonFeet.DW, --9%
    neck="Asn. Gorget +2",
    waist="Reiki Yotai", --7%
    left_ear="Eabani Earring", --4%
    right_ear="Suppanomimi", --5%
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.DW, --10%
	}
	
	sets.engaged.Acc.LowHaste = set_combine(sets.engaged.LowHaste,{
    ammo="Yamarang",
    head="Pill. Bonnet +3",
    body="Pillager's Vest +3",
    hands="Turms Mittens +1",
    legs="Pill. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.STP, --10%
	})	
		
	sets.engaged.Crit.LowHaste = set_combine(sets.engaged.LowHaste,{ 
	ammo="Yetshila +1",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
	right_ring="Hetairoi Ring",})
	
	sets.engaged.PDT.LowHaste = {ammo="Staunch Tathlum +1",
	ammo="Staunch Tathlum +1", --3% DT
	head="Turms Cap +1",
    body="Meg. Cuirie +2", --8% PDT
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2", --6% PDT
    feet="Turms Leggings +1",
    neck="Loricate Torque +1", --6% DT
    waist="Flume Belt +1", --4% PDT
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring", --10% DT
    right_ring="Moonlight Ring", --5% DT
    back="Moonlight Cape" --6% DT
	}
	
	sets.engaged.MDT.LowHaste = { --Assumes Shellra V from Trust (-24% MDT) + 29% = Over Cap
	ammo="Staunch Tathlum +1", --3% DT
    head="Turms Cap +1",
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands="Meg. Gloves +2",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Warder's Charm +1",
    waist="Reiki Yotai", --Engraved Belt
    left_ear="Etiolation Earring", --3%
    right_ear="Odnowa Earring +1", --2%
    left_ring="Defending Ring", --10%
    right_ring="Moonlight Ring", --5%
    back="Moonlight Cape"--6%
	}
	
-- Mid Haste Received --	
-- 15% Magic Haste (37% DW to cap)[Currently @ 32%]
	
	sets.engaged.MidHaste = {ammo="Yamarang",
    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Pill. Culottes +3",
    feet="Plunderer's Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai", --7%
    left_ear="Eabani Earring", --4%
    right_ear="Suppanomimi", --5%
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.DW,}
	
	sets.engaged.Acc.MidHaste = set_combine(sets.engaged.MidHaste,{
    ammo="Yamarang",
    head="Pill. Bonnet +3",
    body="Pillager's Vest +3",
    hands="Turms Mittens +1",
    legs="Pill. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.STP, --10%
	})	
	
	sets.engaged.Crit.MidHaste = set_combine(sets.engaged.MidHaste,{ 
	ammo="Yetshila +1",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
	right_ring="Hetairoi Ring",})
	
	sets.engaged.PDT.MidHaste = {ammo="Staunch Tathlum +1",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape"
	}
	
	sets.engaged.MDT.MidHaste = { --Assumes Shellra V from Trust (-24% MDT) + 29% = Over Cap
	ammo="Staunch Tathlum +1", --3% DT
    head="Turms Cap +1",
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands="Meg. Gloves +2",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Warder's Charm +1",
    waist="Reiki Yotai", --Engraved Belt
    left_ear="Etiolation Earring", --3%
    right_ear="Odnowa Earring +1", --2%
    left_ring="Defending Ring", --10%
    right_ring="Moonlight Ring", --5%
    back="Moonlight Cape"--6%
	}
			
-- High Haste Received --	
-- 30% Magic Haste (26% DW to cap) [Currently @ 24%]
	
	sets.engaged.HighHaste = {
	ammo="Yamarang",
    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Pill. Culottes +3",
    feet="Plunderer's Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai", --7%
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.DW, --10%
	}
	
	sets.engaged.Acc.HighHaste = set_combine(sets.engaged.HighHaste,{
    ammo="Yamarang",
    head="Pill. Bonnet +3",
    body="Pillager's Vest +3",
    hands="Turms Mittens +1",
    legs="Pill. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.STP, --10%
	})	
	
	sets.engaged.Crit.HighHaste = set_combine(sets.engaged.HighHaste,{ 
	ammo="Yetshila +1",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
	right_ring="Hetairoi Ring",})
	
	sets.engaged.PDT.HighHaste = {ammo="Staunch Tathlum +1",
	ammo="Staunch Tathlum +1", --3% DT
	head="Turms Cap +1",
    body="Meg. Cuirie +2", --8% PDT
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2", --6% PDT
    feet="Turms Leggings +1",
    neck="Loricate Torque +1", --6% DT
    waist="Flume Belt +1", --4% PDT
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring", --10% DT
    right_ring="Moonlight Ring", --5% DT
    back="Moonlight Cape" --6% DT
	}
	
	sets.engaged.MDT.HighHaste = { --Assumes Shellra V from Trust (-24% MDT) + 29% = Over Cap
	ammo="Staunch Tathlum +1", --3% DT
    head="Turms Cap +1",
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands="Meg. Gloves +2",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Warder's Charm +1",
    waist="Reiki Yotai", --Engraved Belt
    left_ear="Etiolation Earring", --3%
    right_ear="Odnowa Earring +1", --2%
    left_ring="Defending Ring", --10%
    right_ring="Moonlight Ring", --5%
    back="Moonlight Cape"--6%
	}
	
-- Max Haste Received --	
-- Capped Magic Haste (6% DW to cap)
	
	sets.engaged.MaxHaste = {
    ammo="Yamarang",
    head={ name="Plun. Bonnet +3", augments={'Enhances "Aura Steal" effect',}},
    body="Pillager's Vest +3", --+3
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Pill. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.STP,
	}
	
	sets.engaged.Acc.MaxHaste = set_combine(sets.engaged.MaxHaste,{
    ammo="Yamarang",
    head="Pill. Bonnet +3",
    body="Pillager's Vest +3",
    hands="Turms Mittens +1",
    legs="Pill. Culottes +3",
    feet={ name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}},
    neck="Asn. Gorget +2",
    waist="Eschan Stone",
    left_ear="Digni. Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back=Toutatis.STP, --10%
	})	
	
	sets.engaged.Crit.MaxHaste = set_combine(sets.engaged.MaxHaste,{ 
	ammo="Yetshila +1",
    head="Mummu Bonnet +2",
    body="Mummu Jacket +2",
    hands="Mummu Wrists +2",
    legs="Mummu Kecks +1",
    feet="Mummu Gamash. +1",
	right_ring="Hetairoi Ring",})	
		
	sets.engaged.PDT.MaxHaste = {ammo="Staunch Tathlum +1",
	ammo="Staunch Tathlum +1", --3% DT
	head="Turms Cap +1",
    body="Meg. Cuirie +2", --8% PDT
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2", --6% PDT
    feet="Turms Leggings +1",
    neck="Loricate Torque +1", --6% DT
    waist="Flume Belt +1", --4% PDT
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring", --10% DT
    right_ring="Moonlight Ring", --5% DT
    back="Moonlight Cape" --6% DT
	}
	
	sets.engaged.MDT.MaxHaste = { --Assumes Shellra V from Trust (-24% MDT) + 29% = Over Cap
	ammo="Staunch Tathlum +1", --3% DT
    head="Turms Cap +1",
    body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}, --6%
    hands="Meg. Gloves +2",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Warder's Charm +1",
    waist="Reiki Yotai", --Engraved Belt
    left_ear="Etiolation Earring", --3%
    right_ear="Odnowa Earring +1", --2%
    left_ring="Defending Ring", --10%
    right_ring="Moonlight Ring", --5%
    back="Moonlight Cape"--6%
	}
	
------------------------------------------------------------------------------------------------
---------------------------------------- WS Sets -----------------------------------------------
------------------------------------------------------------------------------------------------	

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
	ammo="Falcon Eye",
    head="Pill. Bonnet +3",
    body="Meg. Cuirie +2", 
    hands="Meg. Gloves +2",
    legs="Plun. Culottes +3",
    feet="Lustra. Leggings +1",
    neck="Asn. Gorget +2",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
	back=Toutatis.WS,
	}
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS,{
    neck="Fotia Gorget",
    waist="Fotia Belt",
	})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS,{
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    left_ring="Garuda Ring +1",
	right_ring="Petrov Ring",
	waist="Fotia Belt",
	neck="Fotia Gorget",
	legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
	right_ear="Telos Earring",})	
	
	sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'],{waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'])
	sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'])
	sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'],{body="Plunderer's Vest +3"})
	sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'])

	sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'],{waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'])
	sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'])
	sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'],{body="Plunderer's Vest +3"})
	sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'])

	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS.acc)
	sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'])
	sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'])
	sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'],{body="Plunderer's Vest +3"})
	sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'])

	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
	waist="Grunfeld Rope", 
	ammo="Falcon Eye", 
	body=HerculeanVest.RSUS})	
	
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"])
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Meg. Cuirie +2",})
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Plunderer's Vest +3"})
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Meg. Cuirie +2",})
		
	sets.precast.WS["Mercy Stroke"] = {ammo="Yetshila +1",
    head="Lustratio Cap +1",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Plun. Culottes +3",
    feet="Lustra. Leggings +1",
    neck="Caro Necklace",
    waist="Grunfeld Rope",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
	back=Toutatis.WS,}
	
	sets.precast.WS["Mercy Stroke"].Acc = set_combine(sets.precast.WS["Mercy Stroke"],{waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS["Mercy Stroke"].Mod = set_combine(sets.precast.WS["Mercy Stroke"])
	sets.precast.WS["Mercy Stroke"].SA = set_combine(sets.precast.WS["Mercy Stroke"])
	sets.precast.WS["Mercy Stroke"].TA = set_combine(sets.precast.WS["Mercy Stroke"],{body="Plunderer's Vest +3"})
	sets.precast.WS["Mercy Stroke"].SATA = set_combine(sets.precast.WS["Mercy Stroke"])

		
	sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS)
	sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'],{waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'])
	sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'])
	sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'],{body="Plunderer's Vest +3"})
	sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'])

	sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS)
	sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {waist="Fotia Belt", neck="Fotia Gorget"})
	sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'])
	sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'])
	sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'],{body="Plunderer's Vest +3"})
	sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'])

	sets.precast.WS['Aeolian Edge'] = {ammo="Dosis Tathlum",
    head="Pill. Bonnet +3",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    legs=HerculeanLegs.MAB,
    feet=HerculeanFeet.WSD,
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Moonshade Earring",
    left_ring="Shiva Ring +1",
    right_ring="Dingir Ring",
	back=Toutatis.WS,}
								
------------------------------------------------------------------------------------------------
---------------------------------------- Defensive Sets ----------------------------------------
------------------------------------------------------------------------------------------------	

	sets.defense.Evasion = {
    ammo="Yamarang",
    head="Turms Cap +1",
    body="Tu. Harness +1",
    hands="Turms Mittens +1",
    legs="Turms Subligar +1",
    feet="Turms Leggings +1",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Assuage Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}

	sets.defense.PDT = {
	ammo="Staunch Tathlum +1",
    head="Meghanada Visor +2",
    body="Meg. Cuirie +2",
    hands="Meg. Gloves +2",
    legs="Meg. Chausses +2",
    feet="Meg. Jam. +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}

	sets.defense.MDT = {
	ammo="Staunch Tathlum +1",
    head="Turms Cap +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Turms Subligar +1",
    feet="Jute Boots +1",
	waist="Windbuffet Belt +1",
    neck="Loricate Torque +1",
    left_ear="Etiolation Earring",
	right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonlight Cape",}
	
	sets.Kiting = {feet="Jute Boots +1"}
	
end

-------------------------------------------------------------------------------------------------------------------
-- Haste Determination --
-------------------------------------------------------------------------------------------------------------------
function determine_haste_group()

    -- Gearswap can't detect the difference between Haste I and Haste II
    -- so use winkey-H to manually set Haste spell level.

    -- Haste (buffactive[33]) - 15%
    -- Haste II (buffactive[33]) - 30%
    -- Haste Samba - 5~10%
    -- Honor March - 12~16%
    -- Victory March - 15~28%
    -- Advancing March - 10~18%
    -- Embrava - 25%
    -- Mighty Guard (buffactive[604]) - 15%
    -- Geo-Haste (buffactive[580]) - 30~40%

    classes.CustomMeleeGroups:clear()

    if state.HasteMode.value == 'Haste II' then
        if(((buffactive[33] or buffactive[580] or buffactive.embrava) and (buffactive.march or buffactive[604])) or
            (buffactive[33] and (buffactive[580] or buffactive.embrava)) or
            (buffactive.march == 2 and buffactive[604]) or buffactive.march == 3) or buffactive[580] == 2 then
            add_to_chat(122, 'Magic Haste Level: 43% - Max Haste')
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif ((buffactive[33] or buffactive.march == 2 or buffactive[580]) and buffactive['haste samba']) then
            add_to_chat(122, 'Magic Haste Level: 35% - High Haste')
            classes.CustomMeleeGroups:append('HighHaste')
        elseif ((buffactive[580] or buffactive[33] or buffactive.march == 2) or
            (buffactive.march == 1 and buffactive[604])) then
            add_to_chat(122, 'Magic Haste Level: 30% - Mid Haste')
            classes.CustomMeleeGroups:append('MidHaste')
        elseif (buffactive.march == 1 or buffactive[604]) then
            add_to_chat(122, 'Magic Haste Level: 15% - Low Haste')
            classes.CustomMeleeGroups:append('LowHaste')
        end
    else
        if (buffactive[580] and ( buffactive.march or buffactive[33] or buffactive.embrava or buffactive[604]) ) or
            (buffactive.embrava and (buffactive.march or buffactive[33] or buffactive[604])) or
            (buffactive.march == 2 and (buffactive[33] or buffactive[604])) or
            (buffactive[33] and buffactive[604] and buffactive.march ) or buffactive.march == 3 or buffactive[580] == 2 then
            add_to_chat(122, 'Magic Haste Level: 43% - Max Haste')
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif ((buffactive[604] or buffactive[33]) and buffactive['haste samba'] and buffactive.march == 1) or
            (buffactive.march == 2 and buffactive['haste samba']) or
            (buffactive[580] and buffactive['haste samba'] ) then
            add_to_chat(122, 'Magic Haste Level: 35% - High Haste')
            classes.CustomMeleeGroups:append('HighHaste')
        elseif (buffactive.march == 2 ) or
            ((buffactive[33] or buffactive[604]) and buffactive.march == 1 ) or  -- MG or haste + 1 march
            (buffactive[580] ) or  -- geo haste
            (buffactive[33] and buffactive[604]) then
            add_to_chat(122, 'Magic Haste Level: 30% - Mid Haste')
            classes.CustomMeleeGroups:append('MidHaste')
        elseif buffactive[33] or buffactive[604] or buffactive.march == 1 then
            add_to_chat(122, 'Magic Haste Level: 15% - Low Haste')
            classes.CustomMeleeGroups:append('LowHaste')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
	-- If engaging, put on TH gear.
	-- If disengaging, turn off TH tagging.
	if newStatus == 'Engaged' and state.TreasureMode ~= 'None' then
		equip(sets.TreasureHunter)
		tag_with_th = true
		tp_on_engage = player.tp
		send_command('wait 3;gs c update th')
	elseif oldStatus == 'Engaged' then
		tag_with_th = false
		tp_on_engage = 0
	end
	-- If SA/TA/Feint are active, don't change gear sets
	if satafeint_active() then
		eventArgs.handled = true
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	determine_haste_group()
	if state.TreasureMode == 'None' then
		tag_with_th = false
		tp_on_engage = 0
	elseif tag_with_th and player.tp ~= tp_on_engage then
		tag_with_th = false
		tp_on_engage = 0
	elseif cmdParams[1] == 'th' and player.status == 'Engaged' then
		send_command('wait 3;gs c update th')
	end
	-- Update the current state of state.Buff, in case buff_change failed
	-- to update the value.
	state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
	state.Buff['Trick Attack'] = buffactive['trick attack'] or false
	state.Buff['Feint'] = buffactive['feint'] or false
	-- Don't allow normal gear equips if SA/TA/Feint is active.
	if satafeint_active() then
		eventArgs.handled = true
	end
	   th_update(cmdParams, eventArgs)  
end


function get_custom_wsmode(spell, action, spellMap)
	local wsmode = ''
	if state.Buff['Sneak Attack'] then
		wsmode = 'SA'
	end
	if state.Buff['Trick Attack'] then
		wsmode = wsmode .. 'TA'
	end
	if wsmode ~= '' then
		return wsmode
	end
end

function customize_idle_set(idleSet)
	if player.hpp < 80 then
		idleSet = set_combine(idleSet, sets.ExtraRegen)
	end
	--if player.mpp < 75 then
      --  idleSet = set_combine(idleSet, sets.latent_refresh)
    --end
    --end
	return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
	end
	if state.FrenzyMode.value == 'On' then
		meleeSet = set_combine(meleeSet, sets.FrenzySallet)
	end
    return meleeSet
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste', 'march', 'mighty guard', 'embrava', 'haste samba', 'geo-haste', 'indi-haste'}:contains(buff:lower()) then
        determine_haste_group()
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end	
end

function job_status_change(new_status, old_status)
    if new_status == 'Engaged' then
        determine_haste_group()
    end
end

-- Called when the player's subjob changes.
function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for TH mode handling.
-------------------------------------------------------------------------------------------------------------------

-- Request job-specific mode tables.
-- Return true on the third returned value to indicate an error: that we didn't recognize the requested field.
function job_get_mode_list(field)
	if field == 'Treasure' then
		return options.TreasureModes, state.TreasureMode
	end
end

-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_mode(field, val)
	if field == 'Treasure' then
		state.TreasureMode = val
		return true
	end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue)
end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
--	local defenseString = ''
	--if state.Defense.Active then
		--local defMode = state.Defense.PhysicalMode
		--if state.Defense.Type == 'Magical' then
			--defMode = state.Defense.MagicalMode
		--end

		--defenseString = 'Defense: '..state.Defense.Type..' '..defMode..'  '
	--end

	add_to_chat(122,'Melee: '..state.OffenseMode..'/'..state.DefenseMode..'  WS: '..state.WeaponskillMode..'  '..
		defenseString..'Kiting: '..on_off_names[state.Kiting]..'  TH: '..state.TreasureMode)

	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
	if spell.type == 'Waltz' then
		refine_waltz(spell, action, spellMap, eventArgs)
	elseif spell.action_type == 'Ranged Attack' then
		if state.TreasureMode ~= 'None' then
			classes.CustomClass = 'TH'
		end
	end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' or spell.action_type == 'Magic' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	-- Update the state of certain buff JAs if the action wasn't interrupted.
	if not spell.interrupted then
		if state.Buff[spell.name] ~= nil then
			state.Buff[spell.name] = true
		end

		-- Don't let aftercast revert gear set for SA/TA/Feint
		if S{'Sneak Attack', 'Trick Attack', 'Feint'}:contains(spell.english) then
			eventArgs.handled = true
		end

		-- If this wasn't an action that would have used up SATA/Feint, make sure to put gear back on.
		if spell.type:lower() ~= 'weaponskill' and spell.type:lower() ~= 'step' then
			-- If SA/TA/Feint are active, put appropriate gear back on (including TH gear).
			if state.Buff['Sneak Attack'] then
				equip(sets.precast.JA['Sneak Attack'])
				if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
					equip(sets.TreasureHunter)
				end
				eventArgs.handled = true
			elseif state.Buff['Trick Attack'] then
				equip(sets.precast.JA['Trick Attack'])
				if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
					equip(sets.TreasureHunter)
				end
				eventArgs.handled = true
			elseif state.Buff['Feint'] then
				equip(sets.precast.JA['Feint'])
				if state.TreasureMode == 'SATA' or state.TreasureMode == 'Fulltime' or tag_with_th then
					equip(sets.TreasureHunter)
				end
				eventArgs.handled = true
			end
		end
		if spell.target and spell.target.type == 'Enemy' then
			tag_with_th = false
			tp_on_engage = 0
		elseif (spell.type == 'Waltz' or spell.type == 'Samba') and tag_with_th then
			-- Update current TP if we spend TP before we actually hit the mob
			tp_on_engage = player.tp
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end

-- Function to indicate if any buffs have been activated that we don't want to equip gear over.
function satafeint_active()
	return state.Buff['Sneak Attack'] or state.Buff['Trick Attack'] or state.Buff['Feint']
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'WAR' then
		set_macro_page(9, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(3, 1)
	else
		set_macro_page(1, 1)
	end
end

