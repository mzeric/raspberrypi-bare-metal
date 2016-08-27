
CFLAGS= -Wall  -O2 -ffunction-sections -fdata-sections -mfpu=neon -mfloat-abi=hard -march=armv7-a -mtune=cortex-a7 -nostartfiles -nostdlib -Wl,verbose

# RPI1
#CFLAGS= -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -nostartfiles

#PREFIX=arm-rtems4.12-
PREFIX=arm-none-eabi-
CC=${PREFIX}gcc
OBJS=raspberrypi2.o

kernel7.img: kernel7.elf
	${PREFIX}objcopy -O binary $< $@
kernel7.elf: ${OBJS}
	${PREFIX}ld  -T link.ld $< -o $@

.o: .c
	${CC} ${CFLAGS} $< -c -DRPI2
	
clean:
	rm *.elf
	rm *.o
