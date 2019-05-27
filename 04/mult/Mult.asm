// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//n = R1
@R1
D=M
@n
M=D
//i = 0
@i
M=0
//result=0
@result
M=0

(LOOP)
    //Jump to stop if i==n
    @i
    D=M
    @n
    D=D-M
    @STOP
    D;JEQ

    //sum = sum + R0
    @sum
    D=M
    @R0
    D=D+M
    @sum
    M=D

    //i++
    @i
    M=M+1

    @LOOP
    0;JMP

(STOP)
    @sum
    D=M
    @R2
    M=D
    @sum
    M=0
    @i
    M=0

(END)
    @END
    0;JMP
