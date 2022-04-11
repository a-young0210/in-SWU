
// ChildView.cpp: CChildView 클래스의 구현
//

#include "pch.h"
#include "framework.h"
#include "example5.h"
#include "ChildView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CChildView

CChildView::CChildView()
{
}

CChildView::~CChildView()
{
}


BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
END_MESSAGE_MAP()



// CChildView 메시지 처리기

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs) 
{
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;

	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW|CS_VREDRAW|CS_DBLCLKS, 
		::LoadCursor(nullptr, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW+1), nullptr);

	return TRUE;
}

void CChildView::OnPaint() 
{
	/*1
	CPaintDC dc(this);

	//해치 브러시
	CRect rect;
	GetClientRect(&rect);
	dc.SelectStockObject(NULL_PEN);
	CBrush brush2(HS_DIAGCROSS, RGB(255, 0, 0));
	dc.SelectObject(&brush2);
	dc.Rectangle(&rect);

	//솔리드 브러시
	CBrush brush1(RGB(255, 0, 0));
	dc.SelectStockObject(BLACK_PEN);
	dc.SelectObject(&brush1);
	dc.Rectangle(50, 50, 200, 200);
	*/

	/*2
	CPaintDC dc(this);

	//클라이언트 영역을 초록색 해치 브러시로 채운다.
	CRect rect3;
	GetClientRect(&rect3);
	CBrush brush6(HS_CROSS, RGB(0, 255, 0));
	dc.SelectObject(&brush6);
	dc.Rectangle(&rect3);

	//경계선이 검은색이고 내부가 비어 있는 타원을 그린다.
	dc.SelectStockObject(BLACK_PEN);
	dc.SelectStockObject(NULL_BRUSH);
	dc.Ellipse(100, 50, 200, 200);
	dc.SelectStockObject(DEVICE_DEFAULT_FONT);
	dc.SetTextAlign(TA_CENTER | TA_BASELINE);
	dc.TextOut(150, 125, _T("타원(Ellipse)"));

	//경계선이 없고 내부가 밝은 회색으로 채워진 다각형을 그린다.
	dc.SelectStockObject(NULL_PEN);
	dc.SelectStockObject(LTGRAY_BRUSH);
	POINT points[] = { {250, 50}, {450, 150}, {300, 200}, {250, 150} };
	dc.Polygon(points, 4);
	dc.SelectStockObject(SYSTEM_FIXED_FONT);
	dc.SetTextAlign(TA_CENTER | TA_BASELINE);
	dc.TextOut(340, 150, _T("사각형(Tetragon)"));
	*/

	/*3
	CPaintDC dc(this);

	CRgn rgn1, rgn2, rgn3, rgn4;
	rgn1.CreateRectRgn(0, 0, 1, 1);	//임의로 만든 리전
	rgn2.CreateRectRgn(10, 10, 100, 100);
	rgn3.CreateEllipticRgn(50, 50, 200, 200);
	rgn4.CreateRectRgn(0, 0, 1, 1);	//임의로 만든 리전
	rgn1.CombineRgn(&rgn2, &rgn3, RGN_XOR);
	CBrush brush7(RGB(0, 0, 255));
	dc.FillRgn(&rgn1, &brush7);
	rgn4.CombineRgn(&rgn2, &rgn3, RGN_AND);
	CBrush brush8(RGB(255, 0, 0));
	dc.FillRgn(&rgn4, &brush8);
	*/

	/*4
	CPaintDC dc(this); // 그리기를 위한 디바이스 컨텍스트입니다.

	 //패턴 브러시
	CRect rect2;
	GetClientRect(&rect2);
	CBitmap bitmap;
	bitmap.LoadBitmap(IDB_BITMAP2);
	CBrush brush5(&bitmap);
	dc.SelectObject(&brush5);
	dc.Rectangle(&rect2);
	dc.RoundRect(450, 50, 600, 200, 50, 50);


	//솔리드 브러시
	CBrush brush3(RGB(255, 0, 0));
	dc.SelectObject(&brush3);
	dc.Rectangle(50, 50, 200, 200);

	//해치 브러시
	CBrush brush4(HS_DIAGCROSS, RGB(255, 0, 0));
	dc.SelectObject(&brush4);
	dc.Ellipse(250, 50, 400, 200);
	*/
	
}

