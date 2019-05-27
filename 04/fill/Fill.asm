// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(KEYBOARD_LOOP)
    //Read value from keyboard
    @KBD
    D=M

    //Draw black if input is more than zero
    @DRAW_BLACK
    D;JGT

    //Draw white otherwise
    @DRAW_WHITE
    0;JMP

(DRAW_WHITE)
    //Setting white color to "color" variable
    @color
    M=0

    @DRAW
    0;JMP

(DRAW_BLACK)
    //Setting black color to "color" variable
    @color
    M=-1

    @DRAW
    0;JMP

(DRAW)
    //Size of screen in machine words (512x256) / 16
    @8192
    D=A

    @size
    M=D

    @SCREEN
    D=A
    @position
    M=D

    @DRAW_NEXT
    0;JMP

(DRAW_NEXT)
    @color
    D=M

    //Set color at position
    @position
    A=M
    M=D

    //Position++
    @position
    D=M+1
    M=D

    ///Checking that (POSITION - SCREEN - SIZE) < 0
    @SCREEN
    D=D-A
    @size
    D=D-M

    //Jumping to next if screen is not fully colored
    @DRAW_NEXT
    D;JLT

@KEYBOARD_LOOP
0;JMP
