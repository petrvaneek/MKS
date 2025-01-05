#include "main.h"
#include "sct.h"

/* Private variables ---------------------------------------------------------*/
TIM_HandleTypeDef htim1;
UART_HandleTypeDef huart2;

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_TIM1_Init(void);
void update_leds(uint8_t led_count);
void display_speed(uint16_t speed);

int main(void) {
    /* MCU Configuration */
    HAL_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_USART2_UART_Init();
    MX_TIM1_Init();
    
    sct_init();
    HAL_TIM_Encoder_Start(&htim1, htim1.Channel);
    
    uint16_t delay_time = 200;  // Initial delay in ms
    uint8_t led_count = 1;      // Start with 1 LED lit
    
    while (1) {
        // Read the rotary encoder value to adjust delay time
        uint16_t encoder_value = __HAL_TIM_GET_COUNTER(&htim1);
        delay_time = encoder_value * 2;  // Map encoder value to a delay range (adjust as necessary)
        if (delay_time < 20) delay_time = 20;  // Minimum delay
        if (delay_time > 500) delay_time = 500; // Maximum delay
        
        // Display the speed on the 7-segment display
        display_speed(delay_time);
        
        // Update the LEDs with the current LED count
        update_leds(led_count);
        
       static int direction = 1;  // 1 pro zvýšení, -1 pro snížení

        if (led_count == 3) {
            direction = -1;  // Změna směru na snížení
        } else if (led_count == 1) {
            direction = 1;  // Změna směru na zvýšení
        }
        
        led_count += direction;
        
        HAL_Delay(delay_time);  // Delay between steps
    }
}

void update_leds(uint8_t led_count) {
    // Turn off all LEDs first
    LL_GPIO_ResetOutputPin(GPIOB, LED3_Pin | LED4_Pin | LED5_Pin);

    // Turn on the LEDs based on the current count
    if (led_count >= 1) LL_GPIO_SetOutputPin(GPIOB, LED3_Pin);
    if (led_count >= 2) LL_GPIO_SetOutputPin(GPIOB, LED4_Pin);
    if (led_count >= 3) LL_GPIO_SetOutputPin(GPIOB, LED5_Pin);
}

void display_speed(uint16_t speed) {
    // Display the delay time (speed) on the 7-segment display
    sct_value(speed);
}

static void MX_TIM1_Init(void) {
    /* Timer configuration for rotary encoder */
    TIM_Encoder_InitTypeDef sConfig = {0};
    TIM_MasterConfigTypeDef sMasterConfig = {0};

    htim1.Instance = TIM1;
    htim1.Init.Prescaler = 0;
    htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
    htim1.Init.Period = 150;
    htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    htim1.Init.RepetitionCounter = 0;
    htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
    sConfig.EncoderMode = TIM_ENCODERMODE_TI1;
    sConfig.IC1Polarity = TIM_ICPOLARITY_FALLING;
    sConfig.IC1Selection = TIM_ICSELECTION_DIRECTTI;
    sConfig.IC1Prescaler = TIM_ICPSC_DIV1;
    sConfig.IC1Filter = 0;
    sConfig.IC2Polarity = TIM_ICPOLARITY_RISING;
    sConfig.IC2Selection = TIM_ICSELECTION_DIRECTTI;
    sConfig.IC2Prescaler = TIM_ICPSC_DIV1;
    sConfig.IC2Filter = 0;
    if (HAL_TIM_Encoder_Init(&htim1, &sConfig) != HAL_OK) {
        Error_Handler();
    }
    sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
    sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
    if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK) {
        Error_Handler();
    }
}

static void MX_GPIO_Init(void) {
    /* GPIO Initialization */
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();

    // LED pins (adjust based on your setup)
    GPIO_InitStruct.Pin = LED3_Pin | LED4_Pin | LED5_Pin;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
}

static void MX_USART2_UART_Init(void) {
    /* USART2 Initialization */
    huart2.Instance = USART2;
    huart2.Init.BaudRate = 38400;
    huart2.Init.WordLength = UART_WORDLENGTH_8B;
    huart2.Init.StopBits = UART_STOPBITS_1;
    huart2.Init.Parity = UART_PARITY_NONE;
    huart2.Init.Mode = UART_MODE_TX_RX;
    huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    huart2.Init.OverSampling = UART_OVERSAMPLING_16;
    if (HAL_UART_Init(&huart2) != HAL_OK) {
        Error_Handler();
    }
}

void Error_Handler(void) {
    /* User can add own implementation to report the error */
    __disable_irq();
    while (1) {
    }
}

#ifdef  USE_FULL_ASSERT
void assert_failed(uint8_t *file, uint32_t line) {
    /* User can add own implementation to report the error */
}
#endif
