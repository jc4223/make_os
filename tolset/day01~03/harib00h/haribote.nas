; haribote-os
; TAB=4

; BOOT_INFO 관계
CYLS	EQU		0x0ff0			; 부트섹터 설정
LEDS	EQU		0x0ff1
VMODE	EQU		0x0ff2			; 색상 갯수에 관한 정의, 몇비트 컬러인지
SCRNX	EQU		0x0ff4			; 해상도 x
SCRNY	EQU		0x0ff6			; 해상도 y
VRAM	EQU		0x0ff8			; 그래픽 버퍼 개시번지
		
		ORG		0xc200			; harybote.sys가 로딩되는 메모리 주소

		MOV		AL,0x10			; VGA 그래픽스, 320x200x8bit 컬러
		MOV		AH,0x00
		MOV		BYTE [VMODE],8	; 화면 모드를 기록함.
		MOV		WORD [SCRNX],320
		MOV		WORD [SCRNY],200
		MOV		DWORD [VRAM],0x000a0000

; 키보드 LED 상태를 BIOS가 알려줌

		MOV		AH,0x02
		INT		0x16 			; keyboard BIOS
		MOV		[LEDS],AL

fin:
		HLT
		JMP		fin
