# Single-Cycle-MIPS-Like-Processor-Project-Phase1
Computer Architecture Course Project, University of Isfahan



This processor supports two kinds of instructions. Immediate-formats and Register-formats.
\
\
R-format instructions
op code |  RS  |  RT  |  RD  | Function |
-------:|:----:|:----:|:----:| --------:|
2 bits  |3 bits|3 bits|3 bits|5 bits|

And I-format instructions
op code |  RS  |  RT  | immediate |
-------:|:----:|:----:| ----:|
2 bits  |3 bits|3 bits|8 bits|

-> instructions are 16 bits long.

Instructions

Instruction | Type | op code | Example | Function |
-------:|:---------------:|:-------------:|:------------------------------:|--------------:|
add     |            R    |       00      |       add rs, rt, rd           |       00000   |
sub     |            R    |       00      |        sub rs, rt, rd          |       00001   |
and     |            R    |       00      |       and rs, rt, rd           |       00010   |
or      |            R    |       00      |        or rs, rt, rd           |       00011   |                      
lw      |            I    |       01      |        lw rt, immediate(rs)    |        x      |
sw      |            I    |       10      |        sw rt, immediate(rs)    |        x      |
beq     |            I    |       11      |        beq rs, rt, immediate   |        x      |

This processor supports 8 16-bit registers, R0 to R7.
