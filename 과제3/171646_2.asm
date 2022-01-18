INCLUDE irvine32.inc  


.data
target BYTE "AAEBDCFBBC",0 
freqTable DWORD 256 DUP(0) 
array DWORD 128 DUP(?)
arraySize DWORD 128
tmp DWORD 0

.code
	Get_frequencies PROTO, tar:PTR BYTE, freq:PTR DWORD

Get_frequencies PROC, tar:PTR BYTE, freq:PTR DWORD	
	mov ecx, 2
	mov esi, tar
	mov edx, freq
	mov eax, 0
	mov ebx, 0
	
	L1:
		mov al, [esi]
		
		.IF al == 0
			ret
		.ENDIF

		mov edi, eax
		mov ebx, [edx + edi*4];
		inc ebx
		mov [edx + edi*4], ebx
		inc esi
		inc ecx
	loop L1
Get_frequencies ENDP

main PROC	

	INVOKE Get_frequencies, ADDR target, ADDR freqTable

	mov esi, OFFSET freqTable	
	add esi, 192
	mov ecx, 10

	L1:
		mov eax, [esi]
		call WriteInt
		call Crlf
		add esi, 4
	loop L1

	call Crlf

	mov esi, OFFSET freqTable	
	add esi, 260
	mov ecx, 26

	L2:
		mov eax, [esi]
		call WriteInt
		call Crlf
		add esi, 4
	loop L2

	call Crlf

	mov esi, OFFSET freqTable	
	add esi, 388
	mov ecx, 26

	L3:
		mov eax, [esi]
		call WriteInt
		call Crlf
		add esi, 4
	loop L3

	call Crlf


main ENDP	
END main