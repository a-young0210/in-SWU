#include <stdio.h>

FILE* infile, *outfile;

void main()
{
	int i, j;
	unsigned char OrgImg[256][256];

	// 디스크에서 영상데이터 읽기
	errno_t err = fopen_s(&infile, "coin.raw", "rb");
	if (err != 0) { printf("File open error!!"); return; }
	fread(OrgImg, sizeof(char), 256 * 256, infile);
	fclose(infile);

	// 역상계산을 위한 영상처리
	for (i = 0; i < 256; i++)
	{
		for (j = 0; j < 256; j++)
		{
			OrgImg[i][j] = 255 - OrgImg[i][j];
		}
	}

	// 하드디스크에 영상데이터 쓰기
	err = fopen_s(&outfile, "coin_inv.raw", "wb");
	fwrite(OrgImg, sizeof(char), 256 * 256, outfile);
	fclose(outfile);

	for (int i = 0; i < 64; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImg[j][i] = 0;
		}
	}
	for (int i = 64; i < 128; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImg[j][i] = 64;
		}
	}
	for (int i = 128; i < 192; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImg[j][i] = 192;
		}
	}
	for (int i = 192; i < 256; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImg[j][i] = 255;
		}
	}

	FILE* outfile2;
	fopen_s(&outfile2, "sample image.raw", "wb");
	fwrite(OrgImg, sizeof(char), 256 * 256, outfile2);
	fclose(outfile2);

	unsigned char OrgImgR[256][256];
	unsigned char OrgImgG[256][256];
	unsigned char OrgImgB[256][256];

	for (int i = 0; i < 64; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImgR[j][i] = 255;
			OrgImgG[j][i] = 0;
			OrgImgB[j][i] = 0;
		}
	}
	for (int i = 64; i < 128; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImgR[j][i] = 0;
			OrgImgG[j][i] = 255;
			OrgImgB[j][i] = 0;
		}
	}
	for (int i = 128; i < 192; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImgR[j][i] = 0;
			OrgImgG[j][i] = 0;
			OrgImgB[j][i] = 255;
		}
	}
	for (int i = 192; i < 256; i++) {
		for (int j = 0; j < 256; j++) {
			OrgImgR[j][i] = 0;
			OrgImgG[j][i] = 0;
			OrgImgB[j][i] = 0;
		}
	}

	FILE* outfile3;
	fopen_s(&outfile3, "sample color image.raw", "wb");
	fwrite(OrgImgR, sizeof(char), 256 * 256, outfile3);
	fwrite(OrgImgG, sizeof(char), 256 * 256, outfile3);
	fwrite(OrgImgB, sizeof(char), 256 * 256, outfile3);
	fclose(outfile3);
}