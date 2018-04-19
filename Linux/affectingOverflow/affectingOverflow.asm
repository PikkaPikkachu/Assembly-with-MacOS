data SEGMENT
NUM1 DB ?
NUM2 DB ?
msg1 DB 10,13,'Input 1st number : $'
msg2 DB 10,13,'Input 2nd number : $'
caff DB 10,13,'Carry flag =1 i.e. affected.$'
cnotaff DB 10,13,'Carry flag not affected. $'
oaff DB 10,13,'overflow flag =1 i.e. affected.$'
onotaff DB 10,13,'overflow not affected.$'
data ENDS

code SEGMENT
	assume CS:code,DS:data

	start:
		MOV AX,data
		MOV DS,AX
		; MOV AL,a
		; MOV BL,b

		LEA DX,msg1
		MOV AH,9
		INT 21H

		MOV AH,1
		INT 21H

		MOV NUM1,AL

		LEA DX,msg2
		MOV AH,9
		INT 21H

		MOV AH,1
		INT 21H

		MOV NUM2,AL

		MOV AL,NUM1
		SUB AL,NUM2

		; SUB AL,BL
		JO oa
		JNO ona
	oa:
		MOV AH,09h
		LEA DX,oaff
		INT 21h
		JC ca
		JNC cna
	ona:
		MOV AH,09h
		LEA DX,onotaff
		INT 21h
		JC ca
		JNC cna

	ca:
		MOV AH,09h
		LEA DX,caff
		INT 21h
		JMP endit

	cna:
		MOV AH,09h
		LEA DX,cnotaff
		INT 21h

	endit:
		MOV AH,4ch
		INT 21h

code ENDS
END start
