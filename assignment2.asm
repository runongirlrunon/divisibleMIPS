# Lindsey Hogg
# CSC256-01
# Assignment 2
# 2.18.16

# x = $s0
# y = $s1
	.data
p1:	.asciiz "Enter the first number: "
p2:	.asciiz "Enter the second number: "
yesdiv:	.asciiz "Yes, the first number is divisible by the second number."
nodiv:	.asciiz "No, the first number is not divisible by the second number."

	.text
main:	li	$s0,0		# x = 0
	li	$s1,0		# y = 0
	
	li	$v0,4		# cout << "Enter the first..." 
	la	$a0,p1		#
	syscall			#
	
	li	$v0,5		# cin >> x
	syscall			#
	move	$s0,$v0		#
	
	li	$v0,4		# cout << "Enter the second..." 
	la	$a0,p2		#
	syscall			#
	
	li	$v0,5		# cin >> y
	syscall			#
	move	$s1,$v0		#
	
	abs	$s0,$s0		# this is to make sure both x & y are positive.
	abs	$s1,$s1		# because math.
	
test:	beqz	$s0,yes		# if (x == 0), jump to YES
	beq	$s0,$s1,yes	# else if (x == y), jump to YES
	blt	$s0,$0,no	# else if (x < 0), jump to NO
	sub	$s0,$s0,$s1	# else, x = x-y
	j	test

yes:	li	$v0,4		# cout << "Yes..."
	la	$a0,yesdiv	#
	syscall			#
	j	exit		#

no:	li	$v0,4		# cout << "No..."
	la	$a0,nodiv	#
	syscall			#

exit:	li	$v0,10		# end program
	syscall			#
	