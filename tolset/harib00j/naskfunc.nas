; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 오브젝트 파일 만드는 모드
[BITS 32]						; 32비트 모드용 기계어 만듬


; 오브젝트 파일을 위한 정보

[FILE "naskfunc.nas"]			; 소스 파일명 정보

		GLOBAL	_io_hlt			; 이 프로그램에 포함된 함수명


; 아래는 실제 함수

[SECTION .text]		; 오브젝트 파일에서 다음의 함수가 있으면 어셈블리어로 작성

_io_hlt:	; void io_hlt(void);
		HLT
		RET
