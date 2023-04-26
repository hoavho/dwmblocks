/* macro for conveniently specifying pathu and pathc below */
#define PATH(name)                      "/opt/dwmblocks/blocks/"name

/* buffer size for capturing output of the programs used for updating blocks */
#define CMDOUTLENGTH                    50

/* DELIMITERENDCHAR must be less than 32.
 * At max, DELIMITERENDCHAR - 1 number of clickable blocks are allowed.
 * Raw characters larger than DELIMITERENDCHAR and smaller than ' ' in ASCII
   character set can be used for signaling color change in status.
 * The character corresponding to DELIMITERENDCHAR + 1 ('\x0b' when
   DELIMITERENDCHAR is 10) will switch the active colorscheme to the first one
   defined in colors array in dwm's config.h and so on.
 * If you wish to change DELIMITERENDCHAR, don't forget to update its value in
   dwm.c and color codes in your pathu programs. */
#define DELIMITERENDCHAR                10

/* delimiter specified as an array of characters
 * (don't remove DELIMITERENDCHAR at the end) */
static const char delimiter[] = { ' ', DELIMITERENDCHAR };

#include "block.h"

/* If interval of a block is set to 0, the block will only be updated once at
   startup.
 * If interval is set to a negative value, the block will never be updated in
   the main loop.
 * Set pathc to NULL if clickability is not required for the block.
 * Set signal to 0 if both clickability and signaling are not required for the
   block.
 * Signal must be less than DELIMITERENDCHAR for clickable blocks.
 * If multiple signals are pending, then the lowest numbered one will be
   delivered first. */

/* pathu - path of the program whose output is used as status text of the block
           (output of the program should be a single line of text with at most
            one newline character at the end)
 * pathc - path of the program used for handling clicks on the block */

/* 1 interval = INTERVALs seconds, INTERVALn nanoseconds */
#define INTERVALs                       1
#define INTERVALn                       0

/* !! Notes
 * signal = is used by dwmblocks to determine which pathc to trigger -> so you have to make them unique
 * e.g. if you set both pathu "sb-cpu-usage.sh" and pathu "sb-ram-usage.sh" with signal 2
 * when you click on either of them, both buttons will be trigger (because they both having same value)
 *
 * HOWEVER, this signal is NOT what is sent/provided to your pathc script
 * -> the parameter sent to your script is dwm signal value (1 = left mouse click - Button1, 2 = middle mouse click - Button2, 3 = right click - Button3)
 * -> so in your pathc .sh script, you should handle dwm signal value (1,2 or 3) instead (to respond differently for differnt button click)

/*        { PATH("volume.sh"),            PATH("volume_button.sh"),       0,              2}, */
static Block blocks[] = {
/*      pathu                           pathc                           interval        signal */
        { PATH("sb-cpu-usage.sh"),      PATH("cpu_usage_button.sh"),	15,             1},
        { PATH("sb-ram-usage.sh"),      PATH("ram_usage_button.sh"),   	15,             2},
        { PATH("sb-cpu-temp.sh"),       PATH("cpu_temp_button.sh"),     1,              3},
        { PATH("sb-battery-v2.sh"),     PATH("battery_button.sh"),      30,             4},
	{ PATH("sb-internet.sh"),       NULL,                           5,              9},
        { PATH("calendar.sh"),          NULL,                           30,             5},
        { NULL } /* just to mark the end of the array */
};
