T3MAKE = t3make -d -f game.t3m

target := zombies.t3
sources := $(patsubst %.t,-source %,$(wildcard *.t))

default:
	$(T3MAKE) -o $(target) $(sources)

run: default
	t3run $(target)

clean:
	$(T3MAKE) -clean $(sources)
	rm -f dummy *~

realclean: clean
	rm -f $(target)
