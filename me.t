#include "zombies.h"

me: Person
    location = villageSquare
    isZombie = nil  /* Start out as normal human */
    isGood   = nil  /* Zombies are good or bad or undefined */
    isBad    = nil  /* Zombies are good or bad or undefined */
    isHim    = true  /* Zombies are male, and we may become a zombie */

    becomeZombie() {
        if (!me.isZombie) {
            "Your bowels loosen. ";
            isZombie = true;
	    houngan.setCurState(notActive);
        }
    }

    desc() {
        if (isZombie) {
            "You look like a zombie. ";
        }
        else {
            "You are just glad to be here. ";
        }
    }
;
