[org 0x0100]
jmp start
message1 : db 'SCORE'
length1 : dw 5
message2 : db 'HIGH SCORE'
length2 : dw 10
top1 : dw 2
left1 : dw 1
bottom1 : dw 21
right1 : dw 55


clrscr: 
	push es
	push ax
	push di
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov di, 0 ; point di to top left column
	nextloc: mov word [es:di], 0x7720 ; clear next char on screen
	add di, 2 ; move to next screen location
	cmp di, 3680 ; has the whole screen cleared
	jne nextloc ; if no clear next position
	pop di
	pop ax
	pop es
	ret

background: 

   ; ;;;;;;;;; print edges
   
    push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte[top1]           ; multiply with y position
	add ax, [left1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	mov ah,0x70
	mov al,218
	mov [es:di], ax
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte[bottom1]           ; multiply with y position
	add ax, [right1]               ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	mov ah,0x70
	mov al,217
	mov [es:di], ax
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte[bottom1]           ; multiply with y position
	add ax, [left1]               ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	mov ah,0x70
	mov al,192
	mov [es:di], ax
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte[top1]           ; multiply with y position
	add ax, [right1]               ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	mov ah,0x70
	mov al,191
	mov [es:di], ax
	
	
   
   ;;;;;horizontal linesss;;;;;;
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte [top1]           ; multiply with y position
	add ax, [left1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	add di,2                          
	mov al, 80                 ; load al with columns per row
	mul byte [top1]           ; multiply with y position
	add ax, [right1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov cx, ax                 ; load length of string in cx
	mov ah, 0x70             ; load attribute in ah
	mov al,196
	mov [es:di], ax
	nextshp: 
	mov al,196                 ; load next char of string
	mov [es:di], ax            ; show this char on screen
	add di, 2				  
	cmp di,cx              ; repeat the operation cx times
	jne nextshp 
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte [bottom1]           ; multiply with y position
	add ax, [left1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	add di,2                          
	mov al, 80                 ; load al with columns per row
	mul byte [bottom1]           ; multiply with y position
	add ax, [right1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov cx, ax  
	mov ah, 0x70             ; load attribute in ah
	mov al,196
	mov [es:di], ax
	nextshp1: 
	mov al,196                 ; load next char of string
	mov [es:di], ax            ; show this char on screen
	add di, 2				  
	cmp di,cx              ; repeat the operation cx times
	jne nextshp1 
	
		
	;;;;print vertical linessss;;;;;;;;;;;;
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte [top1]           ; multiply with y position
	add ax, [left1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	add di,160
	;add di,160                           ; point si to string
	mov al, 80                 ; load al with columns per row
	mul byte [bottom1]           ; multiply with y position
	add ax, [left1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov cx, ax                 ; load length of string in cx
	
	mov ah, 0x70             ; load attribute in ah
	mov al,179
	nexchar:
	mov al,179     ; load next char of string
	mov [es:di], ax            ; show this char on screen
	add di, 160

	cmp di,cx              ; repeat the operation cx times
	jne nexchar
	
	
	mov ax, 0xb800
	mov es, ax                 ; point es to video base
	mov al, 80                 ; load al with columns per row
	mul byte [top1]           ; multiply with y position
	add ax, [right1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax                  ; point di to required location
	add di,160
	;add di,160                           ; point si to string
	mov al, 80                 ; load al with columns per row
	mul byte [bottom1]           ; multiply with y position
	add ax, [right1]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov cx, ax                 ; load length of string in cx
	;sub cx,160
	;mov si,[bp+14]
	mov ah, 0x70             ; load attribute in ah
	mov al,179
	nexchar2:
	mov al,179     ; load next char of string
	mov [es:di], ax            ; show this char on screen
	add di, 160

	cmp di,cx              ; repeat the operation cx times
	jne nexchar2
	
	;;;;;;print score n high score ;;;;;;;;;
	
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov cl,3
	mov al, 80 ; load al with columns per row
	mul cl ; multiply with y position
	add ax, 73 ; add x position
	shl ax, 1 ; turn into byte offset
	mov di,ax ; point di to required location
	mov si, message1 ; point si to string
	mov cx, [length1] ; load length of string in cx
	mov ah, 0x70 ; load attribute in ah
	nextch: mov al, [si] ; load next char of string
	mov [es:di], ax ; show this char on screen
	add di, 2 ; move to next screen location
	add si, 1 ; move to next char in string
	loop nextch ; repeat the operation cx times
	
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov cl,5
	mov al, 80 ; load al with columns per row
	mul cl ; multiply with y position
	add ax, 68 ; add x position
	shl ax, 1 ; turn into byte offset
	mov di,ax ; point di to required location
	mov si, message2 ; point si to string
	mov cx, [length2] ; load length of string in cx
	mov ah, 0x70 ; load attribute in ah
	nextch2: mov al, [si] ; load next char of string
	mov [es:di], ax ; show this char on screen
	add di, 2 ; move to next screen location
	add si, 1 ; move to next char in string
	loop nextch2 ; repeat the operation cx times
	
	
	
	
	
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 


printscore: 
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx
	push di
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov cl,4
	mov al, 80 ; load al with columns per row
	mul cl ; multiply with y position
	add ax, 74 ; add x position
	shl ax, 1 ; turn into byte offset
	mov di,ax
	mov ax, [bp+4] ; load number in ax
	mov bx, 10 ; use base 10 for division
	mov cx, 0 ; initialize count of digits
	nextdigit: mov dx, 0 ; zero upper half of dividend
	div bx ; divide by 10
	add dl, 0x30 ; convert digit into ascii value
	push dx ; save ascii value on stack
	inc cx ; increment count of values
	cmp ax, 0 ; is the quotient zero
	jnz nextdigit ; if no divide it again

	nextpos: pop dx ; remove a digit from the stack
	mov dh, 0x70 ; use normal attribute
	mov [es:di], dx ; print char on screen
	add di, 2 ; move to next screen location
	loop nextpos ; repeat for all digits on stack
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 1
	
	
	
	
printhiscore: 
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx
	push di
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov cl,6
	mov al, 80 ; load al with columns per row
	mul cl ; multiply with y position
	add ax, 74 ; add x position
	shl ax, 1 ; turn into byte offset
	mov di,ax
	mov ax, [bp+4] ; load number in ax
	mov bx, 10 ; use base 10 for division
	mov cx, 0 ; initialize count of digits
	nextdigit1: mov dx, 0 ; zero upper half of dividend
	div bx ; divide by 10
	add dl, 0x30 ; convert digit into ascii value
	push dx ; save ascii value on stack
	inc cx ; increment count of values
	cmp ax, 0 ; is the quotient zero
	jnz nextdigit1 ; if no divide it again

	nextpos1: pop dx ; remove a digit from the stack
	mov dh, 0x70 ; use normal attribute
	mov [es:di], dx ; print char on screen
	add di, 2 ; move to next screen location
	loop nextpos1 ; repeat for all digits on stack
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 1
	
	
	
printblock
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov al, 80                 ; load al with columns per row
	mul byte [bp+6]           ; multiply with y position
	add ax, [bp+8]            ; add x position
	shl ax, 1                  ; turn into byte offset
	mov di,ax
	mov cx,di 
	mov ah,[bp+4]
	nextblock:
	mov al,[bp+10]
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 


	mov di,cx
	add di,320
	mov [es:di], ax 
	mov di,cx
	add di,322
	mov [es:di], ax 
	mov di,cx
	add di,316
	mov [es:di], ax 
	mov di,cx
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,326
	mov [es:di], ax 
	mov di,cx
	add di,328
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 10


delay:
       push cx
       mov cx,0xffff
loop1: loop loop1
       mov cx,0xffff
loop2: loop loop2
       pop cx
       ret	
	
start:

	
	
	
	mov cx,4
l1:
    call clrscr
	call background 

	mov ax, 69
	push ax
	call printscore 

	
	mov ax, 69
	push ax
	call printhiscore 


call delay
mov ax,219   
push ax
mov ax,10
push ax
mov ax,cx
push ax
mov ax,0x00
push ax
call printblock
call delay
inc cx
cmp cx,19
jne l1

	
	

	
	


	

	mov ax, 0x4c00 ; terminate program
	int 0x21