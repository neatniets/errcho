.POSIX:

include config.mk

.SUFFIXES:
.SUFFIXES: .c .o

SRC = errcho.c
OBJ = $(SRC:.c=.o)

all: errcho

clean:
	rm -f $(OBJ) errcho

install: errcho
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f errcho $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/errcho
	mkdir -p $(MANPREFIX)/man1
	cp -f errcho.1 $(DESTDIR)$(MANPREFIX)/man1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/errcho.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/errcho
	rm -f $(DESTDIR)$(MANPREFIX)/man1/errcho.1

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

errcho: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ)
