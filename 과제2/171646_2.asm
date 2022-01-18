TITLE Assignment 2

INCLUDE Irvine32.inc

.data
	multiplier BYTE 40 dup(0)
	multiplicand BYTE 40 dup(0)
	tmp BYTE 10 dup(0)
	produce BYTE 10 dup(0)
	A DWORD 0
	B DWORD 0
	byteCount DWORD ?
	sixteen DWORD 16
	str1 BYTE "Enter a Multiplier : ", 0
	str2 BYTE "Enter a Multiplicand : ", 0
	str3 BYTE "Bye!", 0
	str4 BYTE "Produce : ", 0

.code
main PROC
	call Run
main ENDP

Run PROC
	L0:
		mov edx, OFFSET str1
		call WriteString

		mov edx, OFFSET multiplier
		mov ecx, SIZEOF multiplier
		call ReadString

		.IF eax == 0
			Bye:
				mov edx, OFFSET str3
				call WriteString
				call Crlf
				exit
		.ENDIF

		mov esi, 0
		mov ebx, 0
		mov ecx, eax

		;multiplier
		L1:
			shl ebx,4
			movzx edx, multiplier[esi]
			add ebx, edx
			inc esi
			.IF edx < 40h
				sub ebx, 48
			.ELSEIF edx < 47h
				sub ebx, 55
			.ELSEIF edx < 67h
				sub ebx, 87
			.ENDIF
		loop L1

		mov A, ebx

		mov edx, OFFSET str2
		call WriteString

		mov edx, OFFSET multiplicand
		mov ecx, SIZEOF multiplicand
		call ReadString

		mov esi, 0
		mov ebx, 0
		mov ecx, eax

		;multiplicand
		L2:
			shl ebx,4
			movzx edx, multiplicand[esi]
			add ebx, edx
			add esi, 1
			.IF edx < 40h
				add ebx, -48
			.ELSEIF edx < 47h
				add ebx, -55
			.ELSEIF edx < 67h
				add ebx, -87
			.ENDIF
		loop L2

		mov B, ebx

		mov eax, A
		mul B

		mov edx, OFFSET str4
		call WriteString

		mov ecx, 8
		mov edx, 0
		mov esi, 0

		L3:
			div sixteen

			.IF edx < 10
				add edx, 48
			.ELSEIF edx < 16
				add edx, 55
			.ENDIF

			;call dumpregs

			mov tmp[esi], dl
			mov edx, 0
			add esi, 1
		loop L3

		mov ecx, 8
		mov esi, 0

		L4:
			mov al, tmp[ecx-1]
			mov produce[esi], al
			add esi, 1
		loop L4

		mov produce[8], 10

		mov edx, OFFSET produce
		call WriteString

		jmp L0

	Run ENDP

END main