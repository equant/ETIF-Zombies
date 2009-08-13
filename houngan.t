#include "zombies.h"

houngan: Person 'ugly guy/houngan' 'ugly guy' @villageSquare
    "{the houngan/he} is not a zombie. "
    isHim = true
    properName = 'The houngan'
    globalParamName = 'houngan'
;

+ lookingForCat: ActorState
    isInitState = true
    specialDesc = "The ugly guy is looking for dying animals."
;

++ HelloTopic, StopEventList
    [
        'You say, \"Hi.\" ',
	'\"Holla senior!\" '
    ]
;

+GiveShowTopic @dyingCat
    topicResponse {
    	if (me.isZombie) {
	    "He shrugs is shoulders, \"<<rand('Meh.', 'I\'ve moved on.', 'You keep it.')>>\"";
	}
	else {
	    "The houngan says, \"Ah, lovely... try breathing life into it with a kiss eh?\"";
	}
    }
;

+ hounganTalking : InConversationState
    stateDesc = "He is talking to you. "
;

++ AskTopic @dyingCat
    "<q>Yo yo yo, what\'s with the cat?</q> you ask.<.p>
    <q>Kiss it and find out.</q> he answers. "
;

+ notActive: ActorState
;

