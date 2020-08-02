void io_hlt(void);

void HariMain(void)
{
	int i;
	char *p;

	for (i = 0xa0000; i <= 0xaffff; i++) {

		p = i;
		*p = i & 0x0f;

		/* ����� write_mem8(i, i & 0x0f); �̑���ɂȂ� */
	}

	for (;;) {
		io_hlt();
	}
}
