.data		#variable declarations
matrixA: 	.word 1,4
		.word 3,4
		.word 5,6
matrixB: 	.word 5,5,7
		.word 8,9,10
sizeA: 		.word 3,2
sizeB: 		.word 2,3
space:		.asciiz  " "    # space to insert between numbers
result: 	.word 0,0,0
		.word 0,0,0
		.word 0,0,0
		.text		#run following instructions	
		la $s0,matrixA  #load address matrixA
		la $s1,matrixB  #load address matrixB
		la $s2,sizeA	#load address sizeA
		la $s3,result	#load address result
		li $s5,3	#initiate counter
loop2:		li $s4,3 	#initiate counter
loop1:		lw $t0,0($s0)	#load value of matrixA
      		lw $t4,0($s1)	#load value of matrixB
		mul $t0,$t0,$t4 #multiply previous values
		sw  $t0, 0($s3) #stores value in results
		addi $s0,$s0,4 #move call to Matrix-A one spot
		addi $s1,$s1,12 #move call to Matrix-B three spots
		lw $t0,0($s0)	#load 2nd value of matrixA
      		lw $t4,0($s1)	#load 2nd value of matrixB	
		mul $t0,$t0,$t4 #multiply previous values
		lw $t4,0($s3)	#load current value
		add $t0,$t0,$t4 #add to current value
		sw  $t0, 0($s3) #stores value in results
		addi $s3, $s3, 4 #begin next part in array
		addi $s0,$s0,-4 #begin matrixA at first value
		addi $s1,$s1,-8 #begin matrixB at second value
		addi $s4, $s4, -1 #decrease counter
		bgtz $s4, loop1 #repeat if not finished yet
		addi $s0,$s0,8 #increase MatrixA call by 2
		addi $s1,$s1,-12 #decrease Matrix-B call to beginning
		addi $s5,$s5,-1 #decrease counter
		bgtz $s5,loop2
		li  $t1,9	#initialize counting variable
		addi $s3,$s3,-36 #reset
print:		lw   $a0, 0($s3) #load number for syscall
      		li   $v0, 1           # specify Print Integer service
      		syscall               # print
      		la   $a0, space       # load address of spacer for syscall
      		li   $v0, 4           # specify Print String service
      		syscall
      		addi $s3,$s3,4
      		addi $t1,$t1,-1
      		bgtz $t1,print
      		li $v0,10
      		syscall