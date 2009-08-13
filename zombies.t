#include "zombies.h"

goodZombies: Person 'good zombies' 'Good Zombies' @villageSquare
    "These are good zombies.  Gris Grue said so.  They are painted white all over. "
    isHim = true
    isPlural = true
;

+ zombiesTalking: ActorState, ShuffledEventList
    specialDesc = ""
    stateDesc   = "<<me.isZombie ? 'The zombies smile and nod at you. ' : ''>>"
    isInitState = true

    eventList = [
	'You overhear the zombies, \"Beautiful day!\" \"Certainly is!\"',
	'You overhear the zombies, \"Bought a new coat!\"',
	'You overhear the zombies, \"Bought a new coat!\" \"You did!\"',
	'You overhear the zombies, \"Yes, bought a new coat, this coat I\'m wearing, I think it\'s very fine!\"',
	'You overhear the zombies, \"Oh it is, it is, yes, I think so!\"',
	'You overhear the zombies, \"Did you see that lady?\"',
	'You overhear the zombies, \"Would that lady marry me?\"',
	'You overhear the zombies, \"I don\'t know!  Oh what a pretty lady!\"',
	'You overhear the zombies, \"Wonderful time!\"',
	'You overhear the zombies, \"Beautiful day!\"',
	'You overhear the zombies, \"Marvelous singing!\"',
	'You overhear the zombies, \"Excellent beer!\"'
    ]
;
