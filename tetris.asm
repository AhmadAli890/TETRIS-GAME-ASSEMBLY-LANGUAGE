[org 0x0100]
jmp start
data1 : db 'WELCOME TO GAME ',0
data2 : db 'BY HASSAN AND TAYYAB',0
data3 : db 'THANK YOU FOR PLAYING ',0
data4 : db 'GOOD BYE',0
data5 : db 'GAME ENDED'
datalen5 : dw 10
message1 : db 'SCORE'
length1 : dw 5
message69 : db 'YOUR SCORE IS '
length69 : dw 14
message2 : db 'HIGH SCORE'
length2 : dw 10
message3 : db 'Time'
length3 : dw 4
message4 : db 'Next Shape'
length4 : dw 10
top1 : dw 1
left1 : dw 3
bottom1 : dw 23
right1 : dw 56
lenran:dw 70
lenran1:dw 0
random:dw 3,2,1,1,2,3,4,5,3,2,1,2,3,4,4,3,2,2,1,2,3,4,3,2,1,2,3,4,2,2,3,4,1,1,2,3,4,5,4,3,2,1,2,3,4,2,4,2,3,4,1,2,3,4,5,5,4,3,2,1,2,3,4,5,6,4,3,2,1,2,3,4,5,4,3,2,1,2,3,2,3,4,5,1,2,3,3,4,5,5,4,3,2,1
calscore:dw 0
tickcount: dw 00
ticksec: dw 0
tickmin: dw 0
old: dd 0
;endt:dd 0

displaymessage: db 'Press Any Key To CONTINUE'
displaylen: dw 25


clrscr: 
	push es
	push ax
	push cx
	push di
	mov ax, 0xb800
	mov es, ax 
	xor di, di 
	mov ax, 0x0720
	mov cx, 2000 
	cld 
	rep stosw 
	pop di
	pop cx
	pop ax
	pop es
	ret

clrspecial: 

	push es
	push ax
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di, 0 
nextlocsp: 
	cmp di,628
	je skip69
	cmp di,630
	je skip69
	cmp di,632
	je skip69
	
	mov word [es:di], 0x7720 
skip69:	
	add di, 2 
	cmp di, 4000 
	jne nextlocsp 
	pop di
	pop ax
	pop es
	ret


clrscr1: 
	push es
	push ax
	push di
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov di, 0 ; point di to top left column
	nextloc: 
	mov word [es:di], 0x7720 ; clear next char on screen
	add di, 2 ; move to next screen location
	cmp di, 4000 ; has the whole screen cleared
	jne nextloc ; if no clear next position
	pop di
	pop ax
	pop es
	ret

clrscr3: 
	push es
	push ax
	push di
	mov ax, 0xb800
	mov es, ax ; point es to video base
	mov di, 0 ; point di to top left column
	nextloc3: 
	mov word [es:di], 0x7720 ; clear next char on screen
	add di, 2 ; move to next screen location
	cmp di, 3680 ; has the whole screen cleared
	jne nextloc3 ; if no clear next position
	pop di
	pop ax
	pop es
	ret
	
	clrscr4: 
 push es
 push ax
 push di 
 mov ax, 0xb800
 mov es, ax                        
 mov di, 1592                        
 
 mov word [es:di], 0x0720         
                       
 pop di
 pop ax
 pop es
 ret

delay2 :

push cx
mov cx,0xffff

lp1: loop lp1
     mov cx,0xffff 
lp2: loop lp2
     mov cx,0xffff
lp3: loop lp3  
	mov cx,0xffff
lp4: loop lp4  
	mov cx,0xffff
lp5: loop lp5
mov cx,0xffff
lp6: loop lp6    

pop cx       

ret

delay1 :

push cx
mov cx,0xffff

lp7: loop lp1
     mov cx,0xffff 
lp8: loop lp2
     mov cx,0xffff
lp9: loop lp3  
	mov cx,0xffff
  

pop cx       

ret

printnum2:
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
mov ax,[bp+4]
mov bx,10
mov cx,0
nextdigit68:
mov dx,0
div bx
add dl,0x30
push dx
inc cx
cmp ax,0
jnz nextdigit68

push ax
push bx
push dx
mov ax,[bp+6]
mov bx,10
mov dx,0
div bx
add dl,0x30
mov dh,0x07
mov di,[bp+8]
mov [es:di],dx
mov dl,0x3A
add di,2
mov [es:di],dx
pop dx
pop bx
pop ax

add di,4

nextpos68:
pop dx
mov dh,0x07
mov [es:di],dx
add di,2
loop nextpos68
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 6

end699:
 jmp end5


timer:
push di 
push ax 

inc word [cs:tickcount]; increment tick count
;push word [cs:tickcount]

cmp word[cs:tickcount],18
jb normal
inc word [cs:ticksec]
mov word [cs:tickcount],0
cmp word [cs:ticksec],60
jb normal
mov word [cs:ticksec],0
inc word[cs:tickmin]
cmp word[cs:tickmin],5
je end699
call clrscr4
normal:
mov di,1584
push di
push word[cs:tickmin]
push word[cs:ticksec]
call printnum2
 mov al, 0x20
 out 0x20, al ; end of interrupt
 pop ax
 pop di

jmp far [cs:old] ; return from interrupt



	startscreen:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push bx
	push dx
	push si
	push di
	call delay69
	call delay69


	call delay69
	call delay69
	mov ax, 0xb800
	mov es, ax 
	;mov al, 80                 ; load al with columns per row
	;mul byte 6           ; multiply with y position
	;add ax, 10            ; add x position
	;shl ax, 1                  ; turn into byte offset
	mov di,980
	mov cx,di 
	mov ah,68
	
	mov al,0x00
	mov [es:di], ax 
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	mov cx,di
	add di,2
	mov [es:di], ax
	mov dx,di
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax	
	add di,2
	mov [es:di], ax	
	mov di,cx
	add di,160
	mov [es:di], ax
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	

	mov di,dx
	add di,160
	mov [es:di], ax
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax
	
	call delay69
	call delay69

	mov ax, 0xb800
	mov es, ax 

	mov di,1008
	mov cx,di 
	mov ah,34

	mov al,0x00
	mov [es:di], ax 
	mov bx,di
	add di,2
	;mov bx,di      ;first part
	mov [es:di], ax
	add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	mov cx,di
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax

	mov di,bx
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax

	mov dx,di
	mov di,bx
	add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
	mov di,cx
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax


	mov di,dx	
	add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax


	call delay69
	call delay69
	mov ax, 0xb800
	mov es, ax 
	;mov al, 80                 ; load al with columns per row
	;mul byte 6           ; multiply with y position
	;add ax, 10            ; add x position
	;shl ax, 1                  ; turn into byte offset
	mov di,1026
	mov cx,di 
	mov ah,102
	
	mov al,0x00
	mov [es:di], ax 
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	mov cx,di
	add di,2
	mov [es:di], ax
	mov dx,di
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax
	add di,2
	mov [es:di], ax	
	add di,2
	mov [es:di], ax	
	mov di,cx
	add di,160
	mov [es:di], ax
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	

	mov di,dx
	add di,160
	mov [es:di], ax
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
	
	call delay69
	call delay69
	
		mov ax, 0xb800
	mov es, ax 

	mov di,1056
	mov cx,di 
	mov ah,17

	mov al,0x00
	mov [es:di], ax 
	mov bx,di
	add di,2
	;mov bx,di      ;first part
	mov [es:di], ax	
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	mov cx,di
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax

	mov di,bx
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax

	mov di,bx
	add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
	mov bx,di
	mov di,cx
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
	mov di,bx
			add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	add di,160
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		mov di,bx
		sub di,2
			add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	add di,160
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	
	call delay69
	call delay69
	
		mov ax, 0xb800
	mov es, ax 

	mov di,1074
	mov cx,di 
	mov ah,51

	mov al,0x00
	mov [es:di], ax 
	mov bx,di
	add di,2
	;mov bx,di      ;first part
	mov [es:di], ax	
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	mov cx,di
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax

	mov di,bx
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	
	call delay69
	call delay69
		mov ax, 0xb800
	mov es, ax 

	mov di,1084
	mov cx,di 
	mov ah,85

	mov al,0x00
	mov [es:di], ax 
	mov bx,di
	add di,2
	;mov bx,di      ;first part
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	mov cx,di
	mov di,bx
	;sub di,2
	add di,160
	mov [es:di], ax	
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax	
	
	mov di,bx
	add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
	mov di,cx
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		add di,2
	mov [es:di], ax
		mov bx,di
	;add di,2
	;mov bx,di      ;first part
	mov [es:di], ax	
	add di,160
	mov [es:di], ax	
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax
	mov cx,di
	mov dx,di
	mov di,bx
	sub di,2
	add di,160
	mov [es:di], ax	
		add di,160
	mov [es:di], ax
		add di,160
	mov [es:di], ax	
		mov di,dx
	sub di,2
	mov [es:di], ax
		sub di,2
	mov [es:di], ax
		sub di,2
	mov [es:di], ax
		sub di,2
	mov [es:di], ax
		sub di,2
	mov [es:di], ax
		sub di,2
	mov [es:di], ax
	
	call delay69
	
		mov ax, 0xb800
	mov es, ax 

	mov di,330
	mov cx,di 
	mov ah,204
	;nextblock31:
	mov al,0x00
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
	
		mov ax, 0xb800
	mov es, ax 

	mov di,468
	mov cx,di 
	mov ah,170

	mov al,0x00
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax
	mov di,cx
	add di,646
	mov [es:di], ax
	mov di,cx
	add di,648
	mov [es:di], ax
	
		mov ax, 0xb800
	mov es, ax 

	mov di,3050
	mov cx,di 
	mov ah,238

	mov al,0x00
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
	add di,636
	mov [es:di], ax
	mov di,cx
	add di,634
	mov [es:di], ax
	mov di,cx
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,316
	mov [es:di], ax
		mov ax, 0xb800
	mov es, ax 

	mov di,3500
	mov cx,di 
	mov ah,85

	mov al,0x00
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	mov di,cx
	sub di,4
	mov [es:di], ax
	mov di,cx
	sub di,6
	mov [es:di], ax
	mov di,cx
	add di,320
	mov [es:di], ax 
	mov di,cx
	add di,322
	mov [es:di], ax 
	
	 mov ax, 0xb800
 mov es, ax                        

mov di,2456                       
 mov si, displaymessage                    
 mov cx, [displaylen] 
 mov ah,240 
                    
batatu:
 mov al, [si]                      
 mov [es:di], ax                   
 add di, 2
 add si, 1                         
 loop batatu 

	pop di
	pop si
	pop dx
	pop bx
	pop cx
	pop ax
	pop es
	pop bp
	ret 

	delay69 :

push cx
mov cx,0xffff

lp69: loop lp69
     mov cx,0xffff 
lp70: loop lp70
     mov cx,0xffff
lp71: loop lp71  

pop cx       

ret

delay:
       push cx
       mov cx,0xffff
loop1: loop loop1
       mov cx,0x0100
loop2: loop loop2
       pop cx
       ret	
	
	
	   





startscr:

	push bp
	mov bp,sp
	push es
	push ax
	push cx
	push si
	push di

	push ds
	pop es

	mov di,data1
	mov cx,0xffff
	xor al,al
	repne scasb
	mov ax,0xffff
	sub ax,cx
	dec ax

	mov cx,ax
	mov ax,0xb800
	mov es,ax
	mov bl,6
	mov al,80
	mul bl
	add ax,24
	shl ax,1
	mov di,ax
	mov ah,112
	mov si,data1

	cld 
	nextchar : lodsb
	stosw
	call delay1
	loop nextchar

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp

	push bp
	mov bp,sp
	push es
	push ax
	push cx
	push si
	push di

	push ds
	pop es

	mov di,data2
	mov cx,0xffff
	xor al,al
	repne scasb
	mov ax,0xffff
	sub ax,cx
	dec ax

	mov cx,ax
	mov ax,0xb800
	mov es,ax
	mov bl,8
	mov al,80
	mul bl
	add ax,24
	shl ax,1
	mov di,ax
	mov ah,112
	mov si,data2

	cld 
	nextchar2 : lodsb
	stosw
	call delay1
	loop nextchar2

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp

	ret 



endscr:

	push bp
	mov bp,sp
	push es
	push ax
	push cx
	push si
	push di

	push ds
	pop es

	mov di,data3
	mov cx,0xffff
	xor al,al
	repne scasb
	mov ax,0xffff
	sub ax,cx
	dec ax

	mov cx,ax
	mov ax,0xb800
	mov es,ax
	mov bl,6
	mov al,80
	mul bl
	add ax,24
	shl ax,1
	mov di,ax
	mov ah,112
	mov si,data3

	cld 
	nextchar3 : lodsb
	stosw
	call delay1
	loop nextchar3

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp

	push bp
	mov bp,sp
	push es
	push ax
	push cx
	push si
	push di

	push ds
	pop es


	mov di,data4
	mov cx,0xffff
	xor al,al
	repne scasb
	mov ax,0xffff
	sub ax,cx
	dec ax

	mov cx,ax
	mov ax,0xb800
	mov es,ax
	mov bl,8
	mov al,80
	mul bl
	add ax,24
	shl ax,1
	mov di,ax
	mov ah,112
	mov si,data4

	cld 
	nextchar4 : lodsb
	stosw
	call delay1
	loop nextchar4

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp

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
	
	; push ds
	; pop es 
	
	mov ax, 0xb800
	mov es, ax                 
	mov al, 80                 
	mul byte[top1]           
	add ax, [left1]           
	shl ax, 1                  
	mov di,ax                  
	mov ah,0x70
	mov al,218
	stosw
	
	mov ax, 0xb800
	mov es, ax                
	mov al, 80                
	mul byte[bottom1]           
	add ax, [right1]              
	shl ax, 1                 
	mov di,ax                 
	mov ah,0x70
	mov al,217
	stosw
	
	mov ax, 0xb800
	mov es, ax                 
	mov al, 80                 
	mul byte[bottom1]          
	add ax, [left1]              
	shl ax, 1                 
	mov di,ax                  
	mov ah,0x70
	mov al,192
	stosw
	
	mov ax, 0xb800
	mov es, ax                 
	mov al, 80                
	mul byte[top1]           
	add ax, [right1]              
	shl ax, 1                  
	mov di,ax
	mov ah,0x70
	mov al,191
	stosw
	
   ;;;;;horizontal linesss;;;;;;
	
	mov ax, 0xb800
	mov es, ax                 
	mov al, 80                
	mul byte [top1]           
	add ax, [left1]            
	shl ax, 1                  
	mov di,ax                 
	add di,2                          
	mov al, 80                
	mul byte [top1]          
	add ax, [right1]            
	shl ax, 1                
	mov cx, ax                 
	mov ah, 0x70            
	mov al,196
	mov [es:di], ax
	nextshp: 
	mov al,196               
	mov [es:di], ax            
	add di, 2				  
	cmp di,cx             
	jne nextshp 
	
	mov ax, 0xb800
	mov es, ax                 
	mov al, 80                 
	mul byte [bottom1]           
	add ax, [left1]            
	shl ax, 1                 
	mov di,ax                 
	add di,2                          
	mov al, 80                 
	mul byte [bottom1]         
	add ax, [right1]            
	shl ax, 1                 
	mov cx, ax  
	mov ah, 0x70             
	mov al,196
	mov [es:di], ax
	nextshp1: 
	mov al,196                 
	mov [es:di], ax            
	add di, 2				  
	cmp di,cx              
	jne nextshp1 
	
		
	;;;;print vertical linessss;;;;;;;;;;;;
	
	mov ax, 0xb800
	mov es, ax                  
	mov al, 80                  
	mul byte [top1]           
	add ax, [left1]            
	shl ax, 1                  
	mov di,ax                  
	add di,160
	;add di,160                           
	mov al, 80                 
	mul byte [bottom1]           
	add ax, [left1]             
	shl ax, 1                   
	mov cx, ax               
	
	mov ah, 0x70              
	mov al,179
	nexchar:
	mov al,179     
	mov [es:di], ax             
	add di, 160

	cmp di,cx               
	jne nexchar
	
	
	mov ax, 0xb800
	mov es, ax                  
	mov al, 80                 
	mul byte [top1]            
	add ax, [right1]            
	shl ax, 1                   
	mov di,ax                  
	add di,160
	                      
	mov al, 80                  
	mul byte [bottom1]            
	add ax, [right1]           
	shl ax, 1                   
	mov cx, ax 
	
	mov ah, 0x70              
	mov al,179
	nexchar2:
	mov al,179     
	mov [es:di], ax            
	add di, 160

	cmp di,cx              
	jne nexchar2
	
	;;;;;;print score n high score ;;;;;;;;;
	
	; push ds
	; pop es 
	
	mov ax, 0xb800
	mov es, ax  
	mov cl,2
	mov al, 80 
	mul cl  
	add ax, 73  
	shl ax, 1 
	mov di,ax  
	mov si, message1  
	mov cx, [length1]  
	mov ah, 0x07 
	
	cld
	nextch: 
	lodsb  
	stosw 
	loop nextch  
	
	mov ax, 0xb800
	mov es, ax  
	mov cl,5
	mov al, 80 
	mul cl 
	add ax, 68  
	shl ax, 1 
	mov di,ax  
	mov si, message2  
	mov cx, [length2]  
	mov ah, 0x07 
	
	cld
	nextch2:
	lodsb  
	stosw 
	loop nextch2  
	
	mov ax, 0xb800
	mov es, ax  
	mov cl,8
	mov al, 80  
	mul cl  
	add ax, 74 
	shl ax, 1  
	mov di,ax  
	mov si, message3  
	mov cx, [length3]  
	mov ah, 0x07 
	
	cld
	nextch3:
	lodsb  
	stosw 
	loop nextch3 
	
	mov ax, 0xb800
	mov es, ax  
	mov cl,10
	mov al, 80  
	mul cl 
	add ax, 60 
	shl ax, 1 
	mov di,ax  
	mov si, message4 
	mov cx, [length4]  
	mov ah, 0x07 
	
	cld
	nextch4: 
	lodsb  
	stosw 
	loop nextch4  
	
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
	mov es, ax  
	mov cl,3
	mov al, 80  
	mul cl  
	add ax, 74 
	shl ax, 1  
	mov di,ax
	mov ax, [bp+4] 
	sub ax,1824
	mov bx, 10  
	mov cx, 0 
	nextdigit: mov dx, 0  
	div bx  
	add dl, 0x30  
	push dx  
	inc cx 
	cmp ax, 0  
	jnz nextdigit  

	nextpos: pop dx  
	mov dh, 0x07
	mov [es:di], dx  
	add di, 2  
	loop nextpos  
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 2
	
	
	
printtime: 
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx
	push di
	mov ax, 0xb800
	mov es, ax 
	mov cl,8
	mov al, 80 
	mul cl 
	add ax, 74  
	shl ax, 1  
	mov di,ax
	mov ax, [bp+4]
	mov bx, 10  
	mov cx, 0  
	

	nextdigit3: mov dx, 0  
	div bx  
	add dl, 0x30  
	push dx  
	inc cx  
	cmp ax, 0  
	jnz nextdigit3  

	nextpos3: pop dx 
	mov dh, 0x70  
	mov [es:di], dx  
	add di, 2  
	loop nextpos3  
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 2
	
	
	
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
	mov es, ax 
	mov cl,6
	mov al, 80 
	mul cl  
	add ax, 74 
	shl ax, 1 
	mov di,ax
	mov ax, [bp+4]  
	mov bx, 10  
	mov cx, 0  
	nextdigit1: mov dx, 0  
	div bx  
	add dl, 0x30  
	push dx  
	inc cx  
	cmp ax, 0 
	jnz nextdigit1

	nextpos1: pop dx 
	mov dh, 0x07 
	mov [es:di], dx 
	add di, 2 
	loop nextpos1 
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 2
	

Tshape:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ah,204
	nextblock:
	mov al,0x00
	stosw
	;add di,2
	stosw


	mov di,cx
	add di,320
	stosw
	mov di,cx
	add di,322
	stosw
	mov di,cx
	add di,316
	stosw
	mov di,cx
	add di,314
	stosw
	mov di,cx
	add di,326
	stosw
	mov di,cx
	add di,328
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

Lshape:                 ;L shape
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ah,170
	nextblock5:
	mov al,0x00
	stosw
	;add di,2
	stosw
	mov di,cx
	add di,320
	stosw
	mov di,cx
	add di,322
	stosw
	
	mov di,cx
	add di,326
	stosw
	mov di,cx
	add di,328
	stosw
	mov di,cx
	add di,332
	stosw
	mov di,cx
	add di,334
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

innshape:               ;upcoming shape
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                 ; turn into byte offset
	mov di,[bp+4]
	mov cx,di 
	mov ah,238
	mov al,0x00
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
	add di,636
	mov [es:di], ax
	mov di,cx
	add di,634
	mov [es:di], ax
	
	mov di,cx
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,316
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2



clearshapeinn:               
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                 ; turn into byte offset
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
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
	add di,636
	mov [es:di], ax
	mov di,cx
	add di,634
	mov [es:di], ax
	mov di,cx
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,316
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


		
Nshape:               
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ah,238
	nextblock6:
	mov al,0x00
	stosw
	;add di,2
	stosw
	mov di,cx
	add di,6
	stosw
	mov di,cx
	add di,8
	stosw
	mov di,cx
	add di,326
	stosw
	mov di,cx
	add di,328
	stosw
	mov di,cx
	add di,332
	stosw
	mov di,cx
	add di,334
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2
	
clearnext:               
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ax,0x0720
	mov [es:di], ax 
	add di,2
	mov [es:di], ax
	
	mov di,cx
	sub di,6
	mov [es:di], ax
	mov di,cx
	sub di,4
	mov [es:di], ax
	
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	
	mov di,cx
	add di,320
	mov [es:di], ax
	mov di,cx
	add di,322
	mov [es:di], ax
	
	mov di,cx
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,316
	mov [es:di], ax
	
	
	mov di,cx
	add di,326
	mov [es:di], ax
	mov di,cx
	add di,328
	mov [es:di], ax

	
	mov di,cx
	add di,332
	mov [es:di], ax
	mov di,cx
	add di,334
	mov [es:di], ax

	mov di,cx
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax
	
	mov di,cx
	add di,634
	mov [es:di], ax
	mov di,cx
	add di,636
	mov [es:di], ax
	
	
	mov di,cx
	add di,646
	mov [es:di], ax
	mov di,cx
	add di,648
	mov [es:di], ax

	
	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2
	




square:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	              
	mov di,[bp+4] 
	mov cx,di 
	mov ah,153
	nextblock7:
	mov al,0x00
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	mov di,cx
	add di,320
	mov [es:di], ax
	mov di,cx
	add di,322
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
	ret 2

verline:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ah,88
	mov al,0x00
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


rtshape:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ah,204
	mov al,0x00
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
	add di,326
	mov [es:di], ax
	mov di,cx
	add di,328
	mov [es:di], ax
	
	mov di,cx
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

clearshapert:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
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
	add di,326
	mov [es:di], ax
	mov di,cx
	add di,328
	mov [es:di], ax
	
	mov di,cx
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


ltshape:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ah,204
	mov al,0x00
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
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,316
	mov [es:di], ax
	
	mov di,cx
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


clearshapelt:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
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
	add di,314
	mov [es:di], ax
	mov di,cx
	add di,316
	mov [es:di], ax
	
	mov di,cx
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2




horline:                 ;horizontal line
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4]
	mov cx,di 
	mov ah,88
	mov al,0x00
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	mov di,cx
	sub di,4
	mov [es:di], ax
	mov di,cx
	sub di,6
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

InvTshape:       ;inversion of shape1
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                  ; turn into byte offset
	mov di,[bp+4]
	mov cx,di 
	mov ah,204
	mov al,0x00
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	mov di,cx
	sub di,4
	mov [es:di], ax
	mov di,cx
	sub di,6
	mov [es:di], ax
	mov di,cx
	add di,320
	mov [es:di], ax 
	mov di,cx
	add di,322
	mov [es:di], ax 
	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


inlshape:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ah,40
	mov al,0x00
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

indlshape:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ah,40
	mov al,0x00
	
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	mov di,cx
	add di,634
	mov [es:di], ax
	mov di,cx
	add di,636
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

clearshapeindl:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
	
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	mov di,cx
	add di,634
	mov [es:di], ax
	mov di,cx
	add di,636
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


clearshapeinl:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2



clearshapeint:       ;inversion of shape1
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                  ; turn into byte offset
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	mov di,cx
	sub di,4
	mov [es:di], ax
	mov di,cx
	sub di,6
	mov [es:di], ax
	mov di,cx
	add di,320
	mov [es:di], ax 
	mov di,cx
	add di,322
	mov [es:di], ax 
	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2




clearshapeh:                 ;horizontal line
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	mov di,cx
	sub di,4
	mov [es:di], ax
	mov di,cx
	sub di,6
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2




clearshapev:             
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                
	mov di,[bp+4]
	mov cx,di 
	mov ax,0x0720
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
	add di,640
	mov [es:di], ax
	mov di,cx
	add di,642
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2




clearshape:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ax,0x0720
	stosw
	;add di,2
	stosw


	mov di,cx
	add di,320
	stosw
	mov di,cx
	add di,322
	stosw
	mov di,cx
	add di,316
	stosw
	mov di,cx
	add di,314
	stosw
	mov di,cx
	add di,326
	stosw
	mov di,cx
	add di,328
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2
	
clearshapen:               
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ax,0x0720
	stosw
	;add di,2
	stosw
	mov di,cx
	add di,6
	stosw
	mov di,cx
	add di,8
	stosw
	mov di,cx
	add di,326
	stosw
	mov di,cx
	add di,328
	stosw
	mov di,cx
	add di,332
	stosw
	mov di,cx
	add di,334
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2
	

	
	
clearshapel:

	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ax,0x0720
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
	add di,326
	mov [es:di], ax
	mov di,cx
	add di,328
	mov [es:di], ax
	
	mov di,cx
	add di,332
	mov [es:di], ax
	mov di,cx
	add di,334
	mov [es:di], ax

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2
	
	
clearshapes:

	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ax,0x0720
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	
	mov di,cx
	add di,320
	mov [es:di], ax
	mov di,cx
	add di,322
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
	ret 2

inLrshape:                 
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ah,170
	mov al,0x00
	stosw
	stosw
	mov di,cx
	add di,6
	stosw
	mov di,cx
	add di,8
	stosw
	
	mov di,cx
	add di,12
	stosw
	mov di,cx
	add di,14
	stosw
	mov di,cx
	add di,332
	stosw
	mov di,cx
	add di,334
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2

clearshapeinlr:                 
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	mov ax,0x0720
	stosw
	stosw
	mov di,cx
	add di,6
	stosw
	mov di,cx
	add di,8
	stosw
	
	mov di,cx
	add di,12
	stosw
	mov di,cx
	add di,14
	stosw
	mov di,cx
	add di,332
	stosw
	mov di,cx
	add di,334
	stosw

	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


	
clearcharac:       ;inversion of shape1
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	                  ; turn into byte offset
	mov di,594
	mov cx,di 
	mov ax,0x0720
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,4
	mov [es:di], ax
	mov di,cx
	add di,160
	mov [es:di], ax
	mov di,cx
	add di,162
	mov [es:di], ax
	mov di,cx
	add di,164
	mov [es:di], ax
	
	 
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 


clrsdshpT:

	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	mov ax, 0xb800
	mov es, ax 
	mov di,[bp+4] 
	mov cx,di 
	nextblock9:
	mov ax,0x0720
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	mov di,cx
	add di,320
	mov [es:di], ax
	mov di,cx
	add di,322
	mov [es:di], ax

	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 2


	
delay4:
    mov ecx, 1000000 
	loop3:
    dec ecx
    jnz loop3 
	
	mov ecx, 1000000 
	loop4:
    dec ecx
    jnz loop4       
	
	mov ecx, 1000000 
	loop5:
    dec ecx
    jnz loop5      
    ret		

end1: ;;;;;;;;;;
	
	jmp end5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
downT:
	push ax
	push bx
	push cx
	push dx
	
	mov dx,532
	mov ax,0xb800
	mov es,ax
	mov di,dx
	add di,320
	mov ax,0x0720
	scasw
	jne end1
	
	mov di,dx
	mov ax,0x0720
	add di,314
	;add di,320
	scasw
	jne end1
	
	mov di,dx
	mov ax,0x0720
	add di,320
	;add di,320
	scasw
	jne end1
	
	mov di,dx
	mov ax,0x0720
	add di,326
	;add di,320
	scasw
	jne end1
	
	push dx
	call Tshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritT:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshape
	push dx
	call Tshape
	call delay1
	; call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne left
right:	
	
	mov di,dx
	mov ax,0x0720
	add di,12
	scasw
	jne left
	
	mov di,dx
	add di,172
	scasw
	jne left
	mov di,dx
	sub di,172
	scasw
	jne left
	mov di,dx
	add di,332
	scasw
	jne left
	mov di,dx
	sub di,332
	scasw
	jne left
	mov di,dx
	add di,492
	scasw
	jne left
	mov di,dx
	sub di,492
	scasw
	jne left
	
	push dx
	call clearshape
	add dx,6
	push dx
	call Tshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritT
left:
	cmp al,'a'
	jne rotationt
	mov ax,0x0720
	mov di,dx
	sub di,10
	scasw
	jne rotationt
	mov di,dx
	add di,310
	scasw
	jne rotationt
	mov di,dx
	sub di,310
	scasw
	jne rotationt
	mov di,dx
	add di,150
	scasw
	jne rotationt
	mov di,dx
	sub di,150
	scasw
	jne rotationt
	mov di,dx
	add di,470
	scasw
	jne rotationt
	mov di,dx
	sub di,470
	scasw
	jne rotationt
	
	push dx
	call clearshape
	sub dx,6
	push dx
	call Tshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritT

rotationt:
	cmp al,'w'
	jne downloopT
	push dx
	call clearshape
	call downrt
	
	mov di,dx
	add di,320
	mov ax,0x0720
	scasw
	jne spacecht
	
	mov di,dx
	mov ax,0x0720
	add di,314
	;add di,320
	scasw
	jne spacecht
	mov di,dx
	mov ax,0x0720
	add di,474
	;add di,320
	scasw
	jne spacecht
	
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne spacecht
	mov di,dx
	mov ax,0x0720
	add di,486
	scasw
	jne spacecht
	
	mov di,dx
	mov ax,0x0720
	add di,6
	;add di,320
	scasw
	jne spacecht
	mov di,dx
	mov ax,0x0720
	sub di,6
	scasw
	jne spacecht
	push dx
	call Tshape
	jmp downloopT
	
spacecht:
	call downint
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret
	


	
downloopT:	
	mov bx,dx
ch1:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,640
	scasw
	
	pop dx
	jne eofl1
ch2:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,646
	scasw
	
	pop dx
	jne eofl1
ch3:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,634
	scasw
	pop dx
	jne eofl1
	add dx,160
	jmp lefritT
eofl1:
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret 
	
	
end2: ;;;;;;;;;;
	
	jmp end5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downN:
	push ax
	push bx
	push cx
	push dx
	
	mov dx,532
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end2
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne end2
	
	mov di,dx
	mov ax,0x0720
	add di,332
	scasw
	jne end2
	
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne end2
	
	
	push dx
	call Nshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritn:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	
	sub ax,160
	push ax
	call clearshapen
	push dx
	call Nshape
	call delay1
	;call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftn
rightn:	
	mov di,dx
	mov ax,0x0720
	add di,18
	add di,320
	scasw
	jne leftn
	mov di,dx
	add di,18
	sub di,320
	scasw
	jne leftn
	
	mov di,dx
	add di,18
	add di,480
	scasw
	jne leftn
	
	mov di,dx
	add di,18
	sub di,480
	scasw
	jne leftn
	
	mov di,dx
	add di,18
	sub di,160
	scasw
	jne leftn
	mov di,dx
	add di,18
	add di,160
	scasw
	jne leftn
	
	mov di,dx
	mov ax,0x0720
	add di,18
	scasw
	jne leftn
	
	
	push dx
	call clearshapen
	add dx,6
	push dx
	call Nshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritn
leftn:
	cmp al,'a'
	jne rotationn
	mov di,dx
	mov ax,0x0720
	sub di,4
	add di,320
	scasw
	jne rotationn
	mov di,dx
	sub di,4
	sub di,320
	scasw
	jne rotationn
	mov di,dx
	sub di,4
	add di,160
	scasw
	jne rotationn
	mov di,dx
	sub di,4
	sub di,160
	scasw
	jne rotationn
	mov di,dx
	sub di,4
	add di,480
	scasw
	jne rotationn
	mov di,dx
	sub di,4
	sub di,480
	scasw
	jne rotationn
	
	mov di,dx
	sub di,4
	scasw
	jne rotationn
	
	push dx
	call clearshapen
	sub dx,6
	push dx
	call Nshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritn

rotationn:
	cmp al,'w'
	jne downloopn
	push dx
	call clearshapen
	call downinn
	
	mov di,dx
	mov ax,0x0720
	scasw
	jne spacechn
	
	mov di,dx
	mov ax,0x0720
	add di,332
	;add di,320
	scasw
	jne spacechn
	mov di,dx
	mov ax,0x0720
	add di,492
	;add di,320
	scasw
	jne spacechn
	
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne spacechn
	mov di,dx
	mov ax,0x0720
	add di,486
	scasw
	jne spacechn
	
	mov di,dx
	mov ax,0x0720
	add di,6
	;add di,320
	scasw
	jne spacechn
	mov di,dx
	mov ax,0x0720
	sub di,6
	scasw
	jne spacechn
	push dx
	call Nshape
	jmp downloopn
	
spacechn:
	call downinn
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret
	
	
downloopn:	
	
	
	mov bx,dx
ch2n:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,652
	scasw
	
	pop dx
	jne eofn
ch3n:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,646
	scasw
	pop dx
	jne eofn
	
	
ch1n:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,320
	scasw
	
	pop dx
	jne eofn
	add dx,160
	jmp lefritn
eofn:	
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret 
	
	
	
end8: ;;;;;;;;;;
	ret
	
	
end9: ;;;;;;;;;;
	
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downinn:
	
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end9
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end9
	
	mov di,dx
	mov ax,0x0720
	sub di,6
	scasw
	jne end9
	
	mov di,dx
	mov ax,0x0720
	add di,314
	scasw
	jne end9
	mov di,dx
	mov ax,0x0720
	add di,316
	scasw
	jne end9
	mov di,dx
	mov ax,0x0720
	add di,634
	scasw
	jne end9
	mov di,dx
	mov ax,0x0720
	add di,636
	scasw
	jne end9
	mov di,dx
	mov ax,0x0720
	add di,794
	scasw
	jne end9
	
	
	push dx
	call innshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritinn:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapeinn
	push dx
	call innshape
	call delay1
	call delay1
	;call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftinn
rightinn:	
	mov di,dx
	mov ax,0x0720
	add di,6
	add di,480
	scasw
	jne leftinn
	mov di,dx
	add di,640
	scasw
	jne leftinn
	mov di,dx
	sub di,640
	scasw
	jne leftinn
	mov di,dx
	add di,640
	scasw
	jne leftinn
	
	mov di,dx
	sub di,160
	scasw
	jne leftinn
	mov di,dx
	add di,800
	scasw
	jne leftinn
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne leftinn
	
	push dx
	call clearshapeinn
	
	
	add dx,6
	push dx
	call innshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritinn
leftinn:
	cmp al,'a'
	jne rotationinn
	mov di,dx
	mov ax,0x0720
	sub di,12
	add di,480
	scasw
	jne rotationinn
	mov di,dx
	sub di,12
	add di,640
	scasw
	jne rotationinn
	mov di,dx
	sub di,12
	sub di,640
	scasw
	jne rotationinn
	mov di,dx
	sub di,12
	add di,640
	scasw
	jne rotationinn
	mov di,dx
	sub di,12
	sub di,160
	scasw
	jne rotationinn
	mov di,dx
	sub di,10
	add di,800
	scasw
	jne rotationinn
	
	mov di,dx
	mov ax,0x0720
	sub di,12
	scasw
	jne rotationinn
	
	
	
	push dx
	call clearshapeinn
	
	
	sub dx,6
	push dx
	call innshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritinn

rotationinn:
	cmp al,'w'
	jne downloopinn
	push dx
	call clearshapeinn
	ret	
	

	
downloopinn:	
	
	mov bx,dx
ch1inn:	
	push dx
	mov ax,0x0720
	mov di,bx
	add di,640
	scasw
	pop dx
	jne eofinn
	
ch2inn:	
	push dx
	mov ax,0x0720
	mov di,bx
	add di,954
	scasw
	pop dx
	jne eofinn	

	add dx,160
	jmp lefritinn
eofinn:
	
	
	ret 	
	

end11:
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downint:

	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end11
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne end11
	
	mov di,dx
	mov ax,0x0720
	sub di,6
	scasw
	jne end11
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end11
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne end11
	mov di,dx
	mov ax,0x0720
	add di,314
	scasw
	jne end11
	
	
	
	push dx
	call InvTshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritint:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	
	sub ax,160
	push ax
	call clearshapeint
	push dx
	call InvTshape
	call delay1
	;call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftint
rightint:	
	mov di,dx
	mov ax,0x0720
	add di,12
	add di,320
	scasw
	jne leftint
	mov di,dx
	add di,12
	sub di,320
	scasw
	jne leftint
	
	mov di,dx
	add di,12
	add di,480
	scasw
	jne leftint
	
	mov di,dx
	add di,12
	sub di,480
	scasw
	jne leftint
	
	mov di,dx
	add di,12
	sub di,160
	scasw
	jne leftint
	mov di,dx
	add di,12
	add di,160
	scasw
	jne leftint
	
	mov di,dx
	mov ax,0x0720
	add di,12
	scasw
	jne leftint
	
	
	push dx
	call clearshapeint
	add dx,6
	push dx
	call InvTshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritint
leftint:
	cmp al,'a'
	jne rotationint
	mov di,dx
	mov ax,0x0720
	sub di,10
	add di,320
	scasw
	jne rotationint
	mov di,dx
	sub di,10
	sub di,320
	scasw
	jne rotationint
	mov di,dx
	sub di,10
	add di,160
	scasw
	jne rotationint
	mov di,dx
	sub di,10
	sub di,160
	scasw
	jne rotationint
	mov di,dx
	sub di,10
	add di,480
	scasw
	jne rotationint
	mov di,dx
	sub di,10
	sub di,480
	scasw
	jne rotationint
	
	mov di,dx
	sub di,10
	scasw
	jne rotationint
	
	push dx
	call clearshapeint
	sub dx,6
	push dx
	call InvTshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritint

rotationint:
	cmp al,'w'
	jne downloopint
	push dx
	call clearshapeint
	call downlt
	ret	
	

	
downloopint:	
	
	
	mov bx,dx
ch2int:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,326
	scasw
	
	pop dx
	jne eofint
ch3int:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,640
	scasw
	pop dx
	jne eofint
	
	
ch1int:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,314
	scasw
	
	pop dx
	jne eofint
	add dx,160
	jmp lefritint
eofint:	
	ret 	
	
	


end14:
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downrt:

	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end14
	
	mov di,dx
	mov ax,0x0720
	add di,640
	scasw
	jne end14
	
	mov di,dx
	mov ax,0x0720
	add di,800
	scasw
	jne end14
	mov di,dx
	mov ax,0x0720
	add di,314
	scasw
	jne end14
	
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end14
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne end14
	
	
	
	
	push dx
	call rtshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritrt:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	
	sub ax,160
	push ax
	call clearshapert
	push dx
	call rtshape
	call delay1
	;call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftrt
rightrt:	
	mov di,dx
	mov ax,0x0720
	add di,12
	add di,320
	scasw
	jne leftrt
	
	mov di,dx
	add di,12
	add di,640
	scasw
	jne leftrt
	
	mov di,dx
	add di,12
	sub di,640
	scasw
	jne leftrt
	
	mov di,dx
	add di,12
	sub di,160
	scasw
	jne leftrt
	
	mov di,dx
	add di,12
	add di,800
	scasw
	jne leftrt
	mov di,dx
	add di,12
	sub di,800
	scasw
	jne leftrt
	
	mov di,dx
	mov ax,0x0720
	add di,12
	scasw
	jne leftrt
	
	
	push dx
	call clearshapert
	add dx,6
	push dx
	call rtshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritrt
leftrt:
	cmp al,'a'
	jne rotationrt
	mov di,dx
	mov ax,0x0720
	sub di,4
	add di,480
	scasw
	jne rotationrt
	mov di,dx
	sub di,4
	add di,640
	scasw
	jne rotationrt
	mov di,dx
	sub di,4
	sub di,640
	scasw
	jne rotationrt
	mov di,dx
	sub di,4
	add di,640
	scasw
	jne rotationrt
	mov di,dx
	sub di,4
	sub di,160
	scasw
	jne rotationrt
	mov di,dx
	sub di,4
	add di,800
	scasw
	jne rotationrt
	
	mov di,dx
	mov ax,0x0720
	sub di,4
	scasw
	jne rotationrt
	
	
	
	push dx
	call clearshapert
	
	
	sub dx,6
	push dx
	call rtshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritrt

rotationrt:
	cmp al,'w'
	jne downlooprt
	push dx
	call clearshapert
	call downint
	ret	
	

	
downlooprt:	
	mov bx,dx
	
ch1rt:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,960
	scasw
	
	pop dx
	jne eofrt

ch2rt:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,646
	scasw
	
	pop dx
	jne eofrt

	add dx,160
	jmp lefritrt
eofrt:	
	ret 	
	
	
end15:
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downlt:

	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end15
	
	mov di,dx
	mov ax,0x0720
	add di,640
	scasw
	jne end15
	
	mov di,dx
	mov ax,0x0720
	add di,800
	scasw
	jne end15
	mov di,dx
	mov ax,0x0720
	add di,314
	scasw
	jne end15
	
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end15
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne end15
	
	
	
	
	push dx
	call ltshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritlt:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	
	sub ax,160
	push ax
	call clearshapelt
	push dx
	call ltshape
	call delay1
	;call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftlt
rightlt:	
	mov di,dx
	mov ax,0x0720
	add di,6
	add di,320
	scasw
	jne leftlt
	
	mov di,dx
	add di,6
	add di,640
	scasw
	jne leftlt
	
	mov di,dx
	add di,6
	sub di,640
	scasw
	jne leftlt
	
	mov di,dx
	add di,6
	sub di,160
	scasw
	jne leftlt
	
	mov di,dx
	add di,6
	add di,800
	scasw
	jne leftrt
	mov di,dx
	add di,6
	sub di,800
	scasw
	jne leftlt
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne leftlt
	
	
	push dx
	call clearshapelt
	add dx,6
	push dx
	call ltshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritlt
leftlt:
	cmp al,'a'
	jne rotationlt
	mov di,dx
	mov ax,0x0720
	sub di,10
	add di,480
	scasw
	jne rotationlt
	mov di,dx
	sub di,10
	add di,640
	scasw
	jne rotationlt
	mov di,dx
	sub di,10
	sub di,640
	scasw
	jne rotationlt
	mov di,dx
	sub di,10
	add di,640
	scasw
	jne rotationlt
	mov di,dx
	sub di,10
	sub di,160
	scasw
	jne rotationlt
	mov di,dx
	sub di,10
	add di,800
	scasw
	jne rotationlt
	
	mov di,dx
	mov ax,0x0720
	sub di,10
	scasw
	jne rotationlt
	
	
	
	push dx
	call clearshapelt
	
	
	sub dx,6
	push dx
	call ltshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritlt

rotationlt:
	cmp al,'w'
	jne downlooplt
	push dx
	call clearshapelt
	ret	
	

	
downlooplt:	
	mov bx,dx
	
ch1lt:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,960
	scasw
	
	pop dx
	jne eoflt

ch2lt:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,634
	scasw
	
	pop dx
	jne eoflt

	add dx,160
	jmp lefritlt
eoflt:	
	ret 	
	
	
		
	
	
	
	
	
end3: ;;;;;;;;;;
	
	
	jmp end5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
downsquare:
	push ax
	push bx
	push cx
	push dx
	mov dx,532
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end3
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne end3
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end3
	
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne end3
	
	push dx
	call square
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefrits:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapes
	push dx
	call square
	call delay1
	; call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne lefts
rights:	
	mov di,dx
	mov ax,0x0720
	add di,12
	add di,320
	scasw
	jne lefts
	
	mov di,dx
	sub di,172
	scasw
	jne lefts
	
	mov di,dx
	sub di,332
	scasw
	jne lefts
	
	mov di,dx
	add di,12
	scasw
	jne lefts
	
	mov di,dx
	add di,172
	scasw
	jne lefts
	
	mov di,dx
	add di,12
	add di,480
	scasw
	jne lefts
	
	mov di,dx
	add di,12
	sub di,480
	scasw
	jne lefts
	
	push dx
	call clearshapes
	
	
	add dx,6
	push dx
	call square
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefrits
lefts:
	cmp al,'a'
	jne downloopS
	
	mov di,dx
	mov ax,0x0720
	sub di,4
	add di,320
	scasw
	jne downloopS
	
	mov di,dx
	sub di,4
	add di,480
	scasw
	jne downloopS
	
	
	mov di,dx
	sub di,4
	sub di,480
	scasw
	jne downloopS
	
	mov di,dx
	sub di,4
	add di,160
	scasw
	jne downloopS
	
	mov di,dx
	sub di,4
	sub di,160
	scasw
	jne downloopS
	
	mov di,dx
	sub di,4
	sub di,320
	scasw
	jne downloopS
	
	mov di,dx
	sub di,4
	scasw
	jne downloopS
	
	push dx
	call clearshapes
	
	
	sub dx,6
	push dx
	call square
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefrits
	
	
downloopS:	
	
	mov bx,dx
ch1s:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,640
	scasw
	
	pop dx
	jne eofl1
ch2s:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,646
	scasw
	
	pop dx
	jne eofl1
	
	add dx,160
	
	jmp lefrits

eofs:	
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret 


end4: ;;;;;;;;;;
    
	jmp end5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downL:
	push ax
	push bx
	push cx
	push dx
	mov dx,532
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end4
	
	mov di,dx
	mov ax,0x0720
	add di,332
	scasw
	jne end4
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end4
	
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne end4
	
	
	push dx
	call Lshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritl:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapel
	push dx
	call Lshape
	call delay1
	call delay1
	;call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftl
rightl:	
	mov di,dx
	mov ax,0x0720
	add di,18
	add di,320
	scasw
	jne leftl
	mov di,dx
	add di,18
	sub di,320
	scasw
	jne leftl
	mov di,dx
	add di,18
	sub di,160
	scasw
	jne leftl
	
	mov di,dx
	add di,18
	add di,480
	scasw
	jne leftl
	mov di,dx
	add di,18
	sub di,480
	scasw
	jne leftl
	
	mov di,dx
	mov ax,0x0720
	add di,18
	scasw
	jne leftl
	push dx
	call clearshapel
	
	
	add dx,6
	push dx
	call Lshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritl
leftl:
	cmp al,'a'
	jne rotationl
	mov di,dx
	mov ax,0x0720
	sub di,4
	add di,320
	scasw
	jne rotationl
	mov di,dx
	mov ax,0x0720
	sub di,4
	sub di,320
	scasw
	jne rotationl
	
	mov di,dx
	sub di,4
	add di,480
	scasw
	jne rotationl
	mov di,dx
	sub di,4
	sub di,480
	scasw
	jne rotationl
	mov di,dx
	sub di,4
	sub di,160
	scasw
	jne rotationl
	
	mov di,dx
	mov ax,0x0720
	sub di,4
	scasw
	jne rotationl
	push dx
	call clearshapel
	
	
	sub dx,6
	push dx
	call Lshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritl

rotationl:
	cmp al,'w'
	jne downloopl
	push dx
	call clearshapel
	call downinl
	
	mov di,dx
	mov ax,0x0720
	scasw
	jne spacechl
	
	mov di,dx
	mov ax,0x0720
	add di,332
	scasw
	jne spacechl
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne spacechl
	
	mov di,dx
	mov ax,0x0720
	add di,326
	scasw
	jne spacechl
	mov di,dx
	mov ax,0x0720
	add di,492
	scasw
	jne spacechl
	
	mov di,dx
	mov ax,0x0720
	add di,480
	scasw
	jne spacechl
	
	mov di,dx
	mov ax,0x0720
	add di,486
	scasw
	jne spacechl
	
	push dx
	call Lshape
	jmp downloopl
	
spacechl:
	call downindl
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret
	


	
downloopl:	
	
	mov bx,dx
ch1l:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,640
	scasw
	
	pop dx
	jne eofll
ch2l:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,646
	scasw
	
	pop dx
	jne eofll
ch3l:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,652
	scasw
	pop dx
	jne eofll
	add dx,160
	jmp lefritl
eofll:	
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret 



end12: ;;;;;;;;;;
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downinl:
	
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end12
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end12
	
	mov di,dx
	mov ax,0x0720
	add di,640
	scasw
	jne end12
	
	mov di,dx
	mov ax,0x0720
	add di,800
	scasw
	jne end12
	
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne end12
	
	mov di,dx
	mov ax,0x0720
	add di,166
	scasw
	jne end12
	
	
	push dx
	call inlshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritinl:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapeinl
	push dx
	call inlshape
	call delay1
	call delay1
	;call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftinl
rightinl:	
	mov di,dx
	mov ax,0x0720
	add di,12
	add di,480
	scasw
	jne leftinl
	mov di,dx
	add di,12
	add di,640
	scasw
	jne leftinl
	mov di,dx
	add di,12
	sub di,640
	scasw
	jne leftinl
	mov di,dx
	add di,12
	add di,640
	scasw
	jne leftinl
	
	mov di,dx
	add di,12
	sub di,160
	scasw
	jne leftinl
	mov di,dx
	add di,12
	add di,800
	scasw
	jne leftinl
	
	mov di,dx
	mov ax,0x0720
	add di,12
	scasw
	jne leftinl
	
	push dx
	call clearshapeinl
	
	
	add dx,6
	push dx
	call inlshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritinl
leftinl:
	cmp al,'a'
	jne rotationinl
	mov di,dx
	mov ax,0x0720
	sub di,4
	add di,480
	scasw
	jne rotationinl
	mov di,dx
	sub di,4
	add di,640
	scasw
	jne rotationinl
	mov di,dx
	sub di,4
	sub di,640
	scasw
	jne rotationinl
	mov di,dx
	sub di,4
	add di,640
	scasw
	jne rotationinl
	mov di,dx
	sub di,4
	sub di,160
	scasw
	jne rotationinl
	mov di,dx
	sub di,4
	add di,800
	scasw
	jne rotationinl
	
	mov di,dx
	mov ax,0x0720
	sub di,4
	scasw
	jne rotationinl
	
	
	
	push dx
	call clearshapeinl
	
	
	sub dx,6
	push dx
	call inlshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritinl

rotationinl:
	cmp al,'w'
	jne downloopinl
	push dx
	call clearshapeinl
	call downinlr
	ret	
	

	
downloopinl:	
	
	mov bx,dx
ch1inl:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,960
	scasw
	
	pop dx
	jne eofinl

ch2inl:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,326
	scasw
	
	pop dx
	jne eofinl

	add dx,160
	jmp lefritinl
eofinl:
	
	
	ret 	
	


end13: ;;;;;;;;;;
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downindl:
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end13
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end13
	
	mov di,dx
	mov ax,0x0720
	add di,640
	scasw
	jne end13
	
	mov di,dx
	mov ax,0x0720
	add di,800
	scasw
	jne end13
	
	
	mov di,dx
	mov ax,0x0720
	add di,634
	scasw
	jne end13
	mov di,dx
	mov ax,0x0720
	add di,636
	scasw
	jne end13
	
	mov di,dx
	mov ax,0x0720
	add di,794
	scasw
	jne end13
	
	
	push dx
	call indlshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritindl:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapeindl
	push dx
	call indlshape
	call delay1
	call delay1
	;call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftindl
rightindl:	
	mov di,dx
	mov ax,0x0720
	add di,6
	add di,480
	scasw
	jne leftindl
	mov di,dx
	add di,6
	add di,640
	scasw
	jne leftindl
	mov di,dx
	add di,6
	sub di,640
	scasw
	jne leftindl
	mov di,dx
	add di,6
	add di,640
	scasw
	jne leftindl
	
	mov di,dx
	add di,6
	sub di,160
	scasw
	jne leftinl
	mov di,dx
	add di,6
	add di,800
	scasw
	jne leftindl
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne leftindl
	
	push dx
	call clearshapeindl
	
	
	add dx,6
	push dx
	call indlshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritindl
leftindl:
	cmp al,'a'
	jne rotationindl
	mov di,dx
	mov ax,0x0720
	sub di,10
	add di,480
	scasw
	jne rotationindl
	mov di,dx
	sub di,10
	add di,640
	scasw
	jne rotationindl
	mov di,dx
	sub di,10
	sub di,640
	scasw
	jne rotationindl
	mov di,dx
	sub di,10
	add di,640
	scasw
	jne rotationindl
	mov di,dx
	sub di,10
	sub di,160
	scasw
	jne rotationindl
	mov di,dx
	sub di,10
	add di,800
	scasw
	jne rotationindl
	
	mov di,dx
	mov ax,0x0720
	sub di,4
	scasw
	jne rotationinl
	
	
	
	push dx
	call clearshapeindl
	
	
	sub dx,6
	push dx
	call indlshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritindl

rotationindl:
	cmp al,'w'
	jne downloopindl
	push dx
	call clearshapeindl
	ret	
	

	
downloopindl:	
	
	mov bx,dx
ch1indl:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,960
	scasw
	
	pop dx
	jne eofindl

ch2indl:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,954
	scasw
	
	pop dx
	jne eofindl

	add dx,160
	jmp lefritindl
eofindl:
	
	
	ret 	
	

end79: ;;;;;;;;;;
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downinlr:
	
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end79
	
	mov di,dx
	mov ax,0x0720
	add di,4
	scasw
	jne end79
	mov di,dx
	mov ax,0x0720
	add di,8
	scasw
	jne end79
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne end79
	
	mov di,dx
	mov ax,0x0720
	add di,12
	scasw
	jne end79
	
	mov di,dx
	mov ax,0x0720
	add di,14
	scasw
	jne end79
	
	mov di,dx
	mov ax,0x0720
	add di,332
	scasw
	jne end79
	
	mov di,dx
	mov ax,0x0720
	add di,334
	scasw
	jne end79
	
	
	
	push dx
	call inLrshape
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritinlr:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapeinlr
	push dx
	call inLrshape
	call delay1
	; call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftinlr
rightinlr:	
	
	mov di,dx
	mov ax,0x0720
	add di,18
	scasw
	jne leftinlr
	
	mov di,dx
	add di,178
	scasw
	jne leftinlr
	mov di,dx
	sub di,178
	scasw
	jne leftinlr
	mov di,dx
	add di,338
	scasw
	jne leftinlr
	mov di,dx
	sub di,338
	scasw
	jne leftinlr
	mov di,dx
	add di,658
	scasw
	jne leftinlr
	mov di,dx
	add di,498
	scasw
	jne leftinlr
	mov di,dx
	sub di,818
	scasw
	jne leftinlr
	mov di,dx
	add di,658
	scasw
	jne leftinlr
	mov ax,dx
	push ax
	call clearshapeinlr
	add dx,6
	push dx
	call inLrshape
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritinlr
leftinlr:
	cmp al,'a'
	jne rotationinlr
	mov ax,0x0720
	mov di,dx
	sub di,4
	scasw
	jne rotationinlr
	mov di,dx
	add di,316
	scasw
	jne rotationinlr
	mov di,dx
	add di,476
	scasw
	jne rotationinlr
	mov di,dx
	sub di,316
	scasw
	jne rotationinlr
	mov di,dx
	add di,156
	scasw
	jne rotationinlr
	mov di,dx
	sub di,156
	scasw
	jne rotationinlr
	
	mov ax,dx
	push ax
	call clearshapeinlr
	sub dx,6
	push dx
	call inLrshape
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritinlr
rotationinlr:
	cmp al,'w'
	jne downloopinlr
	push dx
	call clearshapeinlr
	call downindl
	ret	
	
downloopinlr:	
	
	mov bx,dx
ch1inlr:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,320
	scasw
	
	pop dx
	jne eofinlr
ch2inlr:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,326
	scasw
	
	pop dx
	jne eofinlr
ch3inlr:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,652
	scasw
	pop dx
	jne eofinlr
	add dx,160
	jmp lefritinlr
eofinlr:	
	ret 
	



	
	
end6: ;;;;;;;;;;
	
	jmp end5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downv:
	push ax
	push bx
	push cx
	push dx
	mov dx,532
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end6
	
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne end6
	
	mov di,dx
	mov ax,0x0720
	add di,640
	scasw
	jne end6
	
	
	push dx
	call verline
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefritv:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapev
	push dx
	call verline
	call delay1
	call delay1
	;call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne leftv
rightv:	
	mov di,dx
	mov ax,0x0720
	add di,6
	add di,480
	scasw
	jne leftv
	mov di,dx
	add di,6
	add di,640
	scasw
	jne leftv
	mov di,dx
	add di,6
	sub di,640
	scasw
	jne leftv
	mov di,dx
	add di,6
	add di,640
	scasw
	jne leftv
	
	mov di,dx
	add di,6
	sub di,160
	scasw
	jne leftv
	mov di,dx
	add di,6
	add di,800
	scasw
	jne leftv
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne leftv
	
	push dx
	call clearshapev
	
	
	add dx,6
	push dx
	call verline
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefritv
leftv:
	cmp al,'a'
	jne rotationv
	mov di,dx
	mov ax,0x0720
	sub di,4
	add di,480
	scasw
	jne rotationv
	mov di,dx
	sub di,4
	add di,640
	scasw
	jne rotationv
	mov di,dx
	sub di,4
	sub di,640
	scasw
	jne rotationv
	mov di,dx
	sub di,4
	add di,640
	scasw
	jne rotationv
	mov di,dx
	sub di,4
	sub di,160
	scasw
	jne rotationv
	mov di,dx
	sub di,4
	add di,800
	scasw
	jne rotationv
	
	mov di,dx
	mov ax,0x0720
	sub di,4
	scasw
	jne rotationv
	
	
	
	push dx
	call clearshapev
	
	
	sub dx,6
	push dx
	call verline
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefritv

rotationv:
	cmp al,'w'
	jne downloopv
	push dx
	call clearshapev
	call downH
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne spacechv
	mov di,dx
	mov ax,0x0720
	add di,160
	scasw
	jne spacechv
	mov di,dx
	mov ax,0x0720
	add di,320
	scasw
	jne spacechv
	
	mov di,dx
	mov ax,0x0720
	add di,640
	scasw
	jne spacechv
	mov di,dx
	mov ax,0x0720
	add di,800
	scasw
	jne spacechv
	mov di,dx
	mov ax,0x0720
	add di,480
	scasw
	jne spacechv
	push dx
	call verline
	jmp downloopv
	
spacechv:
	call downH
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret
	

	
downloopv:	
	
	mov bx,dx
ch1v:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,960
	scasw
	
	pop dx
	jne eofv

	add dx,160
	jmp lefritv
eofv:
	
	pop dx
	pop cx
	pop bx 
	pop ax 
	ret 	
	
end7: ;;;;;;;;;;
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

downH:
	
	mov ax,0xb800
	mov es,ax
	mov di,dx
	mov ax,0x0720
	scasw
	jne end7
	
	mov di,dx
	mov ax,0x0720
	add di,4
	scasw
	jne end7
	mov di,dx
	mov ax,0x0720
	sub di,4
	scasw
	jne end7
	
	mov di,dx
	mov ax,0x0720
	add di,6
	scasw
	jne end7
	
	mov di,dx
	mov ax,0x0720
	sub di,6
	scasw
	jne end7
	
	
	
	push dx
	call horline
	
	call delay2
	mov ax,0xb800
	mov es,ax
	
	
lefrith:
	
	mov ah,0x0c
	int 0x21
	mov ax,dx
	sub ax,160
	push ax
	call clearshapeh
	push dx
	call horline
	call delay1
	; call delay1
	call delay1
	mov ah,0x01
	int 16h
	cmp al,'d'
	jne lefth
righth:	
	
	mov di,dx
	mov ax,0x0720
	add di,12
	scasw
	jne lefth
	
	mov di,dx
	add di,172
	scasw
	jne lefth
	mov di,dx
	sub di,172
	scasw
	jne lefth
	mov di,dx
	add di,332
	scasw
	jne lefth
	mov di,dx
	sub di,332
	scasw
	jne lefth
	
	mov ax,dx
	push ax
	call clearshapeh
	add dx,6
	push dx
	call horline
	mov ah,0x01
	int 16h
	cmp al,'d'
	je lefrith
lefth:
	cmp al,'a'
	jne rotationh
	mov ax,0x0720
	mov di,dx
	sub di,10
	scasw
	jne rotationh
	mov di,dx
	add di,310
	scasw
	jne rotationh
	mov di,dx
	sub di,310
	scasw
	jne rotationh
	mov di,dx
	add di,150
	scasw
	jne rotationh
	mov di,dx
	sub di,150
	scasw
	jne rotationh
	
	mov ax,dx
	push ax
	call clearshapeh
	sub dx,6
	push dx
	call horline
	mov ah,0x01
	int 16h
	cmp al,'a'
	je lefrith
rotationh:
	cmp al,'w'
	jne downlooph
	push dx
	call clearshapeh
	ret	
	
downlooph:	
	
	mov bx,dx
ch1h:	
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,320
	scasw
	
	pop dx
	jne eofh
ch2h:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,326
	scasw
	
	pop dx
	jne eofh
ch3h:
	push dx
	mov ax,0x0720
	
	mov di,bx
	add di,314
	scasw
	pop dx
	jne eofh
	add dx,160
	jmp lefrith
eofh:	
	ret 
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

removeline:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	push dx
	push bx
	push ds
	mov ax, 0xb800
	mov es, ax 
	
	
	
	
	
	mov bx,10
blinkloop:
	                
	
	mov ax,0x7720
	mov di,[bp+4]
	mov cx,di 
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	
	mov di,cx
	add di,12
	mov [es:di], ax
	mov di,cx
	add di,14
	mov [es:di], ax
	
	mov di,cx
	add di,18
	mov [es:di], ax
	mov di,cx
	add di,20
	mov [es:di], ax
	
	mov di,cx
	add di,24
	mov [es:di], ax
	mov di,cx
	add di,26
	mov [es:di], ax
	
	mov di,cx
	add di,30
	mov [es:di], ax
	mov di,cx
	add di,32
	mov [es:di], ax
	
	mov di,cx
	add di,36
	mov [es:di], ax
	mov di,cx
	add di,38
	mov [es:di], ax
	
	mov di,cx
	add di,42
	mov [es:di], ax
	mov di,cx
	add di,44
	mov [es:di], ax
	
	mov di,cx
	add di,48
	mov [es:di], ax
	mov di,cx
	add di,50
	mov [es:di], ax
	
	mov di,cx
	add di,54
	mov [es:di], ax
	mov di,cx
	add di,56
	mov [es:di], ax
	
	mov di,cx
	add di,60
	mov [es:di], ax
	mov di,cx
	add di,62
	mov [es:di], ax
	
	mov di,cx
	add di,66
	mov [es:di], ax
	mov di,cx
	add di,68
	mov [es:di], ax
	
	mov di,cx
	add di,72
	mov [es:di], ax
	mov di,cx
	add di,74
	mov [es:di], ax
	
	mov di,cx
	add di,78
	mov [es:di], ax
	mov di,cx
	add di,80
	mov [es:di], ax
	
	mov di,cx
	add di,84
	mov [es:di], ax
	mov di,cx
	add di,86
	mov [es:di], ax
	
	mov di,cx
	add di,90
	mov [es:di], ax
	mov di,cx
	add di,92
	mov [es:di], ax
	
	mov di,cx
	add di,96
	mov [es:di], ax
	mov di,cx
	add di,98
	mov [es:di], ax
	
	call delay1
	
	mov ax,0x0720
	
	mov di,[bp+4]
	
	mov [es:di], ax 
	add di,2
	mov [es:di], ax 
	
	mov di,cx
	add di,6
	mov [es:di], ax
	mov di,cx
	add di,8
	mov [es:di], ax
	
	mov di,cx
	add di,12
	mov [es:di], ax
	mov di,cx
	add di,14
	mov [es:di], ax
	
	mov di,cx
	add di,18
	mov [es:di], ax
	mov di,cx
	add di,20
	mov [es:di], ax
	
	mov di,cx
	add di,24
	mov [es:di], ax
	mov di,cx
	add di,26
	mov [es:di], ax
	
	mov di,cx
	add di,30
	mov [es:di], ax
	mov di,cx
	add di,32
	mov [es:di], ax
	
	mov di,cx
	add di,36
	mov [es:di], ax
	mov di,cx
	add di,38
	mov [es:di], ax
	
	mov di,cx
	add di,42
	mov [es:di], ax
	mov di,cx
	add di,44
	mov [es:di], ax
	
	mov di,cx
	add di,48
	mov [es:di], ax
	mov di,cx
	add di,50
	mov [es:di], ax
	
	mov di,cx
	add di,54
	mov [es:di], ax
	mov di,cx
	add di,56
	mov [es:di], ax
	
	mov di,cx
	add di,60
	mov [es:di], ax
	mov di,cx
	add di,62
	mov [es:di], ax
	
	mov di,cx
	add di,66
	mov [es:di], ax
	mov di,cx
	add di,68
	mov [es:di], ax
	
	mov di,cx
	add di,72
	mov [es:di], ax
	mov di,cx
	add di,74
	mov [es:di], ax
	
	mov di,cx
	add di,78
	mov [es:di], ax
	mov di,cx
	add di,80
	mov [es:di], ax
	
	mov di,cx
	add di,84
	mov [es:di], ax
	mov di,cx
	add di,86
	mov [es:di], ax
	
	mov di,cx
	add di,90
	mov [es:di], ax
	mov di,cx
	add di,92
	mov [es:di], ax
	
	mov di,cx
	add di,96
	mov [es:di], ax
	mov di,cx
	add di,98
	mov [es:di], ax
	call delay1
	sub bx,1
	cmp bx,0
	jne blinkloop
	
	add word[calscore],50
	push word[calscore]
	call printscore
	
	
	pop ds
	pop bx 
	pop dx
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	
	ret 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	


checkline:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	push ds
	push es
	checkll:
	
	mov ax,0xb800
	mov es,ax
	mov ds,ax
	mov dx,3370
	mov di,dx
	mov ax,0x0720
	mov bx,3370
	mov cl,8
	mov ch,17
outerloop:
	mov ch,17
	;mov bx,dx
	innerloop:
		mov ax,0x0720
		mov di,dx
		scasw
		je skipline
		add dx,6
		sub ch,1
		cmp ch,0
		jne innerloop
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		mov dx,bx
		mov di,dx
		mov si,dx
		sub si,320
		
		push bx
		call removeline
		
		
		
		mov dx,bx
		mov al,cl
		push cx
		mov di,dx
		movlinel:
		mov di,dx
		mov si,di
		sub si,320
		mov cx,50
		cld
		movblock:
			rep movsw
			;jnz movblock
			sub dx,320
			;sub di,50
			sub al,1
			cmp al,0
			jne movlinel
		
		pop cx
		mov dx,bx
		jmp outerloop
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
skipline:	
		sub bx,320
		mov dx,bx
		sub cl,1
		cmp cl,0
		
		jne outerloop
	
	pop es
	pop ds
	pop dx
	pop cx
	pop bx 
	pop ax
	pop bp
	
	
ret	 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

delayed:  mov cx,400;
        mov dx,500;
        repeat1:
                 repeat2:  sub dx,1;
                           jnz repeat2;
                mov dx,420;
                sub cx,1;
                jnz repeat1;
               
        ret;





GetRand:  push bp
          mov bp,sp
          push bx
		  push si
		  mov si,0
GetNum:
   call delayed
   mov ah, 00h         
   int 1Ah       

   mov  ax, dx
   xor  dx, dx
   mov  cx, 10    
   div  cx       
   cmp dx,5h
   ja GetNum
   cmp dx,0
   je GetNum
   mov bx,[bp+6]
   mov word[bx+si],dx
   add si,2;
   mov cx,140
   sub cx,si
   cmp cx,2
   ja GetNum

   pop si
   pop bx
   pop bp   
ret 4


	
printstrend:
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx
	push di

	mov ax, 0xb800
	mov es, ax  
	mov cl,3
	mov al, 80 
	mul cl  
	add ax, 24  
	shl ax, 1 
	mov di,ax  
	mov si, data5  
	mov cx, [datalen5]  
	mov ah, 112 
	
	cld
	nextchend1: 
	lodsb  
	stosw
call delay1	
	loop nextchend1  

	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 


printstrscore:
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx
	push di

	mov ax, 0xb800
	mov es, ax  
	
	mov di,598
	mov si, message69
	mov cx, [length69]  
	mov ah, 112 
	
	cld
	nextchend69: 
	lodsb  
	stosw
	loop nextchend69

	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
    push random
	push lenran
	call GetRand
	
	mov ax,0xb800
	mov es,ax
    call clrscr1
	call startscreen
	
	mov ah , 1
    int 0x21 
	
	call clrscr
	call background
	
	push 1824
	call printscore
	
 xor ax, ax
 mov es, ax ; point es to IVT base
 mov ax,word[es:8*4]
 mov [old],ax
 mov ax,word[es:8*4+2]
 mov [old+2],ax
 

 
 cli ; disable interrupts
 mov word [es:8*4], timer; store offset at n*4
 mov [es:8*4+2], cs ; store segment at n*4+2
 sti ; enable interrupts
	
	;push 1824
	;call printscore
	push 750
	call printhiscore
	
gameloop1:

	mov cx,[random+bx+2]
	cmp cx,1
	je ngm1
	cmp cx,2
	je ngm2
	cmp cx,3
	je ngm3
	cmp cx,4
	je ngm4
	cmp cx,5
	je ngm5
ngm1:
	push 2060
	call clearnext
	push 2060
	call Lshape
	jmp down
	
ngm2:	
	push 2060
	call clearnext
	push 2060
	call Nshape
	jmp down
	
ngm3:
	push 2060
	call clearnext
	push 2060
	call square
	jmp down
ngm4:
	push 2060
	call clearnext
	push 2060
	call verline
	jmp down
ngm5:
	push 2060
	call clearnext
	push 2060	
	call Tshape
	jmp down
	

down:
	mov ax,[random+bx]
	cmp ax,1
	je gm1
	cmp ax,2
	je gm2
	cmp ax,3
	je gm3
	cmp ax,4
	je gm4
	cmp ax,5
	je gm5
	
	jmp gameend
	
gm1:
	call downL
	jmp gameend
	
gm2:	
	call downN
	jmp gameend
	
gm3:	
	call downsquare
	jmp gameend
gm4:
	call downv
	jmp gameend
gm5:	
	call downT
	jmp gameend
	
gameend:
	
	call checkline
	
	mov bx,lenran1
	add word[bx],2
	mov bx,[lenran1]
	cmp bx,140
	jne gameloop1
	
end5:
	call delay4
	; call delay

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 push es
 xor ax, ax
 mov es, ax ; point es to IVT base
 cli
 mov ax,[old]
 mov [es:8*4],ax
  mov ax,word[old+2]
 mov [es:8*4+2],ax
 sti ; enable interrupts
 pop es

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;call bonus
	call delay
	call delay
	; call delay
	
	;call clrscr
	;call clrscr
	call clrspecial
	call printstrscore
	call printstrend
	call endscr
	;call printstrscor
	;push word[calscore]
	;call printscore



mov ax, 0x4c00 
int 0x21
