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
	arm-none-eabi-gcc -std=gnu99 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\source" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\utilities" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\drivers" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\device" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\startup" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\component\uart" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\component\lists" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\CMSIS\DSP\Include" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\CMSIS\DSP\PrivateInclude" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\CMSIS" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_matrix\board" -O1 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-device

clean-device:
	-$(RM) ./device/system_LPC55S69_cm33_core0.d ./device/system_LPC55S69_cm33_core0.o

.PHONY: clean-device
