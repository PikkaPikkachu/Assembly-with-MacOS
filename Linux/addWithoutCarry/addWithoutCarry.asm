data SEGMENT
n1 DB 03h
n2 DB 07h
data ENDS

code SEGMENT
assume CS:code, DS:data
start:

MOV AX,data
MOV DS,AX

MOV AL,n1
ADD AL,n2

ADD AL,30h ; decimal to ascii
MOV DL,AL

MOV AH,02h ; character output
INT 21h

MOV AH,4ch ;exit
INT 21h

code ENDS
END start
