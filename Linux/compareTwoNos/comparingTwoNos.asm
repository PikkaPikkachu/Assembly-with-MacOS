data SEGMENT
NUM1 DB ?
NUM2 DB ?
msg1 DB 10,13,'Input number 1 : $'
msg2 DB 10,13,'Input number 2 : $'
equal DB 10,13,'Equal  : $ '
greater DB 10,13,'Greater  : $'
smaller DB 10,13,'Smaller : $'

data ENDS

code SEGMENT
	assume CS:code,DS:data

	start:
		MOV AX,data
		MOV DS,AX

    	LEA DX,msg1
		MOV AH,9
		INT 21H

		MOV AH,1
		INT 21H

        SUB AL,30H
        MOV NUM1,AL

    	LEA DX,msg2
		MOV AH,9
		INT 21H

		MOV AH,1
		INT 21H

        SUB AL,30H
        MOV NUM2,AL

        CMP AL,NUM1
        JE isEqual
        JG isGreater

    isSmaller:
		LEA DX,smaller
		MOV AH,9
		INT 21H
        JMP endit

    isEqual:
		LEA DX,equal
		MOV AH,9
		INT 21H
        JMP endit

	isGreater:
		LEA DX,greater
		MOV AH,9
		INT 21H
        JMP endit

	endit:
		MOV AH,4ch
		INT 21h

code ENDS
END start
