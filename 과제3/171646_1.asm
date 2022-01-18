TITLE Assembly Programming HW5_1


INCLUDE irvine32.inc  

.data
	INCLUDE hw3.inc
	bMessage BYTE "Before sort : ", 0
	aMessage BYTE "After sort : ", 0
	byee BYTE "Bye!", 0
	oddLen DWORD 0
	evenLen DWORD 0

.code
main PROC	

	mov eax, LenData
	shr eax, 1
	mov oddLen, eax

	mov eax, LenData
	sub eax, 1
	shr eax, 1
	mov evenLen, eax
	.IF eax == oddLen
		dec evenLen
	.ELSE
		inc evenLen
	.ENDIF

	mov edx, OFFSET bMessage
	call WriteString

	mov ecx, LenData		
	mov edx, OFFSET ArrData

	;print
	L1:	
		mov eax, [edx]			
		call WriteHex
		add edx, 4

		.IF ecx != 1
			mov al, ","
			call Writechar
		.ENDIF

	loop L1

	call Crlf			
	
	mov edx, OFFSET aMessage
	call WriteString

	mov edx, OFFSET ArrData
	mov ecx, LenData
	mov esi, 0

	;odd number sort
	L2:
		.IF esi >= oddLen
			jmp exL2
		.ENDIF

		mov eax, [edx + esi * 8]
		mov ax, 0
		inc esi
		mov ebx, [edx + esi*8]
		mov bx, 0

		.IF eax > ebx
			dec esi
			mov eax, [edx+esi*8]
			inc esi
			mov ebx, [edx+esi*8]

			mov [edx+esi*8], eax
			dec esi
			mov [edx+esi*8], ebx
			mov esi, 0
			add ecx, 1
		.ENDIF
		
		.IF eax == ebx
			dec esi
			mov eax, [edx+esi*8]
			inc esi
			mov ebx, [edx+esi*8]

			.IF ax < bx
				mov [edx+esi*8], eax
				dec esi
				mov [edx+esi*8], ebx
				mov esi, 0
				add ecx, 1
			.ENDIF
		.ENDIF

	loop L2

	exL2 :
		mov edx, OFFSET ArrData
		mov ecx, LenData
		add edx, 4
		mov esi, 0

	;even number sort
	L3:
		.IF esi >= evenLen
			jmp exL3
		.ENDIF

		mov eax, [edx + esi * 8]
		mov ax, 0
		inc esi
		mov ebx, [edx + esi*8]
		mov bx, 0

		.IF eax < ebx
			dec esi
			mov eax, [edx+esi*8]
			inc esi
			mov ebx, [edx+esi*8]

			mov [edx+esi*8], eax
			dec esi
			mov [edx+esi*8], ebx
			mov esi, 0
			add ecx, 1
		.ENDIF
		
		.IF eax == ebx
			dec esi
			mov eax, [edx+esi*8]
			inc esi
			mov ebx, [edx+esi*8]

			.IF ax > bx
				mov [edx+esi*8], eax
				dec esi
				mov [edx+esi*8], ebx
				mov esi, 0
				add ecx, 1
			.ENDIF
		.ENDIF

	loop L3

	exL3:
		mov ecx, LenData		
		mov edx, OFFSET ArrData

	L4:	
		mov eax, [edx]			
		call WriteHex
		add edx, 4

		.IF ecx != 1
			mov al, ","
			call Writechar
		.ENDIF
	loop L4

	call crlf
	mov edx, OFFSET byee
	call WriteString

main ENDP	

END main