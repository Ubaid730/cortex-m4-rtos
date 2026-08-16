# Cortex-M4 Preemptive RTOS

A bare-metal preemptive Real-Time Operating System for ARM Cortex-M4 (STM32F4 Discovery). Priority-based scheduling with PendSV context switching, mutexes, and message queues. No CMSIS, no HAL — pure C and ARM assembly.

## Setup

```bash
sudo apt update
sudo apt install gcc-arm-none-eabi binutils-arm-none-eabi make renode
```

## Build

```bash
make clean
make
```

Produces `build/rtos-day1.elf`.

## Run

```bash
make run
```

Headless:

```bash
renode sim/script.resc --disable-xwt --console
```