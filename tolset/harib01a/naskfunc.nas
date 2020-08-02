; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 오브젝트 파일 만드는 모드
[INSTRSET "i486p"]				; 486�̖��߂܂Ŏg�������Ƃ����L�q
[BITS 32]						; 32비트 모드용 기계어 만듬
[FILE "naskfunc.nas"]			; �\�[�X�t�@�C�������

		GLOBAL	_io_hlt,_write_mem8

[SECTION .text]

_io_hlt:	; void io_hlt(void);
		HLT
		RET

_write_mem8:	; void write_mem8(int addr, int data);
		MOV		ECX,[ESP+4]		; [ESP+4]��addr�������Ă���̂ł����ECX�ɓǂݍ���
		MOV		AL,[ESP+8]		; [ESP+8]��data�������Ă���̂ł����AL�ɓǂݍ���
		MOV		[ECX],AL
		RET
