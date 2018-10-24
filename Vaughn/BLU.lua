function get_sets()
 
        send_command('bind f9 gs c toggle TP set')
        send_command('bind f10 gs c toggle Idle set')
        send_command('bind f11 gs c toggle CDC set')
        send_command('bind f12 gs c toggle Req set')
        send_command('bind !f12 gs c toggle Rea set')
       
        function file_unload()
     
 
        send_command('unbind ^f9')
        send_command('unbind ^f10')
                send_command('unbind ^f11')
                send_command('unbind ^f12')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
                send_command('unbind !f11')
        send_command('unbind !f12')
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
 
       
 
        end    
               
        --Idle Sets--  
        sets.Idle = {}
       
        sets.Idle.index = {'Standard','DT'}
        Idle_ind = 1                   
       
        sets.Idle.Standard = {ammo="Ginsen",
                              head="Rawhide mask",
							  neck="Sanctity necklace",
							  ear1="Infused earring",
							  ear2="Etiolation earring",
                              body="Amalric doublet",
							  hands="Serpentes cuffs",
							  ring1="Dark ring",
							  ring2="Gelatinous ring +1",
                              back="Solemnity cape",
							  waist="Flume belt",
							  legs="Carmine cuisses +1",
							  feet="Serpentes sabots"}
                                                 
        sets.Idle.DT = {ammo="Ginsen",
						--sub="Genmei shield",
                        head="Aya. Zucchetto +1",
						neck="Twilight torque",
						ear1="Infused earring",
						ear2="Etiolation earring",
                        body="Ayanmo corazza +2",
						hands="Aya. Manopolas +2",
						ring1="Ayanmo ring",
						ring2="Gelatinous ring +1",
                        back="Solemnity cape",
						waist="Flume belt",
						legs="Aya. Cosciales +1",
						feet="Aya. Gambieras +1"}
                                                       
                                                       
                                                       
                                                       
       
       
        --TP Sets--
        sets.TP = {}
 
        sets.TP.index = {'Standard', 'AccuracyExtreme', 'DT', 'DTAccuracy'}
        --1=Standard, 2=Solo, 3=Marches, 4=AccuracyLite, 5=AccuracyFull, 6=DT, 7=DTAccuracy--
        TP_ind = 1
       
        sets.TP.Standard = {ammo="Ginsen",
							head="Adhemar bonnet +1",
							neck="Lissome necklace", 
							ear1="Steelflash earring", 
							ear2="Bladeborn earring",
                            body="Adhemar jacket +1",
							hands="Adhemar wristbands +1",
							ring1="Epona's ring",
							ring2="Petrov ring",
                            back={ name="Rosmerta's cape", augments={'DEX+19','Accuracy+20 Attack+20','','"Dbl.Atk."+10',}},
							waist="Windbuffet belt +1",
							legs="Herculean trousers",
							feet="Rawhide boots"}
                                               
        sets.TP.AccuracyExtreme = {ammo="Falcon eye",
                                   head="Carmine mask",
								   neck="Subtlety spectacles", 
								   ear1="Steelflash earring", 
								   ear2="Zennaroi earring",
                                   body="Adhemar jacket +1",
								   hands="Adhemar wristbands +1",
								   ring1="Epona's ring",
								   ring2="Petrov ring",
                                   back={ name="Rosmerta's cape", augments={'DEX+19','Accuracy+20 Attack+20','','"Dbl.Atk."+10',}},
								   waist="Kentarch belt",
								   legs="Herculean trousers",
								   feet="Herculean boots"}
                                                       
        sets.TP.DT = {ammo="Ginsen",
                        head="Aya. Zucchetto +1",
						neck="Twilight torque",
						ear1="Infused earring",
						ear2="Etiolation earring",
                        body="Ayanmo corazza +2",
						hands="Aya. Manopolas +2",
						ring1="Ayanmo ring",
						ring2="Gelatinous ring +1",
                        back="Solemnity cape",
						waist="Flume belt",
						legs="Aya. Cosciales +1",
						feet="Aya. Gambieras +1"}
                                 
        sets.TP.DTAccuracy = {ammo="Falcon eye",
                                        head="Carmine mask",neck="Twilight torque", ear1="Steelflash earring", ear2="Zennaroi earring",
										body="Emet harness +1",hands="Herculean gloves",ring1="Dark ring",ring2="Gelatinous ring +1",
										back="Solemnity cape",waist="Flume belt",legs="Herculean trousers",feet="Herculean boots"}
       
       
       
       
       
       
        --Weaponskill Sets--
        sets.WS = {}
       
        sets.Requiescat = {}
       
        sets.Requiescat.index = {'Attack','Accuracy'}
        Requiescat_ind = 1
       
        sets.Requiescat.Attack = {ammo="Cheruski needle",
                                  head="Carmine mask",
								  neck="Fotia gorget",
								  ear1="Brutal earring",
								  ear2="Ishvara earring",
                                  body="Amalric doublet",
								  hands="Carmine finger gauntlets",
								  ring1="Epona's ring",
								  ring2="Levia. ring",
                                  back={ name="Rosmerta's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},
								  waist="Fotia belt",
								  legs="Carmine cuisses",
								  feet="Rawhide boots"}
                                                                 
        sets.Requiescat.Accuracy = {ammo="Falcon eye",
                                    head="Carmine mask",
									neck="Fotia gorget",
									ear1="Brutal earring",
									ear2="Ishvara earring",
                                    body="Amalric doublet",
									hands="Carmine finger gauntlets",
									ring1="Epona's ring",
									ring2="Levia. ring",
                                    back="Atheling mantle",
									waist="Fotia belt",
									legs="Carmine cuisses",
									feet="Rawhide boots"}
        sets.SwiftBlade = {}
       
        sets.SwiftBlade.index = {'Attack','Accuracy'}
        SwiftBlade_ind = 1
       
        sets.SwiftBlade.Attack = {ammo="Falcon eye",
                                                        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Brutal earring",ear2="Ishvara earring",
                                                            body="Abnoba kaftan",hands="Herculean gloves",ring1="Epona's ring",ring2="Petrov ring",
                                                            back="Atheling mantle",waist="Fotia belt",legs="Herculean trousers",feet="Thereoid greaves"}
                                                                 
        sets.SwiftBlade.Accuracy = {ammo="Falcon eye",
                                                        head="Whirlpool mask",neck="Soil gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                                            body="Luhlaza jubbah +1",hands="Qaaxo mitaines",ring1="Epona's ring",ring2="Levia. ring",
                                                            back="Letalis mantle",waist="Soil belt",legs="Quiahuiz trousers",feet="Assim. charuqs +1"}
        sets.ChantDuCygne = {}
       
        sets.ChantDuCygne.index = {'Attack','Accuracy'}
        ChantDuCygne_ind = 1
       
        sets.ChantDuCygne.Attack = {ammo="Falcon eye",
                                    head="Adhemar bonnet +1",
									neck="Fotia gorget",
									ear1="Brutal earring",
									ear2="Ishvara earring",
                                    body="Abnoba kaftan",
									hands="Adhemar wristbands +1",
									ring1="Epona's ring",
									ring2="Petrov ring",
                                    back={ name="Rosmerta's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},
									waist="Fotia belt",
									legs="Herculean trousers",
									feet="Thereoid greaves"}
                                                           
        sets.ChantDuCygne.Accuracy = {ammo="Falcon eye",
                                                          head="Uk'uxkaj cap",neck="Flame gorget",ear1="Bladeborn earring",ear2="Steelflash earring",
                                                              body="Abnoba kaftan",hands="Luh. bazubands +1",ring1="Epona's ring",ring2="Petrov  ring",
                                                              back="Rancorous mantle",waist="Light belt",legs="Manibozho brais",feet="Assim. charuqs +1"}
                                                           
        sets.WS.SanguineBlade = {}
       
        sets.WS.SanguineBlade = {ammo="Ghastly tathlum +1",
                                                  head="Amalric coif",neck="Sanctity necklace",ear1="Hecate's earring",ear2="Friomisi earring",
                                                  body="Amalric doublet",hands="Amalric gages",ring1="Fenrir ring",ring2="Acumen ring",
                                                  back="Cornflower cape",waist="Aswang sash",legs="Amalric slops",feet="Amalric nails"}
               
        sets.WS.CircleBlade = {}               
                       
        sets.WS.CircleBlade = {ammo="Cheruski needle",
                                                   head="Uk'uxkaj cap",neck="Soil Gorget",ear1="Moonshade earring",ear2="Brutal earring",
                                                   body="Assim. jubbah +1",hands="Luh. bazubands +1",ring1="Epona's ring",ring2="Pyrosoul ring",
                                                   back="Atheling mantle",waist="Soil belt",legs="Quiahuiz trousers",feet="Luhlaza charuqs +1",
                                                   back="Atheling mantle",waist="Soil belt",legs="Quiahuiz trousers",feet="Luhlaza charuqs +1"}
                                                   
        sets.WS.Expiacion = {}         
                       
        sets.WS.Expiacion = {ammo="Cheruski needle",
                                             head="Uk'uxkaj cap",neck="Soil Gorget",ear1="Moonshade earring",ear2="Brutal earring",
                                                 body="Assim. jubbah +1",hands="Luh. bazubands +1",ring1="Epona's ring",ring2="Pyrosoul ring",
                                                 back="Atheling mantle",waist="Soil belt",legs="Quiahuiz trousers",feet="Luhlaza charuqs +1"}
                                                 
        sets.Realmrazer = {}
       
        sets.Realmrazer.index = {'Attack','Accuracy'}
        Realmrazer_ind = 1
       
        sets.Realmrazer.Attack = {ammo="Cheruski needle",
                                                      head="Carmine mask",neck="Fotia gorget",ear1="Brutal earring",ear2="Ishvara earring",
                                                          body="Amalric doublet",hands="Carmine finger gauntlets",ring1="Epona's ring",ring2="Levia. ring",
                                                          back="Atheling mantle",waist="Fotia belt",legs="Carmine cuisses",feet="Rawhide boots"}
                                                         
        sets.Realmrazer.Accuracy = {ammo="Falcon eye",
                                                        head="Whirlpool mask",neck="Flame gorget",ear1="Bladeborn earring",ear2="Steelflash earring",
                                                            body="Luhlaza jubbah +1",hands="Luh. Bazubands +1",ring1="Levia. ring",ring2="Aquasoul ring",
                                                            back="Letalis mantle",waist="Light belt",legs="Quiahuiz trousers",feet="Assim. charuqs +1"}
                                                       
        sets.WS.FlashNova = {}
       
        sets.WS.FlashNova = {ammo="Ghastly tathlum +1",
                                                  head="Amalric coif",neck="Sanctity necklace",ear1="Hecate's earring",ear2="Friomisi earring",
                                                  body="Amalric doublet",hands="Amalric gages",ring1="Fenrir ring",ring2="Acumen ring",
                                                  back="Cornflower cape",waist="Aswang sash",legs="Amalric slops",feet="Amalric nails"}
                                                               
                                                               
                                                               
                                                               
                                                               
        --Blue Magic Sets--
        sets.BlueMagic = {}
       
        sets.BlueMagic.STR = {ammo="Mavi tathlum",
													head="Despair helm",neck="Ire torque +1",ear1="Flame pearl",ear2="Flame pearl",
													body="Despair mail",hands="Despair finger gauntlets",ring1="Vulcan's ring",ring2="Pyrosoul ring",
													back="Cornflower cape",waist="Pipilaka belt",legs="Rawhide trousers",feet="Despair greaves"}
                                                 
        sets.BlueMagic.STRDEX = {ammo="Cheruski needle",
													head="Despair helm",neck="Ire torque +1",ear1="Flame pearl",ear2="Flame pearl",
													body="Despair mail",hands="Despair finger gauntlets",ring1="Vulcan's ring",ring2="Pyrosoul ring",
													back="Cornflower cape",waist="Pipilaka belt",legs="Rawhide trousers",feet="Herculean boots"}
                                                       
        sets.BlueMagic.STRVIT = {ammo="Mavi tathlum",
                                                    head="Despair helm",neck="Ire torque +1",ear1="Flame pearl",ear2="Flame pearl",
													body="Despair mail",hands="Despair finger gauntlets",ring1="Vulcan's ring",ring2="Pyrosoul ring",
													back="Cornflower cape",waist="Pipilaka belt",legs="Rawhide trousers",feet="Despair greaves"}
                                                         
        sets.BlueMagic.STRMND = {ammo="Mavi tathlum",
                                                     head="Carmine mask",neck="Fotia gorget",ear1="Brutal earring",ear2="Ishvara earring",
                                                     body="Amalric doublet",hands="Carmine finger gauntlets",ring1="Epona's ring",ring2="Levia. ring",
                                                     back="Atheling mantle",waist="Fotia belt",legs="Carmine cuisses",feet="Rawhide boots"}
                                                               
        sets.BlueMagic.AGI = {ammo="Mavi tathlum",
                                                  head="Luh. Keffiyeh +1",neck="Ire torque +1",ear1="Flame pearl",ear2="Flame pearl",
												body="Assim. jubbah +1",hands="Iuitl wristbands",ring1="Breezesoul ring",ring2="Auster's ring",
                                                  back="Cornflower cape",waist="Pipilaka belt",legs="Quiahuiz trousers",feet="Luhlaza charuqs +1"}
                                                 
        sets.BlueMagic.INT = {ammo="Ghastly tathlum +1",
                                                  head="Jhakri coronal +1",neck="Sanctity necklace",ear1="Hecate's earring",ear2="Friomisi earring",
                                                  body="Jhakri robe +1",hands="Jhakri cuffs +1",ring1="Vertigo ring",ring2="Acumen ring",
                                                  back="Cornflower cape",waist="Yamabuki-no-Obi",legs="Jhakri slops +1",feet="Jhakri pigaches +1"}
                                                 
        sets.BlueMagic.Cures = {ammo="Aqua sachet",
                                                    head="Uk'uxkaj cap",neck="Aife's medal",ear1="Loquac. earring",ear2="Mendicant's earring",
                                                    body="Assim. jubbah +1",hands="Telchine gloves",ring1="Levia. ring",ring2="Aquasoul ring",
                                                    back="Solemnity cape",waist="Pythia sash +1",legs="Gyve trousers",feet="Assim. charuqs +1"}
                                                       
        sets.BlueMagic.SelfCures = {ammo="Aqua sachet",
                                                    head="Uk'uxkaj cap",neck="Aife's medal",ear1="Loquac. earring",ear2="Mendicant's earring",
                                                    body="Assim. jubbah +1",hands="Telchine gloves",ring1="Levia. ring",ring2="Aquasoul ring",
                                                    back="Solemnity cape",waist="Pythia sash +1",legs="Gyve trousers",feet="Assim. charuqs +1"}
                                                       
        sets.BlueMagic.Stun = {ammo="Mavi tathlum",
                                                   head="Assim. keffiyeh",neck="Sanctity necklace",ear1="Loquac. earring",
                                                   body="Assim. jubbah +1",hands="Mv. bazubands +2",ring1="Prolix ring",ring2="Sangoma ring",
                                                   back="Cornflower cape",waist="Twilight belt",legs="Mavi tayt +2",feet="Luhlaza charuqs +1"}
                                                   
        sets.BlueMagic.HeavyStrike = {ammo="Falcon eye",
                                                          head="Whirlpool mask",neck="Ire torque +1",ear1="Flame pearl",ear2="Heartseeker earring",
                                                          body="Assim. jubbah +1",hands="Umuthi gloves",ring1="Pyrosoul ring",ring2="Petrov  ring",
                                                          back="Cornflower cape",waist="Dynamic belt +1",legs="Manibozho brais",feet="Assim. charuqs +1"}
                                                                 
        sets.BlueMagic.ChargedWhisker = {ammo="Erlene's notebook",
                                                             head="Uk'uxkaj cap",neck="Eddy necklace",ear1="Hecate's earring",ear2="Friomisi earring",
                                                             body="Hagondes Coat +1",hands="Umuthi gloves",ring1="Acumen ring",ring2="Petrov  ring",
                                                             back="Cornflower cape",waist="Pipilaka belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}
		
		sets.BlueMagic.TenebralCrush = {ammo="Ghastly tathlum +1",
                                                  head="Pixie Hairpin +1",neck="Sanctity necklace",ear1="Hecate's earring",ear2="Friomisi earring",
                                                  body="Jhakri robe +1",hands="Jhakri cuffs +1",ring1="Vertigo ring",ring2="Acumen ring",
                                                  back="Cornflower cape",waist="Yamabuki-no-Obi",legs="Jhakri slops +1",feet="Jhakri pigaches +1"}
        
		sets.BlueMagic.WhiteWind = {ammo="Mavi tathlum",
                                                                head="Luh. Keffiyeh +1",neck="Cuamiz collar",ear1="Upsurge Earring",ear2="Cassie earring",
                                                                body="Aetosaur jerkin",hands="Weath. cuffs +1",ring1="Bomb queen ring",ring2="Meridian ring",
                                                                back="Oretania's cape",waist="Gold mog. belt",legs="Desultor tassets",feet="Llwyd's clogs"}
                                                                         
        sets.BlueMagic.MagicAccuracy = {ammo="Mavi Tathlum",
                                                            head="Assim. keffiyeh",neck="Eddy necklace",ear1="Psystorm earring",ear2="Lifestorm earring",
                                                            body="Assim. jubbah +1",hands="Hagondes cuffs",ring1="Mediator's ring",ring2="Sangoma ring",
                                                            back="Cornflower cape",waist="Ovate rope",legs="Mavi tayt +2",feet="Luhlaza charuqs +1"}
                                                                         
        sets.BlueMagic.Skill = {ammo="Mavi tathlum",
                                                        head="Luh. Keffiyeh +1",neck="Jeweled collar",ear1="Loquac. earring",
                                                        body="Assim. jubbah +1",hands="Ayao's gages",ring1="Prolix ring",
                                                        back="Cornflower cape",waist="Twilight belt",legs="Mavi tayt +2",feet="Luhlaza charuqs +1"}
                                                       
        sets.BlueMagic.SkillRecast = {ammo="Mavi tathlum",
                                                              head="Luh. Keffiyeh +1",neck="Jeweled collar",ear1="Loquac. earring",
                                                              body="Assim. jubbah +1",hands="Mv. Bazubands +2",ring1="Prolix ring",
                                                              back="Swith cape",waist="Twilight belt",legs="Mavi tayt +2",feet="Luhlaza charuqs +1"}
                                                                 
                                                                 
                                                                 
                                                                 
                                               
                                               
        --Utility Sets--
        sets.Utility = {}
       
        sets.Utility.Stoneskin = {head="Haruspex hat",neck="Stone Gorget",ear1="Loquac. earring",ear2="Earthcry earring",
                                                          body="Assim. jubbah +1",hands="Stone Mufflers",ring1="Prolix ring",
                                                          back="Swith cape",waist="Siegel sash",legs="Haven hose",feet="Iuitl gaiters"}
                                                         
        sets.Utility.Phalanx = {head="Haruspex hat",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
                                                    body="Assim. jubbah +1",hands="Ayao's gages",ring1="Prolix ring",
                                                        back="Swith cape",waist="Pythia sash +1",legs="Portent pants",feet="Iuitl gaiters"}
                                                       
        sets.Utility.Steps = {ammo="Falcon eye",
                                                  head="Whirlpool mask",ear2="Heartseeker earring",
                                                  body="Thaumas coat",hands="Umuthi gloves",
                                                  back="Letalis cape",waist="Chaac belt",legs="Manibozho brais",feet="Manibozho boots"}
                                                 
        sets.Utility.PDT = {head="Whirlpool mask",neck="Twilight torque",ear1="Ethereal earring",
                                                body="Iuitl vest",hands="Umuthi gloves",ring1="Dark ring",ring2="Dark ring",
                                                back="Mollusca mantle",waist="Flume belt",legs="Iuitl Tights +1",feet="Iuitl gaiters"}
                                               
        sets.Utility.MDT = {head="Whirlpool mask",neck="Twilight torque",
                                                body="Assim. jubbah +1",hands="Umuthi gloves",ring1="Dark ring",ring2="Dark ring",
                                                back="Mollusca mantle",legs="Quiahuiz trousers",feet="Luhlaza charuqs +1"}
                                                       
       
       
       
       
       
        --Job Ability Sets--
       
        sets.JA = {}
       
        sets.JA.ChainAffinity = {feet="Assim. charuqs +1",head="Hashishin kavuk"}
       
        sets.JA.BurstAffinity = {feet="Hashishin Basmak +1"}
       
        sets.JA.Efflux = {legs="Mavi tayt +2"}
       
        sets.JA.AzureLore = {hands="Luh. bazubands +1"}
       
        sets.JA.Diffusion = {feet="Luhlaza Charuqs +1"}
                                                               
                                                               
                       
                       
                       
                       
        --Precast Sets--
        sets.precast = {}
       
        sets.precast.FC = {}
       
        sets.precast.FC.Standard = {ammo="Impatiens",head="Carmine mask",neck="Baetyl pendant", ear1="Loquac. Earring",ear2="Etiolation earring",
                                                            body="Luhlaza jubbah",hands="Leyline Gloves",ring1="Kishar ring",ring2="Weatherspoon ring",
                                                        back="Swith Cape",waist="Witful Belt",legs="Psycloth lappas",feet="Carmine greaves"}
       
        sets.precast.FC.Blue = {ammo="Impatiens",head="Carmine mask",neck="Baetyl pendant", ear1="Loquac. Earring",ear2="Etiolation earring",
                                                        body="Hashishin mintan",hands="Leyline Gloves",ring1="Kishar ring",ring2="Weatherspoon ring",
                                                        back="Swith Cape",waist="Witful Belt",legs="Psycloth lappas",feet="Carmine greaves"}      
end
 
 
 
 
 
 
function precast(spell)
        if spell.action_type == 'Magic' then
                equip(sets.precast.FC.Standard)
                               
                if spell.skill == 'Blue Magic' then
                equip(sets.precast.FC.Blue)
                end
        end
       
        if spell.english == 'Azure Lore' then
                equip(sets.JA.AzureLore)
        end
       
        if spell.english == 'Requiescat' or spell.english == 'Savage Blade' then
                equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
        end
       
        if spell.english == 'Chant du Cygne' then
                equip(sets.ChantDuCygne[sets.ChantDuCygne.index[ChantDuCygne_ind]])
        end
       
        if spell.english == 'Circle Blade' then
                equip(sets.WS.CircleBlade)
        end
               
        if spell.english == 'Expiacion' then
                equip(sets.WS.Expiacion)
        end
       
        if spell.english == 'Sanguine Blade' then
                equip(sets.WS.SanguineBlade)
        end
       
        if spell.english == 'Box Step' then
                equip(sets.Utility.Steps)
        end
       
        if spell.english == 'Realmrazer' then
                equip(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
        end
       
        if spell.english == 'Flash Nova' then
                equip(sets.WS.FlashNova)
        end
end
       
function midcast(spell,act)
        if spell.english == 'Vertical Cleave' or spell.english == 'Death Scissors' or spell.english == 'Empty Thrash' or spell.english == 'Dimensional Death' or spell.english == 'Quadrastrike' or spell.english == 'Bloodrake' then
                equip(sets.BlueMagic.STR)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
               
        if spell.english == 'Disseverment' or spell.english == 'Hysteric Barrage' or spell.english == 'Frenetic Rip' or spell.english == 'Seedspray' or spell.english == 'Vanity Dive' or spell.english == 'Goblin Rush' or spell.english == 'Paralyzing Triad' or spell.english == 'Thrashing Assault' then
                equip(sets.BlueMagic.STRDEX)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Quad. Continuum' or spell.english == 'Delta Thrust' or spell.english == 'Cannonball' or spell.english == 'Glutinous Dart' then
                equip(sets.BlueMagic.STRVIT)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Whirl of Rage' then
                equip(sets.BlueMagic.STRMND)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Benthic Typhoon' or spell.english == 'Final Sting' or spell.english == 'Spiral Spin' then
                equip(sets.BlueMagic.AGI)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Gates of Hades' or spell.english == 'Searing Tempest' or spell.english == 'Blindig Fulgor' or spell.english == 'Spectral Floe' or spell.english == 'Tenebral Crush' or spell.english == 'Entomb' or spell.english == 'Silent Storm' or spell.english == 'Anvil Lightning' or spell.english == 'Leafstorm' or spell.english == 'Firespit' or spell.english == 'Acrid Stream' or spell.english == 'Regurgitation' or spell.english == 'Corrosive Ooze' or spell.english == 'Thermal Pulse' or spell.english == 'Magic Hammer' or spell.english == 'Evryone. Grudge' or spell.english == 'Water Bomb' or spell.english == 'Dark Orb' or spell.english == 'Thunderbolt' or spell.english == 'Tem. Upheaval' or spell.english == 'Embalming Earth' or spell.english == 'Foul Waters' or spell.english == 'Rending Deluge' or spell.english == 'Droning Whirlwind' or spell.english == 'Subduction' then
                equip(sets.BlueMagic.INT)
                if buffactive['Burst Affinity'] then
                        equip(sets.JA.BurstAffinity)
                end
        end
       
        if spell.english == 'Magic Fruit' or spell.english == 'Plenilune Embrace' or spell.english == 'Wild Carrot' or spell.english == 'Pollen' or spell.english == 'Cure III' or spell.english == 'Cure IV' then
                equip(sets.BlueMagic.Cures)
                        if spell.target.name == player.name and string.find(spell.english, 'Magic Fruit') or string.find(spell.english, 'Plenilune Embrace') or string.find(spell.english, 'Wild Carrot') or string.find(spell.english, 'Cure III') or string.find(spell.english, 'Cure IV') then
                                equip(sets.BlueMagic.SelfCures)
                        end
        end
       
        if spell.english == 'White Wind' then
                equip(sets.BlueMagic.WhiteWind)
        end
       
        if spell.english == 'Head Butt' or spell.english == 'Sudden Lunge' or spell.english == 'Blitzstrahl' then
                equip(sets.BlueMagic.Stun)
        end
       
        if spell.english == 'Heavy Strike' then
                equip(sets.BlueMagic.HeavyStrike)
        end
       
        if spell.english == 'Charged Whisker' then
                equip(sets.BlueMagic.ChargedWhisker)
                if buffactive['Burst Affinity'] then
                        equip(sets.JA.BurstAffinity)
                end
        end
       
        if spell.english == 'Frightful Roar' or spell.english == 'Infrasonics' or spell.english == 'Barbed Crescent' or spell.english == 'Tourbillion' or spell.english == 'Cimicine Discharge' or spell.english == 'Sub-zero smash' or spell.english == 'Filamented Hold' or spell.english == 'Mind Blast' or spell.english == 'Sandspin' or spell.english == 'Hecatomb Wave' or spell.english == 'Cold Wave' or spell.english == 'Terror Touch' then
                equip(sets.BlueMagic.MagicAccuracy)
        end
       
        if spell.english == 'MP Drainkiss' or spell.english == 'Digest' or spell.english == 'Blood Saber' or spell.english == 'Blood Drain' or spell.english == 'Osmosis' or spell.english == 'Occultation' or spell.english == 'Magic Barrier' or spell.english == 'Diamondhide' or spell.english == 'Metallic Body' or spell.english == 'Retinal Glare' then
                equip(sets.BlueMagic.SkillRecast)
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
       
        if spell.english == 'Cocoon' or spell.english == 'Harden Shell' or spell.english == 'Animating Wail' or spell.english == 'Battery Charge' or spell.english == 'Nat. Meditation' or spell.english == 'Carcharian Verve' or spell.english == 'O. Counterstance' or spell.english == 'Barrier Tusk' or spell.english == 'Saline Coat' or spell.english == 'Regeneration' or spell.english == 'Erratic Flutter' then
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
end
 
function aftercast(spell)
        if player.status == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
       
        if spell.action_type == 'Weaponskill' then
                add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
        end
end
 
function status_change(new,old)
        if new == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        else
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end
 
function self_command(command)
        if command == 'toggle TP set' then
                TP_ind = TP_ind +1
                if TP_ind > #sets.TP.index then TP_ind = 1 end
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'toggle Idle set' then
                Idle_ind = Idle_ind +1
                if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
                send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        elseif command == 'toggle Req set' then
                Requiescat_ind = Requiescat_ind +1
                if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
                send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
        elseif command == 'toggle CDC set' then
                ChantDuCygne_ind = ChantDuCygne_ind +1
                if ChantDuCygne_ind > #sets.ChantDuCygne.index then ChantDuCygne_ind = 1 end
                send_command('@input /echo <----- Chant du Cygne Set changed to '..sets.ChantDuCygne.index[ChantDuCygne_ind]..' ----->')
        elseif command == 'toggle Rea set' then
                Realmrazer_ind = Realmrazer_ind +1
                if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
                send_command('@input /echo <----- Realmrazer Set changed to '..sets.Realmrazer.index[Realmrazer_ind]..' ----->')
        elseif command == 'equip TP set' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'equip Idle set' then
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end