TITLE Assembly Programming HW3_3

INCLUDE irvine32.inc 

.data
	andMessage BYTE "1. x AND y", 0
	orMessage BYTE "2. x OR y", 0
	notMessage BYTE "3. NOT x", 0
	xorMessage BYTE "4. x XOR y", 0
	exitMessage BYTE "5. Exit program", 0
	chooseMessage BYTE "Choose Calculation Mode : ",0
	changeMessage BYTE "Do you want to change the mode(Y/N)? : ",0
	enterX BYTE "Enter x : ", 0
	enterY BYTE "Enter y : ", 0
	andRes BYTE "Result of x AND y : ", 0
	orRes BYTE "Result of x OR y : ", 0
	notRes BYTE "Result of NOT x : ", 0
	xorRes BYTE "Result of x XOR y : ", 0
	exitRes BYTE "Bye!", 0
	
	mode DWORD 0
	opX DWORD 0
	opY DWORD 0
	buffer BYTE 2 DUP(0)

.code
main PROC	
	
	mov ecx, 2
	mov ebx, 0


	message:
			mov edx, OFFSET andMessage
			call WriteString
			call crlf

			mov edx, OFFSET orMessage
			call WriteString
			call crlf

			mov edx, OFFSET notMessage
			call WriteString
			call crlf

			mov edx, OFFSET xorMessage
			call WriteString
			call crlf

			mov edx, OFFSET exitMessage
			call WriteString
			call crlf
			call crlf

	L1:
		mov ecx, 2

		lp1:
			inc ecx
			mov edx, OFFSET chooseMessage
			call WriteString
			mov edx, OFFSET mode
			mov ecx, SIZEOF mode
			call ReadHEX
			.IF eax < 6h
				jmp exitlp1
			.ENDIF
				
		loop lp1

		exitlp1:
			call crlf

		mov ebx, eax

		.IF ebx == 5h
			jmp endProg
		.ELSEIF ebx == 1h
			;AND
			jmp inputXY
			ANDCAL:
				mov ebx, eax
				pop eax
				AND eax, ebx
				mov ebx, 1h

				mov edx, OFFSET andRes
				call WriteString
				call writehex
				call crlf
		.ELSEIF ebx == 2h
			;OR
			jmp inputXY
			ORCAL:
				mov ebx, eax
				pop eax
				OR eax, ebx
				mov ebx, 2h

				mov edx, OFFSET orRes
				call WriteString
				call writehex
				call crlf
		.ELSEIF ebx == 3h
			;NOT
			jmp inputXY
			NOTCAL:
				pop eax
				NOT eax
				mov ebx, 3h

				mov edx, OFFSET notRes
				call WriteString
				call writehex
				call crlf
		.ELSEIF ebx == 4h
			;XOR
			jmp inputXY
			XORCAL:
				mov ebx, eax
				pop eax
				XOR eax, ebx
				mov ebx, 4h

				mov edx, OFFSET xorRes
				call WriteString
				call writehex
				call crlf
		.ELSE
			jmp message
		.ENDIF

		call crlf
		mov edx, OFFSET changeMessage
		call WriteString
		
		mov edx, OFFSET buffer
		mov ecx, SIZEOF buffer
		call ReadString

		.IF buffer == 59h
			jmp message
		.ELSEIF buffer == 4Eh
			jmp inputXY
		.ELSE
			jmp endProg
		.ENDIF

	inputXY:
		mov edx, OFFSET enterX
		call WriteString

		mov edx, OFFSET opX
		mov ecx, SIZEOF opX
		call ReadHex
		push eax

		.IF ebx == 3h
			jmp NOTCAL
		.ENDIF

		mov edx, OFFSET enterY
		call WriteString

		mov edx, OFFSET opY
		mov ecx, SIZEOF opY
		call ReadHex
		call crlf

		.IF ebx == 1h
			jmp ANDCAL
		.ELSEIF ebx == 2h
			jmp ORCAL
		.ELSEIF ebx == 3h
			jmp NOTCAL
		.ELSEIF ebx == 4h
			jmp XORCAL
		.ENDIF

	endProg:
		mov edx, OFFSET exitRes
		call WriteString
		main ENDP	

END main