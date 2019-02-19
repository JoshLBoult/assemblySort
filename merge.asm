// User input:
// m[0] <- location of input array (suggested > 1000)size of input array
// m[1] <- size of input array (in theory, should be less that 2^16)
// Output:
// Output array stored in the same location as input array (m[m[1]])

// NB: We consider the algorithm as a type of binary tree that splits down before being
// merged again e.g.
//        5,3,6     Level 0
//       /     \
//      5,3     6   Level 1
//     /   \    |
//    5     3   6   Level 2
//     \   /    |
//      3,5     6   Consider this again level 1
//        \    /
//         3,5,6    Consider this again level 0

// Program address usage split into three areas:

// Area 1 (Stores progression of algorithm and current state of sub array):
// m[2] <- Left or right side? 0=Left, 1=Right
// m[3] <- Location of start of sub array
// m[4] <- Size of sub array
// m[5] <- Is this sub array merged? 0=No, 1=Yes
// m[6] <- Which level of the tree is this sub array? Original array=0
// m[7] <- Location of parent array
// m[8] <- Size of parent array

// Area 2 (Stores history of whether parents at each level were odd or even length
// and whether they were the left or right side of their parent)
// These arrays are overwritten as we move up and down different branches:
// m[9]           <- If this reaches 1, the array has finished sorting i.e.
//                   We will have finished the "left side" of the upper array
//                   which is the whole array itself.
// m[10] to m[24] <- store which side of each level we are on. There can be 16 total
//                   levels including level 0. This allows 2^16 input array size
// m[25]          <- Is the original array odd or even (0=odd, 1=even)
// m[26] to m[40] <- store whether the sub arrays referenced in m[10] to m[26]
//                   are odd or even

// Area 3 (Used to save temporary data e.g. during loops):
// (DIVISION)
// m[41] <- 2, we will always divide by 2
// m[42] <- The number to be divided
// m[43] <- Counts times the division has completed (end result is solution)
// m[44] <- Whether input was odd (=0) or even (=1)

// Initialisation for first level of tree, left side (m[2] to m[8])
@2
M=0
@0
D=M
@3
M=D
@7
M=D
@5
M=0
@6
M=1
@1
D=M
@8
M=D
// We need to divide the input for m[4]
// Initialise division by 2
@2
D=A
@41
M=D
(DIVIDE) // Find the size of the left half and whether the input is odd or even
// m[42] has to be filled before entering this 'function'
@41
D=M
@42
M=M-D
@43
M=M+1
// Now, is m[42] <,= or > 0?
@42
D=M
@DIVIDE
D;JGT
@ODD
D;JLT
@EVEN
D;JEQ














//
