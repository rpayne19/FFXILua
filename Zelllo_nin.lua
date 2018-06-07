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
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-Ate"}
    gear.DayFeet = "Danzo Sune-Ate"
    gear.NightFeet = "Hachiya Kyahan +3"
    
    select_movement_feet()
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    --sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}
	sets.precast.JA['Provoke'] = {
		
		head="Hachiya Hatsu. +3",
		body="Emet Harness",
		hands="Hachiya Tekko +3",
		feet={ name="Mochi. Kyahan +1", augments={'Reduces elem. ninjutsu III cast time',}},
        legs={ name="Herculean Trousers", augments={'"Store TP"+4','Attack+23','Quadruple Attack +3','Accuracy+9 Attack+9',}},		feet={ name="Mochi. Kyahan +1", augments={'Reduces elem. ninjutsu III cast time',}},
		neck="Unmoving Collar +1",
		waist="Light Belt",
		left_ear="Iga Mimikazari",
		right_ear="Brutal Earring",
		left_ring="Begrudging Ring",
		right_ring="Apate Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}},
	}
	
	sets.precast.JA['Mijin Gakure'] = {legs='Mochi. Hakama +1'}

    ---- Waltz set (chr and vit)
    --sets.precast.Waltz = {ammo="Sonia's Plectrum",
    --    head="Felistris Mask",
    --    body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
    --    back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
    --    -- Uk'uxkaj Cap, Daihanshi Habaki
    --    
    ---- Don't need any special gear for Healing Waltz.
    --sets.precast.Waltz['Healing Waltz'] = {}
    --
    ---- Set for acc on steps, since Yonin drops acc a fair bit
    --sets.precast.Step = {
    --    head="Whirlpool Mask",neck="Ej Necklace",
    --    body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
    --    back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}
    --
    --sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		--ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'Mag. Acc.+16','"Fast Cast"+5','INT+5','"Mag.Atk.Bns."+14',}},
		body={ name="Adhemar Jacket", augments={'HP+80','"Fast Cast"+7','Magic dmg. taken -3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Gyve Trousers",
		feet="Hiza. Sune-Ate +1",
		neck="Magoraga Beads",
		waist="Hurch'lan Sash",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Apate Ring",
		right_ring="Prolix Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}},
	}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    -- Snapshot for ranged
    --sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		
		head="Hachiya Hatsu. +3",
		body="Mummu Jacket +2",
		hands="Mummu Wrists +2",
		legs="Hiza. Hizayoroi +2",
		feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
		neck="Soil Gorget",
		waist="Soil Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
        left_ring="Regal Ring",
        right_ring="Ramuh Ring +1",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
	}
		
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {ear1="Brutal Earring"})

    sets.precast.WS['Blade: Hi'] = {
		ammo="Yetshila",
		head="Hachiya Hatsu. +3",
		body="Ken. Samue",
		hands="Mummu Wrists +2",
		legs="Hiza. Hizayoroi +2",
		feet="Mummu Gamash. +1",
		neck="Iga Erimaki",
		waist="Soil Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
		left_ring="Regal Ring",
		right_ring="Begrudging Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
	}

    --sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS,
    --    {head="Felistris Mask",hands="Hachiya Tekko",ring1="Stormsoul Ring",legs="Nahtirah Trousers"})

    sets.precast.WS['Blade: Shun'] = {
		
		head="Hachiya Hatsu. +3",
		body="Mummu Jacket +2",
		hands="Mummu Wrists +2",
		legs="Hiza. Hizayoroi +2",
		feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
		neck="Moonbeam Nodowa",
		waist="Light Belt",
		left_ear="Ishvara Earring",
		right_ear="Brutal Earring",
        left_ring="Regal Ring",
        right_ring="Ramuh Ring +1",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
    }
    
    sets.precast.WS['Blade: Metsu'] = {
        ammo="Jukukik Feather",
        head="Hachiya Hatsu. +3",
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Hiza. Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
        neck="Soil Gorget",
        waist="Soil Belt",
        left_ear="Brutal Earring",
        right_ear="Ishvara Earring",
        left_ring="Regal Ring",
        right_ring="Ramuh Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','Weapon skill damage +10%',}},
    }

    sets.precast.WS['Aeolian Edge'] = {
		
		head="Hachiya Hatsu. +3",
		body="Hachiya Chain. +3",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Sanctity Necklace",
		waist="Salire Belt",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Haverton Ring",
		right_ring="Resonance Ring",
		back={ name="Andartia's Mantle", augments={'INT+3','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+2',}},
	}
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        ear2="Loquacious Earring", ring1="Prolix Ring"}
        
    sets.midcast.Utsusemi = set_combine(sets.midcast.SelfNinjutsu, {feet="Hattori Kyahan"})

    sets.midcast.ElementalNinjutsu = {		
		head="Hachiya Hatsu. +3",
		body="Hachiya Chain. +3",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Sanctity Necklace",
		waist="Salire Belt",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Andartia's Mantle", augments={'INT+3','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+2',}},
	}

    sets.midcast.ElementalNinjutsu.Resistant = {		
		head="Hachiya Hatsu. +3",
		body="Hachiya Chain. +3",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Sanctity Necklace",
		waist="Salire Belt",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Haverton Ring",
		right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'INT+3','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+2',}},
	}

    sets.midcast.NinjutsuDebuff = set_combine(sets.midcast.Ninjutsu, {ear1="Lifestorm Earring",ear2="Psystorm Earring"})

    sets.midcast.NinjutsuBuff = sets.midcast.Utsusemi

    sets.midcast.RA = {
		head="Hachiya Hatsu. +3",
		body="Hachiya Chain. +3",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Sanctity Necklace",
		waist="Salire Belt",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Haverton Ring",
		right_ring="Apate Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}},
	}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
	sets.resting = {
		ammo="Happo Shuriken",
		head="Hachiya Hatsu. +3",
		body="Hiza. Haramaki +1",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Epona's Ring",
		right_ring="Mummu Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
    
    -- Idle sets
    sets.idle = {
		ammo="Happo Shuriken",
		head="Hachiya Hatsu. +3",
		body="Hiza. Haramaki +1",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet=gear.MovementFeet,
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Epona's Ring",
		right_ring="Mummu Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
	
	--{
    --    head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
    --    body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --    back="Shadow Mantle",waist="Flume Belt",legs="Hachiya Hakama",feet=gear.MovementFeet
	--}

    sets.idle.Town = sets.idle
    
    sets.idle.Weak = sets.idle
    
    -- Defense sets
    sets.defense.Evasion = {
		head="Hachiya Hatsu. +3",
		body="Hachiya Chain. +3",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Sanctity Necklace",
		waist="Salire Belt",
		left_ear="Bladeborn Earring",
		right_ear="Steelflash Earring",
		left_ring="Haverton Ring",
		right_ring="Apate Ring",
		back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}},
	}

    sets.defense.PDT = {
		ammo="Happo Shuriken",
		head="Hachiya Hatsu. +3",
		body="Hiza. Haramaki +1",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Epona's Ring",
		right_ring="Mummu Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

    sets.defense.MDT = {
		ammo="Happo Shuriken",
		head="Hachiya Hatsu. +3",
		body="Hiza. Haramaki +1",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Epona's Ring",
		right_ring="Mummu Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

    sets.Kiting = {feet=gear.MovementFeet}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		ammo="Happo Shuriken",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Ken. Samue",
		hands={ name="Herculean Gloves", augments={'Rng.Acc.+17','"Triple Atk."+4','DEX+9','Attack+12',}},
        legs={ name="Herculean Trousers", augments={'"Store TP"+4','Attack+23','Quadruple Attack +3','Accuracy+9 Attack+9',}},		
		feet={ name="Herculean Boots", augments={'Attack+28','"Triple Atk."+4','AGI+3','Accuracy+5',}},
		neck="Moonbeam Nodowa",
		waist="Windbuffet Belt +1",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Epona's Ring",
		right_ring="Apate Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
	
    sets.engaged.Acc = {
		ammo="Happo Shuriken",
		head="Hachiya Hatsu. +3",
		body="Hiza. Haramaki +1",
		hands="Hachiya Tekko +3",
		legs="Hachiya Hakama +3",
		feet="Hachiya Kyahan +3",
		neck="Moonbeam Nodowa",
		waist="Windbuffet Belt +1",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		left_ring="Epona's Ring",
		right_ring="Mummu Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}
	
    sets.engaged.Evasion = sets.engaged.Acc
	
    sets.engaged.Acc.Evasion = sets.engaged.Acc
	
    sets.engaged.PDT = sets.defense.PDT
	
    sets.engaged.Acc.PDT = sets.defense.PDT

    -- Custom melee group: High Haste (~20% DW)
    sets.engaged.HighHaste = set_combine(sets.engaged, {body= "Mochi. Chainmail +1", feet="Hiza. sune-ate +2"})
    sets.engaged.Acc.HighHaste = set_combine(sets.engaged.Acc, {body= "Mochi. Chainmail +1", feet="Hiza. sune-ate +2"})
    sets.engaged.Evasion.HighHaste = set_combine(sets.engaged.Evasion, {body= "Mochi. Chainmail +1", feet="Hiza. sune-ate +2"})
    sets.engaged.Acc.Evasion.HighHaste = set_combine(sets.engaged.Acc.Evasion, {body= "Mochi. Chainmail +1", feet="Hiza. sune-ate +2"})
    sets.engaged.PDT.HighHaste = set_combine(sets.engaged.PDT, {body= "Mochi. Chainmail +1", feet="Hiza. sune-ate +2"})
    sets.engaged.Acc.PDT.HighHaste = set_combine(sets.engaged.PDT.Acc, {body= "Mochi. Chainmail +1", feet="Hiza. sune-ate +2"})

    -- Custom melee group: Embrava Haste (7% DW)
    sets.engaged.EmbravaHaste = set_combine(sets.engaged, {feet="Hiza. sune-ate +2"})
    sets.engaged.Acc.EmbravaHaste = set_combine(sets.engaged.Acc, {feet="Hiza. sune-ate +2"})
    sets.engaged.Evasion.EmbravaHaste = set_combine(sets.engaged.Evasion, {feet="Hiza. sune-ate +2"})
    sets.engaged.Acc.Evasion.EmbravaHaste = set_combine(sets.engaged.Acc.Evasion, {feet="Hiza. sune-ate +2"})
    sets.engaged.PDT.EmbravaHaste = set_combine(sets.engaged.PDT, {feet="Hiza. sune-ate +2"})
    sets.engaged.Acc.PDT.EmbravaHaste = set_combine(sets.engaged.Acc.PDT, {feet="Hiza. sune-ate +2"})

    -- Custom melee group: Max Haste (0% DW)
    sets.engaged.MaxHaste = sets.engaged
	
    sets.engaged.Acc.MaxHaste = sets.engaged.Acc
	
    sets.engaged.Evasion.MaxHaste = sets.engaged.Evasion
	
    sets.engaged.Acc.Evasion.MaxHaste = sets.engaged.Evasion
	
    sets.engaged.PDT.MaxHaste = sets.engaged.PDT
	
    sets.engaged.Acc.PDT.MaxHaste = sets.engaged.PDT


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi +1"}
    sets.buff.Doom = {ring2="Purity Ring", waist="Gishdubar Sash"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
	sets.buff.Futae = {hands="Hattori Tekko +1"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 3)
    else
        set_macro_page(1, 1)
    end
end
