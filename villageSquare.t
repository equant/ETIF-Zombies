#include "zombies.h"

villageSquare: OutdoorRoom 'Village Square'
    "You're standing in the bright sunlight in the village square, lined by brick buildings and tall trees.  An ice cream shop is to the east, and a dusty corral lies south. "
    east = iceCreamShop
    south = corral
    northeast = upstairs /* Hack to easily get to Fanny */
;

+ buildings : Enterable, Fixture -> buildingEntry 'brick building*buildings' 'buildings'
    "The buildings are made of shiny brown brick. They are tall.  One of them is very tall. They have windows. "
    canTravelerPass(t) {
        return true;
    }
    noteTraversal(t) {
        "Holy fuck, that's cool! ";
    }
;

+ windows : Fixture 'window*windows' 'windows'
    "Green plants are in some windows. Young daughters are in others. "
;

+ plants : Fixture 'healthy vibrant green plant*plants' 'plants'
    "They look so healthy!  Vibrant green leaves shine in the sun. "
;

+ windowDaughters : Distant, Fixture 'young daughter*daughters' 'daughters'
    "There are so many young women looking down from the windows.  Some are watering plants, but most just stare down into the square, expressionless. "
;

+ iceCreamShopFront: Enterable, Fixture -> iceCreamShop 'ice cream shop/store' 'ice cream shop'
  "Faded pictures of waffle cones and smiling children make it impossible to see inside. "
;


buildingEntry : Room 'Inside a Brick Building'
    "Plain and clean.  Greyish-green paint was applied in many thick layers over cement block and cheap molding. "
    vocabWords = 'building/interior'
    out = villageSquare

    up = buildingStairsUp
;

+ buildingStairsUp: StairwayUp 'stair*stairs' 'stairs'

    isPlural = true
;


upstairs: Room 'Upstairs Room'
    "It's comfortable. "

    down = buildingStairsDown
;

+ buildingStairsDown: StairwayDown -> buildingStairsUp 'stair*stairs' 'stairs'

    isPlural = true
;

+ table: Surface, Immovable 'dining table' 'table'
;

++ cup: Container 'blue cup' 'cup'
;


class AcceptsActorStateScript: object
    doScriptEvent(evt) {
        if (evt.ofKind(ActorState)) {
            fanny.setCurState(evt);
        }
        else {
            inherited(evt);
        }
    }
;

fanny: Person 'sweet girl/daughter' 'sweet girl' @upstairs
    "{The fanny/she} looks sweet, but strong.  Her skin is like butter.  Her hair, chocolate. "

    isHer = true
    globalParamName = 'fanny'

    stateDaemon = static new Daemon(self, &goNextState, 1)

    makeProper(properName) { 
        name = properName; 
        isProperName = true; 
        initializeVocabWith(properName.toLower()); 
        return name; 
    } 

    dobjFor(Feel) {
        action() {
            if (!isProperName) {
                "Hi, I'm <<makeProper('Fanny')>>. ";
            }
        }
    }

    goNextState() {
        actStateEvents.doScript();
    }

    actStateEvents: AcceptsActorStateScript, ShuffledEventList {
        eventList = [
            fannyInWindow,
            fannyFarting,
            'Hmmm, this is great! ',
            'I would like a bit of ice cream, frankly.  Or a frank furter. '
        ];

        eventPercent = 50;
        eventReduceTo = 20;
        eventReduceAfter = 8;
    }
;

+ fannyInWindow: ActorState
    isInitState = true
    specialDesc = "{A fanny/she} is looking out the window. "
    stateDesc = "She's looking down into the square. "
;

+ fannyFarting: ActorState
    specialDesc = "{A fanny/she} is leaning on the table, farting. "
    activateState(actor, oldState) {
        "A soft whisper of air movement comes from {the's fanny/her} direction. ";
    }
;

/* vim:set sw=4 et: */
