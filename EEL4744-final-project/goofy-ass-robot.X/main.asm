.INCLUDE "AVR64DU32def.inc"

//Define MACROS
.MACRO LoadTwoBytes ;low, high, value
    LDI R16, HIGH(@2);generating delay 0xFFFF - 0xFEA0 + 1
    STS @1, R16 ;I can reuse this again
    LDI R16, LOW(@2)
    STS @0, R16
.ENDMACRO

.MACRO LoadOneByte
    LDI R16, @1 ; load 1 byte into r16
    STS @0, R16 ; store to data space the value stored in r16
.ENDMACRO
//End of MACROS

//L298N input ports
.EQU IN1 = 0b00000100 //IN1 = PORTA2
.EQU IN2 = 0b00001000 //IN4 = PORTA3
.EQU IN3 = 0b00010000 //IN3 = PORTA4
.EQU IN4 = 0b00100000 //IN4 = PORTA5

.ORG 0x00
    JMP Main

.ORG 0x14
    JMP ForwardWheel

.ORG 0x69
    JMP BackwardWheel

.ORG 0x99
    JMP RotateClockwise

Main:
//idk what to put here yet
ForwardWheel:
.org 0x400
LoadOneByte PORTA_DIRSET, IN1// set PORTA2 to be the output
LoadOneByte PORTA_DIRSET, IN2// set PORTA3 to be the output
LoadOneByte PORTA_DIRSET, IN3// set PORTA4 to be the output
LoadOneByte PORTA_DIRSET, IN4// set PORTA5 to be the output



