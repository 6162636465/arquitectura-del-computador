.text
main: 
	la $t0,coeficientes
	addi $t0,$t0,12
	l.s $f1,($t0)#en $t0 se guarda la ultima dirección del arreglo de floats
	l.s $f12,($t0)#se incializa $f3 con el valor de la ultima posicion
	
	li $v0,4 # prepara para imprimir unca cadena
	la $a0,x # mete a x: en $a0
	syscall	# imprime $a0
	li $v0,5 # prepara para leer entero
	syscall # lee
	move $t1,$v0 # valor leido es almacenado en $t1
	mtc1 $t1,$f0 # $t1 lo mueve hacia el Coproc1 en $f0
	cvt.s.w $f0,$f0
	mtc1 $t1,$f3
	cvt.s.w $f3,$f3
	li $t2,3 # contador
bucle:
	bltz $t2,salir # verifica que #t2 no sea menor que cero
	addi $t0,$t0,-4 # corre el array
	l.s $f1,($t0)
	mul.s $f2,$f1,$f0 # multiplica el valor almacenado por el coeficiente correspondiente 
	add.s $f12,$f12,$f2
	mul.s $f0,$f0,$f3 # potencia
	addi $t2,$t2,-1	
	j bucle	# vuelve al inicio de bucle		
salir:
	li $v0,4 # se prepara para imprimir cadena
	la $a0,res # asigna res: a $a0
	syscall # imprime res:
	li $v0,2 # se prepara para imprimir un float
	syscall # imprime float
	li $v0,10 # se prepara para salir del programa
	syscall # termina el programa
	
.data
	coeficientes: .float  3.0,2.0,1.0,4.0
	x: .asciiz "Introduce x: "
	res: .asciiz "El resultado del polinomio es: "
