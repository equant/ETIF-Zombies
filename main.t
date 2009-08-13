#include "zombies.h"

gameMain: GameMainDef
    initialPlayerChar = me
;

/* You could customize this if you wished */
versionInfo: GameID  
    IFID = '3DB1A4E5-7611-4924-8AC8-F3309590E6FF'
    name = 'Zombies'
    byline = 'Equant & Tim'
    version = '1'
    authorEmail = 'Equant and Tim <zombies@retards.org>'
    desc = 'Zombies Buying Brides'
    /*htmlDesc = '$HTMLDESC$'*/
;

iceCreamShop: Room 'Ice Cream Shop'
    "You're inside an ice cream shop.  This is a nice shop. "
    west = villageSquare
    out asExit(west)
; 

dyingCat: Actor 'dying cat' 'cat' @villageSquare
    isDead = nil
    specialDesc = "A cat is <<isDead ? 'lying' : 'standing'>> here."

    desc() {
        if (isDead) {
            "It's expired. ";
        }
        else {
            "It's dying, but not dead yet. ";

            if (me.isZombie) {
                die();
            }
        }
    }

    die() {
        isDead = true;
        "Its body goes limp. ";
    }

    dobjFor(Kiss) {
        action () {
            "Ewww. ";
            if (!isDead) {
                die();

                me.becomeZombie();
            }
            else {
                if (me.isZombie) {
                    "Well, maybe it's not soooo gross, since you're a zombie. ";
                }
                else {
                    "God, that's gross. ";
                }
            }
        }
    }
;
    
bishop: Person 'fucking bishop' 'Bishop' @iceCreamShop
    "Good god, man, he's the fucking bishop! "
    isHim = true

    dobjFor(Feel) {
        action () {
            "You touched his holiness. ";
            me.becomeZombie();
        }
    }
;
