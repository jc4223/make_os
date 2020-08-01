void io_hlt(void);

void HariMain(void)
{

fin:
	io_hlt(); /* c언어에선 HLT 할수 없음 */
	goto fin;

}
