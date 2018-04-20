data SEGMENT
NUM1 DB ?
NUM2 DB ?
NUM3 DB ?
msg1 DB 10,13,'Input number 1 : $'
msg2 DB 10,13,'Input number 2 : $'
msg3 DB 10,13,'Input number 3 : $'

order DB 10,13,'Order is : $ '

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

    	LEA DX,msg3
		MOV AH,9
		INT 21H

		MOV AH,1
		INT 21H

        SUB AL,30H
        MOV NUM3,AL

        MOV AL,NUM1
        CMP AL,NUM2
        JG isGreater12

        MOV AL,NUM3
        CMP AL,NUM2
        JG print3
        JMP print2

	isGreater12:
        MOV AL,NUM1
        CMP AL,NUM3
        JG print1
        JMP print3

    LEA DX,order
		MOV AH,9
		INT 21H

    print1:
        MOV DL,NUM1
        ADD DL,30H
        MOV AH,2
        INT 21H
        JMP endit

    print2:
        MOV DL,NUM2
        ADD DL,30H
        MOV AH,2
        INT 21H
        JMP endit

    print3:
        MOV DL,NUM3
        ADD DL,30H
        MOV AH,2
        INT 21H
        JMP endit

    endit:
		MOV AH,4ch
		INT 21h

code ENDS
END start
