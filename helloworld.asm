##print "hello world"
.data
str: .asciiz "hello world\n"

.text
.globl main

main:
   la $a0, str
   li $v0, 4
   syscall
   li $v0, 10
   syscall