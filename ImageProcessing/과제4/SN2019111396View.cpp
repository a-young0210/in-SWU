
// SN2019111396View.cpp: CSN2019111396View 클래스의 구현
//

#include "pch.h"
#include "framework.h"
// SHARED_HANDLERS는 미리 보기, 축소판 그림 및 검색 필터 처리기를 구현하는 ATL 프로젝트에서 정의할 수 있으며
// 해당 프로젝트와 문서 코드를 공유하도록 해 줍니다.
#ifndef SHARED_HANDLERS
#include "SN2019111396.h"
#endif

#include "SN2019111396Doc.h"
#include "SN2019111396View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CSN2019111396View

IMPLEMENT_DYNCREATE(CSN2019111396View, CScrollView)

BEGIN_MESSAGE_MAP(CSN2019111396View, CScrollView)
	// 표준 인쇄 명령입니다.
	ON_COMMAND(ID_FILE_PRINT, &CScrollView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, &CScrollView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, &CSN2019111396View::OnFilePrintPreview)
	ON_WM_CONTEXTMENU()
	ON_WM_RBUTTONUP()
	ON_COMMAND(IDM_REVERSE_IMG, &CSN2019111396View::OnReverseImg)
	ON_COMMAND(IDM_CONST_ADD, &CSN2019111396View::OnConstAdd)
	ON_COMMAND(IDM_CONST_SUB, &CSN2019111396View::OnConstSub)
	ON_COMMAND(IDM_CONST_MUL, &CSN2019111396View::OnConstMul)
	ON_COMMAND(IDM_CONST_DIV, &CSN2019111396View::OnConstDiv)
	ON_COMMAND(IDM_CONTRAST_UP, &CSN2019111396View::OnContrastUp)
	ON_COMMAND(IDM_CONTRAST_DOWN, &CSN2019111396View::OnContrastDown)
	ON_COMMAND(IDM_SALT_PEPPER, &CSN2019111396View::OnSaltPepper)
	ON_COMMAND(IDM_BITPLANE_7, &CSN2019111396View::OnBitplane7)
	ON_COMMAND(IDM_BITPLANE_4, &CSN2019111396View::OnBitplane4)
	ON_COMMAND(IDM_BITPLANE_0, &CSN2019111396View::OnBitplane0)
	ON_COMMAND(IDM_WATERMARK_INSERTION, &CSN2019111396View::OnWatermarkInsertion)
	ON_COMMAND(IDM_WATERMARK_DETECTION, &CSN2019111396View::OnWatermarkDetection)
END_MESSAGE_MAP()

// CSN2019111396View 생성/소멸

CSN2019111396View::CSN2019111396View() noexcept
{
	// TODO: 여기에 생성 코드를 추가합니다.
	height = width = 256;
	int rwsize = (((width * 8) + 31) / 32 * 4);	// 4바이트의 배수여야 함
	BmInfo = (BITMAPINFO*)malloc(sizeof(BITMAPINFOHEADER) * 256 * sizeof(RGBQUAD));

	BmInfo->bmiHeader.biBitCount = 8;
	BmInfo->bmiHeader.biClrImportant = 256;
	BmInfo->bmiHeader.biClrUsed = 256;
	BmInfo->bmiHeader.biCompression = 0;	// BI_RGB = 0
	BmInfo->bmiHeader.biHeight = height;
	BmInfo->bmiHeader.biPlanes = 1;
	BmInfo->bmiHeader.biSize = 40;	// BITMAPINFOHEABER 크기
	BmInfo->bmiHeader.biSizeImage = rwsize * height;
	BmInfo->bmiHeader.biWidth = width;
	BmInfo->bmiHeader.biXPelsPerMeter = 0;
	BmInfo->bmiHeader.biYPelsPerMeter = 0;
	for (int i = 0; i < 256; i++)	// Palette number is 256
	{
		BmInfo->bmiColors[i].rgbRed = BmInfo->bmiColors[i].rgbGreen = BmInfo->bmiColors[i].rgbBlue = i;
		BmInfo->bmiColors[i].rgbReserved = 0;
	}
}

CSN2019111396View::~CSN2019111396View()
{
	free(BmInfo);
}

BOOL CSN2019111396View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	//  Window 클래스 또는 스타일을 수정합니다.

	return CScrollView::PreCreateWindow(cs);
}

// CSN2019111396View 그리기

void CSN2019111396View::OnDraw(CDC* pDC)	//화면에 입출력 데이터를 표시할 때 사용
{
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: 여기에 원시 데이터에 대한 그리기 코드를 추가합니다.
	for (int i = 0; i < height; i++)
		for (int j = 0; j < width; j++)
			m_RevImg[i][j] = pDoc->m_InImg[height - i - 1][j];

	SetDIBitsToDevice(pDC->GetSafeHdc(), 0, 0, width, height,
		0, 0, 0, height, m_RevImg, BmInfo, DIB_RGB_COLORS);

	for (int i = 0; i < height; i++)
		for (int j = 0; j < width; j++)
			m_RevImg[i][j] = pDoc->m_OutImg[height - i - 1][j];

	SetDIBitsToDevice(pDC->GetSafeHdc(), 300, 0, width, height,
		0, 0, 0, height, m_RevImg, BmInfo, DIB_RGB_COLORS);


	/*for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			unsigned char InVal = pDoc->m_InImg[i][j];
			unsigned char OutVal = pDoc->m_OutImg[i][j];

			pDC->SetPixel(j, i, RGB(InVal, InVal, InVal));
			pDC->SetPixel(j + 300, i, RGB(OutVal, OutVal, OutVal));
		}
	}*/
}

void CSN2019111396View::OnInitialUpdate()
{
	CScrollView::OnInitialUpdate();

	CSize sizeTotal;
	// TODO: 이 뷰의 전체 크기를 계산합니다.
	sizeTotal.cx = sizeTotal.cy = 100;
	SetScrollSizes(MM_TEXT, sizeTotal);
}


// CSN2019111396View 인쇄


void CSN2019111396View::OnFilePrintPreview()
{
#ifndef SHARED_HANDLERS
	AFXPrintPreview(this);
#endif
}

BOOL CSN2019111396View::OnPreparePrinting(CPrintInfo* pInfo)
{
	// 기본적인 준비
	return DoPreparePrinting(pInfo);
}

void CSN2019111396View::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: 인쇄하기 전에 추가 초기화 작업을 추가합니다.
}

void CSN2019111396View::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: 인쇄 후 정리 작업을 추가합니다.
}

void CSN2019111396View::OnRButtonUp(UINT /* nFlags */, CPoint point)
{
	ClientToScreen(&point);
	OnContextMenu(this, point);
}

void CSN2019111396View::OnContextMenu(CWnd* /* pWnd */, CPoint point)
{
#ifndef SHARED_HANDLERS
	theApp.GetContextMenuManager()->ShowPopupMenu(IDR_POPUP_EDIT, point.x, point.y, this, TRUE);
#endif
}


// CSN2019111396View 진단

#ifdef _DEBUG
void CSN2019111396View::AssertValid() const
{
	CScrollView::AssertValid();
}

void CSN2019111396View::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}

CSN2019111396Doc* CSN2019111396View::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CSN2019111396Doc)));
	return (CSN2019111396Doc*)m_pDocument;
}
#endif //_DEBUG


// CSN2019111396View 메시지 처리기


void CSN2019111396View::OnReverseImg()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
			pDoc->m_OutImg[i][j] = 255 - pDoc->m_InImg[i][j];
	}

	Invalidate(FALSE);
}




void CSN2019111396View::OnConstAdd()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			int tempVal = pDoc->m_InImg[i][j] + 60;
			tempVal = tempVal > 255 ? 255 : tempVal;
			pDoc->m_OutImg[i][j] = (unsigned char)tempVal;
		}
	}
	Invalidate(FALSE);
}


void CSN2019111396View::OnConstSub()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			int tempVal = pDoc->m_InImg[i][j] - 60;
			tempVal = tempVal > 255 ? 255 : tempVal;
			pDoc->m_OutImg[i][j] = (unsigned char)tempVal;
		}
	}
	Invalidate(FALSE);
}


void CSN2019111396View::OnConstMul()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			//int tempVal = pDoc->m_InImg[i][j] * 1.4;
			int tempVal = (int)(pDoc->m_InImg[i][j] * 2.0);
			tempVal = tempVal > 255 ? 255 : tempVal;
			pDoc->m_OutImg[i][j] = (unsigned char)tempVal;
		}
	}
	Invalidate(FALSE);
}


void CSN2019111396View::OnConstDiv()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			//int tempVal = pDoc->m_InImg[i][j]/1.4;
			int tempVal = (int)(pDoc->m_InImg[i][j] / 2.0);
			tempVal = tempVal < 0 ? 0 : tempVal;
			tempVal = tempVal > 255 ? 255 : tempVal;
			pDoc->m_OutImg[i][j] = (unsigned char)tempVal;
		}
	}
	Invalidate(FALSE);
}


void CSN2019111396View::OnContrastUp()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	double slope = 2.0;
	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			int tempVal = (int)(128 + slope * (pDoc->m_InImg[i][j] - 128));
			tempVal = tempVal < 0 ? 0 : tempVal;
			tempVal = tempVal > 255 ? 255 : tempVal;
			pDoc->m_OutImg[i][j] = (unsigned char)tempVal;
		}
	}
	Invalidate(FALSE);

}


void CSN2019111396View::OnContrastDown()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	double slope = 1 / 2.0;
	for (int i = 0; i < 256; i++)
	{
		for (int j = 0; j < 256; j++)
		{
			int tempVal = (int)(128 + slope * (pDoc->m_InImg[i][j] - 128));
			tempVal = tempVal < 0 ? 0 : tempVal;
			tempVal = tempVal > 255 ? 255 : tempVal;
			pDoc->m_OutImg[i][j] = (unsigned char)tempVal;
		}
	}
	Invalidate(FALSE);
}


void CSN2019111396View::OnSaltPepper()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	double rand_val;
	srand(time(0));
	//unsigned char LUT[256];
	for (int i = 0; i < height; i++) {
		for (int j = 0; j < width; j++) {
			rand_val = rand() % 3 - 1;
			if (rand_val > (1 - 2 / 100)) {
				pDoc->m_InImg1[i][j] = pDoc->m_InImg[i][j];
				pDoc->m_OutImg[i][j] = pDoc->m_InImg1[i][j] = 0;
			}
			else if (rand_val < (1 - 2 / 100)) {
				pDoc->m_InImg1[i][j] = pDoc->m_InImg[i][j];
				pDoc->m_OutImg[i][j] = pDoc->m_InImg1[i][j] = 255;
			}
		}
	}
	Invalidate(FALSE);
}

typedef unsigned char uchar;

void CSN2019111396View::OnBitplane7()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	int position = 7;

	uchar mask = 0x01;
	mask <<= position;

	for (int i = 0;i < 256;i++)
		for (int j = 0; j < 256; j++) {
			if ((mask & pDoc->m_InImg[i][j]) == pow(2, position))
			{
				pDoc->m_OutImg[i][j] = 255;
			}
			else
			{
				pDoc->m_OutImg[i][j] = 0;
			}
		}

	Invalidate(FALSE);
}


void CSN2019111396View::OnBitplane4()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	int position = 4;

	uchar mask = 0x01;
	mask <<= position;

	for (int i = 0;i < 256;i++)
		for (int j = 0; j < 256; j++) {
			if ((mask & pDoc->m_InImg[i][j]) == pow(2, position))
			{
				pDoc->m_OutImg[i][j] = 255;
			}
			else
			{
				pDoc->m_OutImg[i][j] = 0;
			}
		}

	Invalidate(FALSE);
}



void CSN2019111396View::OnBitplane0()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;
	int position = 0;

	uchar mask = 0x01;
	mask <<= position;
	for (int i = 0;i < 256;i++)
		for (int j = 0; j < 256; j++) {
			if ((mask & pDoc->m_InImg[i][j]) == pow(2, position))
			{
				pDoc->m_OutImg[i][j] = 255;
			}
			else
			{
				pDoc->m_OutImg[i][j] = 0;
			}
		}

	Invalidate(FALSE);
}


void CSN2019111396View::OnWatermarkInsertion()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	int position = 0;

	uchar mask = 0x01;
	mask <<= position;

	for (int i = 0; i < 64; i++) {
		for (int j = 0; j < 256; j++) {
			   pDoc->m_InImg[j][i] = 0;
		}
	}
	for (int i = 64; i < 128; i++) {
		for (int j = 0; j < 256; j++) {
				pDoc->m_InImg1[j][i] = 255;
		}
	}
	for (int i = 128; i < 192; i++) {
		for (int j = 0; j < 256; j++) {
				pDoc->m_InImg1[j][i] = 0;
		}
	}
	for (int i = 192; i < 256; i++) {
		for (int j = 0; j < 256; j++) {
				pDoc->m_InImg1[j][i] = 255;
		}
	}



	FILE* outfile2;
	fopen_s(&outfile2, "lenna2.raw", "wb");
	fwrite(pDoc->m_OutImg, sizeof(char), 256 * 256, outfile2);
	fclose(outfile2);

	Invalidate(FALSE);
}


void CSN2019111396View::OnWatermarkDetection()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CSN2019111396Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	FILE* infile;
	errno_t err = fopen_s(&infile, "lenna2", "rb");
	if (err != 0) { printf("File open error!!"); return; }
	fread(pDoc->m_InImg1, sizeof(char), 256 * 256, infile);
	fclose(infile);

	int position = 0;

	uchar mask = 0x01;
	mask <<= position;

	for (int i = 0;i < 256;i++)
		for (int j = 0; j < 256; j++) {
			if ((mask & pDoc->m_InImg2[i][j]) == pow(2, position))
			{
				pDoc->m_OutImg[i][j] = 255;
			}
			else
			{
				pDoc->m_OutImg[i][j] = 0;
			}
		}

	Invalidate(FALSE);
}
