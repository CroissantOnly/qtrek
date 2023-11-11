QTREK_CXXFLAGS=$(CXXFLAGS) $(STD)
QTREK_LDFLAGS=$(LDFLAGS)

CXX:=clang++
STD:=-std=c++20

QTREK_CC=$(CXX) $(QTREK_CXXFLAGS)
QTREK_LD=$(CXX) $(QTREK_LDFLAGS)

%.o: %.cc
	$(QTREK_CC) -MMD -o $@ -c $<
	echo $@

QTREK_BIN=qtreksvr
QTREK_OBJS=qtrek/main.o

$(QTREK_BIN): $(QTREK_OBJS)
	$(QTREK_LD) -o $@ $^

all: $(QTREK_BIN)

clean:
	$(RM) $(QTREK_BIN) **/*.o

.PHONY: all clean
