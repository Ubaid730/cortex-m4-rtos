CROSS = arm-none-eabi-
CC = $(CROSS)gcc
LD = $(CROSS)gcc

CFLAGS = -mcpu=cortex-m4 -mthumb -fno-builtin -nostdlib -g -O0 -Iinclude
LDFLAGS = -T linker.ld -Wl,--gc-sections

TARGET = rtos-day1
OBJS = build/startup.o build/main.o build/task.o build/mutex.o build/queue.o

all: build/$(TARGET).elf

build:
	mkdir -p build

build/%.o: src/%.c | build
	$(CC) $(CFLAGS) -c $< -o $@

build/%.o: src/%.S | build
	$(CC) $(CFLAGS) -c $< -o $@

build/$(TARGET).elf: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $@

run: build/$(TARGET).elf
	renode sim/script.resc

clean:
	rm -rf build

.PHONY: all run clean