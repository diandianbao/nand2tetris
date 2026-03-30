// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

(LOOP)
  @KBD
  D=M
  @FILL
  D;JGT

(CLEAR)
  @offset
  D=M
  @SCREEN
  A=D+A
  M=0

  @INC_OFFSET
  0;JMP

(FILL)
  @offset
  D=M
  @SCREEN
  A=D+A
  M=-1

(INC_OFFSET)
  @offset
  MD=M+1
  @8192
  D=D-A

  @LOOP
  D;JNE

(RESET_OFFSET)
  @offset
  M=0
  @LOOP
  0;JMP