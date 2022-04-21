CC     := gcc
CFLAGS := -Wall -Wextra -Werror -pedantic
RM     := rm -vf

EXEC  := hello
OBJS  := hello.o main.o
INCL  := hello.h
SHLIB := libhello.so

PREFIX  ?= /usr/local
LIBDIR  ?= $(PREFIX)/lib
INCLDIR ?= $(PREFIX)/include

.PHONY: all
all: $(SHLIB) $(EXEC)

%.o: %.c
	$(CC) -c $< -o $@ -fPIC $(CFLAGS)

$(SHLIB): hello.o
	$(CC) $< -o $@ -shared $(CFLAGS)

$(EXEC): main.o $(SHLIB)
	$(CC) $< -o $@ -L. -lhello $(CFLAGS)

.PHONY: lib
lib: $(SHLIB)

.PHONY: lib-install
lib-install: $(SHLIB)
	install -m 0755 $(SHLIB) $(LIBDIR)
	install -m 0644 $(INCL) $(INCLDIR)

.PHONY: test
test:
	cd test && \
        cmake -S . -B _build && \
        make -C _build && \
        ./_build/hello_test

.PHONY: lib-uninstall
lib-uninstall:
	@$(RM) $(LIBDIR)/$(SHLIB)
	@$(RM) $(INCLDIR)/$(INCL)

.PHONY: clean
clean:
	@$(RM) $(OBJS)
	@$(RM) -r test/_build

.PHONY: mrproper
mrproper: clean
	@$(RM) $(SHLIB) $(EXEC)
