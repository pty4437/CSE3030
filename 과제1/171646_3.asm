TITLE Assignment 3

INCLUDE irvine32.inc

.data
INCLUDE hw3.inc
tmp DWORD 1

.code
main PROC
	mov eax, 0
	mov ebx, 0

	mov ecx, X
	mov tmp, ecx

	mov ecx, Y
	sub ecx, 1

	L1:
		mov eax, 0
		mov edx, ecx
		mov ecx, X

		M1:
			add eax, tmp
		loop M1

		mov tmp, eax
		mov ecx, edx
	loop L1


	mov ecx, Y
	mov tmp, ecx
	
	mov ecx, X
	sub ecx, 1

	L2:
		mov ebx, 0
		mov edx, ecx
		mov ecx, Y

		M2:
			add ebx, tmp
		loop M2

		mov tmp, ebx
		mov ecx, edx
	loop L2

	call DumpRegs
main ENDP
END main