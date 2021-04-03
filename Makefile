.POSIX:

.SUFFIXES:
.SUFFIXES: .c .o

SRC = errcho.c
OBJ = $(SRC:.c=.o)

all: errcho

clean:
	rm -f $(OBJ) errcho

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

errcho: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ)
