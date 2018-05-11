-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
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
'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb', 'Spectral Floe', 'Entomb', 
'Searing Tempest', 'Tenebral Crush', 'Enbalming Earth',
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
'Pyric Bulwark','Reactor Cool','Occultation'
}
-- Other general buffs
blue_magic_maps.Buff = S{
'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
'Memento Mori','Nat. Meditation','Orcish Counterstance','Refueling',
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
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning', 'Cleave')
state.WeaponskillMode:options('Normal', 'Acc')
state.CastingMode:options('Normal', 'Resistant', 'Cleave')
state.IdleMode:options('Normal', 'PDT', 'Learning', 'Cleave')
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
sets.buff['Burst Affinity'] = {}
sets.buff['Chain Affinity'] = {}
sets.buff.Convergence = {}
sets.buff.Diffusion = {}
sets.buff.Enchainment = {}
sets.buff.Efflux = {}

-- Precast Sets
-- Precast sets to enhance JAs
sets.precast.JA['Azure Lore'] = {}
sets.precast.JA['Provoke'] = {
    head="Despair Helm", --todo augment despair helm with 7 enmity (path D)
    body="Emet Harness",
    hands={ name="Adhemar Wrist. +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
    legs="Obatala Subligar",
    neck="Unmoving Collar +1",
    waist="Sulla Belt",
    left_ear="Friomisi Earring",
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
}

-- Waltz set (chr and vit)
sets.precast.Waltz = {}
-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells
sets.precast.FC = {
    head={ name="Herculean Helm", augments={'Mag. Acc.+23','"Fast Cast"+5','INT+7','"Mag.Atk.Bns."+10',}},
    body={ name="Taeon Tabard", augments={'"Snapshot"+4','"Snapshot"+4',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    left_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
}

--sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wrist. +1",
    legs={ name="Herculean Trousers", augments={'"Dbl.Atk."+2','STR+5','Weapon skill damage +6%','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
    feet="Adhe. Gamashes +1",
    neck="Caro Necklace",
    waist="Windbuffet Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ramuh Ring +1",
    back="Bleating Mantle",
}

sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Assimilator's Bazubands +2"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Requiescat'] = {
    ammo="Ginsen",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Phalaina Locket",
    waist="Porous Rope",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ramuh Ring +1",
    back="Bleating Mantle",
}

sets.precast.WS['Sanguine Blade'] = {
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring",
    back="Izdubar Mantle",
}

sets.precast.WS['Chant du Cygne'] = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wrist. +1",
    legs={ name="Herculean Trousers", augments={'Rng.Acc.+6','Weapon skill damage +4%','DEX+7','Rng.Atk.+9',}},
    feet="Adhe. Gamashes +1"
    neck="Caro Necklace",
    waist="Light Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Begrudging Ring",
    right_ring="Ramuh Ring +1",
    back="Bleating Mantle",
}

-- Midcast Sets
sets.midcast.FastRecast = {
	head="Haruspex Hat",
	ear2="Loquacious Earring", 
	ring1="Prolix Ring"}
	
sets.midcast['Blue Magic'] = {}
-- Physical Spells --
sets.midcast['Blue Magic'].Physical = {
	ammo="Mavi Tathlum",
	head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
	neck="Sanctity Necklace",
	body="Assimilator's jubbah +2",
	hands="Assimilator's Bazubands +2",
	legs="Assimilator's shalwar +2",
	feet="Assimilator's charuqs +2",
	waist="Grunfeld Rope",
	ear1="Heartseeker Earring",
	ear2="Steelflash Earring",
	ring1="Rajas Ring",
	ring2="Apate Ring",
    back={ name="Cornflower Cape", augments={'MP+17','DEX+5','Accuracy+2','Blue Magic skill +10',}}
}

sets.midcast['Blue Magic'].PhysicalAcc = {
	ammo="Mavi Tathlum",
	head={ name="Dampening Tam", augments={'DEX+10','Accuracy+15','Mag. Acc.+15','Quadruple Attack +3',}},
	neck="Sanctity Necklace",
	body="Assimilator's jubbah +2",
	hands="Assimilator's Bazubands +2",
	legs="Assimilator's shalwar +2",
	feet="Assimilator's charuqs +2",
	waist="Grunfeld Rope",
	ear1="Heartseeker Earring",
	ear2="Steelflash Earring",
	ring1="Rajas Ring",
	ring2="Apate Ring",
    back={ name="Cornflower Cape", augments={'MP+17','DEX+5','Accuracy+2','Blue Magic skill +10',}}
}

sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
	{
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands="Assimilator's Bazubands +2",
		ring1="Ifrit Ring +1",
		ring2="Ifrit Ring +1"
	}
)

sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
	{
		ammo="Jukukik Feather",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands="Assimilator's Bazubands +2",
		waist="Grunfeld Rope",
		ring1="Ramuh Ring +1",
		ring2="Ramuh Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	}
)

sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
	{
		hands="Assimilator's Bazubands +2",
		feet="Aya. Gambieras +2",
		ring1="Ayanmo Ring"
	}
)

sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
	{
		head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
		hands="Assimilator's Bazubands +2",
		ring1="Rajas Ring",
		ring2="Apate Ring"
	}
)

sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
	{		
		ammo="Ghastly Tathlum",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
)

sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
	{		
		ammo="Hydrocera",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Aya. Gambieras +2",
		ring1="Ayanmo Ring"
	}
)

sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
	{
		hands="Assimilator's Bazubands +2",
	}
)

sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)

-- Magical Spells --
sets.midcast['Blue Magic'].Magical = {
    ammo="Mavi Tathlum",
    head="Jhakri Coronal +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet={ name="Amalric Nails +1", augments={'Mag. Acc.+20','"Mag.Atk.Bns."+20','"Conserve MP"+7',}},
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
	{	
		head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
	}
)

sets.midcast['Blue Magic'].Magical.Cleave = set_combine(sets.midcast['Blue Magic'].Magical,
	{		
		main={ name="Vampirism", augments={'STR+5','INT+6','DMG:+8',}},
		sub={ name="Iris", augments={'Blue Magic skill +15','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
	}
)

sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
	{		
		ammo="Hydrocera",
		feet="Aya. Gambieras +2",
		ring1="Ayanmo Ring"
	}
)
sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical,
	{		
		feet="Aya. Gambieras +2",
		ring1="Ayanmo Ring"
	}
)

sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
	{		
		feet="Aya. Gambieras +2",
		ring1="Ayanmo Ring"
	}
)

sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical,
	{		
		ammo="Hydrocera",
		feet="Aya. Gambieras +2",
		ring1="Ayanmo Ring"
	}
)

sets.midcast['Blue Magic'].MagicAccuracy = {
    ammo="Ghastly Tathlum",
	head={ name="Amalric Coif +1", augments={'INT+12','Mag. Acc.+25','Enmity-6',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

-- Breath Spells --
sets.midcast['Blue Magic'].Breath = {
    ammo="Ghastly Tathlum",
    head="Jhakri Coronal +2",
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
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

sets.midcast['Blue Magic'].SkillBasedBuff = {
    ammo="Mavi Tathlum",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Assim. Jubbah +2",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Herculean Trousers", augments={'Attack+14','"Triple Atk."+4','DEX+7','Accuracy+8',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+4','Attack+4',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Cornflower Cape", augments={'MP+17','DEX+5','Accuracy+2','Blue Magic skill +10',}},
}


sets.midcast['Blue Magic'].Buff = {}
sets.midcast.Protect = {}
sets.midcast.Protectra = {}
sets.midcast.Shell = {}
sets.midcast.Shellra = {}
-- Sets to return to when not performing an action.
-- Gear for learning spells: +skill and AF hands.
sets.Learning = {ammo="Mavi Tathlum",hands="Assimilator's Bazubands +1",
    back={ name="Cornflower Cape", augments={'MP+17','DEX+5','Accuracy+2','Blue Magic skill +10',}},}
--head="Luhlaza Keffiyeh",
--body="Assimilator's Jubbah",hands="Assimilator's Bazubands +1",
--back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs"}
sets.latent_refresh = {waist="Fucho-no-obi"}
-- Resting sets
sets.resting = {
    ammo="Staunch Tathlum",
    head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
    body="Jhakri Robe +2",
    hands="Aya. Manopolas +1",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+4','Attack+4',}},
    neck="Loricate Torque +1",
    waist="Shinjutsu-no-Obi",
    left_ear="Loquac. Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Renaye Ring",
    back="Solemnity Cape",
}
-- Idle sets
sets.idle = {
    ammo="Staunch Tathlum",
    head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
    body="Jhakri Robe +1",
    hands={ name="Herculean Gloves", augments={'Rng.Acc.+17','"Triple Atk."+4','DEX+9','Attack+12',}},
    legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}},
    feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Handler's Earring +1",
    right_ear="Odnowa Earring",
    left_ring={ name="Dark Ring", augments={'Spell interruption rate down -3%','Phys. dmg. taken -6%',}},
    right_ring="Jelly Ring",
    back="Solemnity Cape",
}

sets.idle.PDT = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Renaye Ring",
    back="Solemnity Cape",
}

sets.idle.Cleave = {
	main="Earth Staff",
    ammo="Staunch Tathlum",
    head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
    body="Jhakri Robe +1",
    hands={ name="Herculean Gloves", augments={'Rng.Acc.+17','"Triple Atk."+4','DEX+9','Attack+12',}},
    legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}},
    feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Handler's Earring +1",
    right_ear="Odnowa Earring",
    left_ring={ name="Dark Ring", augments={'Spell interruption rate down -3%','Phys. dmg. taken -6%',}},
    right_ring="Jelly Ring",
    back="Solemnity Cape",
}

-- Defense sets
sets.defense.PDT = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Renaye Ring",
    back="Solemnity Cape",
}

sets.defense.MDT = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Eabani Earring",
    left_ring="Defending Ring",
    right_ring="Renaye Ring",
    back="Solemnity Cape",
}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group
sets.engaged = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wrist. +1",
    legs={ name="Herculean Trousers", augments={'Rng.Atk.+5','"Triple Atk."+4','DEX+5','Accuracy+7',}},
    feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
    neck="Clotharius Torque",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}

sets.engaged.Acc = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wrist. +1",
    legs={ name="Herculean Trousers", augments={'Rng.Atk.+5','"Triple Atk."+4','DEX+5','Accuracy+7',}},
    feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
    neck="Clotharius Torque",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ramuh Ring +1",
    back="Bleating Mantle",
}

sets.engaged.Refresh = {
    ammo="Ginsen",
    head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+4','Attack+4',}},
    neck="Decimus Torque",
    waist="Kentarch Belt",
    left_ear="Suppanomimi",
    right_ear="Cessance Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}

sets.engaged.DW = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wrist. +1",
    legs={ name="Herculean Trousers", augments={'Rng.Atk.+5','"Triple Atk."+4','DEX+5','Accuracy+7',}},
    feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
    neck="Clotharius Torque",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}

sets.engaged.DW.Acc = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands="Adhemar Wrist. +1",
    legs={ name="Herculean Trousers", augments={'Rng.Atk.+5','"Triple Atk."+4','DEX+5','Accuracy+7',}},
    feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
    neck="Clotharius Torque",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ramuh Ring +1",
    back="Bleating Mantle",
}

sets.engaged.DW.Refresh = {
    ammo="Ginsen",
    head={ name="Rawhide Mask", augments={'HP+50','Accuracy+15','Evasion+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+4','Attack+4',}},
    neck="Decimus Torque",
    waist="Kentarch Belt",
    left_ear="Suppanomimi",
    right_ear="Cessance Earring",
    left_ring="Ramuh Ring +1",
    right_ring="Ramuh Ring +1",
    back="Bleating Mantle",
}

sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)
sets.self_healing = {}
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