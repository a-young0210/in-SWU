
// EditCtrlView.cpp: CEditCtrlView 클래스의 구현
//

#include "pch.h"
#include "framework.h"
// SHARED_HANDLERS는 미리 보기, 축소판 그림 및 검색 필터 처리기를 구현하는 ATL 프로젝트에서 정의할 수 있으며
// 해당 프로젝트와 문서 코드를 공유하도록 해 줍니다.
#ifndef SHARED_HANDLERS
#include "EditCtrl.h"
#endif

#include "EditCtrlDoc.h"
#include "EditCtrlView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CEditCtrlView

IMPLEMENT_DYNCREATE(CEditCtrlView, CFormView)

BEGIN_MESSAGE_MAP(CEditCtrlView, CFormView)
	ON_WM_CONTEXTMENU()
	ON_WM_RBUTTONUP()
	ON_EN_CHANGE(IDC_MYEDIT, &CEditCtrlView::OnEnChangeMyedit)
	ON_EN_MAXTEXT(IDC_MYEDIT, &CEditCtrlView::OnEnMaxtextMyedit)
END_MESSAGE_MAP()

// CEditCtrlView 생성/소멸

CEditCtrlView::CEditCtrlView() noexcept
	: CFormView(IDD_EDITCTRL_FORM)
{
	// TODO: 여기에 생성 코드를 추가합니다.

}

CEditCtrlView::~CEditCtrlView()
{
}

void CEditCtrlView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_MYEDIT, m_edit);
	DDX_Control(pDX, IDC_MYSTATIC, m_static);
}

BOOL CEditCtrlView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	//  Window 클래스 또는 스타일을 수정합니다.

	return CFormView::PreCreateWindow(cs);
}

void CEditCtrlView::OnInitialUpdate()
{
	CFormView::OnInitialUpdate();
	GetParentFrame()->RecalcLayout();
	ResizeParentToFit();
	m_edit.SetLimitText(20);

}

void CEditCtrlView::OnRButtonUp(UINT /* nFlags */, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CEditCtrlView::OnContextMenu(CWnd* /* pWnd */, CPoint point)
{
#ifndef SHARED_HANDLERS
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
#endif
}


// CEditCtrlView 진단

#ifdef _DEBUG
void CEditCtrlView::AssertValid() const
{
	CFormView::AssertValid();
}

void CEditCtrlView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}

CEditCtrlDoc* CEditCtrlView::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CEditCtrlDoc)));
	return (CEditCtrlDoc*)m_pDocument;
}
#endif //_DEBUG


// CEditCtrlView 메시지 처리기


void CEditCtrlView::OnEnChangeMyedit()
{
	// TODO:  RICHEDIT 컨트롤인 경우, 이 컨트롤은
	// CFormView::OnInitDialog() 함수를 재지정 
	//하고 마스크에 OR 연산하여 설정된 ENM_CHANGE 플래그를 지정하여 CRichEditCtrl().SetEventMask()를 호출하지 않으면
	// 이 알림 메시지를 보내지 않습니다.

	// TODO:  여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CString str;
	m_edit.GetWindowText(str);
	m_static.SetWindowTextW(str);
}


void CEditCtrlView::OnEnMaxtextMyedit()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	MessageBox(_T("최대 길이 도달!"), _T("오류"), MB_ICONERROR);
}
