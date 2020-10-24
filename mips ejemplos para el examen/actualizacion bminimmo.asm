.data
array: .word 3,2,5,0
.text
	la $s1,array
	li $s2,10
	lw $t0,0($s1)
	addi $t1,$zero,0
loop :  add $t1,$t1,1
	beq $t1,$s2,done
	add $t2,$t1,$t1
	add $t2,$t2,$t2
	add $t2,$t2,$s1
	lw $t3,0($t2)
	slt $t0,$t4,$t3#<
	beq $t0,$zero,loop
	addi $t4,$t3,0
	j loop
done:   add $a0,$zero,$t0
	li $v0, 1
	syscall
	li $v0, 10
	syscall