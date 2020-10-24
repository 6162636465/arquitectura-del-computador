.data
p1 .float 2,0 # que define (x1, y1)
p2 .float 4,5 # que define (x2, y2)
p3 .float 20,10 # que define (x3, y3)
p4 .float 10,3 # que define (x4, y4)
p5 .float 5,2  # que define (x5, y

.text # aqui comienzan a definirse las instrucciones
.globl __start

__start: 

li $v0,10

syscall # servicio de finalizar programa


.data
