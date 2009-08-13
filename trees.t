#include "zombies.h"

trees : Fixture 'variety tall tree*trees' 'trees'
    "A variety of trees.\n\n<<fallingLeaves.doScript()>>"
    location=villageSquare

    fallingLeaves : ShuffledEventList
    { 
        eventList =
        [
	    'A few leaves fall from the trees.\n',
            'There is a rustling in the fallen leaves.\n'
        ]
        eventPercent = 90
        eventReduceAfter = 3
        eventReduceTo = 50    
    }
;

+ leaves : Decoration 'small pile/leaves' 'pile of leaves'
  "High winds cause these leaves to fall from the trees.  Blah blah ticks.<<sheepTicks.discover>>"
  dobjFor(Search) asDobjFor(Examine) 
;

+ sheepTicks : Hidden 'sheep tick*ticks' 'ticks'
  "Resting under the leaves, these sheep ticks wait."
  isPlural = true

  iobjFor(MoveWith)
  {
    verify() {}
    check() {}
    action()
    {
      /* if(gDobj==nest && !nest.moved) */
        /* replaceAction(Take, nest); */
    }
  }
;

