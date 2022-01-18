TITLE Assignment 2

INCLUDE irvine32.inc

.data
INCLUDE hw2.inc
tmp1 DWORD 1
tmp2 DWORD 1

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, fib
	mov edx, 0

	L1:
		sub ecx, 2
	L2:
		add ebx, tmp1
		add ebx, tmp2

		mov eax, ebx

		mov edx, tmp1
		mov tmp2, edx
		mov tmp1, ebx

		mov ebx, 0
	loop L2

	call DumpRegs
main ENDP
END main