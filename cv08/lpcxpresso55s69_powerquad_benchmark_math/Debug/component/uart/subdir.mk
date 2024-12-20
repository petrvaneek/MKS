################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/uart/fsl_adapter_usart.c 

C_DEPS += \
./component/uart/fsl_adapter_usart.d 

OBJS += \
./component/uart/fsl_adapter_usart.o 


# Each subdirectory must supply rules for building sources it contributes
component/uart/%.o: ../component/uart/%.c component/uart/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -DCPU_LPC55S69JBD100_cm33_core0 -DMCUXPRESSO_SDK -DCPU_LPC55S69JBD100 -DCPU_LPC55S69JBD100_cm33 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -D__NEWLIB__ -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\source" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\utilities" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\drivers" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\device" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\startup" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\component\uart" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\component\lists" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\CMSIS\DSP\Include" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\CMSIS\DSP\PrivateInclude" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\CMSIS" -I"C:\Temp\MKSVanek\MKS\lpcxpresso55s69_powerquad_benchmark_math\board" -O1 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__NEWLIB__ -fstack-usage -specs=nano.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-uart

clean-component-2f-uart:
	-$(RM) ./component/uart/fsl_adapter_usart.d ./component/uart/fsl_adapter_usart.o

.PHONY: clean-component-2f-uart

