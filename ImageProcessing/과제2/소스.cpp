#include <stdio.h>
#include <windows.h>
#define WIDTHBYTES(bits)	(((bits) + 31) / 32 * 4)  //영상의 가로줄은 4바이트의 배수
#define BYTE unsigned char

void main()
{
	FILE* infile, *outfile;
	errno_t err = fopen_s(&infile, "talent.bmp", "rb");	//입력할 파일을 오픈
	if (err != 0) { printf("There is no file!!!\n"); return; }

	//BMP헤드정보의 입력
	BITMAPFILEHEADER hf;	//"파일정보헤드" 변수 선언
	BITMAPINFOHEADER hInfo;	//"영상정보헤드" 변수 선언
	fread(&hf, sizeof(BITMAPFILEHEADER), 1, infile);	//파일정보헤드 읽음
	if (hf.bfType != 0x4D42) exit(1);	//파일 타입이 "BM" (0x4D42)인지 검사
	fread(&hInfo, sizeof(BITMAPINFOHEADER), 1, infile);	//영상정보헤드 읽음
	if (hInfo.biBitCount != 8) { printf("Bad File format!!"); return; }	//흑백

	//팔레트정보의 입력
	RGBQUAD hRGB[256];	//팔레트정보를 위한 배열(흑백파일)
	fread(hRGB, sizeof(RGBQUAD), 256, infile);	//팔레트 입력

	//메모리 할당
	BYTE *lpImg = new BYTE[hInfo.biSizeImage];	//저장할 영상메모리 할당
	fread(lpImg, sizeof(char), hInfo.biSizeImage, infile);	//영상데이터 읽음
	fclose(infile);	//오픈했던 파일을 닫아줌

	int rwsize = WIDTHBYTES(hInfo.biBitCount * hInfo.biWidth);

	//역상의 이미지 구하기
	for (int i = 0; i < hInfo.biHeight; i++)
	{
		for (int j = 0; j < hInfo.biWidth; j++)
			lpImg[i * rwsize + j] = 255 - lpImg[i * rwsize + j];
	}

	//영상 출력
	fopen_s(&outfile, "OutImg.bmp", "wb");	//출력할 파일을 오픈
	fwrite(&hf, sizeof(BITMAPFILEHEADER), sizeof(char),  outfile);	//파일헤드 출력
	fwrite(&hInfo, sizeof(BITMAPINFOHEADER), sizeof(char),  outfile);	//영상헤드 출력
	
	fwrite(hRGB, sizeof(RGBQUAD), 256, outfile);	//팔레트 출력

	fwrite(lpImg, sizeof(char), hInfo.biSizeImage, outfile);	//영상데이터 출력
	fclose(outfile);	//파일을 닫아줌

	//메모리 해제
	delete[]lpImg;



	FILE* infile2, *outfile2;
	err = fopen_s(&infile2, "pshop256.bmp", "rb");	//입력할 파일을 오픈
	if (err != 0) { printf("There is no file!!!\n"); return; }

	BITMAPFILEHEADER hf2;
	fread(&hf2, sizeof(BITMAPFILEHEADER), 1, infile2);	//파일헤드를 읽음
	if (hf2.bfType != 0x4D42) exit(1);

	BITMAPINFOHEADER hInfo2;
	fread(&hInfo2, sizeof(BITMAPINFOHEADER), 1, infile2);	//영상헤드를 읽음
	printf("Image Size: (%3dx%3d)\n", hInfo2.biWidth, hInfo2.biHeight);
	printf("Palette Type: %dbit Colors\n", hInfo2.biBitCount);


	//256컬러 이하의 경우는 취급하지 않음
	if (hInfo2.biBitCount < 8) { printf("Bad File format!!"); return; }

	//RGBQUAD *pRGB
	RGBQUAD *pRGB = NULL;
	if (hInfo2.biClrUsed != 0)	//팔레트가 있는 경우
	{
		pRGB = new RGBQUAD[hInfo2.biClrUsed];	//팔레트의 크기만큼 메모리를 할당함
		fread(pRGB, sizeof(RGBQUAD), hInfo2.biClrUsed, infile2);	//팔레트를 파일에서 읽음
	}

	//영상데이터를 저장할 메모리 할당
	BYTE *lpImg2 = new BYTE[hInfo2.biSizeImage];
	fread(lpImg2, sizeof(char), hInfo2.biSizeImage, infile2);
	fclose(infile2);

	//크기 계산, 메모리 할당
	rwsize = WIDTHBYTES(hInfo2.biBitCount*hInfo2.biWidth);
	int rwsize2 = WIDTHBYTES(24 * hInfo2.biWidth);
	BYTE *lpOutImg = new BYTE[rwsize2 * hInfo2.biHeight];
	int index, R, G, B, i, j;

	if (hInfo2.biBitCount == 24)	//만일 입력영상이 트루(24비트) 컬러인 경우는 팔레트 없음
		for (i = 0; i < hInfo2.biHeight; i++)	//역상 이미지 구하기
		{
			for (j = 0; j < hInfo2.biWidth; j++)
			{	//팔레트가 없으므로 영상데이터가 바로 컬러값
				lpOutImg[i * rwsize2 + 3 * j + 2] = 255 - lpOutImg[i * rwsize + 3 * j + 2];
				lpOutImg[i * rwsize2 + 3 * j + 1] = 255 - lpOutImg[i * rwsize + 3 * j + 1];
				lpOutImg[i * rwsize2 + 3 * j] = 255 - lpOutImg[i * rwsize + 3 * j];
			}
		}
	else  //트루컬러가 아닌 경우는 팔레트가 있음


		for (i = 0; i < hInfo2.biHeight; i++)	//역상이미지 구하기
		{
			for (j = 0; j < hInfo2.biWidth; j++)
			{
				index = lpImg2[i * rwsize + j];	//영상데이터는 팔레트의 인덱스임
				R = pRGB[index].rgbRed;	//팔레트에서 실제 영상데이터를 가져옴(R)
				G = pRGB[index].rgbGreen;	//G
				B = pRGB[index].rgbBlue;	//B
				R = 255 - R; G = 255 - G; B = 255 - B;	//역상을 계산함
				lpOutImg[i * rwsize2 + 3 * j + 2] = (BYTE)R;
				lpOutImg[i * rwsize2 + 3 * j + 1] = (BYTE)G;
				lpOutImg[i * rwsize2 + 3 * j] = (BYTE)B;
			}
		}

	//계산된 역상 이미지를 하드 디스크에 출력 (24비트인 트루컬러로 출력)
	hInfo2.biBitCount = 24;
	hInfo2.biSizeImage = rwsize2 * hInfo2.biHeight;
	hInfo2.biClrUsed = hInfo2.biClrImportant = 0;
	hf2.bfOffBits = 54;	//팔레트가 없으므로 파일의 시작부에서
	//영상데이터까지의 오프셋은 고정 크기임
	hf2.bfSize = hf2.bfOffBits + hInfo2.biSizeImage;

	fopen_s(&outfile2, "OutImg24.bmp", "wb");
	fwrite(&hf2, sizeof(char), sizeof(BITMAPFILEHEADER), outfile2);
	fwrite(&hInfo2, sizeof(char), sizeof(BITMAPINFOHEADER), outfile2);
	fwrite(lpOutImg, sizeof(char), rwsize2 * hInfo2.biHeight, outfile2);
	fclose(outfile2);

	//메모리해제
	if (hInfo2.biClrUsed != 0) delete[]pRGB;
	delete[]lpOutImg;
	delete[]lpImg2;

	BITMAPFILEHEADER filehead;
	BITMAPINFOHEADER infohead;

	int width = 256, height = 256;
	BYTE* pallete = new BYTE[width * height];

	filehead.bfType = 0x4D42;
	filehead.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) + width * height;
	filehead.bfSize = sizeof(BITMAPFILEHEADER);

	infohead.biBitCount = 8;
	infohead.biClrImportant = 0;
	infohead.biClrUsed = 0;
	infohead.biCompression = 0;
	infohead.biHeight = height;
	infohead.biPlanes = 1;
	infohead.biSize = 40;
	infohead.biWidth = width;
	infohead.biHeight = height;

	infohead.biSizeImage = infohead.biWidth * infohead.biHeight * (infohead.biBitCount / 8);


	infohead.biXPelsPerMeter = 0;
	infohead.biYPelsPerMeter = 0;

	for (int i = 0; i < height; i++)
	{
		for (int j = 0; j < width;j++)
		{
			pallete[i * width + j] = j / 4;
		}
	}

	unsigned char img[256][256];

	for (int i = 0; i < 256; i++) {		for (int j = 0; j < 256; j++) {			if (j < 64) {				img[i][j] = 0;			}			else if (j < 128) {				img[i][j] = 64;			}			else if (j < 192) {				img[i][j] = 192;			}			else {				img[i][j] = 255;			}		}	}

	for (int i = 0; i < 256; i++) {		for (int j = 0; j < 256; j++) {			img[i][j] = img[256 - i - 1][j];		}	}

	FILE* fp;
	fopen_s(&fp, "sample image.bmp", "wb");
	fwrite(&filehead, sizeof(char), sizeof(BITMAPFILEHEADER), fp);
	fwrite(&infohead, sizeof(char), sizeof(BITMAPINFOHEADER), fp);
	fwrite(img, sizeof(char), 256 * 256, fp);
	fwrite(pallete, sizeof(char), 256 * 256, fp);
	fclose(fp);

	//메모리해제
	if (infohead.biClrUsed != 0) delete[]img;
	delete[]pallete;

}