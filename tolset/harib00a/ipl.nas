; haribote-ipl
; TAB=4

		ORG		0x7c00			; 메모리 안에서 로딩되는 곳

; 아래는 표준 FAT12 포맷 플로피 디스켓을 위한 내용들

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; 부트섹터 이름. 마음대로해도 ok
		DW		512				; 1섹터 크기(바이트 단위, 512)
		DB		1				; 클러스터 크기(1로 해야됨)
		DW		1				; 예약된 섹터수 
		DB		2				; 디스크 FAT 테이블 수
		DW		224				; 루트 디렉토리 엔트리 수 (보통 224엔트리)
		DW		2880				; 디스크 총섹터수
		DW		0xf0				; 미디어 타입
		DW		9				; 하나의 FAT 테이블 섹터 수
		DW		18				; 1트랙에 몇 색터가있는지
		DW		2				; 헤드의 수
		DD		0				; 파티션 없으므로 0
		DD		2880				; 드라이브 크기 한번더씀
		DB		0, 0, 0x29			; 필요하다고함
		DD		0xffffffff			; 볼륨 시리얼 번호
		DB		"HELLO-OS  "		; 디스크 이름
		DB		"FAT12   "			; 포멧이름
		RESB	18				; 18바이트 남김

; 프로그램 본체

entry:
		MOV		AX,0			; 레지스터 초기화
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg


; 추가된 부분

		MOV		AX,0x0820
		MOV		ES,AX
		MOV		CH,0			; 실린더 0
		MOV		DH,0			; 헤드 0
		MOV		CL,2			; 섹터 2 

		MOV		AH,0x02			; AH=0x02 :디스크 읽기
		MOV		AL,1			; 1섹터
		MOV		BX,0
		MOV		DL,0x00			; A 드라이브
		INT		0x13			; 디스크 BIOS 추출
		JC		error




fin:
		HLT						; CPU 정지 시킴
		JMP		fin				; 무한 루프

error:
		MOV		SI,msg

putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SI에 1 더함
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; 한 문자 표시 기능
		MOV		BX,15			; 컬러 코드
		INT		0x10			; 비디오 BIOS 호출
		JMP		putloop

msg:
		DB		0x0a, 0x0a		; 줄바꿈 문자 2개
		DB		"good i e yo you good good good"
		DB		0x0a			; 줄바꿈
		DB		0

		RESB	0x7dfe-$		; 나머지칸 0채우기

		DB		0x55, 0xaa
