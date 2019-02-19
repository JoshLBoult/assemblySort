// m[0] <- the size of the array to be sorted
// m[1] <- location of the start of the array
// m[2] <- counts the operations completed per pass, so the program knows when to
// reset and begin the next pass. Resets to 1 as operations per pass should be n-1
// where n is the size of the array
// m[3] <- counts the number of swaps per pass, if this is 0 then the array is sorted
// and the program jumps to the end
// m[4] <- the index of the first number to be sorted
// m[5] <- the index of the adjacent number to be sorted
// m[6] <- stores temporary value of m[m[4]] during swap procedure
// m[7] <- stores temporary value of m[m[5]] during swap procedure

// Setup everything except size of array and location
(SETUP)
@2
M=1
@3
M=0
@1
D=M
@4
M=D
@5
M=D
M=M+1
// We define a bubble pass label that iterates over an entire pass of the array
(BUBBLEPASS)
// This checks if the pass is complete so it can reset for the next pass or end
@0
D=M
@2
D=D-M
@RESET
D;JEQ
// Now, we go through one operation for the pass
@4
A=M
D=M
@5
A=M
D=D-M
// Jumps to swap label if the numbers need swapping
@SWAP
D;JGT
// Jump back if the numbers were swapped and moves indices for the next operation
// in this pass
(CONTINUEPASS)
@2
M=M+1
@5
D=M
M=M+1
@4
M=D
@BUBBLEPASS
0;JMP
// Checks for end, if false then resets count of operations and swaps for next pass
// and resets the current indices being checked
(RESET)
@3
D=M
@END
D;JEQ
@SETUP
0;JMP
// Swap procedure for sorting the array
(SWAP)
// Save values as follows: m[6]    <- m[m[4]],  m[7]    <-m [m[5]]
// Set values as follows : m[m[4]] <- m[7],     m[m[5]] <- m[6]
@4
A=M
D=M
@6
M=D
@5
A=M
D=M
@7
M=D
// Now set values
D=M
@4
A=M
M=D
@6
D=M
@5
A=M
M=D
// Increment swaps per pass and continue algorithm
@3
M=M+1
@CONTINUEPASS
0;JMP
(END)
@END
0;JMP
