.data
#polinomios
    pedirnumero1:.asciiz"coloque el valor de (n) :\n"
    f1: .float 2.14156
    mensaje:.asciiz"acabando el bucle"
    spacio:.asciiz","
.text
#pedir datos
li $v0,4
la $a0,pedirnumero1
syscall

li $v0,5
syscall

li $v0,2 #pedir flotant
lwc1 $f12,f1
main:
addi $t0,$zero,0#i=0
while:
    bgt $t0,$a0,exit
    jal printNumber
    addi $t0,$t0,1#i++
    j while
    exit:
    li $v0,4
    la $a0,mensaje
    syscall
li $v0,10 
syscall
printNumber:
    li $v0,1
    add $a0,$t0,$zero
    syscall 
    li $v0,4
    la $a0,spacio
    jr $ra#retorna