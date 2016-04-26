 .data
myname: .asciiz "\r\nNAME: Wxh\r\n"
myid: .asciiz "ID: W\r\n"
suc: .asciiz "\nSuccess! Location:"
fail: .asciiz "\r\nFail!\r\n"
buf: .space 100
hh: .asciiz "\n"
 .text
 .globl main
main: 
 la $a0, buf
 la $a1, 100
 li $v0, 8  #input a string
 syscall
 # $a0 = address of input bufferll
 # $a1 = maximum number of characters to read
inputchar:
 li $v0, 12  # input a char
 syscall 
 addi $t7, $0, '?'
 sub $t6, $t7, $v0
 beq $t6, $0, exit
 add $t0, $0, $0
 la $s1, buf
find_loop: 
 lb $s0, 0($s1)
 sub $t1, $v0, $s0
 beq $t1, $0, success
 addi $t0, $t0, 1
 slt $t3, $t0, $a1
 beq $t3, $0, failed
 addi $s1 $s1, 1
 j find_loop
success:
 la $a0, suc
 li $v0, 4
 syscall
 addi $a0, $t0, 1
 li $v0, 1
 syscall
 la $a0, hh
 li $v0, 4
 syscall
 j inputchar
failed:
 la $a0, fail
 li $v0, 4
 syscall
 j inputchar
exit:
 la $a0, myname
 li $v0, 4
 syscall
 la $a0, myid
 li $v0, 4
 syscall
 li $v0, 10
 syscall
