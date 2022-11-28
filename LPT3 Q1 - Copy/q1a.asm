
.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_integer_msg_format byte "%d", 0Ah, 0
output_string_msg_format byte "%s", 0Ah, 0
input_integer_format1 byte "%d",0
input_integer_format2 byte "%d",0

output_msg1 byte "Current = ", 0Ah, 0
output_msg2 byte "Resistance = ", 0Ah, 0
output_msg3 byte "Voltage = %d", 0Ah, 0

number sdword ?
M sdword ?
N sdword ?
O sdword ?

.code

main proc
	push ebp
	mov ebp, esp
	sub ebp, 100
	mov ebx, ebp
	add ebx, 4
    
	mov eax, 100
	mov ecx,30
	mov edx, 50
	sub eax,ecx
	add eax,edx
	mov O,eax
	mov eax,ecx

	cmp eax, 0   ;if cond
    jle END_IF_

	; print_int_value 2
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-12]
	push [ebp-8]
	push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push ebp
	
	INVOKE printf, ADDR output_integer_msg_format, O
	pop ebp
	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]
	pop [ebp-8]
	pop [ebp-12]
	pop edx
	pop ecx
	pop ebx
	pop eax

END_IF_:


;


;-----------------------for loop------------------

; 	mov eax, 7      ;initialize
; FOR_:
;     cmp eax, 10     ;cond
;     jge END_FOR_

;     cmp eax, 5
;     jne ELSE_IF_
;     inc ecx
;     jmp END_IF_
; ELSE_IF_:
;     cmp eax, 7
;     jg ELSE_
;     mov ecx, eax
;     inc eax
;     jmp END_IF_
; ELSE_:
 
;     mov ecx, eax
;     dec eax
; END_IF_:
;     inc eax
;     jmp FOR_
; END_FOR_:      ;endfor

;-----------------------if elseif else------------------
	
; 	cmp eax, 5   ;if cond
;     jne ELSE_IF_
;     inc ecx
;     jmp END_IF_
; ELSE_IF_:
;     cmp eax, 7   ;elif cond
;     jg ELSE_
;     mov ecx, eax
;     inc eax
;     jmp END_IF_
; ELSE_:                 ;else
 
;     mov ecx, eax
;     dec eax
; END_IF_:

;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret
main endp
end


