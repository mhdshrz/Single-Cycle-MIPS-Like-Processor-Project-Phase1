# Single-Cycle-MIPS-Like-Processor-Project-Phase1
Computer Architecture Course Project, University of Isfahan



This processor supports two kinds of instructions. Immediate-formats and Register-formats.
\
\
Register-format instructions:
op |  rs  |  rt  |  rd  | funct |
-------:|:----:|:----:|:----:| --------:|
2 bits  |3 bits|3 bits|3 bits|5 bits|

And Immediate-format instructions:
op |  rs  |  rt  | imm8 |
-------:|:----:|:----:| ----:|
2 bits  |3 bits|3 bits|8 bits|

-> instructions are 16 bits long.

Instructions

Instruction | Type | op | Example | funct |
-------:|:---------------:|:-------------:|:------------------------------:|--------------:|
add     |            R    |       00      |       add rd, rs, rt           |       00000   |
sub     |            R    |       00      |        sub rd, rs, rt          |       00001   |
and     |            R    |       00      |       and rd, rs, rt           |       00010   |
or      |            R    |       00      |        or rd, rs, rt           |       00011   |                      
lw      |            I    |       01      |        lw rt, immediate(rs)    |        x      |
sw      |            I    |       10      |        sw rt, immediate(rs)    |        x      |
beq     |            I    |       11      |        beq rs, rt, immediate   |        x      |

This processor supports 8 16-bit registers.
