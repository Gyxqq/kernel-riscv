SRC:=src
BUILD:=build
TARGET:=kernel.bin
KERNELNEED:= \
$(BUILD)/kernel/boot.o \
$(BUILD)/kernel/main.o

$(TARGET):$(KERNELNEED)
	-$(shell mkdir -p $(BUILD)/kernel)
	riscv64-unknown-elf-ld -e _start -Ttext=0x80200000 $(KERNELNEED) -o kernel.bin 
$(BUILD)/kernel/%.o:$(SRC)/kernel/%.s
	-$(shell mkdir -p $(BUILD)/kernel)
	riscv64-unknown-elf-gcc -c $^ -o $@
$(BUILD)/kernel/%.o:$(SRC)/kernel/%.c
	-$(shell mkdir -p $(BUILD)/kernel)
	riscv64-unknown-elf-gcc -c $^ -o $@ 
clean:
	-rm -rf $(BUILD)
	@echo clean success
run:
	qemu-system-riscv64 -bios fw_jump.bin -machine virt -kernel kernel.bin -smp 1 -m 128M -nographic