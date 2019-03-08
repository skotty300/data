-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/TP/WS. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
	WeaponIndex = 1
	WeaponArray = {} -- Default Ranged Weapon Is Annihilator. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	warning = false
	AutoGunWS = "Slug Shot" -- Set Auto Gun WS Here --
	AutoBowWS = "Sidewinder" -- Set Auto Bow WS Here --
	AutoMode = 'OFF' -- Set Default Auto RA/WS ON or OFF Here --
	Attack = 'OFF' -- Set Default WS Attack Set ON or OFF Here --
	Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
	ammo_warning_limit = 10 -- Set Ammo Limit Check Here --
	Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
	target_distance = 15 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="LastStand", SC2="Coronach", SC3="Ranged"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {	
	head="Hunter's Beret",
    body="Kyudogi +1",
    hands="Blood Fng. Gnt.",
    legs="Blood Cuisses",
    feet="Areion Boots +1",
    neck="Qiqirn Collar",
    waist="Venturer's Belt",
    left_ear="Genin Earring",
    right_ear="Drone Earring",
    left_ring="Defending Ring",
    right_ring="Cerberus Ring +1",
    back="Amemet Mantle +1"}
	
	-- Idle/Town Sets --
	sets.Idle.Regen = {
	   head="Blood Mask",
    body="Kirin's Osode",
    hands="Seiryu's Kote",
    legs="Blood Cuisses",
    feet="Areion Boots +1",
    neck="Orochi Nodowa +1",
    waist="Sonic Belt +1",
    left_ear="Velocity Earring",
    right_ear="Cassie Earring",
    left_ring="Defending Ring",
    right_ring="Merman's Ring",
    back="Lamia Mantle +1",}
	
	sets.Idle.Regen.Annihilator = set_combine(sets.Idle.Regen,{})
	sets.Idle.Regen.EBow = set_combine(sets.Idle.Regen,{
			main="Kriegsbeil",
			sub="Fransisca",
			range="Eurytos' Bow",
			ammo="Kabura Arrow",
			head="Blood Mask"})
	sets.Idle.Regen.Annihilator.NIN = set_combine(sets.Idle.Regen,{})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{legs="Blood Cuisses",
			feet="Areion Boots +1"})
	sets.Idle.Movement.Annihilator = set_combine(sets.Idle.Movement,{})
	sets.Idle.Movement.Ebow = set_combine(sets.Idle.Movement,{
			range="Eurytos' Bow"})
	sets.Idle.Movement.Annihilator.NIN = set_combine(sets.Idle.Movement,{})
	sets.Idle.Movement.Ebow.NIN = set_combine(sets.Idle.Movement,{
			main="Kriegsbeil",
			sub="Fransisca",
			range="Eurytos' Bow"})

	-- Preshot --
	sets.Preshot = {}

	-- Barrage Base Set. This Set Takes Priority Over Other Pieces. --
	Barrage = {
			hands="Orion Bracers +1",
			legs="Dusk Trousers +1",
			right_ring="Behemoth ring +1"}

	-- Shooting Base Set --
	sets.Midshot = {	
	head="Hunter's Beret",
    body="Kyudogi +1",
    hands="Blood Fng. Gnt.",
    legs="Akinji Salvars",
    feet="Scout's Socks",
    neck="Qiqirn Collar",
    waist="Venturer's Belt",
    left_ear="Genin Earring",
    right_ear="Drone Earring",
    left_ring="Dragon Ring +1",
    right_ring="Cerberus Ring +1",
    back="Amemet Mantle +1"}

	sets.Midshot.Ebow.HighACC = set_combine(sets.Midshot.Ebow.MidACC,{})

	-- Ebow Barrage Sets --
	sets.Midshot.Ebow.Barrage = set_combine(sets.Midshot.Ebow,{},Barrage)
	sets.Midshot.Ebow.MidACC.Barrage = set_combine(sets.Midshot.Ebow.MidACC,{},Barrage)
	sets.Midshot.Ebow.HighACC.Barrage = set_combine(sets.Midshot.Ebow.HighACC,{},Barrage)

	-- Annihilator(Decoy Down) /SAM Sets --
	sets.Midshot.Annihilator.SAM = {
			range="Annihilator",
			ammo="Achiyal. Bullet"}
	sets.Midshot.Annihilator.SAM.MidACC = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.HighACC = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})

	-- Annihilator(Decoy Up) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Decoy = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Decoy = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.Decoy = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(Enmity) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Enmity = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Enmity = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.Enmity = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(AM) /SAM Sets --
	sets.Midshot.Annihilator.SAM.AM = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.AM = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.AM = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(AM: Ionis) /SAM Sets --
	sets.Midshot.Annihilator.SAM.AM.Ionis = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.AM.Ionis = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.AM.Ionis = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(Decoy Down: Ionis) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Ionis = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Ionis = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.Ionis = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(Decoy Up: Ionis) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(Decoy Down: SAM Roll) /SAM Sets --
	sets.Midshot.Annihilator.SAM.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.STP = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(Decoy Up: SAM Roll) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Decoy.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.SAM.Decoy.STP,{})
	sets.Midshot.Annihilator.SAM.HighACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC.Decoy.STP,{})

	-- Annihilator(Decoy Down: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator(Decoy Up: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Annihilator.SAM.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
	sets.Midshot.Annihilator.SAM.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
	sets.Midshot.Annihilator.SAM.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})

	-- Annihilator /SAM Barrage Sets --
	sets.Midshot.Annihilator.SAM.Barrage = set_combine(sets.Midshot.Annihilator.SAM,{},Barrage)
	sets.Midshot.Annihilator.SAM.MidACC.Barrage = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{},Barrage)
	sets.Midshot.Annihilator.SAM.HighACC.Barrage = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{},Barrage)

	-- Eurytos' Bow(Decoy Down) /SAM Sets --
	sets.Midshot.Ebow.SAM = {
			range="Eurytos' Bow",
			ammo="Kabura Arrow"}
	sets.Midshot.Ebow.SAM.MidACC = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.HighACC = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})

	-- Ebow(Decoy Up) /SAM Sets --
	sets.Midshot.Ebow.SAM.Decoy = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Decoy = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.Decoy = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(Enmity) /SAM Sets --
	sets.Midshot.Ebow.SAM.Enmity = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Enmity = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.Enmity = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(AM) /SAM Sets --
	sets.Midshot.Ebow.SAM.AM = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.AM = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.AM = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(AM: Ionis) /SAM Sets --
	sets.Midshot.Ebow.SAM.AM.Ionis = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.AM.Ionis = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.AM.Ionis = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(Decoy Down: Ionis) /SAM Sets --
	sets.Midshot.Ebow.SAM.Ionis = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Ionis = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.Ionis = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(Decoy Up: Ionis) /SAM Sets --
	sets.Midshot.Ebow.SAM.Decoy.Ionis = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(Decoy Down: SAM Roll) /SAM Sets --
	sets.Midshot.Ebow.SAM.STP = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.STP = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.STP = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(Decoy Up: SAM Roll) /SAM Sets --
	sets.Midshot.Ebow.SAM.Decoy.STP = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Decoy.STP = set_combine(sets.Midshot.Ebow.SAM.Decoy.STP,{})
	sets.Midshot.Ebow.SAM.HighACC.Decoy.STP = set_combine(sets.Midshot.Ebow.SAM.MidACC.Decoy.STP,{})

	-- Ebow(Decoy Down: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Ebow.SAM.Ionis.STP = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Ionis.STP = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.Ionis.STP = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow(Decoy Up: Ionis + SAM Roll) /SAM Sets --
	sets.Midshot.Ebow.SAM.Decoy.Ionis.STP = set_combine(sets.Midshot.Ebow.SAM,{})
	sets.Midshot.Ebow.SAM.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Ebow.SAM.MidACC,{})
	sets.Midshot.Ebow.SAM.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Ebow.SAM.HighACC,{})

	-- Ebow /SAM Barrage Sets --
	sets.Midshot.Ebow.SAM.Barrage = set_combine(sets.Midshot.Ebow.SAM,{},Barrage)
	sets.Midshot.Ebow.SAM.MidACC.Barrage = set_combine(sets.Midshot.Ebow.SAM.MidACC,{},Barrage)
	sets.Midshot.Ebow.SAM.HighACC.Barrage = set_combine(sets.Midshot.Ebow.SAM.HighACC,{},Barrage)

	-- Annihilator(Decoy Down) /NIN Sets --
	sets.Midshot.Annihilator.NIN = {
			range="Annihilator",
			ammo="Achiyal. Bullet"}
	sets.Midshot.Annihilator.NIN.MidACC = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.HighACC = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})

	-- Annihilator(Decoy Up) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Decoy = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Decoy = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Decoy = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Enmity) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Enmity = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Enmity = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Enmity = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(AM) /NIN Sets --
	sets.Midshot.Annihilator.NIN.AM = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.AM = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.AM = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(AM: Ionis) /NIN Sets --
	sets.Midshot.Annihilator.NIN.AM.Ionis = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.AM.Ionis = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.AM.Ionis = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Decoy Down: Ionis) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Ionis = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Ionis = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Ionis = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Decoy Up: Ionis) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Decoy Down: SAM Roll) /NIN Sets --
	sets.Midshot.Annihilator.NIN.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Decoy Up: SAM Roll) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Decoy.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Decoy Down: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator(Decoy Up: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Annihilator.NIN.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
	sets.Midshot.Annihilator.NIN.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
	sets.Midshot.Annihilator.NIN.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})

	-- Annihilator /NIN Barrage Sets --
	sets.Midshot.Annihilator.NIN.Barrage = set_combine(sets.Midshot.Annihilator.NIN,{},Barrage)
	sets.Midshot.Annihilator.NIN.MidACC.Barrage = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{},Barrage)
	sets.Midshot.Annihilator.NIN.HighACC.Barrage = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{},Barrage)

	-- Ebow(Decoy Down) /NIN Sets --
	sets.Midshot.Ebow.NIN = {
			range="Eurytos' Bow",
			ammo="Kabura Arrow"}
	sets.Midshot.Ebow.NIN.MidACC = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.HighACC = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})

	-- Ebow(Decoy Up) /NIN Sets --
	sets.Midshot.Ebow.NIN.Decoy = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Decoy = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Decoy = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Enmity) /NIN Sets --
	sets.Midshot.Ebow.NIN.Enmity = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Enmity = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Enmity = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(AM) /NIN Sets --
	sets.Midshot.Ebow.NIN.AM = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.AM = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.AM = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(AM: Ionis) /NIN Sets --
	sets.Midshot.Ebow.NIN.AM.Ionis = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.AM.Ionis = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.AM.Ionis = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Decoy Down: Ionis) /NIN Sets --
	sets.Midshot.Ebow.NIN.Ionis = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Ionis = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Ionis = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Decoy Up: Ionis) /NIN Sets --
	sets.Midshot.Ebow.NIN.Decoy.Ionis = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Decoy Down: SAM Roll) /NIN Sets --
	sets.Midshot.Ebow.NIN.STP = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.STP = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.STP = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Decoy Up: SAM Roll) /NIN Sets --
	sets.Midshot.Ebow.NIN.Decoy.STP = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Decoy.STP = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Decoy.STP = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Decoy Down: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Ebow.NIN.Ionis.STP = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Ionis.STP = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Ionis.STP = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow(Decoy Up: Ionis + SAM Roll) /NIN Sets --
	sets.Midshot.Ebow.NIN.Decoy.Ionis.STP = set_combine(sets.Midshot.Ebow.NIN,{})
	sets.Midshot.Ebow.NIN.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Ebow.NIN.MidACC,{})
	sets.Midshot.Ebow.NIN.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Ebow.NIN.HighACC,{})

	-- Ebow /NIN Barrage Sets --
	sets.Midshot.Ebow.NIN.Barrage = set_combine(sets.Midshot.Ebow.NIN,{},Barrage)
	sets.Midshot.Ebow.NIN.MidACC.Barrage = set_combine(sets.Midshot.Ebow.NIN.MidACC,{},Barrage)
	sets.Midshot.Ebow.NIN.HighACC.Barrage = set_combine(sets.Midshot.Ebow.NIN.HighACC,{},Barrage)

	-- PDT/MDT Sets --
	sets.PDT = {
	head="Blood Mask",
    body="Blood Scale Mail",
    hands="Seiryu's Kote",
    legs="Blood Cuisses",
    feet="Areion Boots +1",
    neck="Qiqirn Collar",
    waist="Sonic Belt +1",
    left_ear="Velocity Earring",
    right_ear="Cassie Earring",
    left_ring="Defending Ring",
    right_ring="Merman's Ring",
    back="Lamia Mantle +1",}

	sets.MDT = set_combine(sets.PDT,{ 
	head="Coral Visor +1",
    body="Kyudogi +1",
    hands="Merman's Bangles",
	neck="Jeweled Collar +1",
    waist="Resolute Belt",
	left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Merman's Ring"})

	-- Melee Sets --
	sets.Melee = {
	head="Denali Bonnet",
    body="Kirin's Osode",
    hands="Dusk Gloves +1",
    legs="Byakko's Haidate",
    feet="Dusk Ledelsens +1",
    neck="Peacock Amulet",
    waist="Sonic Belt +1",
    left_ear="Bushinomimi",
    right_ear="Harmonius Earring",
    left_ring="Toreador's Ring",
    right_ring="Toreador's Ring",
    back="Amemet Mantle +1"}
	
	sets.Melee.MidACC = set_combine(sets.Melee,{})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{})

	-- WS Base Set --
	sets.WS = {
	head="Wyvern Helm +1",
    body="Kirin's Osode",
    hands="Seiryu's Kote",
    legs="Akinji Salvars",
    feet="Hachiryu Sune-Ate",
    neck="Qiqirn Collar",
    waist="Grenadier Belt",
    left_ear="Bushinomimi",
    right_ear="Harmonius Earring",
    left_ring="Triumph Ring +1",
    right_ring="Triumph Ring +1",
    back="Amemet Mantle +1"}


	-- Namas Arrow Sets --
	sets.WS["Namas Arrow"] = {}
	sets.WS["Namas Arrow"].MidACC = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{})

	-- Namas Arrow(Attack) Set. This Set Takes Priority Over Other Sets. --
	sets.WS["Namas Arrow"].ATT = set_combine(sets.WS["Namas Arrow"],{})

	-- Namas Arrow(Enmity) Sets --
	sets.WS["Namas Arrow"].Enmity = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].MidACC.Enmity = set_combine(sets.WS["Namas Arrow"].MidACC,{})
	sets.WS["Namas Arrow"].HighACC.Enmity = set_combine(sets.WS["Namas Arrow"].HighACC,{})

	-- Namas Arrow(AM) Sets --
	sets.WS["Namas Arrow"].AM = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].MidACC.AM = set_combine(sets.WS["Namas Arrow"].MidACC,{})
	sets.WS["Namas Arrow"].HighACC.AM = set_combine(sets.WS["Namas Arrow"].HighACC,{})

	-- Namas Arrow(SAM Roll) Sets --
	sets.WS["Namas Arrow"].STP = set_combine(sets.WS["Namas Arrow"],{})
	sets.WS["Namas Arrow"].MidACC.STP = set_combine(sets.WS["Namas Arrow"].MidACC,{})
	sets.WS["Namas Arrow"].HighACC.STP = set_combine(sets.WS["Namas Arrow"].HighACC,{})

	-- Sidewinder Sets --
	sets.WS["Sidewinder"] = {	
	head="Wyvern Helm +1",
    body="Kirin's Osode",
    hands="Seiryu's Kote",
    legs="Dusk Trousers +1",
    feet="Hachiryu Sune-Ate",
    neck="Qiqirn Collar",
    waist="Grenadier Belt",
    left_ear="Genin Earring",
    right_ear="Drone Earring",
    left_ring="Triumph Ring +1",
    right_ring="Triumph Ring +1",
    back="Amemet Mantle +1"}
	sets.WS["Sidewinder"].MidACC = set_combine(sets.WS["Sidewinder"],{neck="Peacock Amulet"})
	sets.WS["Sidewinder"].HighACC = set_combine(sets.WS["Sidewinder"].MidACC,{left_ring="Dragon Ring +1", right_ear="Behemoth Ring +1"})

	-- Sidewinder(Attack) Set. This Set Takes Priority Over Other Sets. --
	sets.WS["Sidewinder"].ATT = set_combine(sets.WS["Sidewinder"],{})


	-- Wildfire Set --
	sets.WS.Wildfire = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Shadowbind = {
			hands="Hunter's Bracers"}

	sets.JA.Scavenge = {feet="Hunter's Socks"}
	sets.JA.Camouflage = {body="Hunter's Jerkin"}
	sets.JA.Sharpshot = {legs="Hunter's Braccae"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{})

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{	
						head="Walahra Turban",
						hands="Dusk Gloves +1",
						feet="Dusk Ledelsens +1",
						waist="Sonic Belt +1"})
end

-- function pretarget(spell,action)
	-- if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		-- cancel_spell()
		-- send_command('input /item "Echo Drops" <me>')
	-- elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		-- cancel_spell()
		-- send_command('Aggressor')
	-- elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		-- cancel_spell()
		-- send_command('ThirdEye')
	-- elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		-- cancel_spell()
		-- add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	-- elseif spell.action_type == 'Ranged Attack' then
		-- if spell.target.distance > 24.9 then -- Cancel Ranged Attack If You Are Out Of Range --
			-- cancel_spell()
			-- add_to_chat(123, spell.name..' Canceled: [Out of Range]')
			-- return
		-- else
			-- if AutoMode == 'ON' and not buffactive.amnesia then -- Auto WS/Decoy Shot/Double Shot --
				-- if player.tp >= 1000 then
					-- cancel_spell()
					-- autoWS()
				-- elseif windower.ffxi.get_ability_recasts()[52] < 1 then
					-- cancel_spell()
					-- send_command('DecoyShot')
				-- elseif windower.ffxi.get_ability_recasts()[126] < 1 then
					-- cancel_spell()
					-- send_command('DoubleShot')
				-- end
			-- end
		-- end
	-- elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		-- if (spell.skill == 'Archery' or spell.skill == 'Marksmanship') and spell.target.distance > 16+target_distance then
			-- cancel_spell()
			-- add_to_chat(123, spell.name..' Canceled: [Out of Range]')
			-- return
		-- else
			-- if spell.english ~= 'Bora Axe' and spell.target.distance > target_distance then
				-- cancel_spell()
				-- add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				-- return
			-- end
		-- end
	-- end
-- end

function precast(spell,action)
	local check_ammo
	local check_ammo_count = 1
	if spell.action_type == 'Ranged Attack' then
		check_ammo = player.equipment.ammo
		-- if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
			-- add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
			-- cancel_spell()
			-- return
		-- else
			-- equip(sets.Preshot)
			-- if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
				-- add_to_chat(8, '***** [Low Ammo Warning!] *****')
				-- warning = true
			-- elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
				-- warning = false
			-- end
		--end
	-- elseif spell.type == "WeaponSkill" then
		-- if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			-- cancel_spell()
			-- add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			-- return
		-- else
			-- equipSet = sets.WS
			-- if equipSet[spell.english] then
				-- equipSet = equipSet[spell.english]
			-- end
			-- if Attack == 'ON' then
				-- equipSet = equipSet["ATT"]
			-- end
			-- if equipSet[AccArray[AccIndex]] then
				-- equipSet = equipSet[AccArray[AccIndex]]
			-- end
			-- if equipSet["Enmity"] and Enmity == 'ON' then
				-- equipSet = equipSet["Enmity"]
			-- end
			-- if buffactive.Aftermath and equipSet["AM"] then
				-- equipSet = equipSet["AM"]
			-- end
			-- if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
				-- equipSet = equipSet["STP"]
			-- end
			-- if player.tp > 2990 or buffactive.Sekkanoki then
				-- if spell.english == "Last Stand" then -- Equip Altdorf's Earring and Wilhelm's Earring When You Have 3000 TP or Sekkanoki For Last Stand --
					-- equipSet = set_combine(equipSet,{ear1="Altdorf's Earring",ear2="Wilhelm's Earring"})
				-- elseif spell.english == "Sidewinder" then -- Equip Jupiter's Pearl When You Have 3000 TP or Sekkanoki For Sidewinder --
					-- equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
				-- end
			-- end
			-- if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				-- equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			-- end
			-- equip(equipSet)
		-- end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.Utsusemi)
				end
			else
				equip(sets.Precast.Utsusemi)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		equipSet = sets.Midshot
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Barrage and equipSet["Barrage"] then
			equipSet = equipSet["Barrage"]
		end
		if buffactive["Decoy Shot"] and equipSet["Decoy"] then
			equipSet = equipSet["Decoy"]
		end
		if equipSet["Enmity"] and Enmity == 'ON' then
			equipSet = equipSet["Enmity"]
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if spell.action_type == 'Ranged Attack' and AutoMode == 'ON' then
		autoRA()
	else
		status_change(player.status)
	end
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.Melee
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "overkill" then -- Overkill Timer --
		if gain then
			send_command('timers create "Overkill" 60 down')
		else
			send_command('timers delete "Overkill"')
			add_to_chat(123,'Overkill: [OFF]')
		end
	elseif buff == "decoy shot" then -- Decoy Shot Timer --
		if gain then
			send_command('timers create "Decoy Shot" 180 down')
		else
			send_command('timers delete "Decoy Shot"')
			add_to_chat(123,'Decoy Shot: [OFF]')
		end
	elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C17' then -- Ranged Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Ranged Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- SAM Roll Toggle --
		if Samurai_Roll == 'ON' then
			Samurai_Roll = 'OFF'
			add_to_chat(123,'SAM Roll: [OFF]')
		else
			Samurai_Roll = 'ON'
			add_to_chat(158,'SAM Roll: [ON]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Enmity Toggle --
		if Enmity == 'ON' then
			Enmity = 'OFF'
			add_to_chat(123,'Enmity Set: [OFF]')
		else
			Enmity = 'ON'
			add_to_chat(158,'Enmity Set: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Overkill Toggle --
		send_command('Overkill')
		add_to_chat(158,'Overkill: [ON]')
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'C2' then -- Auto RA/WS Toggle --
		if AutoMode == 'ON' then
			AutoMode = 'OFF'
			add_to_chat(123,'Auto Mode: [OFF]')
		else
			AutoMode = 'ON'
			add_to_chat(158,'Auto Mode: [ON]')
		end
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('ring1','ring2','back')
	end
end

function autoRA() -- Make Auto RA Delay Adjustment Here --
	local delay = '2.2'
	if player.equipment.range == 'Annihilator' then
		if spell.type == "WeaponSkill" then
			delay = '2.25'
		else
			if buffactive["Courser's Roll"] then
				delay = '0.7'
			elseif buffactive.Overkill or buffactive[581] then -- Flurry II --
				delay = '0.5'
			else
				delay = '1.05'
			end
		end
	elseif player.equipment.range == "Eurytos' Bow" then
		if spell.type == "WeaponSkill" then
			delay = '2.25' 
		else
			if buffactive["Courser's Roll"] then
				delay = '0.7'
			elseif buffactive.Overkill or buffactive[581] then -- Flurry II --
				delay = '0.5'
			else
				delay = '1.05'
			end
		end
	end
	send_command('@wait '..delay..'; input /ra <t>')
end

function autoWS() -- Change Ranged Weapon Here --
	if player.equipment.range == 'Annihilator' then
		send_command('input /ws "'..AutoGunWS..'" <t>')
	elseif player.equipment.range == "Eurytos' Bow" then
		send_command('input /ws "'..AutoBowWS..'" <t>')
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end
	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'DNC' then
		set_macro_page(5, 11)
	elseif player.sub_job == 'SAM' then
		set_macro_page(2, 11)
	elseif player.sub_job == 'DRG' then
		set_macro_page(3, 11)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 11)
	else
		set_macro_page(1, 11)
	end
end