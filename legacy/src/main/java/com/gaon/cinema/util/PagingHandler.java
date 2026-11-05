package com.gaon.cinema.util;

public class PagingHandler {
	private int searchtotal;		//�˻� ���� ����
	private int pagesize;				//�������� ũ��
	private int pagelistsize;		//������ ����Ʈ�� ũ��
	private int start;					//���� �۹�ȣ
	private int end;						//�� �۹�ȣ
	private int pagenum;				//���� �������� ��ġ
	private int pagetotal;			//��ü �������� ����
	private int pagestart;			//���� ������
	private int pageend;				//�� ������
	private int pagelistnum;		//���� ������ ����Ʈ�� ��ġ
	private int pagelisttotal;	//�� ������ ����Ʈ�� ����
	
	public int getSearchtotal() { return searchtotal; }
	public int getPagesize() { return pagesize; }
	public int getPagelistsize() { return pagelistsize; }
	public int getStart() { return start; }
	public int getEnd() { return end; }
	public int getPagenum() { return pagenum; }
	public int getPagetotal() { return pagetotal; }
	public int getPagestart() { return pagestart; }
	public int getPageend() { return pageend; }
	public int getPagelistnum() { return pagelistnum; }
	public int getPagelisttotal() { return pagelisttotal; }
	
	public PagingHandler(int searchtotal, int pagesize, int pagelistsize, int pagenum) {
		/* �˻� �� ���� */
		this.searchtotal = searchtotal;
		/* ������ ũ�� ���� */
		this.pagesize = pagesize;
		/* ������ ����Ʈ ũ�� ����*/
		this.pagelistsize = pagelistsize;
		/* ������ ��ȣ ���� */
		if(pagenum != 0) { this.pagenum = pagenum; }
		else { this.pagenum = pagenum = 1; }
		
		/* ���� �۹�ȣ ���� */
		this.start = (pagenum * pagesize) + 1 - pagesize;
		/* �� �۹�ȣ ���� */
		this.end = pagenum * pagesize;
		/* �� ������ ���� ���� */
		if(searchtotal % pagesize == 0) { this.pagetotal = searchtotal / pagesize; }
		else { this.pagetotal = (searchtotal / pagesize) + 1; }
		/* �� ������ ����Ʈ ���� ���� */
		if((pagetotal % pagesize) == 0 || (pagelistsize == 1) || (pagelistsize == pagetotal)) { this.pagelisttotal = pagetotal / pagelistsize; }
		else { this.pagelisttotal = (pagetotal / pagelistsize) + 1; }
		/* ������ ����Ʈ ��ȣ ���� */
		if(pagenum % pagelistsize == 0) { this.pagelistnum = pagenum / pagelistsize; }
		else { this.pagelistnum = (pagenum / pagelistsize) + 1; }
		/* ���� ������ ���� */
		this.pagestart = (pagelistnum * pagelistsize + 1) - pagelistsize;
		/* �� ������ ���� */
		if(pagelistnum > (pagetotal / pagelistsize)) { this.pageend = pagetotal; }
		else { this.pageend = pagelistnum * pagelistsize; }
	}
}
