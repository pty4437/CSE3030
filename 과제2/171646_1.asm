TITLE Assignment 1

INCLUDE irvine32.inc

.data
var1 BYTE "5441", 0
arr BYTE 10 DUP(0)
seven DWORD 7
sixteen DWORD 16
tmp DWORD 0
res DWORD 0h
ten DWORD 10

.code
main PROC
	mov esi, 0
	
	mov ebx, 0
	mov edx, 0
	mov ecx, LENGTHOF var1 - 1
	;dec ecx

	L1:
		movzx ebx, var1[esi]
		sub ebx, '0'

		.IF ebx != 0
			mov eax, ebx
			push ecx
			dec ecx

			.IF ecx != 0
				L2:
					mul seven
				loop L2
			.ENDIF

			pop ecx
			add tmp, eax
		.ENDIF

		inc esi
	loop L1

	mov edx, tmp

	.IF edx < 10
		mov eax, edx
		call dumpregs
		jmp last
	.ENDIF


	mov ecx, 2
	mov ebx, edx
	mov edx, 0
	mov eax, ebx
	mov ebx, 0

	;call dumpregs

	L4:
		inc ecx
		.IF eax < 1
			jmp O
		.ENDIF

		div ten
		inc ebx
		;call dumpregs
		push edx
		mov edx, 0
	loop L4

	O:
		mov ecx, ebx
		mov eax, 0
		;inc ecx
		;call dumpregs
		jmp L3


	;inc ecx
	L3:
		;call dumpregs
		shl eax, 4
		pop edx
		add eax, edx
	loop L3
		
	call dumpregs

	last:

main ENDP
END main