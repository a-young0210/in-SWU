#include <stdio.h>
#include <windows.h>
#define WIDTHBYTES(bits)	(((bits) + 31) / 32 * 4)  //������ �������� 4����Ʈ�� ���
#define BYTE unsigned char

void main()
{
	FILE* infile, *outfile;
	errno_t err = fopen_s(&infile, "talent.bmp", "rb");	//�Է��� ������ ����
	if (err != 0) { printf("There is no file!!!\n"); return; }

	//BMP��������� �Է�
	BITMAPFILEHEADER hf;	//"�����������" ���� ����
	BITMAPINFOHEADER hInfo;	//"�����������" ���� ����
	fread(&hf, sizeof(BITMAPFILEHEADER), 1, infile);	//����������� ����
	if (hf.bfType != 0x4D42) exit(1);	//���� Ÿ���� "BM" (0x4D42)���� �˻�
	fread(&hInfo, sizeof(BITMAPINFOHEADER), 1, infile);	//����������� ����
	if (hInfo.biBitCount != 8) { printf("Bad File format!!"); return; }	//���

	//�ȷ�Ʈ������ �Է�
	RGBQUAD hRGB[256];	//�ȷ�Ʈ������ ���� �迭(�������)
	fread(hRGB, sizeof(RGBQUAD), 256, infile);	//�ȷ�Ʈ �Է�

	//�޸� �Ҵ�
	BYTE *lpImg = new BYTE[hInfo.biSizeImage];	//������ ����޸� �Ҵ�
	fread(lpImg, sizeof(char), hInfo.biSizeImage, infile);	//�������� ����
	fclose(infile);	//�����ߴ� ������ �ݾ���

	int rwsize = WIDTHBYTES(hInfo.biBitCount * hInfo.biWidth);

	//������ �̹��� ���ϱ�
	for (int i = 0; i < hInfo.biHeight; i++)
	{
		for (int j = 0; j < hInfo.biWidth; j++)
			lpImg[i * rwsize + j] = 255 - lpImg[i * rwsize + j];
	}

	//���� ���
	fopen_s(&outfile, "OutImg.bmp", "wb");	//����� ������ ����
	fwrite(&hf, sizeof(BITMAPFILEHEADER), sizeof(char),  outfile);	//������� ���
	fwrite(&hInfo, sizeof(BITMAPINFOHEADER), sizeof(char),  outfile);	//������� ���
	
	fwrite(hRGB, sizeof(RGBQUAD), 256, outfile);	//�ȷ�Ʈ ���

	fwrite(lpImg, sizeof(char), hInfo.biSizeImage, outfile);	//�������� ���
	fclose(outfile);	//������ �ݾ���

	//�޸� ����
	delete[]lpImg;



	FILE* infile2, *outfile2;
	err = fopen_s(&infile2, "pshop256.bmp", "rb");	//�Է��� ������ ����
	if (err != 0) { printf("There is no file!!!\n"); return; }

	BITMAPFILEHEADER hf2;
	fread(&hf2, sizeof(BITMAPFILEHEADER), 1, infile2);	//������带 ����
	if (hf2.bfType != 0x4D42) exit(1);

	BITMAPINFOHEADER hInfo2;
	fread(&hInfo2, sizeof(BITMAPINFOHEADER), 1, infile2);	//������带 ����
	printf("Image Size: (%3dx%3d)\n", hInfo2.biWidth, hInfo2.biHeight);
	printf("Palette Type: %dbit Colors\n", hInfo2.biBitCount);


	//256�÷� ������ ���� ������� ����
	if (hInfo2.biBitCount < 8) { printf("Bad File format!!"); return; }

	//RGBQUAD *pRGB
	RGBQUAD *pRGB = NULL;
	if (hInfo2.biClrUsed != 0)	//�ȷ�Ʈ�� �ִ� ���
	{
		pRGB = new RGBQUAD[hInfo2.biClrUsed];	//�ȷ�Ʈ�� ũ�⸸ŭ �޸𸮸� �Ҵ���
		fread(pRGB, sizeof(RGBQUAD), hInfo2.biClrUsed, infile2);	//�ȷ�Ʈ�� ���Ͽ��� ����
	}

	//�������͸� ������ �޸� �Ҵ�
	BYTE *lpImg2 = new BYTE[hInfo2.biSizeImage];
	fread(lpImg2, sizeof(char), hInfo2.biSizeImage, infile2);
	fclose(infile2);

	//ũ�� ���, �޸� �Ҵ�
	rwsize = WIDTHBYTES(hInfo2.biBitCount*hInfo2.biWidth);
	int rwsize2 = WIDTHBYTES(24 * hInfo2.biWidth);
	BYTE *lpOutImg = new BYTE[rwsize2 * hInfo2.biHeight];
	int index, R, G, B, i, j;

	if (hInfo2.biBitCount == 24)	//���� �Է¿����� Ʈ��(24��Ʈ) �÷��� ���� �ȷ�Ʈ ����
		for (i = 0; i < hInfo2.biHeight; i++)	//���� �̹��� ���ϱ�
		{
			for (j = 0; j < hInfo2.biWidth; j++)
			{	//�ȷ�Ʈ�� �����Ƿ� �������Ͱ� �ٷ� �÷���
				lpOutImg[i * rwsize2 + 3 * j + 2] = 255 - lpOutImg[i * rwsize + 3 * j + 2];
				lpOutImg[i * rwsize2 + 3 * j + 1] = 255 - lpOutImg[i * rwsize + 3 * j + 1];
				lpOutImg[i * rwsize2 + 3 * j] = 255 - lpOutImg[i * rwsize + 3 * j];
			}
		}
	else  //Ʈ���÷��� �ƴ� ���� �ȷ�Ʈ�� ����


		for (i = 0; i < hInfo2.biHeight; i++)	//�����̹��� ���ϱ�
		{
			for (j = 0; j < hInfo2.biWidth; j++)
			{
				index = lpImg2[i * rwsize + j];	//�������ʹ� �ȷ�Ʈ�� �ε�����
				R = pRGB[index].rgbRed;	//�ȷ�Ʈ���� ���� �������͸� ������(R)
				G = pRGB[index].rgbGreen;	//G
				B = pRGB[index].rgbBlue;	//B
				R = 255 - R; G = 255 - G; B = 255 - B;	//������ �����
				lpOutImg[i * rwsize2 + 3 * j + 2] = (BYTE)R;
				lpOutImg[i * rwsize2 + 3 * j + 1] = (BYTE)G;
				lpOutImg[i * rwsize2 + 3 * j] = (BYTE)B;
			}
		}

	//���� ���� �̹����� �ϵ� ��ũ�� ��� (24��Ʈ�� Ʈ���÷��� ���)
	hInfo2.biBitCount = 24;
	hInfo2.biSizeImage = rwsize2 * hInfo2.biHeight;
	hInfo2.biClrUsed = hInfo2.biClrImportant = 0;
	hf2.bfOffBits = 54;	//�ȷ�Ʈ�� �����Ƿ� ������ ���ۺο���
	//�������ͱ����� �������� ���� ũ����
	hf2.bfSize = hf2.bfOffBits + hInfo2.biSizeImage;

	fopen_s(&outfile2, "OutImg24.bmp", "wb");
	fwrite(&hf2, sizeof(char), sizeof(BITMAPFILEHEADER), outfile2);
	fwrite(&hInfo2, sizeof(char), sizeof(BITMAPINFOHEADER), outfile2);
	fwrite(lpOutImg, sizeof(char), rwsize2 * hInfo2.biHeight, outfile2);
	fclose(outfile2);

	//�޸�����
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

	//�޸�����
	if (infohead.biClrUsed != 0) delete[]img;
	delete[]pallete;

}