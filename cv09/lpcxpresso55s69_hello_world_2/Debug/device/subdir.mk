################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/system_LPC55S69_cm33_core0.c 

C_DEPS += \
./device/system_LPC55S69_cm33_core0.d 

OBJS += \
./device/system_LPC55S69_cm33_core0.o 


# Each subdirectory must supply rules for building sources it contributes
device/%.o: ../device/%.c device/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_BAREMETAL -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\utilities" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\drivers" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\device" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\startup" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\component\uart" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\component\lists" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\CMSIS" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\source" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_hello_world_2\board" -O0 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-device

clean-device:
	-$(RM) ./device/system_LPC55S69_cm33_core0.d ./device/system_LPC55S69_cm33_core0.o

.PHONY: clean-device
