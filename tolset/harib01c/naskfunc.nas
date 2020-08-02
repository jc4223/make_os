; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 오브젝트 파일 만드는 모드
[INSTRSET "i486p"]				; 이 프로그램이 486 아키텍처 용 프로그램임을 nask에 알림
[BITS 32]						; 32비트 모드용 기계어 만듬
[FILE "naskfunc.nas"]			; �\�[�X�t�@�C�������

		GLOBAL	_io_hlt

[SECTION .text]

_io_hlt:	; void io_hlt(void);
		HLT
		RET
