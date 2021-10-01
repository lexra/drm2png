DEPENDENCIES = libdrm libpng
CFLAGS = $(shell pkg-config --cflags $(DEPENDENCIES))
LDFLAGS = $(shell pkg-config --libs $(DEPENDENCIES)) -lpthread


all: drm2png ntpc fbgrab i2c_read_data

i2c_read_data: i2c_read_data.o
	$(CC) $@.o -o $@ $(LDFLAGS)

fbgrab: fbgrab.o
	$(CC) $@.o -o $@ $(LDFLAGS)

ntpc: ntpc.o
	$(CC) $@.o -o $@ $(LDFLAGS)

drm2png: drm2png.o
	$(CC) $@.o -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

echoflags:
	@echo CFLAGS=${CFLAGS}
	@echo LDFLAGS=${LDFLAGS}

clean:
	rm -f *.o drm2png ntpc fbgrab i2c_read_data
