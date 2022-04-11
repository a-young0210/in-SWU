
// SN2019111396View.h: CSN2019111396View 클래스의 인터페이스
//

#pragma once


class CSN2019111396View : public CScrollView
{
protected: // serialization에서만 만들어집니다.
	CSN2019111396View() noexcept;
	DECLARE_DYNCREATE(CSN2019111396View)

// 특성입니다.
public:
	CSN2019111396Doc* GetDocument() const;

// 작업입니다.
public:

// 재정의입니다.
public:
	virtual void OnDraw(CDC* pDC);  // 이 뷰를 그리기 위해 재정의되었습니다.
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual void OnInitialUpdate(); // 생성 후 처음 호출되었습니다.
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);

// 구현입니다.
public:
	virtual ~CSN2019111396View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// 생성된 메시지 맵 함수
protected:
	afx_msg void OnFilePrintPreview();
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnReverseImg();
	afx_msg void OnImghisto();
	afx_msg void OnHistoEqual();
	afx_msg void OnHistoStretchBasic();
	afx_msg void OnHistoStretch();
	afx_msg void OnHistoUpstretch();
	afx_msg void OnHistoSpecFilein();
	afx_msg void OnHistoSpecCal();
	afx_msg void OnEdgePrewitt();
	afx_msg void OnEdgeSobel();
	afx_msg void OnSharpeningLaplacian();
	afx_msg void OnBinarOtzu();
	afx_msg void OnBinarAdap();
	afx_msg void OnSmoothingBox();
};

#ifndef _DEBUG  // SN2019111396View.cpp의 디버그 버전
inline CSN2019111396Doc* CSN2019111396View::GetDocument() const
   { return reinterpret_cast<CSN2019111396Doc*>(m_pDocument); }
#endif

