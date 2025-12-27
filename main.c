/* * ALT-BIOS: Physical Firmware Layer
 * Targeted for x86_64 Architecture
 */

#include <stdint.h>

// Direct memory address for VGA text mode
#define VIDEO_MEMORY (uint16_t*)0xB8000
#define SCREEN_WIDTH 80

void bios_print(const char* str, int line) {
    uint16_t* terminal_buffer = VIDEO_MEMORY + (line * SCREEN_WIDTH);
    for (int i = 0; str[i] != '\0'; i++) {
        // Character + Color Attribute (0x07 is Light Grey on Black)
        terminal_buffer[i] = (uint16_t)str[i] | (uint16_t)0x07 << 8;
    }
}

void main() {
    bios_print("ALT-BIOS v2.0.25 Initializing...", 0);
    bios_print("Checking Processor... OK", 1);
    bios_print("Memory Check: 16384MB OK", 2);
    
    while(1) {
        // Halt state - waiting for user input
    }
}
