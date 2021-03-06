PREFIX=.
SRCDIR=$(PREFIX)/src
INCDIR=$(PREFIX)/include
BINDIR=$(PREFIX)
OBJDIR=$(PREFIX)/obj

EXEC=$(BINDIR)/lispy
SRC=$(wildcard $(SRCDIR)/*.c)
OBJ=$(addprefix $(OBJDIR)/, $(notdir $(SRC:.c=.o)))

CC=gcc
CFLAGS=-Wall -Wextra -std=c99
CLIB=-lm -ledit
CPPFLAGS=-I$(INCDIR)

vpath %.c src
vpath %.h include

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(CLIB)

$(OBJDIR)/%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS) $(CLIB) $(CPPFLAGS)

.PHONY: clean mrproper

clean:
	rm $(OBJDIR)/*.o

mrproper: clean
	rm $(EXEC)
