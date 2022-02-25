.data 
row: .word 3
column: .word 5
matrix: .word 4,4,4,4,4,5,5,5,5,5,6,6,6,6,6
.eqv DATA_SIZE 4
newline: .asciiz "\n"
space: .asciiz " "
txt: .asciiz "Transpose of the matrix:"

.text
main:
la $t5,matrix
lw $t1,row
lw $t2,column
li $t0,0 #i
la $t7,newline

jal print

li $v0,4
la $a3,txt
syscall

jal print.1


li $v0,10
syscall

print:
      li $t4,0 #j


      while1:
             blt $t0,$t1,while2

             jr $ra

             while2:
                   blt $t4,$t2,L1

                   j L2

                   L1:
                   mul $t3,$t0,$t2
                   add $t3,$t3,$t4
                   mul $t3,$t3,DATA_SIZE
                   add $t3,$t3,$t5
                   lw $t6,($t3)

                   #print the value
                   li,$v0,1
                   move $a0,$t6
                   syscall

                   la $a0, space
                   addi $v0, $0, 4
                   syscall


                   addi $t4,$t4,1

                   j while2

                   L2:
                      addi $t0,$t0,1

                      la $a0, newline
                      addi   $v0, $0, 4
                      syscall

                      addi $t4,$zero,0


                      j print
                      
                      
                      
      print.1:
      li $t0,0 #j


      while1.1:
             blt $t4,$t2,while2.2

             jr $ra

             while2.2:
                   blt $t0,$t1,L1.1

                   j L2.2

                   L1.1:
                   mul $t3,$t0,$t2
                   add $t3,$t3,$t4
                   mul $t3,$t3,DATA_SIZE
                   add $t3,$t3,$t5
                   lw $t6,($t3)

                   #print the value
                   li,$v0,1
                   move $a0,$t6
                   syscall

                   la $a0, space
                   addi $v0, $0, 4
                   syscall


                   addi $t0,$t0,1

                   j while2.2

                   L2.2:
                      addi $t4,$t4,1

                      la $a0, newline
                      addi   $v0, $0, 4
                      syscall

                      addi $t0,$zero,0


                      j print.1
