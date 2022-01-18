TITLE Assignment 1

INCLUDE irvine32.inc

.data
INCLUDE hw1.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, SIZEOF array1/4 - 1
	mov edx, 0
	L1:
		mov edx, [array1 + ebx + 4]
		sub edx, [array1 + ebx]
		add eax, edx
		add ebx, 4
	loop L1

	call DumpRegs
main ENDP
END main