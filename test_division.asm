// Divides M[0] by M[1]
// M[2] is max number of divisions possible if there is remainder
// M[5] is result if there is no remainder
// M[3] is decremented every time a division is done if it is >= 0
@0
D=M
@3
M=D

// Main division loop
(DIVISION)
@1 // JUMP BACK HERE
D=A
@5
M=D+M
@3
D=M
@1
D=D-M
@3
M=D
@FINALISE
D;JLE // JUMPS TO 19
@DIVISION
0;JMP // JUMP BACK

// Division done, stores extra value and ends
(FINALISE)
@1 // JUMP HERE
D=A
@5
D=M-D
@2
M=D // Stores the maximum number of divisions without overrun
(END)
@END
0;JMP
