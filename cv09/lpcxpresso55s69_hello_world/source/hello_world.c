/*
 * Copyright (c) 2013 - 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017, 2024 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "board.h"
#include <stddef.h>
#include "fsl_power.h"
#include "fsl_debug_console.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
volatile uint32_t g_systickCounter;
/*******************************************************************************
 * Prototypes
 ******************************************************************************/
void SysTick_Handler(void)
{
    if (g_systickCounter != 0U)
    {
        g_systickCounter--;
    }
}

void SysTick_DelayTicks(uint32_t n)
{
    g_systickCounter = n;
    while (g_systickCounter != 0U)
    {
    }
}
uint32_t strcmp_safe(const char *input, const char *password_stored, int pwd_storedlen)
{
    uint32_t test1, test2 = 0;

    // Porovnání každého znaku z input s password_stored
    for (uint32_t i=0;i<pwd_storedlen;i++)
    {
    	{if(input[i]==password_stored[i])
    		{test1++;}
    	else
    		{test2++;}
    	}
    }
return test2;
}
/*******************************************************************************
 * Variables
 ******************************************************************************/
volatile char ch;

/*******************************************************************************
 * Code
 ******************************************************************************/
/*!
 * @brief Main function
 */
int main(void)
{

	uint32_t DWT1, DWT2;
	uint32_t x,y,Sum;
	char password_stored[20]="12345678";
	char input[20];
	int status = 0;
	char pwd_storedlen[20];
    /* Init board hardware. */
    /* set BOD VBAT level to 1.65V */
	POWER_SetBodVbatLevel(kPOWER_BodVbatLevel1650mv, kPOWER_BodHystLevel50mv, false);
    /* attach main clock divide to FLEXCOMM0 (debug console) */
    CLOCK_AttachClk(BOARD_DEBUG_UART_CLK_ATTACH);

    BOARD_InitBootPins();
    SystemCoreClockUpdate();
    BOARD_InitBootClocks();
    BOARD_InitDebugConsole();
#if !defined(DONT_ENABLE_FLASH_PREFETCH)
    /* enable flash prefetch for better performance */
    SYSCON->FMCCR |= SYSCON_FMCCR_PREFEN_MASK;
#endif

    /* Set systick reload value to generate 1ms interrupt */
    if (SysTick_Config(SystemCoreClock / 1000U))
    {
        while (1)
        {
        }
    }

    PRINTF("hello world.\r\n");

    while (1)
    {	PRINTF("Enter password: \r\n");
    	SCANF("%s",input);
    	DWT1=DWT->CYCCNT;
    	status = strcmp_safe(input, password_stored, strlen(pwd_storedlen));
		DWT2=DWT->CYCCNT;
		PRINTF("Password: %s \r\n",input);
		//PRINTF("Cycles in function: %d \r\n",DWT2-DWT1);
		if (status == 0)
			{ PRINTF("Password correct \r\n");}
		else
			{PRINTF("Password invalid\r\n");}
		PRINTF("nCycles for strcmp function: %d \r\n",DWT2-DWT1);
        //ch = GETCHAR();
        //PUTCHAR(ch);
    }
}
