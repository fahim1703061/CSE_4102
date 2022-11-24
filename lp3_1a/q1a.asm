; Equivalent C code:
; int a;
; int b;
; int c;
; int d;
; scan(a);
; scan(b);
; scan(d);
; c = a + b + 100 + d;
; print(c);

;start -1
.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_integer_msg_format byte "Voltage = %d", 0Ah, 0
output_string_msg_format byte "%s", 0Ah, 0
input_integer_format1 byte "%d",0
input_integer_format2 byte "%d",0

output_msg1 byte "Current = ", 0Ah, 0
output_msg2 byte "Resistance = ", 0Ah, 0
output_msg3 byte "Voltage = %d", 0Ah, 0

number sdword ?
v sdword ?
i sdword ?
r sdword ?

.code

main proc
	push ebp
	mov ebp, esp
	sub ebp, 100
	mov ebx, ebp
	add ebx, 4
    
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
	
	INVOKE printf, ADDR output_string_msg_format, ADDR output_msg1
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

;scan_int_value 0
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-12]
	push [ebp-8]
	push [ebp-4]
	push [ebp-0]
	push ebp
	INVOKE scanf, ADDR input_integer_format1, ADDR i
	pop ebp
	pop [ebp-0]
	pop [ebp-4]
	pop [ebp-8]
	pop [ebp-12]
	mov eax, i
	mov dword ptr [ebp-0], eax
	pop edx
	pop ecx
	pop ebx
	pop eax

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
	
	INVOKE printf, ADDR output_string_msg_format, ADDR output_msg2
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

;scan_int_value 1
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-12]
	push [ebp-8]
	push [ebp-4]
	push [ebp-0]
	push ebp
	INVOKE scanf, ADDR input_integer_format2, ADDR r
	pop ebp
	pop [ebp-0]
	pop [ebp-4]
	pop [ebp-8]
	pop [ebp-12]
	mov eax, r
	mov dword ptr [ebp-4], eax
	pop edx
	pop ecx
	pop ebx
	pop eax

;
;ld_var 0 i
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_var 1 r
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;mul -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	mul edx
	mov dword ptr [ebx], eax
	add ebx, 4
    
;store 2
	mov dword ptr [ebp-8], eax
    mov v, eax



;print_msg 2
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
	mov eax, [ebp-8]
	INVOKE printf, ADDR output_integer_msg_format, v
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


