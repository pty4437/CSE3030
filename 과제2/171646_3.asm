TITLE Assignment 3

INCLUDE Irvine32.inc

.data
	string BYTE 40 dup(0)
	search BYTE 40 dup(0)
	changed BYTE 40 dup(0)
	strSize DWORD 0
	searSize DWORD 0
	byteCount DWORD ?
	sixteen DWORD 16
	str1 BYTE "Type_A_String: ", 0
	str2 BYTE "A_Word_for_Search: ", 0
	str3 BYTE "Bye!", 0
	str4 BYTE "Found", 0
	str5 BYTE "Not found", 0
	str6 BYTE "Changed: ", 0
	abc BYTE "\n", 0
	idx DWORD 0
	flag BYTE 0

.code
main PROC
		L0:
			mov edx, OFFSET str1
			call WriteString

			mov edx, OFFSET string
			mov ecx, SIZEOF string
			call ReadString

			mov strSize, eax

			.IF strSize < 1
				mov edx, OFFSET str3
				call WriteString
				jmp E
			.ENDIF

			mov edx, OFFSET str2
			call WriteString

			mov edx, OFFSET search
			mov ecx, SIZEOF search
			call ReadString

			mov searSize, eax
		
			mov ecx, strSize
			inc ecx

			mov esi, 0
			mov edi, 0
			mov ebx, 0
			mov eax, 0

			L1:
				mov al, string[esi]
				mov ebx, eax
				sub al, search[edi]

				.IF edi == searSIZE
					.IF string[esi] == ' ' || string[esi] == 0
						L2:
							push ebx
							inc esi
							mov bl, string[esi]
						loop L2
						jmp F
					.ELSE
						push ebx
						inc esi
					.ENDIF
				.ENDIF

				.IF al == 0
					.IF edi == 0
						.IF string[esi-1] == ' ' || esi == 0
							inc edi
							mov idx, edi
						.ELSE
							push ebx
						.ENDIF
					.ELSE
						inc edi
						mov idx, edi
					.ENDIF
				.ELSE
					push ebx
					mov edi, 0
				.ENDIF

				inc esi		
			loop L1

			jmp NF

			mov ebx, 0ah

			F:
				mov edx, OFFSET str4
				call WriteString
				call Crlf

				mov eax, strSize
				sub eax, searSize
				mov ecx, eax
				mov esi, ecx
				inc ecx

				L4:
					pop ebx
					mov search[esi], bl
					dec esi
				loop L4

				mov edx, OFFSET str6
				call WriteString

				mov edx, OFFSET search
				call WriteString
				call Crlf
				jmp L0
			NF:
				mov edx, OFFSET str5
				call WriteString
				call Crlf

				mov edx, OFFSET str6
				call WriteString

				mov edx, OFFSET string
				call WriteString
				call Crlf

				jmp L0

		jmp L0

		E:
	main ENDP
END main
