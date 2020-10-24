.data
     
     p1: .word 2,0 # que define (x1, y1)
     p2: .word 4,5 # que define (x2, y2)
     p3: .word 20,10 # que define (x3, y3)
     p4: .word 10,3 # que define (x4, y4)
     p5: .word 5,2 # que define (x5, y5)
     
     textoA:  .asciiz "El area es: "
     dos: .float 2.0

.text

 main:
 
     la $t1, p1 #Carga direccion de p1 en $t1
     la $t2, p2 #Carga direccion de p2 en $t2
     la $t3, p3 #Carga direccion de p3 en $t3
     la $t4, p4 #Carga direccion de p4 en $t4
     la $t5, p5 #Carga direccion de p5 en $t5
     
     li $t0, 0  #Suma = 0
     li $t6, 0  #Temporal = 0
     
     lw $t7, 0($t1)
     lw $t8, 4($t2)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     add $t0, $t0, $t6 #Se agrega el temporal a la suma total  
     
     lw $t7, 0($t2)
     lw $t8, 4($t3)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     add $t0, $t0, $t6 #Se agrega el temporal a la suma total    
     
     lw $t7, 0($t3)
     lw $t8, 4($t4)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     add $t0, $t0, $t6 #Se agrega el temporal a la suma total 
     
     lw $t7, 0($t4)
     lw $t8, 4($t5)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     add $t0, $t0, $t6 #Se agrega el temporal a la suma total 
     
     lw $t7, 0($t5)
     lw $t8, 4($t1)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     add $t0, $t0, $t6 #Se agrega el temporal a la suma total 
     
          ################################################     ################################################
     
     lw $t7, 4($t1)
     lw $t8, 0($t2)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     sub $t0, $t0, $t6 #Se agrega el temporal a la suma total  
     
     lw $t7, 4($t2)
     lw $t8, 0($t3)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     sub $t0, $t0, $t6 #Se agrega el temporal a la suma total    
     
     lw $t7, 4($t3)
     lw $t8, 0($t4)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     sub $t0, $t0, $t6 #Se agrega el temporal a la suma total 
     
     lw $t7, 4($t4)
     lw $t8, 0($t5)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     sub $t0, $t0, $t6 #Se agrega el temporal a la suma total 
     
     lw $t7, 4($t5)
     lw $t8, 0($t1)
     mul $t6, $t7, $t8 #Producto de la multiplicación se almacena en el temporal
     sub $t0, $t0, $t6 #Se agrega el temporal a la suma total 
     
     abs $t0, $t0
     
     mtc1 $t0, $f0
     cvt.s.w $f0, $f0
     
     la $a1, dos
     l.s $f1, ($a1)
     
     div.s $f0, $f0, $f1
     
     
     # Imprimo textoHI
     li $v0, 4
     la $a0, textoA
     syscall
    
     # Imprimo el area
     li $v0, 2
     mov.s $f12, $f0
     syscall      
            
# Final del programa
    li $v0, 10
    syscall    