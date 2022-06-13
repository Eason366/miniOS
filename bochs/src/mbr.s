SECTION MBR VSTART=0X7C00 ;程序加载到0X7C00

;----------------------初始化寄存器----------------------
MOV AX, CS
MOV DS, AX
MOV ES, AX
MOV SS, AX
MOV FS, AX 
MOV SP, 0X7C00


;清屏利用OX06 号功能，上卷全部行，清屏。
; -----------------------------------------------------------
; INT OXLO 功能号： OX06 功能描述：上卷窗口
; -----------------------------------------------------------
;输入：
;AH 功能号＝ OX06
; AL ＝上卷的行数（如果为0 ，表示全部）
;BH ＝上卷行属性
; (CL, CH) ＝窗口左上角的（ X , Y ）位置
; (DL, DH) ＝窗口右下角的（ X, Y ）位置

MOV AH,0X6
MOV AL,0X0
MOV BX,0X700
MOV CX,0X0      ;(0,0)
MOV DX,0X184F   ;(80,25)

INT 0X10

;获取光标位置
MOV AH, 3
MOV BH, 0
INT 0X10
;获取光标位置结束

;打印字符串 message
MOV AX, message
MOV BP, AX

MOV CX, 5
MOV AX, 0X1301
MOV BX, 0X02
MOV DL, 0X0A
INT 0X10

JMP $

message DB "1 MBR"
TIMES 510-($-$$) DB 0
DB 0X55, 0XAA