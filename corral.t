#include "zombies.h"

corral: OutdoorRoom 'Corral'
    "There are several well loved dairy cows, enjoying their cud.  A zombie is creeping around under them on the corral floor. "
    north = villageSquare
;

+ cows : Heavy 'cow/cows' 'cows' "They are <<isClean ? 'clean' : '' >> large bluish-brown animals. "
    isClean = nil
    isPlural = true
    cannotTakeMsg  = 'They are too large to take. '
    cannotCleanMsg = 'They move away. ' 
;
+ corralFloor : Floor 'corral floor' 'corral floor' "The corral\'s floor is covered in manure. ";

corralZombie : Person 'corral zombie' 'zombie' @corral
    "The zombie is covered in white paint and cow shit. "
    specialDesc = 'A zombie is creeping around on the ground. '
;

+ thermometer : Thing 'stainless steel rectal thermometer' 'rectal thermometer'
    "A <<isClean ? 'very shiney' : 'very dirty'>> \"Joseph Martin's and Associates Stainless Steel Large Animal Veterinary Rectal Thermometer\"."
    isClean = true
;

+ AskTopic @thermometer
    "Getting the zombies attention, you ask, <q>You have a very fine thermometer there, does it work well?</q>\b
    <q>Glorp.</q> the zombie replies. "
;

+ AskTopic @cup
    "<q>Cup?</q>\b
    <q>Far Out.</q>"
    //isActive = me.hasSeen(fanny)
;
+ AskTopic @fanny
    "You ask, <q>What\'s the deal with the girl in the building?</q>\b
    <q>Fanny?  She farts a lot.</q> the zombie replies. "
    //isActive = me.hasSeen(fanny)
;
