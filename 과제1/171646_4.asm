TITLE Assignment 4

INCLUDE irvine32.inc

.data
INCLUDE hw4.inc

.code
main PROC
	mov ecx, SIZEOF target-1
	mov esi, 0

	L1:
		movzx eax, source[esi]
		mov ebx, ecx
		sub ebx, 1
		mov target[ebx], al
		inc esi
	loop L1

	mov ecx, SIZEOF target-1

	mov target[ecx], 0

	mov edx, OFFSET target
	call WriteString
main ENDP
END main