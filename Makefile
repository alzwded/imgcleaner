FORTRANS = isgray.f grayns.f fillpb.f proces.f clean.f
SRC = imgCleaner.c fUtils.c
OBJS = $(FORTRANS:.f=.o) $(SRC:.c=.o)
EXECUTABLE = imgCleaner
CFLAGS = -g -c
F77FLAGS = -g -c
CC = gcc
F77 = gfortran

LIBDEPS = -ljpeg -lgfortran

all: $(OBJS) $(EXECUTABLE)
.PHONY all:

$(EXECUTABLE): $(OBJS) 
	$(CC) -o imgCleaner -g $(OBJS) $(LIBDEPS)
	mkdir -p obj
	mv *.o obj/
	mkdir -p bin
	mv $(EXECUTABLE) bin/

.f.o:
	$(F77) $(F77FLAGS) -o $@ $<

.c.o:
	$(CC) $(CFLAGS) -o $@ $<

imgCleaner.o: imgCleanerF.h

clean:
	rm -f imgCleaner *.o bin/ obj/
