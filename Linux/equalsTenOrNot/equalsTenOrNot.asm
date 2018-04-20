data SEGMENT
NUM1 DB ?
NUM2 DB ?
msg1 DB 10,13,'Input number : $'
equal DB 10,13,'Equal to 10 : $ '
greater DB 10,13,'Greater than 10 : $'
smaller DB 10,13,'Smaller than 10 : $'

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

        CMP AL,10H
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
