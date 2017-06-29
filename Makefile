# Makefile for dungeon

# Where to install the program
BINDIR = /usr/games

# Where to install the data file
DATADIR = /usr/games/lib

# Where to install the man page
MANDIR = /usr/share/man

# The dungeon program provides a ``more'' facility which tries to
# figure out how many rows the terminal has.  Several mechanisms are
# supported for determining this; the most common one has been left
# uncommented.  If you have trouble, especially when linking, you may
# have to select a different option.

# more option 1: use the termcap routines.  On some systems the LIBS
# variable may need to be set to -lcurses.  On some it may need to
# be /usr/lib/termcap.o.  These options are commented out below.
LIBS = -ltermcap
TERMFLAG =
# LIBS = -lcurses
# LIBS = /usr/lib/termcap.o

# more option 2: use the terminfo routines.  On some systems the LIBS
# variable needs to be -lcursesX, but probably all such systems support
# the termcap routines (option 1) anyhow.
# LIBS = -lcurses
# TERMFLAG = -DMORE_TERMINFO

# more option 3: assume all terminals have 24 rows
# LIBS =
# TERMFLAG = -DMORE_24

# more option 4: don't use the more facility at all
# LIBS =
# TERMFLAG = -DMORE_NONE

# End of more options

# Uncomment the following line if you want to have access to the game
# debugging tool.  This is invoked by typing "gdt".  It is not much
# use except for debugging.
GDTFLAG = -DALLOW_GDT

# Compilation flags
CFLAGS = -g #-static
# On SCO Unix Development System 3.2.2a, the const type qualifier does
# not work correctly when using cc.  The following line will cause it
# to not be used and should be uncommented.
# CFLAGS= -O -Dconst=

##################################################################

# Source files
CSRC =	actors.c ballop.c clockr.c demons.c dgame.c dinit.c dmain.c\
	dso1.c dso2.c dso3.c dso4.c dso5.c dso6.c dso7.c dsub.c dverb1.c\
	dverb2.c gdt.c lightp.c local.c nobjs.c np.c np1.c np2.c np3.c\
	nrooms.c objcts.c rooms.c sobjs.c supp.c sverbs.c verbs.c villns.c

# Object files
OBJS =	actors.o ballop.o clockr.o demons.o dgame.o dinit.o dmain.o\
	dso1.o dso2.o dso3.o dso4.o dso5.o dso6.o dso7.o dsub.o dverb1.o\
	dverb2.o gdt.o lightp.o local.o nobjs.o np.o np1.o np2.o np3.o\
	nrooms.o objcts.o rooms.o sobjs.o supp.o sverbs.o verbs.o villns.o

dungeon: $(OBJS) dtextc.dat
	$(CC) $(CFLAGS) -o zork $(OBJS) $(LIBS)

install: zork dtextc.dat
	mkdir -p $(BINDIR) $(LIBDIR) $(MANDIR)/man6
	cp zork $(BINDIR)
	cp dtextc.dat $(DATADIR)
	cp dungeon.6 $(MANDIR)/man6/

clean:
	rm -f $(OBJS) zork core dsave.dat *~

dtextc.dat:
	cat dtextc.uu1 dtextc.uu2 dtextc.uu3 dtextc.uu4 | uudecode

dinit.o: dinit.c funcs.h vars.h
	$(CC) $(CFLAGS) $(GDTFLAG) -DTEXTFILE=\"$(DATADIR)/dtextc.dat\" -c dinit.c

dgame.o: dgame.c funcs.h vars.h
	$(CC) $(CFLAGS) $(GDTFLAG) -c dgame.c

gdt.o: gdt.c funcs.h vars.h
	$(CC) $(CFLAGS) $(GDTFLAG) -c gdt.c

local.o: local.c funcs.h vars.h
	$(CC) $(CFLAGS) $(GDTFLAG) -c local.c

supp.o: supp.c funcs.h vars.h
	$(CC) $(CFLAGS) $(TERMFLAG) -c supp.c	

actors.o: funcs.h vars.h
ballop.o: funcs.h vars.h
clockr.o: funcs.h vars.h
demons.o: funcs.h vars.h
dmain.o: funcs.h vars.h
dso1.o: funcs.h vars.h
dso2.o: funcs.h vars.h
dso3.o: funcs.h vars.h
dso4.o: funcs.h vars.h
dso5.o: funcs.h vars.h
dso6.o: funcs.h vars.h
dso7.o: funcs.h vars.h
dsub.o: funcs.h vars.h
dverb1.o: funcs.h vars.h
dverb2.o: funcs.h vars.h
lightp.o: funcs.h vars.h
nobjs.o: funcs.h vars.h
np.o: funcs.h vars.h
np1.o: funcs.h vars.h parse.h
np2.o: funcs.h vars.h parse.h
np3.o: funcs.h vars.h parse.h
nrooms.o: funcs.h vars.h
objcts.o: funcs.h vars.h
rooms.o: funcs.h vars.h
sobjs.o: funcs.h vars.h
sverbs.o: funcs.h vars.h
verbs.o: funcs.h vars.h
villns.o: funcs.h vars.h
