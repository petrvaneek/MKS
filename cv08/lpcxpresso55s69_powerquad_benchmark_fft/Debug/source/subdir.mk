################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/powerquad_benchmark_fft.c \
../source/semihost_hardfault.c 

C_DEPS += \
./source/powerquad_benchmark_fft.d \
./source/semihost_hardfault.d 

OBJS += \
./source/powerquad_benchmark_fft.o \
./source/semihost_hardfault.o 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\source" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\utilities" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\drivers" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\device" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\startup" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\component\uart" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\component\lists" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\CMSIS\DSP\Include" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\CMSIS\DSP\PrivateInclude" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\CMSIS" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_fft\board" -O1 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-source

clean-source:
	-$(RM) ./source/powerquad_benchmark_fft.d ./source/powerquad_benchmark_fft.o ./source/semihost_hardfault.d ./source/semihost_hardfault.o

.PHONY: clean-source

