; haribote-os
; TAB=4

		ORG		0xc200			; harybote.sys가 로딩되는 메모리 주소

		MOV		AL,0x10			; VGA 그래픽스, 320x200x8bit 컬러
		MOV		AH,0x00
		INT		0x10
fin:
		HLT
		JMP		fin
