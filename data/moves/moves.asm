; Characteristics of each move.

MACRO move
	db \1 ; animation
	db \2 ; effect
	db \3 ; power
	db \4 | \5 ; type
	db \6 percent ; accuracy
	db \7 ; pp
	db \8 percent ; effect chance
	assert \7 <= 40, "PP must be 40 or less"
ENDM

Moves:
; entries correspond to move ids (see constants/move_constants.asm)
	table_width MOVE_LENGTH, Moves
	move POUND,        EFFECT_NORMAL_HIT,         40, NORMAL,        PHYSICAL, 100, 35,   0 ; No changes
	move KARATE_CHOP,  EFFECT_NORMAL_HIT,         50, FIGHTING,      PHYSICAL, 100, 25,   0 ; No changes
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          15, NORMAL,        PHYSICAL,  85, 10,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly
	move COMET_PUNCH,  EFFECT_MULTI_HIT,          18, NORMAL,        PHYSICAL,  85, 15,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly
	move MEGA_PUNCH,   EFFECT_NORMAL_HIT,         80, NORMAL,        PHYSICAL,  85, 20,   0 ; No changes
	move PAY_DAY,      EFFECT_PAY_DAY,            40, NORMAL,        PHYSICAL, 100, 20,   0 ; NEED TO: changes to overworld engine
	move FIRE_PUNCH,   EFFECT_BURN_HIT,           75, FIRE,          PHYSICAL, 100, 15,  10 ; Fire-type damaging moves thaw the target
	move ICE_PUNCH,    EFFECT_FREEZE_HIT,         75, ICE,           PHYSICAL, 100, 15,  10 ; No changes
	move THUNDERPUNCH, EFFECT_PARALYZE_HIT,       75, ELECTRIC,      PHYSICAL, 100, 15,  10 ; Electric-type targets can't be paralyzed
	move SCRATCH,      EFFECT_NORMAL_HIT,         40, NORMAL,        PHYSICAL, 100, 35,   0 ; No changes
	move VICEGRIP,     EFFECT_NORMAL_HIT,         55, NORMAL,        PHYSICAL, 100, 30,   0 ; No changes
	move GUILLOTINE,   EFFECT_OHKO,                0, NORMAL,        PHYSICAL,  30,  5,   0 ; NEED TO: OHKO moves are not affected by accuracy changes, +1% accuracy for every level
	move RAZOR_WIND,   EFFECT_RAZOR_WIND,         80, NORMAL,        SPECIAL,  100, 10,   0 ; Accuracy 75% -> 100%
	move SWORDS_DANCE, EFFECT_ATTACK_UP_2,         0, NORMAL,        STATUS,   100, 20,   0 ; PP 30 -> 20
	move CUT,          EFFECT_NORMAL_HIT,         50, NORMAL,        PHYSICAL,  95, 30,   0 ; No changes | Marked for deletion
	move GUST,         EFFECT_GUST,               40, FLYING,        SPECIAL,  100, 35,   0 ; Power is doubled instead of damage if used against a flying opponent | Gust is now affected by king's rock
	move WING_ATTACK,  EFFECT_NORMAL_HIT,         60, FLYING,        PHYSICAL, 100, 35,   0 ; No changes
	move WHIRLWIND,    EFFECT_FORCE_SWITCH,        0, NORMAL,        STATUS,   100, 20,   0 ; Priority -1 -> -3, NEED TO: only fail based on level difference, cannot force a flying or digging mon to switch, can force a protected mon to switch, cannot miss
	move FLY,          EFFECT_FLY,                90, FLYING,        PHYSICAL,  95, 15,   0 ; Power 70 -> 90 | NEED TO: confirm if gust and twister double in power or damage
	move BIND,         EFFECT_TRAP_TARGET,        15, NORMAL,        PHYSICAL,  85, 20,   0 ; Damage per turn for trapping moves 1/16 max hp -> 1/8 max hp | Accuracy 75% -> 85% | Turns trapped 2-5 -> 4-5 | Trapping moves are affected by King's Rock
	move SLAM,         EFFECT_NORMAL_HIT,         80, NORMAL,        PHYSICAL,  75, 20,   0 ; No changes
	move VINE_WHIP,    EFFECT_NORMAL_HIT,         45, GRASS,         PHYSICAL, 100, 25,   0 ; Power 35 -> 45 | pp 10 -> 25
	move STOMP,        EFFECT_STOMP,              65, NORMAL,        PHYSICAL, 100, 20,  30 ; Stomp never misses against a minimized target
	move DOUBLE_KICK,  EFFECT_DOUBLE_HIT,         30, FIGHTING,      PHYSICAL, 100, 30,   0 ; Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly | NEED TO: check if substitute falling ends the move early
	move MEGA_KICK,    EFFECT_NORMAL_HIT,        120, NORMAL,        PHYSICAL,  75,  5,   0 ; No changes
	move JUMP_KICK,    EFFECT_JUMP_KICK,         100, FIGHTING,      PHYSICAL,  95, 10,   0 ; Crash damage is 1/2 max hp, not 1/8th of the damage | Power 70 -> 100 | pp 25 -> 10 | NEED TO: update end turn effects if the user fained from crash damage
	move ROLLING_KICK, EFFECT_FLINCH_HIT,         60, FIGHTING,      PHYSICAL,  85, 15,  30 ; No changes
	move SAND_ATTACK,  EFFECT_ACCURACY_DOWN,       0, GROUND,        STATUS,   100, 15,   0 ; No changes
	move HEADBUTT,     EFFECT_FLINCH_HIT,         70, NORMAL,        PHYSICAL, 100, 15,  30 ; No changes
	move HORN_ATTACK,  EFFECT_NORMAL_HIT,         65, NORMAL,        PHYSICAL, 100, 25,   0 ; No changes
	move FURY_ATTACK,  EFFECT_MULTI_HIT,          15, NORMAL,        PHYSICAL,  85, 20,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly
	move HORN_DRILL,   EFFECT_OHKO,                1, NORMAL,        PHYSICAL,  30,  5,   0 ; NEED TO: OHKO moves are not affected by accuracy changes, +1% accuracy for every level
	move TACKLE,       EFFECT_NORMAL_HIT,         40, NORMAL,        PHYSICAL, 100, 35,   0 ; Power 35 -> 45 | Accuracy 95% -> 100%
	move BODY_SLAM,    EFFECT_BODY_SLAM,          85, NORMAL,        PHYSICAL, 100, 15,  30 ; Body slam does double damage to minimize | Body Slam never misses against a minimized target
	move WRAP,         EFFECT_TRAP_TARGET,        15, NORMAL,        PHYSICAL,  90, 20,   0 ; Damage per turn for trapping moves 1/16 max hp -> 1/8 max hp | Turns trapped 2-5 -> 4-5 | Trapping moves are affected by King's Rock | Accuracy 85% -> 90%
	move TAKE_DOWN,    EFFECT_RECOIL_HIT,         90, NORMAL,        PHYSICAL,  85, 20,   0 ; No changes
	move THRASH,       EFFECT_RAMPAGE,           120, NORMAL,        PHYSICAL, 100, 10,   0 ; Power 90 -> 120 | pp 20 -> 10 | NEED TO: update factors that disrupt rampage
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT,        120, NORMAL,        PHYSICAL, 100, 15,   0 ; Recoil damage: 1/4 -> 1/3
	move TAIL_WHIP,    EFFECT_DEFENSE_DOWN,        0, NORMAL,        STATUS,   100, 30,   0 ; No changes
	move POISON_STING, EFFECT_POISON_HIT,         15, POISON,        PHYSICAL, 100, 35,  30 ; No changes
	move TWINEEDLE,    EFFECT_POISON_MULTI_HIT,   25, BUG,           PHYSICAL, 100, 20,  20 ; Twineedle can no longer poison a steel type pokemon | Either hit can activate King's Rock | Each hit has a 20% chance to poison the target
	move PIN_MISSILE,  EFFECT_MULTI_HIT,          25, BUG,           PHYSICAL,  95, 20,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly | Power 14 -> 25 | Accuracy 85% -> 95%
	move LEER,         EFFECT_DEFENSE_DOWN,        0, NORMAL,        STATUS,   100, 30,   0 ; No changes
	move BITE,         EFFECT_FLINCH_HIT,         60, DARK,          PHYSICAL, 100, 25,  30 ; No changes
	move GROWL,        EFFECT_ATTACK_DOWN,         0, NORMAL,        STATUS,   100, 40,   0 ; NEED TO: sound moves can hit behind a substitute
	move ROAR,         EFFECT_FORCE_SWITCH,        0, NORMAL,        STATUS,   100, 20,   0 ; Priority -1 -> -3, NEED TO: only fail based on level difference, cannot force a flying or digging mon to switch, can force a protected mon to switch, cannot miss
	move SING,         EFFECT_SLEEP,               0, NORMAL,        STATUS,    55, 15,   0 ; NEED TO: sound moves can hit behind a substitute
	move SUPERSONIC,   EFFECT_CONFUSE,             0, NORMAL,        STATUS,    55, 20,   0 ; NEED TO: sound moves can hit behind a substitute
	move SONICBOOM,    EFFECT_STATIC_DAMAGE,      20, NORMAL,        SPECIAL,   90, 20,   0 ; No changes
	move DISABLE,      EFFECT_DISABLE,             0, NORMAL,        STATUS,   100, 20,   0 ; Accuracy 55% -> 100% | Turns 2-8 -> 5
	move ACID,         EFFECT_SP_DEF_DOWN_HIT,    40, POISON,        SPECIAL,  100, 30,  10 ; Defense down on hit -> Sp.def down on hit
	move EMBER,        EFFECT_BURN_HIT,           40, FIRE,          SPECIAL,  100, 25,  10 ; Fire-type damaging moves thaw the target
	move FLAMETHROWER, EFFECT_BURN_HIT,           90, FIRE,          SPECIAL,  100, 15,  10 ; Fire-type damaging moves thaw the target | Power 95 -> 90
	move MIST,         EFFECT_MIST,                0, ICE,           STATUS,   100, 30,   0 ; NEED TO: Mist effect is a a screen instead of substatus
	move WATER_GUN,    EFFECT_NORMAL_HIT,         40, WATER,         SPECIAL,  100, 25,   0 ; No changes
	move HYDRO_PUMP,   EFFECT_NORMAL_HIT,        110, WATER,         SPECIAL,   80,  5,   0 ; Power 120 -> 110
	move SURF,         EFFECT_NORMAL_HIT,         90, WATER,         SPECIAL,  100, 15,   0 ; Power 95 -> 90
	move ICE_BEAM,     EFFECT_FREEZE_HIT,         90, ICE,           SPECIAL,  100, 10,  10 ; Power 95 -> 90
	move BLIZZARD,     EFFECT_FREEZE_HIT,        110, ICE,           SPECIAL,   70,  5,  10 ; Power 120 -> 110
	move PSYBEAM,      EFFECT_CONFUSE_HIT,        65, PSYCHIC_TYPE,  SPECIAL,  100, 20,  10 ; No changes
	move BUBBLEBEAM,   EFFECT_SPEED_DOWN_HIT,     65, WATER,         SPECIAL,  100, 20,  10 ; No changes
	move AURORA_BEAM,  EFFECT_ATTACK_DOWN_HIT,    65, ICE,           SPECIAL,  100, 20,  10 ; No changes
	move HYPER_BEAM,   EFFECT_HYPER_BEAM,        150, NORMAL,        SPECIAL,   90,  5,   0 ; Hyper beam is now affected by King's Rock
	move PECK,         EFFECT_NORMAL_HIT,         35, FLYING,        PHYSICAL, 100, 35,   0 ; No changes
	move DRILL_PECK,   EFFECT_NORMAL_HIT,         80, FLYING,        PHYSICAL, 100, 20,   0 ; No changes
	move SUBMISSION,   EFFECT_RECOIL_HIT,         80, FIGHTING,      PHYSICAL,  80, 20,   0 ; PP 25 -> 20
	move LOW_KICK,     EFFECT_LOW_KICK,            1, FIGHTING,      PHYSICAL, 100, 20,  30 ; Power 50 -> varies by weight | Accuracy 90% -> 100%
	move COUNTER,      EFFECT_COUNTER,             1, FIGHTING,      PHYSICAL, 100, 20,   0 ; Priority -1 -> -2 | NEED TO: Counter cannot be copied by mirror move | Fix missed OHKO moves being countered | Counter becomes a 1 power physical move if the opponent did 0 damage
	move SEISMIC_TOSS, EFFECT_LEVEL_DAMAGE,        1, FIGHTING,      PHYSICAL, 100, 20,   0 ; No changes
	move STRENGTH,     EFFECT_NORMAL_HIT,         80, NORMAL,        PHYSICAL, 100, 15,   0 ; No changes
	move ABSORB,       EFFECT_LEECH_HIT,          20, GRASS,         SPECIAL,  100, 25,   0 ; PP 20 -> 25 | NEED TO: Absorb moves can work on a substitute
	move MEGA_DRAIN,   EFFECT_LEECH_HIT,          40, GRASS,         SPECIAL,  100, 15,   0 ; PP 10 -> 15 | NEED TO: Absorb moves can work on a substitute
	move LEECH_SEED,   EFFECT_LEECH_SEED,          0, GRASS,         STATUS,    90, 10,   0 ; NEED TO: Leech seed happens after the end of turns
	move GROWTH,       EFFECT_GROWTH,              0, NORMAL,        STATUS,   100, 20,   0 ; Effect Sp.Atk up -> Growth effect
	move RAZOR_LEAF,   EFFECT_NORMAL_HIT,         55, GRASS,         PHYSICAL,  95, 25,   0 ; No changes
	move SOLARBEAM,    EFFECT_SOLARBEAM,         120, GRASS,         SPECIAL,  100, 10,   0 ; NEED TO: confirm if Power is halved if there is a sandstorm | show charging animation even if its sunny, then the firiing animation
	move POISONPOWDER, EFFECT_POISON,              0, POISON,        STATUS,    75, 35,   0 ; Grass types are immune to powder moves
	move STUN_SPORE,   EFFECT_PARALYZE,            0, GRASS,         STATUS,    75, 30,   0 ; Grass types are immune to powder moves
	move SLEEP_POWDER, EFFECT_SLEEP,               0, GRASS,         STATUS,    75, 15,   0 ; Grass types are immune to powder moves
	move PETAL_DANCE,  EFFECT_RAMPAGE,           120, GRASS,         SPECIAL,  100, 10,   0 ; Power 70 -> 120 | pp 20 -> 10 | NEED TO: update factors that disrupt rampage
	move STRING_SHOT,  EFFECT_SPEED_DOWN_2,        0, BUG,           STATUS,    95, 40,   0 ; Effect speed down -> speed down 2
	move DRAGON_RAGE,  EFFECT_STATIC_DAMAGE,      40, DRAGON,        SPECIAL,  100, 10,   0 ; No changes
	move FIRE_SPIN,    EFFECT_TRAP_TARGET,        35, FIRE,          SPECIAL,   85, 15,   0 ; Fire-type damaging moves thaw the target | Damage per turn for trapping moves 1/16 max hp -> 1/8 max hp | Turns trapped 2-5 -> 4-5 | Trapping moves are affected by King's Rock | Power 15 -> 35 | Accuracy 70% -> 85%
	move THUNDERSHOCK, EFFECT_PARALYZE_HIT,       40, ELECTRIC,      SPECIAL,  100, 30,  10 ; Electric-type targets can't be paralyzed
	move THUNDERBOLT,  EFFECT_PARALYZE_HIT,       90, ELECTRIC,      SPECIAL,  100, 15,  10 ; Electric-type targets can't be paralyzed | Power 95 -> 90
	move THUNDER_WAVE, EFFECT_PARALYZE,            0, ELECTRIC,      STATUS,    90, 20,   0 ; Electric-type targets can't be paralyzed | Accuracy 100% -> 90%
	move THUNDER,      EFFECT_THUNDER,           110, ELECTRIC,      SPECIAL,   70, 10,  30 ; Electric-type targets can't be paralyzed | Power 120 -> 110
	move ROCK_THROW,   EFFECT_NORMAL_HIT,         50, ROCK,          PHYSICAL,  90, 15,   0 ; No changes
	move EARTHQUAKE,   EFFECT_EARTHQUAKE,        100, GROUND,        PHYSICAL, 100, 10,   0 ; No changes
	move FISSURE,      EFFECT_OHKO,                1, GROUND,        PHYSICAL,  30,  5,   0 ; NEED TO: OHKO moves are not affected by accuracy changes, +1% accuracy for every level
	move DIG,          EFFECT_FLY,                80, GROUND,        PHYSICAL, 100, 10,   0 ; Power 60 -> 80 | NEED TO: some moves do not work when the target is locked onto and in the semi invulnerable turn
	move TOXIC,        EFFECT_TOXIC,               0, POISON,        STATUS,    85, 10,   0 ; Accuracy 85% -> 90% | Toxic never misses if used by a poison type | NEED TO: counter is not reset after heal bell or baton pass, toxic stays even after switching
	move CONFUSION,    EFFECT_CONFUSE_HIT,        50, PSYCHIC_TYPE,  SPECIAL,  100, 25,  10 ; No changes
	move PSYCHIC_M,    EFFECT_SP_DEF_DOWN_HIT,    90, PSYCHIC_TYPE,  SPECIAL,  100, 10,  10 ; No changes
	move HYPNOSIS,     EFFECT_SLEEP,               0, PSYCHIC_TYPE,  STATUS,    60, 20,   0 ; No changes
	move MEDITATE,     EFFECT_ATTACK_UP,           0, PSYCHIC_TYPE,  STATUS,   100, 40,   0 ; No changes
	move AGILITY,      EFFECT_SPEED_UP_2,          0, PSYCHIC_TYPE,  STATUS,   100, 30,   0 ; No changes
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, NORMAL,        PHYSICAL, 100, 30,   0 ; No changes
	move RAGE,         EFFECT_RAGE,               20, NORMAL,        PHYSICAL, 100, 20,   0 ; Rage increases the attack stat of the user when hit instead of increasing damage | NEED TO: check that the effect only starts if rage hit
	move TELEPORT,     EFFECT_TELEPORT,            0, PSYCHIC_TYPE,  STATUS,   100, 20,   0 ; NEED TO: teleport ignores level difference | Teleport fails if trapped by a trapping move
	move NIGHT_SHADE,  EFFECT_LEVEL_DAMAGE,        1, GHOST,         SPECIAL,  100, 15,   0 ; No changes
	move MIMIC,        EFFECT_MIMIC,               0, NORMAL,        STATUS,   100, 10,   0 ; NEED TO: Mimic always hits unless flying or underground | The mimiced move only has 5 pp
	move SCREECH,      EFFECT_DEFENSE_DOWN_2,      0, NORMAL,        STATUS,    85, 40,   0 ; NEED TO: sound moves can hit behind a substitute
	move DOUBLE_TEAM,  EFFECT_EVASION_UP,          0, NORMAL,        STATUS,   100, 15,   0 ; No changes
	move RECOVER,      EFFECT_HEAL,                0, NORMAL,        STATUS,   100, 10,   0 ; PP 20 -> 10 | NEED TO: round up when healing
	move HARDEN,       EFFECT_DEFENSE_UP,          0, NORMAL,        STATUS,   100, 30,   0 ; No changes
	move MINIMIZE,     EFFECT_EVASION_UP_2,        0, NORMAL,        STATUS,   100, 10,   0 ; PP 20 -> 10 | Effect evasion up 1 -> up 2
	move SMOKESCREEN,  EFFECT_ACCURACY_DOWN,       0, NORMAL,        STATUS,   100, 20,   0 ; No changes
	move CONFUSE_RAY,  EFFECT_CONFUSE,             0, GHOST,         STATUS,   100, 10,   0 ; No changes
	move WITHDRAW,     EFFECT_DEFENSE_UP,          0, WATER,         STATUS,   100, 40,   0 ; No changes
	move DEFENSE_CURL, EFFECT_DEFENSE_CURL,        0, NORMAL,        STATUS,   100, 40,   0 ; NEED TO : the power of rollout is doubled after curling
	move BARRIER,      EFFECT_DEFENSE_UP_2,        0, PSYCHIC_TYPE,  STATUS,   100, 20,   0 ; PP 30 -> 20
	move LIGHT_SCREEN, EFFECT_LIGHT_SCREEN,        0, PSYCHIC_TYPE,  STATUS,   100, 30,   0 ; NEED TO: Reflect and light screen halve damage instead of doubling defense
	move HAZE,         EFFECT_RESET_STATS,         0, ICE,           STATUS,   100, 30,   0 ; No changes
	move REFLECT,      EFFECT_REFLECT,             0, PSYCHIC_TYPE,  STATUS,   100, 20,   0 ; NEED TO: Reflect and light screen halve damage instead of doubling defense
	move FOCUS_ENERGY, EFFECT_FOCUS_ENERGY,        0, NORMAL,        STATUS,   100, 30,   0 ; Focus energy increases crit chance by 2, not 1 | NEED TO: Focus energy is copied by psych up and transform
	move BIDE,         EFFECT_BIDE,                0, NORMAL,        PHYSICAL, 100, 10,   0 ; Bide only lasts 2 turns | NEED TO: cant switch while using bide | Bide has priority of +1 the whole duration | Bide bypasses accuracy checks
	move METRONOME,    EFFECT_METRONOME,           0, NORMAL,        STATUS,   100, 10,   0 ; Metronome can't use mirror move, snore or transform | NEED TO: check other exceptions
	move MIRROR_MOVE,  EFFECT_MIRROR_MOVE,         0, FLYING,        STATUS,   100, 20,   0 ; NEED TO: Copies the last move used by target, not just against the user
	move SELFDESTRUCT, EFFECT_SELFDESTRUCT,      200, NORMAL,        PHYSICAL, 100,  5,   0 ; Explosion moves don't halve the target's defense | NEED TO: don't remove the pokemon's sprite after use
	move EGG_BOMB,     EFFECT_NORMAL_HIT,        100, NORMAL,        PHYSICAL,  75, 10,   0 ; No changes
	move LICK,         EFFECT_PARALYZE_HIT,       30, GHOST,         PHYSICAL, 100, 30,  30 ; Power 20 -> 30
	move SMOG,         EFFECT_POISON_HIT,         30, POISON,        SPECIAL,   70, 20,  40 ; Power 20 -> 30
	move SLUDGE,       EFFECT_POISON_HIT,         65, POISON,        SPECIAL,  100, 20,  30 ; No changes
	move BONE_CLUB,    EFFECT_FLINCH_HIT,         65, GROUND,        PHYSICAL,  85, 20,  10 ; No changes
	move FIRE_BLAST,   EFFECT_BURN_HIT,          110, FIRE,          SPECIAL,   85,  5,  10 ; Fire-type damaging moves thaw the target
	move WATERFALL,    EFFECT_FLINCH_HIT,         80, WATER,         PHYSICAL, 100, 15,  20 ; Power 120 -> 110 | +20% flinch chance
	move CLAMP,        EFFECT_TRAP_TARGET,        35, WATER,         PHYSICAL,  85, 15,   0 ; Damage per turn for trapping moves 1/16 max hp -> 1/8 max hp | Turns trapped 2-5 -> 4-5 | Trapping moves are affected by King's Rock | Accuraccy 75% -> 85% | pp 10 -> 15
	move SWIFT,        EFFECT_ALWAYS_HIT,         60, NORMAL,        SPECIAL,  100, 20,   0 ; No changes
	move SKULL_BASH,   EFFECT_SKULL_BASH,        130, NORMAL,        PHYSICAL, 100, 10,   0 ; Power 100 -> 130 | pp 15 -> 10
	move SPIKE_CANNON, EFFECT_MULTI_HIT,          20, NORMAL,        PHYSICAL, 100, 15,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly
	move CONSTRICT,    EFFECT_SPEED_DOWN_HIT,     10, NORMAL,        PHYSICAL, 100, 35,  10 ; No changes
	move AMNESIA,      EFFECT_SP_DEF_UP_2,         0, PSYCHIC_TYPE,  STATUS,   100, 20,   0 ; No changes
	move KINESIS,      EFFECT_ACCURACY_DOWN,       0, PSYCHIC_TYPE,  STATUS,    80, 15,   0 ; No changes
	move SOFTBOILED,   EFFECT_HEAL,                0, NORMAL,        STATUS,   100, 10,   0 ; NEED TO: round up when healing
	move HI_JUMP_KICK, EFFECT_JUMP_KICK,         130, FIGHTING,      PHYSICAL,  90, 10,   0 ; Crash damage is 1/2 max hp, not 1/8th of the damage | Power 85 -> 130 | PP 20 -> 10
	move GLARE,        EFFECT_PARALYZE,            0, NORMAL,        STATUS,   100, 30,   0 ; Glare can hit ghost type pokemon | Acuraccy 75% -> 100%
	move DREAM_EATER,  EFFECT_DREAM_EATER,       100, PSYCHIC_TYPE,  SPECIAL,  100, 15,   0 ; NEED TO: Drain moves can heal off a substitute
	move POISON_GAS,   EFFECT_POISON,              0, POISON,        STATUS,    90, 40,   0 ; Acuraccy 55% -> 90%
	move BARRAGE,      EFFECT_MULTI_HIT,          15, NORMAL,        PHYSICAL,  85, 20,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly
	move LEECH_LIFE,   EFFECT_LEECH_HIT,          80, BUG,           PHYSICAL, 100, 10,   0 ; Power 20 -> 80 | PP 15 -> 10 | NEED TO: drain moves can heal off a subtitute
	move LOVELY_KISS,  EFFECT_SLEEP,               0, NORMAL,        STATUS,    75, 10,   0 ; No changes
	move SKY_ATTACK,   EFFECT_SKY_ATTACK,        140, FLYING,        PHYSICAL,  90,  5,  30 ; Flinch chance +30% | Hi crit move | SKy attack is not affected by king's rock
	move TRANSFORM,    EFFECT_TRANSFORM,           0, NORMAL,        STATUS,   100, 10,   0 ; NEED TO: cant transform if already transformed or if the opponent has a substitute
	move BUBBLE,       EFFECT_SPEED_DOWN_HIT,     40, WATER,         SPECIAL,  100, 30,  10 ; Power 20 -> 40
	move DIZZY_PUNCH,  EFFECT_CONFUSE_HIT,        70, NORMAL,        PHYSICAL, 100, 10,  20 ; No changes
	move SPORE,        EFFECT_SLEEP,               0, GRASS,         STATUS,   100, 15,   0 ; Grass types are immune to powder moves
	move FLASH,        EFFECT_ACCURACY_DOWN,       0, NORMAL,        STATUS,    70, 20,   0 ; Marked for deletion
	move PSYWAVE,      EFFECT_PSYWAVE,             1, PSYCHIC_TYPE,  SPECIAL,  100, 15,   0 ; Accuracy 80% -> 100% | NEED TO: change damage formula
	move SPLASH,       EFFECT_SPLASH,              0, NORMAL,        STATUS,   100, 40,   0 ; No changes
	move ACID_ARMOR,   EFFECT_DEFENSE_UP_2,        0, POISON,        STATUS,   100, 20,   0 ; PP 40 -> 20
	move CRABHAMMER,   EFFECT_NORMAL_HIT,        100, WATER,         PHYSICAL,  90, 10,   0 ; Accuracy 85% -> 90% | power 90 -> 100
	move EXPLOSION,    EFFECT_SELFDESTRUCT,      250, NORMAL,        PHYSICAL, 100,  5,   0 ; Explosion moves don't halve the target's defense | NEED TO: don't remove the pokemon's sprite after use
	move FURY_SWIPES,  EFFECT_MULTI_HIT,          18, NORMAL,        PHYSICAL,  80, 15,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly
	move BONEMERANG,   EFFECT_DOUBLE_HIT,         50, GROUND,        PHYSICAL,  90, 10,   0 ; Each hit can now activate King's Rock | NEED TO: check if focus band can activate repeatedly | NEED TO: check if substitute falling ends the move early
	move REST,         EFFECT_HEAL,                0, PSYCHIC_TYPE,  STATUS,   100, 10,   0 ; Rest cannot be called by sleep talk
	move ROCK_SLIDE,   EFFECT_FLINCH_HIT,         75, ROCK,          PHYSICAL,  90, 10,  30 ; No changes
	move HYPER_FANG,   EFFECT_FLINCH_HIT,         80, NORMAL,        PHYSICAL,  90, 15,  10 ; No changes
	move SHARPEN,      EFFECT_ATTACK_UP,           0, NORMAL,        STATUS,   100, 30,   0 ; No changes
	move CONVERSION,   EFFECT_CONVERSION,          0, NORMAL,        STATUS,   100, 30,   0 ; Conversion can be used on curse | NEED TO: conversion uses the first move slot of the enemy
	move TRI_ATTACK,   EFFECT_TRI_ATTACK,         80, NORMAL,        SPECIAL,  100, 10,  20 ; Tri attack cannot freeze an ice type or burn a fire type or paralyze an electric type
	move SUPER_FANG,   EFFECT_SUPER_FANG,          1, NORMAL,        PHYSICAL,  90, 10,   0 ; No changes
	move SLASH,        EFFECT_NORMAL_HIT,         70, NORMAL,        PHYSICAL, 100, 20,   0 ; No changes
	move SUBSTITUTE,   EFFECT_SUBSTITUTE,          0, NORMAL,        STATUS,   100, 10,   0 ; NEED TO: check substitute
	move STRUGGLE,     EFFECT_RECOIL_HIT,         50, NORMAL,        PHYSICAL, 100,  1,   0 ; Struggle's recoil is 1/4th max hp | NEED TO: struggle never misses
	move SKETCH,       EFFECT_SKETCH,              0, NORMAL,        STATUS,   100,  1,   0 ; NEED TO: sketch can copy mirror move and sleep talk, metronome mimic and transform
	move TRIPLE_KICK,  EFFECT_TRIPLE_KICK,         1, FIGHTING,      PHYSICAL,  90, 10,   0 ; Update triple kick
	move THIEF,        EFFECT_THIEF,              60, DARK,          PHYSICAL, 100, 25, 100 ; Theif's effect always works | Power 40 -> 60 | PP 10 -> 25 | NEED TO: thief doesn't permanently steal the item in trainer battles.
	move SPIDER_WEB,   EFFECT_MEAN_LOOK,           0, BUG,           STATUS,   100, 10,   0 ; Ghost type pokemon cant be trapped | NEED TO: baton pass switchers are not trapped
	move MIND_READER,  EFFECT_LOCK_ON,             0, NORMAL,        STATUS,   100,  5,   0 ; NEED TO: Fails if already active | Cannot be baton passed | Effect leaves when user or target leaves | Effect ends next turn | Never misses
	move NIGHTMARE,    EFFECT_NIGHTMARE,           0, GHOST,         STATUS,   100, 15,   0 ; Nightmare is affected by accuracy | NEED TO: end turn effects happen at the end
	move FLAME_WHEEL,  EFFECT_FLAME_WHEEL,        60, FIRE,          PHYSICAL, 100, 25,  10 ; Fire-type damaging moves thaw the target
	move SNORE,        EFFECT_SNORE,              50, NORMAL,        SPECIAL,  100, 15,  30 ; Snore is not affected by King's Rock | Power 40 -> 50 | NEED TO: snore bypasses substitute
	move CURSE,        EFFECT_CURSE,               0, GHOST,         STATUS,   100, 10,   0 ; Curse is now Ghost type | Curse can hit through a substitute | NEED TO: Only fail if all 3 stats are at max/ min | Cursed pokemon take curse damage if the opponent faints 
	move FLAIL,        EFFECT_REVERSAL,            1, NORMAL,        PHYSICAL, 100, 15,   0 ; Reversal moves now have damage variation and can cause a critical hit
	move CONVERSION2,  EFFECT_CONVERSION2,         0, NORMAL,        STATUS,   100, 30,   0 ; NEED TO: won't change the user to any of the types it arleady is
	move AEROBLAST,    EFFECT_NORMAL_HIT,        100, FLYING,        SPECIAL,   95,  5,   0 ; No changes
	move COTTON_SPORE, EFFECT_SPEED_DOWN_2,        0, GRASS,         STATUS,   100, 40,   0 ; Grass types are immune to powder moves | Accuracy 85% -> 100%
	move REVERSAL,     EFFECT_REVERSAL,            1, FIGHTING,      PHYSICAL, 100, 15,   0 ; Reversal moves now have damage variation and can cause a critical hit
	move SPITE,        EFFECT_SPITE,               0, GHOST,         STATUS,   100, 10,   0 ; Spite always decreases pp by 4 | NEED TO: make sure text shows correct amount of pp depleted
	move POWDER_SNOW,  EFFECT_FREEZE_HIT,         40, ICE,           SPECIAL,  100, 25,  10 ; No changes
	move PROTECT,      EFFECT_PROTECT,             0, NORMAL,        STATUS,   100, 10,   0 ; NEED TO: protect success rate is 1/3 ever time, not 1/2
	move MACH_PUNCH,   EFFECT_PRIORITY_HIT,       40, FIGHTING,      PHYSICAL, 100, 30,   0 ; No changes
	move SCARY_FACE,   EFFECT_SPEED_DOWN_2,        0, NORMAL,        STATUS,   100, 10,   0 ; Accuracy 90% -> 100%
	move FAINT_ATTACK, EFFECT_ALWAYS_HIT,         60, DARK,          PHYSICAL, 100, 20,   0 ; No changes
	move SWEET_KISS,   EFFECT_CONFUSE,             0, NORMAL,        STATUS,    75, 10,   0 ; MAYBE: Make sweet kiss fairy type
	move BELLY_DRUM,   EFFECT_BELLY_DRUM,          0, NORMAL,        STATUS,   100, 10,   0 ; No changes
	move SLUDGE_BOMB,  EFFECT_POISON_HIT,         90, POISON,        SPECIAL,  100, 10,  30 ; No changes
	move MUD_SLAP,     EFFECT_ACCURACY_DOWN_HIT,  20, GROUND,        SPECIAL,  100, 10, 100 ; No changes
	move OCTAZOOKA,    EFFECT_ACCURACY_DOWN_HIT,  65, WATER,         SPECIAL,   85, 10,  50 ; No changes
	move SPIKES,       EFFECT_SPIKES,              0, GROUND,        STATUS,   100, 20,   0 ; Spikes can go up to 3 layers
	move ZAP_CANNON,   EFFECT_PARALYZE_HIT,      120, ELECTRIC,      SPECIAL,   50,  5, 100 ; Electric-type targets can't be paralyzed | Power 100 -> 120
	move FORESIGHT,    EFFECT_FORESIGHT,           0, NORMAL,        STATUS,   100, 40,   0 ; NEED TO: update foresight
	move DESTINY_BOND, EFFECT_DESTINY_BOND,        0, GHOST,         STATUS,   100,  5,   0 ; NEED TO: destiny bond fails if used twice in a row | Pokemon that used destiny bond faints first
	move PERISH_SONG,  EFFECT_PERISH_SONG,         0, NORMAL,        STATUS,   100,  5,   0 ; NEED TO: Perish song pokemon faint in the order they would move
	move ICY_WIND,     EFFECT_SPEED_DOWN_HIT,     55, ICE,           SPECIAL,   95, 15, 100 ; No changes
	move DETECT,       EFFECT_PROTECT,             0, FIGHTING,      STATUS,   100,  5,   0 ; NEED TO: protect success rate is 1/3 ever time, not 1/2
	move BONE_RUSH,    EFFECT_MULTI_HIT,          25, GROUND,        PHYSICAL,  90, 10,   0 ; Hit chance ratio (2:3:4:5) 3:3:1:1 -> 7:7:3:3 | Each hit can now activate King's Rock | Accuracy 80% -> 90% | NEED TO: check if focus band can activate repeatedly 
	move LOCK_ON,      EFFECT_LOCK_ON,             0, NORMAL,        STATUS,   100,  5,   0
	move OUTRAGE,      EFFECT_RAMPAGE,           120, DRAGON,        PHYSICAL, 100, 10,   0 ; Power 90 -> 120 | PP 15 -> 10
	move SANDSTORM,    EFFECT_SANDSTORM,           0, ROCK,          STATUS,   100, 10,   0
	move GIGA_DRAIN,   EFFECT_LEECH_HIT,          75, GRASS,         SPECIAL,  100, 10,   0 ; Power 60 -> 75 | PP 5 -> 10
	move ENDURE,       EFFECT_ENDURE,              0, NORMAL,        STATUS,   100, 10,   0
	move CHARM,        EFFECT_ATTACK_DOWN_2,       0, NORMAL,        STATUS,   100, 20,   0
	move ROLLOUT,      EFFECT_ROLLOUT,            30, ROCK,          PHYSICAL,  90, 20,   0
	move FALSE_SWIPE,  EFFECT_FALSE_SWIPE,        40, NORMAL,        PHYSICAL, 100, 40,   0
	move SWAGGER,      EFFECT_SWAGGER,             0, NORMAL,        STATUS,    90, 15, 100
	move MILK_DRINK,   EFFECT_HEAL,                0, NORMAL,        STATUS,   100, 10,   0
	move SPARK,        EFFECT_PARALYZE_HIT,       65, ELECTRIC,      PHYSICAL, 100, 20,  30 ; Electric-type targets can't be paralyzed
	move FURY_CUTTER,  EFFECT_FURY_CUTTER,        40, BUG,           PHYSICAL,  95, 20,   0 ; Power 10 -> 40 | 
	move STEEL_WING,   EFFECT_DEFENSE_UP_HIT,     70, STEEL,         PHYSICAL,  90, 25,  10
	move MEAN_LOOK,    EFFECT_MEAN_LOOK,           0, NORMAL,        STATUS,   100,  5,   0
	move ATTRACT,      EFFECT_ATTRACT,             0, NORMAL,        STATUS,   100, 15,   0
	move SLEEP_TALK,   EFFECT_SLEEP_TALK,          0, NORMAL,        STATUS,   100, 10,   0
	move HEAL_BELL,    EFFECT_HEAL_BELL,           0, NORMAL,        STATUS,   100,  5,   0
	move RETURN,       EFFECT_RETURN,              1, NORMAL,        PHYSICAL, 100, 20,   0
	move PRESENT,      EFFECT_PRESENT,             1, NORMAL,        PHYSICAL,  90, 15,   0
	move FRUSTRATION,  EFFECT_FRUSTRATION,         1, NORMAL,        PHYSICAL, 100, 20,   0
	move SAFEGUARD,    EFFECT_SAFEGUARD,           0, NORMAL,        STATUS,   100, 25,   0
	move PAIN_SPLIT,   EFFECT_PAIN_SPLIT,          0, NORMAL,        STATUS,   100, 20,   0
	move SACRED_FIRE,  EFFECT_SACRED_FIRE,       100, FIRE,          PHYSICAL,  95,  5,  50 ; Fire-type damaging moves thaw the target
	move MAGNITUDE,    EFFECT_MAGNITUDE,           1, GROUND,        PHYSICAL, 100, 30,   0
	move DYNAMICPUNCH, EFFECT_CONFUSE_HIT,       100, FIGHTING,      PHYSICAL,  50,  5, 100
	move MEGAHORN,     EFFECT_NORMAL_HIT,        120, BUG,           PHYSICAL,  85, 10,   0
	move DRAGONBREATH, EFFECT_PARALYZE_HIT,       60, DRAGON,        SPECIAL,  100, 20,  30
	move BATON_PASS,   EFFECT_BATON_PASS,          0, NORMAL,        STATUS,   100, 40,   0
	move ENCORE,       EFFECT_ENCORE,              0, NORMAL,        STATUS,   100,  5,   0
	move PURSUIT,      EFFECT_PURSUIT,            40, DARK,          PHYSICAL, 100, 20,   0
	move RAPID_SPIN,   EFFECT_RAPID_SPIN,         20, NORMAL,        PHYSICAL, 100, 40,   0
	move SWEET_SCENT,  EFFECT_EVASION_DOWN,        0, NORMAL,        STATUS,   100, 20,   0
	move IRON_TAIL,    EFFECT_DEFENSE_DOWN_HIT,  100, STEEL,         PHYSICAL,  75, 15,  30
	move METAL_CLAW,   EFFECT_ATTACK_UP_HIT,      50, STEEL,         PHYSICAL,  95, 35,  10
	move VITAL_THROW,  EFFECT_ALWAYS_HIT,         70, FIGHTING,      PHYSICAL, 100, 10,   0
	move MORNING_SUN,  EFFECT_MORNING_SUN,         0, NORMAL,        STATUS,   100,  5,   0
	move SYNTHESIS,    EFFECT_SYNTHESIS,           0, GRASS,         STATUS,   100,  5,   0
	move MOONLIGHT,    EFFECT_MOONLIGHT,           0, NORMAL,        STATUS,   100,  5,   0
	move HIDDEN_POWER, EFFECT_HIDDEN_POWER,        1, NORMAL,        SPECIAL,  100, 15,   0
	move CROSS_CHOP,   EFFECT_NORMAL_HIT,        100, FIGHTING,      PHYSICAL,  80,  5,   0
	move TWISTER,      EFFECT_TWISTER,            40, DRAGON,        SPECIAL,  100, 20,  20 ; Power is doubled instead of damage if used against a flying opponent
	move RAIN_DANCE,   EFFECT_RAIN_DANCE,          0, WATER,         STATUS,    90,  5,   0
	move SUNNY_DAY,    EFFECT_SUNNY_DAY,           0, FIRE,          STATUS,    90,  5,   0
	move CRUNCH,       EFFECT_DEFENSE_DOWN_HIT,   80, DARK,          PHYSICAL, 100, 15,  20 ; Sp def down hit -> def down hit
	move MIRROR_COAT,  EFFECT_MIRROR_COAT,         1, PSYCHIC_TYPE,  SPECIAL,  100, 20,   0
	move PSYCH_UP,     EFFECT_PSYCH_UP,            0, NORMAL,        STATUS,   100, 10,   0
	move EXTREMESPEED, EFFECT_PRIORITY_HIT,       80, NORMAL,        PHYSICAL, 100,  5,   0
	move ANCIENTPOWER, EFFECT_ALL_UP_HIT,         60, ROCK,          SPECIAL,  100,  5,  10
	move SHADOW_BALL,  EFFECT_SP_DEF_DOWN_HIT,    80, GHOST,         SPECIAL,  100, 15,  20
	move FUTURE_SIGHT, EFFECT_FUTURE_SIGHT,      120, PSYCHIC_TYPE,  SPECIAL,  100, 10,   0 ; Powr 80 -> 120 | Accuracy 90% -> 100% | PP 15 -> 10
	move ROCK_SMASH,   EFFECT_DEFENSE_DOWN_HIT,   40, FIGHTING,      PHYSICAL, 100, 15,  50 ; Power 20 -> 40
	move WHIRLPOOL,    EFFECT_TRAP_TARGET,        35, WATER,         SPECIAL,   85, 15,   0 ; Damage per turn for trapping moves 1/16 max hp -> 1/8 max hp | Turns trapped 2-5 -> 4-5 | Trapping moves are affected by King's Rock | Power 15 -> 35 | Accuracy 70% - 85%
	move BEAT_UP,      EFFECT_BEAT_UP,            10, DARK,          PHYSICAL, 100, 10,   0
	assert_table_length NUM_ATTACKS