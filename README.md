# dwmblocks

Modular status monitor for dwm written in C with features including
signaling, clickability, cursor hinting and color.

# Usage

`dwmblocks [-d <delimiter>]`

# Modifying blocks

Blocks are added and removed by editing [blocks.h](blocks.h) file. Read it for
more info.

> The provided blocks use siji font for icons.

# Colored output and Clickability

[patches](patches) folder includes two patches for dwm, one for dwm already
patched with systray patch and the other for vanilla dwm. One of the patches,
whichever appropriate, is essential for dwmblocks to function properly. It will
add support for colored text, clickability and cursor hinting when hovering on
clickable blocks (inspired by polybar).

Clickability is inspired by statuscmd patch for dwm. On clicking on text
corresponding to a clickable block, the program specified to handle clicks for
that block is executed with the first argument specifying which button was
clicked (1 for left, 2 for middle and 3 for right).

Colored output is inspired by statuscolors patch for dwm. To add colors, have
your programs for the blocks output raw characters from '\x0b' to '\x31'. '\x0b'
in status text switches active colorscheme to the first one in the colors array
in dwm and so on. See
[statuscolors patch for dwm](https://dwm.suckless.org/patches/statuscolors/)
for more info. Keep in mind that you have to start from '\x0b' instead of '\x01'
as instructed on the page.

# Signaling changes

To signal a specific block to update, run `sigdwmblocks <signal> [<sigval>]`.
`<sigval>` is optional and must be an integer. If provided, it is passed as the
first argument to the program specified for updating the block.

# xgetrootname

It is a tiny program to get the current root name. May prove helpful in
debugging.

# Installation

Clone the repository and run `make install clean` after getting in the project
directory. By default the program is installed in `$HOME/.local/bin`
(see the [GNUmakefile](GNUmakefile)). If xgetrootname is required run
`make xgetrootname`.

# Acknowledgements

Some ideas and code was taken from other projects. Credits for those go to -

* torrinfail ([original dwmblocks implementation](https://github.com/torrinfail/dwmblocks))
* Daniel Bylinka ([statuscmd patch for dwm](https://dwm.suckless.org/patches/statuscmd/))
* Jeremy Jay ([statuscolors patch for dwm](https://dwm.suckless.org/patches/statuscolors/))

# See also

* [dsblocks](https://github.com/ashish-yadav11/dsblocks) - A clone of this
  project with the only difference being that C functions instead of external
  programs are used to update blocks and handle clicks.
