
// 2019111396Practices08View.cpp: CMy2019111396Practices08View 클래스의 구현
//

#include "pch.h"
#include "framework.h"
// SHARED_HANDLERS는 미리 보기, 축소판 그림 및 검색 필터 처리기를 구현하는 ATL 프로젝트에서 정의할 수 있으며
// 해당 프로젝트와 문서 코드를 공유하도록 해 줍니다.
#ifndef SHARED_HANDLERS
#include "2019111396Practices08.h"
#endif

#include "2019111396Practices08Doc.h"
#include "2019111396Practices08View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CMy2019111396Practices08View

IMPLEMENT_DYNCREATE(CMy2019111396Practices08View, CFormView)

BEGIN_MESSAGE_MAP(CMy2019111396Practices08View, CFormView)
	ON_WM_CONTEXTMENU()
	ON_WM_RBUTTONUP()
	ON_BN_CLICKED(IDC_RIGHT, &CMy2019111396Practices08View::OnBnClickedRight)
	ON_BN_CLICKED(IDC_LEFT, &CMy2019111396Practices08View::OnBnClickedLeft)
END_MESSAGE_MAP()

// CMy2019111396Practices08View 생성/소멸

CMy2019111396Practices08View::CMy2019111396Practices08View() noexcept
	: CFormView(IDD_MY2019111396PRACTICES08_FORM)
{
	// TODO: 여기에 생성 코드를 추가합니다.

}

CMy2019111396Practices08View::~CMy2019111396Practices08View()
{
}

void CMy2019111396Practices08View::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_LEFT, m_left);
	DDX_Control(pDX, IDC_RIGHT, m_right);
	DDX_Control(pDX, IDC_COMBO1, m_combo1);
	DDX_Control(pDX, IDC_COMBO2, m_combo2);
}

BOOL CMy2019111396Practices08View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	//  Window 클래스 또는 스타일을 수정합니다.

	return CFormView::PreCreateWindow(cs);
}

void CMy2019111396Practices08View::OnInitialUpdate()
{
	CFormView::OnInitialUpdate();
	GetParentFrame()->RecalcLayout();
	ResizeParentToFit();

}

void CMy2019111396Practices08View::OnRButtonUp(UINT /* nFlags */, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CMy2019111396Practices08View::OnContextMenu(CWnd* /* pWnd */, CPoint point)
{
#ifndef SHARED_HANDLERS
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
#endif
}


// CMy2019111396Practices08View 진단

#ifdef _DEBUG
void CMy2019111396Practices08View::AssertValid() const
{
	CFormView::AssertValid();
}

void CMy2019111396Practices08View::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}

CMy2019111396Practices08Doc* CMy2019111396Practices08View::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMy2019111396Practices08Doc)));
	return (CMy2019111396Practices08Doc*)m_pDocument;
}
#endif //_DEBUG


// CMy2019111396Practices08View 메시지 처리기


void CMy2019111396Practices08View::OnLbnSelchangeList2()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
}


void CMy2019111396Practices08View::OnBnClickedRight()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	int nIndex = m_combo1.GetCurSel();
	if (nIndex != LB_ERR) {
		CString str;
		m_combo1.GetLBText(nIndex, str);
		m_combo1.DeleteString(nIndex);
		m_combo1.SetCurSel(nIndex);	//삭제된 다음 위치의 항목이 자동 선택된
		m_combo2.AddString(str);
		AfxGetMainWnd()->SetWindowText(_T("왼쪽에서 오른쪽으로..."));
	}
}




void CMy2019111396Practices08View::OnBnClickedLeft()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	int nIndex = m_combo2.GetCurSel();
	if (nIndex != LB_ERR) {
		CString str;
		m_combo2.GetLBText(nIndex, str);
		m_combo2.DeleteString(nIndex);
		m_combo2.SetCurSel(nIndex);	//삭제된 다음 위치의 항목이 자동 선택된
		m_combo1.AddString(str);
		AfxGetMainWnd()->SetWindowText(_T("오른쪽에서 왼쪽으로..."));
	}
}
