<<DDL>

SQL> describe player;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 PLAYER_ID                                 NOT NULL CHAR(7)
 PLAYER_NAME                               NOT NULL VARCHAR2(20)
 TEAM_ID                                   NOT NULL CHAR(3)
 E_PLAYER_NAME                                      VARCHAR2(40)
 NICKNAME                                           VARCHAR2(30)
 JOIN_YYYY                                          CHAR(4)
 POSITION                                           VARCHAR2(10)
 BACK_NO                                            NUMBER(2)
 NATION                                             VARCHAR2(20)
 BIRTH_DATE                                         DATE
 SOLAR                                              CHAR(1)
 HEIGHT                                             NUMBER(3)
 WEIGHT                                             NUMBER(3)

SQL> CREATE TABLE TEAM_TEMP AS SELECT * FROM TEAM;

테이블이 생성되었습니다.

SQL> DESC TEAM_TEMP;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 TEAM_ID                                   NOT NULL CHAR(3)
 REGION_NAME                               NOT NULL VARCHAR2(8)
 TEAM_NAME                                 NOT NULL VARCHAR2(40)
 E_TEAM_NAME                                        VARCHAR2(50)
 ORIG_YYYY                                          CHAR(4)
 STADIUM_ID                                NOT NULL CHAR(3)
 ZIP_CODE1                                          CHAR(3)
 ZIP_CODE2                                          CHAR(3)
 ADDRESS                                            VARCHAR2(80)
 DDD                                                VARCHAR2(3)
 TEL                                                VARCHAR2(10)
 FAX                                                VARCHAR2(10)
 HOMEPAGE                                           VARCHAR2(50)
 OWNER                                              VARCHAR2(10)

SQL> ALTER TABLE PLAYER
  2  ADD (ADDRESS VARCHAR2(80));

테이블이 변경되었습니다.

SQL> DESC PLAYER;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 PLAYER_ID                                 NOT NULL CHAR(7)
 PLAYER_NAME                               NOT NULL VARCHAR2(20)
 TEAM_ID                                   NOT NULL CHAR(3)
 E_PLAYER_NAME                                      VARCHAR2(40)
 NICKNAME                                           VARCHAR2(30)
 JOIN_YYYY                                          CHAR(4)
 POSITION                                           VARCHAR2(10)
 BACK_NO                                            NUMBER(2)
 NATION                                             VARCHAR2(20)
 BIRTH_DATE                                         DATE
 SOLAR                                              CHAR(1)
 HEIGHT                                             NUMBER(3)
 WEIGHT                                             NUMBER(3)
 ADDRESS                                            VARCHAR2(80)

SQL> ALTER TABLE PLAYER
  2  DROP COLUMN ADDRESS;

테이블이 변경되었습니다.

SQL> DESC PLAYER;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 PLAYER_ID                                 NOT NULL CHAR(7)
 PLAYER_NAME                               NOT NULL VARCHAR2(20)
 TEAM_ID                                   NOT NULL CHAR(3)
 E_PLAYER_NAME                                      VARCHAR2(40)
 NICKNAME                                           VARCHAR2(30)
 JOIN_YYYY                                          CHAR(4)
 POSITION                                           VARCHAR2(10)
 BACK_NO                                            NUMBER(2)
 NATION                                             VARCHAR2(20)
 BIRTH_DATE                                         DATE
 SOLAR                                              CHAR(1)
 HEIGHT                                             NUMBER(3)
 WEIGHT                                             NUMBER(3)

SQL> ALTER TABLE TEAM_TEMP
  2  MODIFY (ORIG_YYYY VARCHAR2(8) DEFAULT '20020129' NOT NULL);

테이블이 변경되었습니다.

SQL> DESC TEAM_TEMP;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 TEAM_ID                                   NOT NULL CHAR(3)
 REGION_NAME                               NOT NULL VARCHAR2(8)
 TEAM_NAME                                 NOT NULL VARCHAR2(40)
 E_TEAM_NAME                                        VARCHAR2(50)
 ORIG_YYYY                                 NOT NULL VARCHAR2(8)
 STADIUM_ID                                NOT NULL CHAR(3)
 ZIP_CODE1                                          CHAR(3)
 ZIP_CODE2                                          CHAR(3)
 ADDRESS                                            VARCHAR2(80)
 DDD                                                VARCHAR2(3)
 TEL                                                VARCHAR2(10)
 FAX                                                VARCHAR2(10)
 HOMEPAGE                                           VARCHAR2(50)
 OWNER                                              VARCHAR2(10)

SQL> ALTER TABLE PLAYER
  2  DROP CONSTRAINT PLAYER_FK;

테이블이 변경되었습니다.

SQL> ALTER TABLE PLAYER
  2  ADD CONSTRAINT PLAYER_FK
  3  FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID);

테이블이 변경되었습니다.

SQL> DROP TABLE TEAM;
DROP TABLE TEAM
           *
1행에 오류:
ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다


SQL> DELETE TEAM
  2  WHERE TEAM_ID = 'K10';
DELETE TEAM
*
1행에 오류:
ORA-02292: 무결성 제약조건(SYSTEM.PLAYER_FK)이 위배되었습니다- 자식 레코드가
발견되었습니다

SQL> DROP TABLE PLAYER;

테이블이 삭제되었습니다.

SQL> RENAME TEAM TO TEAM_BACKUP;

테이블 이름이 변경되었습니다.

SQL> TRUNCATE TABLE TEAM;
TRUNCATE TABLE TEAM
               *
1행에 오류:
ORA-00942: 테이블 또는 뷰가 존재하지 않습니다

SQL> RENAME TEAM_BACKUP TO TEAM;

테이블 이름이 변경되었습니다.

SQL> TRUNCATE TABLE TEAM;

테이블이 잘렸습니다.

SQL> DESC TEAM;
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 TEAM_ID                                   NOT NULL CHAR(3)
 REGION_NAME                               NOT NULL VARCHAR2(8)
 TEAM_NAME                                 NOT NULL VARCHAR2(40)
 E_TEAM_NAME                                        VARCHAR2(50)
 ORIG_YYYY                                          CHAR(4)
 STADIUM_ID                                NOT NULL CHAR(3)
 ZIP_CODE1                                          CHAR(3)
 ZIP_CODE2                                          CHAR(3)
 ADDRESS                                            VARCHAR2(80)
 DDD                                                VARCHAR2(3)
 TEL                                                VARCHAR2(10)
 FAX                                                VARCHAR2(10)
 HOMEPAGE                                           VARCHAR2(50)
 OWNER                                              VARCHAR2(10)

SQL> DROP TABLE TEAM;

테이블이 삭제되었습니다.

SQL> DESC TEAM;
ERROR:
ORA-04043: TEAM 객체는 존재하지 않습니다.



<<DML>>

SQL> INSERT INTO PLAYER
  2  (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO)
  3  VALUES ('2002007', '박지성', 'K07', 'MF', 178, 73, 7);

1 개의 행이 만들어졌습니다.

SQL> INSERT INTO PLAYER
  2  VALUES ('2002010', '이청용', 'K07', '','BlueDragon', '2002', 'MF', '17', NULL, NULL, '1', 180, 69);

1 개의 행이 만들어졌습니다.

SQL> UPDATE PLAYER
  2  SET BACK_NO = 99;

482 행이 업데이트되었습니다.

SQL> UPDATE PLAYER
  2  SET POSITION = 'MF';

482 행이 업데이트되었습니다.

SQL> DELETE FROM PLAYER;

482 행이 삭제되었습니다.

SQL> SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO
  2  FROM PLAYER;

PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009175        우르모브                                 K06
MF                          180         70         99

2007188        윤희준                                   K06
MF                          180         74         99

2012073        김규호                                   K06
MF                          177         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007178        김민성                                   K06
MF                          182         73         99

2007191        김장관                                   K06
MF                          170         61         99

2008384        김정효                                   K06
MF                          174         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008395        장대일                                   K06
MF                          184         79         99

2011050        박상수                                   K06
MF                          173         65         99

2007189        정재영                                   K06
MF                          187         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011049        정태민                                   K06
MF                          180         71         99

2010107        정현우                                   K06
MF                          178         70         99

2011043        송종국                                   K06
MF                          177         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011044        오정석                                   K06
MF                          178         74         99

2012137        이고르                                   K06
MF                          181         76         99

2007200        김용하                                   K06
MF                          173         66         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012072        전상배                                   K06
MF                          176         67         99

2009038        전우근                                   K06
MF                          175         68         99

2008365        이태성                                   K06
MF                          177         64         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011047        황철민                                   K06
MF                          175         68         99

2008235        정관규                                   K06
MF                          178         71         99

2011048        정기종                                   K06
MF                          182         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012074        정창오                                   K06
MF                          186         82         99

2012127        디디                                     K06
MF                          179         78         99

2007182        마니치                                   K06
MF                          184         80         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007195        우성용                                   K06
MF                          191         76         99

2010103        장기봉                                   K06
MF                          180         71         99

2012075        이광수                                   K06
MF                          177         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010087        하리                                     K06
MF                          168         65         99

2000017        박상남                                   K06
MF                          188         80         99

2000018        빅토르                                   K06
MF                          183         79         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000021        이윤겸                                   K04
MF                          178         80         99

2000022        하재훈                                   K04
MF                          174         67         99

2000023        김충호                                   K04
MF                          185         83         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000024        임기한                                   K04
MF                          177         85         99

2000025        김경태                                   K04
MF                                                 99

2012054        남현우                                   K04
MF                          180         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008499        김충호                                   K04
MF                          185         83         99

2011021        이현                                     K04
MF                          192         85         99

2012052        한동진                                   K04
MF                          183         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012126        다오                                     K04
MF                          190         80         99

2008182        최철                                     K04
MF                          176         77         99

2010112        송창남                                   K04
MF                          175         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008424        조승호                                   K04
MF                          179         70         99

2008450        윤중희                                   K04
MF                          177         75         99

2011022        김범직                                   K04
MF                          182         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012053        김상홍                                   K04
MF                          178         68         99

2000001        김태호                                   K10
MF                                                 99

2000002        정상수                                   K10
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000003        유동우                                   K10
MF                          177         70         99

2000004        전기현                                   K10
MF                                                 99

2012047        강성일                                   K10
MF                          182         80         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010057        김승준                                   K10
MF                          183         77         99

2007298        이은성                                   K10
MF                          184         82         99

2007312        정대수                                   K10
MF                          184         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012051        정민기                                   K10
MF                          171         65         99

2010110        정성근                                   K10
MF                          180         73         99

2011098        정영근                                   K10
MF                          180         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007301        정정수                                   K10
MF                          180         74         99

2007309        김창엽                                   K10
MF                          174         64         99

2007299        장철우                                   K10
MF                          172         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011116        콜리                                     K10
MF                          182         75         99

2007313        홍광철                                   K10
MF                          172         65         99

2008461        강정훈                                   K10
MF                          175         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007306        공오균                                   K10
MF                          177         72         99

2012049        정국진                                   K10
MF                          172         62         99

2011099        정동선                                   K10
MF                          170         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010109        최경규                                   K10
MF                          177         72         99

2010111        최내철                                   K10
MF                          177         71         99

2012048        배성재                                   K10
MF                          178         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012121        샴                                       K10
MF                          174         69         99

2012136        오비나                                   K10
MF                          169         70         99

2010056        김관우                                   K10
MF                          175         69         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012050        김광진                                   K10
MF                          175         75         99

2010113        김상규                                   K10
MF                          175         65         99

2009151        임영주                                   K10
MF                          176         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011101        박영훈                                   K10
MF                          174         73         99

2008178        한정국                                   K10
MF                          179         71         99

2012046        정광선                                   K10
MF                          175         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007315        정은중                                   K10
MF                          184         72         99

2009152        정찬중                                   K10
MF                          182         72         99

2011032        김석                                     K10
MF                          194         85         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011100        탁준석                                   K10
MF                          178         69         99

2000011        정호곤                                   K06
MF                          172         77         99

2000012        최경훈                                   K06
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000013        정동훈                                   K06
MF                          180         88         99

2000014        정남표                                   K06
MF                          180         77         99

2000015        정광재                                   K06
MF                          180         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000016        권혁준                                   K06
MF                          173         82         99

2011052        정경진                                   K06
MF                          186         78         99

2012076        정용대                                   K06
MF                          189         83         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010108        정지혁                                   K06
MF                          187         77         99

2010059        박유석                                   K06
MF                          186         78         99

2011053        정진우                                   K06
MF                          180         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007185        정학철                                   K06
MF                          176         73         99

2007193        류병훈                                   K06
MF                          184         68         99

2011055        최준홍                                   K06
MF                          178         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011046        서용혁                                   K06
MF                          183         79         99

2010058        심재원                                   K06
MF                          184         77         99

2007123        김임생                                   K04
MF                          183         80         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007022        장형석                                   K04
MF                          181         72         99

2012058        박진성                                   K04
MF                          184         76         99

2009125        이거룩                                   K04
MF                          183         77         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010001        이정민                                   K04
MF                          183         78         99

2012134        페르난도                                 K04
MF                          178         74         99

2000094        김무건                                   K03
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007001        정병지                                   K03
MF                          184         77         99

2011069        최주호                                   K03
MF                          185         75         99

2007130        김대희                                   K03
MF                          192         88         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009133        김준호                                   K03
MF                          185         77         99

2011065        허인무                                   K03
MF                          187         81         99

2011056        강용                                     K03
MF                          179         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007080        고병운                                   K03
MF                          180         73         99

2012069        정광석                                   K03
MF                          183         72         99

2007002        정상훈                                   K03
MF                          183         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012062        정석우                                   K03
MF                          181         72         99

2009139        정은석                                   K03
MF                          185         80         99

2009030        최민서                                   K03
MF                          180         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012064        성종현                                   K03
MF                          178         74         99

2008468        싸빅                                     K03
MF                          185         78         99

2007277        오명관                                   K03
MF                          185         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012063        김동식                                   K03
MF                          183         77         99

2012067        김수길                                   K03
MF                          179         69         99

2008444        김승엽                                   K03
MF                          180         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007101        김종화                                   K03
MF                          182         76         99

2007190        하석주                                   K03
MF                          174         71         99

2010065        허제정                                   K03
MF                          175         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007096        홍명보                                   K03
MF                          181         72         99

2008472        정기남                                   K03
MF                          174         72         99

2011059        정상록                                   K03
MF                          173         63         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011068        나희근                                   K03
MF                          178         72         99

2012133        레오                                     K03
MF                          179         74         99

2012124        메도                                     K03
MF                          180         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012068        최길영                                   K03
MF                          172         64         99

2008203        최상인                                   K03
MF                          174         63         99

2011131        옐라                                     K03
MF                          184         79         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011061        유현구                                   K03
MF                          170         68         99

2009033        김기부                                   K03
MF                          183         76         99

2012070        김상인                                   K03
MF                          178         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011062        김정운                                   K03
MF                          178         70         99

2012071        김중규                                   K03
MF                          170         64         99

2012066        김창호                                   K03
MF                          175         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011063        이종범                                   K03
MF                          178         68         99

2012061        남익경                                   K03
MF                          177         70         99

2011064        윤보영                                   K03
MF                          177         63         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008443        김동국                                   K03
MF                          185         80         99

2012060        박종완                                   K03
MF                          188         82         99

2012059        김징요                                   K03
MF                          174         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010044        이철우                                   K03
MF                          185         78         99

2011057        코난                                     K03
MF                          180         76         99

2000095        정민규                                   K03
MF                          178         71         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000062        제형진                                   K01
MF                          179         75         99

2000063        곽기훈                                   K01
MF                          177         72         99

2000064        최민영                                   K01
MF                          174         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000071        김회택                                   K07
MF                                                 99

2000072        서현옥                                   K07
MF                                                 99

2000073        정상호                                   K07
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000074        최철우                                   K07
MF                                                 99

2012081        정영광                                   K07
MF                          185         80         99

2007227        최종문                                   K07
MF                          185         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012088        염동균                                   K07
MF                          189         83         99

2012089        김정래                                   K07
MF                          185         81         99

2008212        강철                                     K07
MF                          178         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012077        정강선                                   K07
MF                          180         73         99

2012083        정인호                                   K07
MF                          184         79         99

2007213        정태영                                   K07
MF                          180         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007209        정현수                                   K07
MF                          176         74         99

2012084        정형주                                   K07
MF                                                 99

2012085        정홍철                                   K07
MF                          181         69         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008359        마시엘                                   K07
MF                          177         70         99

2011034        김창원                                   K07
MF                          183         75         99

2012090        장경진                                   K07
MF                          184         82         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008425        주영호                                   K07
MF                          185         80         99

2012092        홍성요                                   K07
MF                          184         78         99

2009115        정경일                                   K07
MF                          170         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011035        정길식                                   K07
MF                          178         72         99

2010030        정남일                                   K07
MF                          182         76         99

2010032        정대욱                                   K07
MF                          182         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007210        정도근                                   K07
MF                          181         69         99

2012078        정동희                                   K07
MF                          174         64         99

2007102        정명곤                                   K07
MF                          177         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012079        정성진                                   K07
MF                          178         68         99

2012080        정승현                                   K07
MF                          181         71         99

2012082        정요환                                   K07
MF                          170         62         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009100        정정겸                                   K07
MF                          172         65         99

2008428        정종현                                   K07
MF                          173         68         99

2012086        노병준                                   K07
MF                          177         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012087        최종우                                   K07
MF                          176         69         99

2007305        조진원                                   K07
MF                          176         75         99

2012132        실바                                     K07
MF                          173         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010031        윤용구                                   K07
MF                          168         60         99

2011127        김반                                     K07
MF                          174         69         99

2011038        김영수                                   K07
MF                          175         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008423        임관식                                   K07
MF                          172         68         99

2011036        이정호                                   K07
MF                          176         71         99

2011039        하기윤                                   K07
MF                          180         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010003        정대철                                   K07
MF                          183         78         99

2010154        꼬레아                                   K07
MF                          172         70         99

2007214        노상래                                   K07
MF                          175         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009149        성한수                                   K07
MF                          177         69         99

2009161        세자르                                   K07
MF                          180         78         99

2012032        조병호                                   K07
MF                          177         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011120        찌코                                     K07
MF                          180         67         99

2010037        하성룡                                   K07
MF                          179         68         99

2012091        홍복표                                   K07
MF                          182         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000081        김윤환                                   K05
MF                                                 99

2000082        정은철                                   K05
MF                                                 99

2000083        김경춘                                   K05
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000084        최동우                                   K05
MF                                                 99

2000085        전명구                                   K05
MF                                                 99

2000086        박경치                                   K05
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007106        정이섭                                   K05
MF                          185         78         99

2012007        최관민                                   K05
MF                          188         85         99

2008179        최동우                                   K05
MF                          187         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008138        김용발                                   K05
MF                          183         77         99

2012006        김창민                                   K05
MF                          191         87         99

2010010        정대건                                   K05
MF                          183         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007159        정봉현                                   K05
MF                          188         74         99

2012009        정창민                                   K05
MF                          181         68         99

2012005        최동혁                                   K05
MF                          185         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012012        백인석                                   K05
MF                          179         72         99

2008391        서혁수                                   K05
MF                          178         77         99

2012004        안광호                                   K05
MF                          190         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009076        임종훈                                   K05
MF                          182         74         99

2007148        이진철                                   K05
MF                          187         75         99

2009061        한종성                                   K05
MF                          177         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009160        호제리오                                 K05
MF                          185         85         99

2007031        황승주                                   K05
MF                          176         68         99

2010023        고관영                                   K05
MF                          180         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007155        정경량                                   K05
MF                          173         65         99

2010025        정은익                                   K05
MF                          176         63         99

2012001        레오마르                                 K05
MF                          183         77         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008269        명재용                                   K05
MF                          173         63         99

2007149        변재섭                                   K05
MF                          170         63         99

2012002        보띠                                     K05
MF                          174         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011123        비에라                                   K05
MF                          176         73         99

2008460        서동원                                   K05
MF                          184         78         99

2010019        안대현                                   K05
MF                          179         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010018        양현정                                   K05
MF                          176         72         99

2010022        유원섭                                   K05
MF                          180         77         99

2012008        김수철                                   K05
MF                          171         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012013        임다한                                   K05
MF                          181         67         99

2007087        전경준                                   K05
MF                          178         68         99

2010021        이영훈                                   K05
MF                          178         71         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011028        추운기                                   K05
MF                          173         69         99

2008393        하은철                                   K05
MF                          176         69         99

2011030        고민기                                   K05
MF                          178         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008143        정도훈                                   K05
MF                          182         77         99

2012011        정연건                                   K05
MF                          188         77         99

2011002        정현기                                   K05
MF                          190         82         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011003        남궁도                                   K05
MF                          186         80         99

2010101        문태혁                                   K05
MF                          178         74         99

2008392        최성배                                   K05
MF                          181         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012125        에드밀손                                 K05
MF                          184         79         99

2012003        쿠키                                     K05
MF                          170         76         99

2000087        정은익                                   K05
MF                          176         65         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000091        이순호                                   K03
MF                                                 99

2000092        유동관                                   K03
MF                                                 99

2000093        박기동                                   K03
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011111        김반코비                                 K02
MF                          185         78         99

2012020        김선우                                   K02
MF                          174         68         99

2011074        김여성                                   K02
MF                          179         63         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007064        김용우                                   K02
MF                          175         70         99

2012019        김종민                                   K02
MF                          174         65         99

2008437        박용훈                                   K02
MF                          175         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008436        김만근                                   K02
MF                          177         67         99

2007070        김재민                                   K02
MF                          180         71         99

2007043        김현두                                   K02
MF                          176         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012017        이성용                                   K02
MF                          173         70         99

2012018        하태근                                   K02
MF                          182         75         99

2012122        미트로                                   K02
MF                          192         89         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007048        최건하                                   K02
MF                          180         75         99

2010168        산드로                                   K02
MF                          182         78         99

2012023        윤화평                                   K02
MF                          182         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012022        김관희                                   K02
MF                          180         70         99

2000051        김광래                                   K09
MF                                                 99

2000052        김춘석                                   K09
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000053        조재흠                                   K09
MF                                                 99

2000054        김영진                                   K09
MF                                                 99

2000055        정귀화                                   K09
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012094        최동석                                   K09
MF                          190         89         99

2010125        백민철                                   K09
MF                          185         78         99

2007236        조의손                                   K09
MF                          192         87         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011018        우태식                                   K09
MF                          185         75         99

2010117        정동진                                   K09
MF                          182         74         99

2008414        정성일                                   K09
MF                          178         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012093        정치곤                                   K09
MF                          183         76         99

2012095        최요셉                                   K09
MF                          183         75         99

2010119        최용호                                   K09
MF                          182         69         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007068        최정석                                   K09
MF                          182         78         99

2007266        손현준                                   K09
MF                          175         70         99

2011012        안성훈                                   K09
MF                          176         63         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008420        김상헌                                   K09
MF                          185         80         99

2012102        박성호                                   K09
MF                          184         71         99

2007225        이윤열                                   K09
MF                          185         79         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009048        정도용                                   K09
MF                          168         68         99

2011072        정민성                                   K09
MF                          175         64         99

2011008        조재필                                   K09
MF                          180         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012096        조현국                                   K09
MF                          172         65         99

2010049        안드레                                   K09
MF                          172         69         99

2012097        안상현                                   K09
MF                          176         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012098        우진석                                   K09
MF                          176         70         99

2007133        유상수                                   K09
MF                          175         67         99

2010048        김영표                                   K09
MF                          176         66         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012100        김준기                                   K09
MF                          183         74         99

2012101        김지남                                   K09
MF                          183         68         99

2008413        박광민                                   K09
MF                          180         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009051        박창근                                   K09
MF                          170         63         99

2010118        이원권                                   K09
MF                          173         65         99

2010120        정병채                                   K09
MF                          180         72         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009046        정성재                                   K09
MF                          178         72         99

2012119        뚜따                                     K09
MF                          187         84         99

2012105        마르코                                   K09
MF                          175         77         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011005        최성호                                   K09
MF                          187         73         99

2011108        최윤화                                   K09
MF                          175         67         99

2009047        최정환                                   K09
MF                          178         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009005        왕정현                                   K09
MF                          181         73         99

2012099        김정수                                   K09
MF                          184         74         99

2012103        김원광                                   K09
MF                          183         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009044        진순진                                   K09
MF                          180         78         99

2010053        이태욱                                   K09
MF                          173         66         99

2012104        한동원                                   K09
MF                          174         61         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011004        한정화                                   K09
MF                          173         63         99

2010164        히카르도                                 K09
MF                          189         71         99

2011082        권정혁                                   K01
MF                          195         80         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009070        최창주                                   K01
MF                          187         86         99

2007020        서동명                                   K01
MF                          196         94         99

2008410        양지원                                   K01
MF                          181         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012039        이무림                                   K01
MF                          185         79         99

2012034        정윤구                                   K01
MF                          182         75         99

2011106        끌레베르                                 K01
MF                          186         79         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011080        최경삼                                   K01
MF                          188         74         99

2007004        최종욱                                   K01
MF                          185         74         99

2012035        변성환                                   K01
MF                          176         69         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008366        손상호                                   K01
MF                          187         78         99

2012044        유재형                                   K01
MF                          180         79         99

2011077        김세권                                   K01
MF                          184         80         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009069        하성용                                   K01
MF                          179         75         99

2010082        한정일                                   K01
MF                          172         65         99

2010054        정건형                                   K01
MF                          176         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009058        정도균                                   K01
MF                          184         78         99

2011083        최기욱                                   K01
MF                          175         68         99

2012028        최진섭                                   K01
MF                          179         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011079        서덕규                                   K01
MF                          182         72         99

2012130        에디                                     K01
MF                          182         70         99

2009055        김길용                                   K01
MF                          183         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012036        김윤섭                                   K01
MF                          184         77         99

2012029        김천수                                   K01
MF                          174         65         99

2012033        장성욱                                   K01
MF                          174         71         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007023        장철민                                   K01
MF                          179         76         99

2011084        전광철                                   K01
MF                          186         74         99

2012045        전재운                                   K01
MF                          177         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007008        박정수                                   K01
MF                          170         61         99

2012042        박주영                                   K01
MF                          172         65         99

2012040        김원희                                   K01
MF                          178         71         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012041        곽기훈                                   K01
MF                          177         72         99

2007010        정현석                                   K01
MF                          178         70         99

2011105        마르코스                                 K01
MF                          170         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010045        최규선                                   K01
MF                          182         66         99

2012129        알리송                                   K01
MF                          171         60         99

2012038        김태유                                   K01
MF                          175         64         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012030        박성훈                                   K01
MF                          187         83         99

2012037        이인석                                   K01
MF                          181         74         99

2011104        파울링뇨                                 K01
MF                          174         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012031        현영민                                   K01
MF                          179         73         99

2000061        홍인기                                   K01
MF                          182         75         99

2007114        정기동                                   K04
MF                          171         66         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010005        정기형                                   K04
MF                          173         64         99

2012055        정정현                                   K04
MF                          176         68         99

2007122        정한윤                                   K04
MF                          185         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007137        남기일                                   K04
MF                          177         69         99

2012131        무스타파                                 K04
MF                          180         73         99

2012056        최정주                                   K04
MF                          177         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010004        조현호                                   K04
MF                          183         71         99

2007125        윤정춘                                   K04
MF                          173         66         99

2011103        장경호                                   K04
MF                          174         66         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008209        이문식                                   K04
MF                          173         66         99

2008457        곽경근                                   K04
MF                          184         81         99

2012120        다보                                     K04
MF                          183         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007126        최성철                                   K04
MF                          190         78         99

2007153        비탈리                                   K04
MF                          183         74         99

2009026        안승인                                   K04
MF                          182         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011019        윤원철                                   K04
MF                          184         75         99

2009027        김성재                                   K04
MF                          178         67         99

2007135        김원식                                   K04
MF                          172         64         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012057        김종민                                   K04
MF                          184         77         99

2011020        박필석                                   K04
MF                          190         83         99

2010084        제프유                                   K04
MF                          184         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000026        롤란                                     K04
MF                          184         81         99

2000027        셀라하틴                                 K04
MF                          180         75         99

2000031        차경복                                   K08
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000032        정학범                                   K08
MF                                                 99

2000033        안익수                                   K08
MF                                                 99

2000034        차상광                                   K08
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009045        권찬수                                   K08
MF                          183         77         99

2012107        정경두                                   K08
MF                          194         76         99

2007255        정해운                                   K08
MF                          185         79         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009101        양영민                                   K08
MF                          190         80         99

2011087        가이모토                                 K08
MF                          182         77         99

2012108        정두영                                   K08
MF                          181         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012118        정명휘                                   K08
MF                          185         76         99

2007329        정영철                                   K08
MF                          183         80         99

2007259        정정재                                   K08
MF                          184         80         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007186        정현수                                   K08
MF                          186         80         99

2007089        노태경                                   K08
MF                          175         68         99

2009098        문삼진                                   K08
MF                          173         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012111        민경인                                   K08
MF                          177         71         99

2011091        최종남                                   K08
MF                          182         76         99

2007055        최충균                                   K08
MF                          184         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010034        배진수                                   K08
MF                          178         72         99

2008471        김영진                                   K08
MF                          180         75         99

2008399        임규식                                   K08
MF                          182         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012106        곽치국                                   K08
MF                          170         68         99

2009095        정상식                                   K08
MF                          184         71         99

2011086        정용희                                   K08
MF                          178         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012109        노규영                                   K08
MF                          180         83         99

2010126        최강조                                   K08
MF                          165         57         99

2008171        최남열                                   K08
MF                          178         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011088        백영철                                   K08
MF                          177         71         99

2007242        조태용                                   K08
MF                          174         67         99

2012117        올리베                                   K08
MF                          175         73         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011128        김리네                                   K08
MF                          172         69         99

2012128        쟈스민                                   K08
MF                          180         78         99

2012114        전재호                                   K08
MF                          168         64         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008131        김진호                                   K08
MF                          174         68         99

2012115        이낙훈                                   K08
MF                          172         62         99

2007100        홍도표                                   K08
MF                          173         66         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010127        정대의                                   K08
MF                          174         70         99

2009084        정우재                                   K08
MF                          173         71         99

2007192        샤샤                                     K08
MF                          190         84         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012112        서관수                                   K08
MF                          179         74         99

2011095        김성운                                   K08
MF                          173         64         99

2012113        김정운                                   K08
MF                          170         68         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011094        장동현                                   K08
MF                          178         67         99

2007250        황연석                                   K08
MF                          192         81         99

2000041        정호                                     K02
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2000042        왕선재                                   K02
MF                                                 99

2000043        코샤                                     K02
MF                                                 99

2000044        윤성효                                   K02
MF                                                 99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007067        정광수                                   K02
MF                          182         79         99

2009004        최호진                                   K02
MF                          190         82         99

2007203        조범철                                   K02
MF                          185         85         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007035        김운재                                   K02
MF                          182         82         99

2008429        정영선                                   K02
MF                          184         81         99

2012021        정유진                                   K02
MF                          188         76         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2011073        손승준                                   K02
MF                          186         72         99

2007007        조홍기                                   K02
MF                          175         66         99

2012027        안동원                                   K02
MF                          184         78         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012024        김강진                                   K02
MF                          181         65         99

2007036        김병근                                   K02
MF                          175         63         99

2012026        김태권                                   K02
MF                          180         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012014        김병국                                   K02
MF                          183         78         99

2011075        김성환                                   K02
MF                          183         75         99

2012123        가비                                     K02
MF                          177         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010089        강대희                                   K02
MF                          174         65         99

2007051        고종수                                   K02
MF                          176         70         99

2012015        고창현                                   K02
MF                          170         64         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009089        정기범                                   K02
MF                          173         65         99

2009083        정동현                                   K02
MF                          175         72         99

2011071        정두현                                   K02
MF                          175         67         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012025        정준                                     K02
MF                          170         65         99

2007040        정진우                                   K02
MF                          179         72         99

2007069        데니스                                   K02
MF                          176         71         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2007274        서정원                                   K02
MF                          173         66         99

2012016        손대호                                   K02
MF                          186         79         99

2011070        오규찬                                   K02
MF                          178         71         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2012135        윤원일                                   K02
MF                          176         70         99

2009131        김동욱                                   K02
MF                          176         68         99

2010901        장성철                                   K11
MF                          176         75         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010902        장윤정                                   K11
MF                          173         63         99

2010903        장서연                                   K11
MF                          180         60         99

2009901        고규억                                   K12
MF                          175         70         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2009902        장재우                                   K12
MF                          172         63         99

2008901        오재진                                   K13
MF                          173         72         99

2008902        선원길                                   K13
MF                          174         66         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2008903        안소정                                   K13
MF                          174         63         99

2007901        주시형                                   K14
MF                          170         72         99

2007902        홍종하                                   K14
MF                          169         74         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2010801        오춘식                                   K15
MF                          168         75         99

2010802        박창우                                   K15
MF                          177         68         99

2010803        박진하                                   K15
MF                          181         62         99


PLAYER_ID      PLAYER_NAME                              TEAM_I
-------------- ---------------------------------------- ------
POSITION                 HEIGHT     WEIGHT    BACK_NO
-------------------- ---------- ---------- ----------
2002007        박지성                                   K07
MF                          178         73         99

2002010        이청용                                   K07
MF                          180         69         99


482 행이 선택되었습니다.

SQL> SELECT DISTINCT POSITION
  2  FROM PLAYER;

POSITION
--------------------
MF

SQL> SELECT *
  2  FROM PLAYER;

// 위와 같이 482개의 행이 출력됨.
482 행이 선택되었습니다.

SQL> SELECT PLAYER_NAME AS 선수명, POSITION AS 위치, HEIGHT AS 키, WEIGHT AS 몸무게
  2  FROM PLAYER;

선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
우르모브                                 MF                          180
        70

윤희준                                   MF                          180
        74

김규호                                   MF                          177
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김민성                                   MF                          182
        73

김장관                                   MF                          170
        61

김정효                                   MF                          174
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
장대일                                   MF                          184
        79

박상수                                   MF                          173
        65

정재영                                   MF                          187
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정태민                                   MF                          180
        71

정현우                                   MF                          178
        70

송종국                                   MF                          177
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
오정석                                   MF                          178
        74

이고르                                   MF                          181
        76

김용하                                   MF                          173
        66


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
전상배                                   MF                          176
        67

전우근                                   MF                          175
        68

이태성                                   MF                          177
        64


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
황철민                                   MF                          175
        68

정관규                                   MF                          178
        71

정기종                                   MF                          182
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정창오                                   MF                          186
        82

디디                                     MF                          179
        78

마니치                                   MF                          184
        80


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
우성용                                   MF                          191
        76

장기봉                                   MF                          180
        71

이광수                                   MF                          177
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
하리                                     MF                          168
        65

박상남                                   MF                          188
        80

빅토르                                   MF                          183
        79


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이윤겸                                   MF                          178
        80

하재훈                                   MF                          174
        67

김충호                                   MF                          185
        83


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
임기한                                   MF                          177
        85

김경태                                   MF


남현우                                   MF                          180
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김충호                                   MF                          185
        83

이현                                     MF                          192
        85

한동진                                   MF                          183
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
다오                                     MF                          190
        80

최철                                     MF                          176
        77

송창남                                   MF                          175
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
조승호                                   MF                          179
        70

윤중희                                   MF                          177
        75

김범직                                   MF                          182
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김상홍                                   MF                          178
        68

김태호                                   MF


정상수                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
유동우                                   MF                          177
        70

전기현                                   MF


강성일                                   MF                          182
        80


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김승준                                   MF                          183
        77

이은성                                   MF                          184
        82

정대수                                   MF                          184
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정민기                                   MF                          171
        65

정성근                                   MF                          180
        73

정영근                                   MF                          180
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정정수                                   MF                          180
        74

김창엽                                   MF                          174
        64

장철우                                   MF                          172
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
콜리                                     MF                          182
        75

홍광철                                   MF                          172
        65

강정훈                                   MF                          175
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
공오균                                   MF                          177
        72

정국진                                   MF                          172
        62

정동선                                   MF                          170
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최경규                                   MF                          177
        72

최내철                                   MF                          177
        71

배성재                                   MF                          178
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
샴                                       MF                          174
        69

오비나                                   MF                          169
        70

김관우                                   MF                          175
        69


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김광진                                   MF                          175
        75

김상규                                   MF                          175
        65

임영주                                   MF                          176
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
박영훈                                   MF                          174
        73

한정국                                   MF                          179
        71

정광선                                   MF                          175
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정은중                                   MF                          184
        72

정찬중                                   MF                          182
        72

김석                                     MF                          194
        85


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
탁준석                                   MF                          178
        69

정호곤                                   MF                          172
        77

최경훈                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정동훈                                   MF                          180
        88

정남표                                   MF                          180
        77

정광재                                   MF                          180
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
권혁준                                   MF                          173
        82

정경진                                   MF                          186
        78

정용대                                   MF                          189
        83


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정지혁                                   MF                          187
        77

박유석                                   MF                          186
        78

정진우                                   MF                          180
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정학철                                   MF                          176
        73

류병훈                                   MF                          184
        68

최준홍                                   MF                          178
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
서용혁                                   MF                          183
        79

심재원                                   MF                          184
        77

김임생                                   MF                          183
        80


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
장형석                                   MF                          181
        72

박진성                                   MF                          184
        76

이거룩                                   MF                          183
        77


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이정민                                   MF                          183
        78

페르난도                                 MF                          178
        74

김무건                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정병지                                   MF                          184
        77

최주호                                   MF                          185
        75

김대희                                   MF                          192
        88


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김준호                                   MF                          185
        77

허인무                                   MF                          187
        81

강용                                     MF                          179
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
고병운                                   MF                          180
        73

정광석                                   MF                          183
        72

정상훈                                   MF                          183
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정석우                                   MF                          181
        72

정은석                                   MF                          185
        80

최민서                                   MF                          180
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
성종현                                   MF                          178
        74

싸빅                                     MF                          185
        78

오명관                                   MF                          185
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김동식                                   MF                          183
        77

김수길                                   MF                          179
        69

김승엽                                   MF                          180
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김종화                                   MF                          182
        76

하석주                                   MF                          174
        71

허제정                                   MF                          175
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
홍명보                                   MF                          181
        72

정기남                                   MF                          174
        72

정상록                                   MF                          173
        63


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
나희근                                   MF                          178
        72

레오                                     MF                          179
        74

메도                                     MF                          180
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최길영                                   MF                          172
        64

최상인                                   MF                          174
        63

옐라                                     MF                          184
        79


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
유현구                                   MF                          170
        68

김기부                                   MF                          183
        76

김상인                                   MF                          178
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김정운                                   MF                          178
        70

김중규                                   MF                          170
        64

김창호                                   MF                          175
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이종범                                   MF                          178
        68

남익경                                   MF                          177
        70

윤보영                                   MF                          177
        63


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김동국                                   MF                          185
        80

박종완                                   MF                          188
        82

김징요                                   MF                          174
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이철우                                   MF                          185
        78

코난                                     MF                          180
        76

정민규                                   MF                          178
        71


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
제형진                                   MF                          179
        75

곽기훈                                   MF                          177
        72

최민영                                   MF                          174
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김회택                                   MF


서현옥                                   MF


정상호                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최철우                                   MF


정영광                                   MF                          185
        80

최종문                                   MF                          185
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
염동균                                   MF                          189
        83

김정래                                   MF                          185
        81

강철                                     MF                          178
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정강선                                   MF                          180
        73

정인호                                   MF                          184
        79

정태영                                   MF                          180
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정현수                                   MF                          176
        74

정형주                                   MF


정홍철                                   MF                          181
        69


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
마시엘                                   MF                          177
        70

김창원                                   MF                          183
        75

장경진                                   MF                          184
        82


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
주영호                                   MF                          185
        80

홍성요                                   MF                          184
        78

정경일                                   MF                          170
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정길식                                   MF                          178
        72

정남일                                   MF                          182
        76

정대욱                                   MF                          182
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도근                                   MF                          181
        69

정동희                                   MF                          174
        64

정명곤                                   MF                          177
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정성진                                   MF                          178
        68

정승현                                   MF                          181
        71

정요환                                   MF                          170
        62


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정정겸                                   MF                          172
        65

정종현                                   MF                          173
        68

노병준                                   MF                          177
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최종우                                   MF                          176
        69

조진원                                   MF                          176
        75

실바                                     MF                          173
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
윤용구                                   MF                          168
        60

김반                                     MF                          174
        69

김영수                                   MF                          175
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
임관식                                   MF                          172
        68

이정호                                   MF                          176
        71

하기윤                                   MF                          180
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정대철                                   MF                          183
        78

꼬레아                                   MF                          172
        70

노상래                                   MF                          175
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
성한수                                   MF                          177
        69

세자르                                   MF                          180
        78

조병호                                   MF                          177
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
찌코                                     MF                          180
        67

하성룡                                   MF                          179
        68

홍복표                                   MF                          182
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김윤환                                   MF


정은철                                   MF


김경춘                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최동우                                   MF


전명구                                   MF


박경치                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정이섭                                   MF                          185
        78

최관민                                   MF                          188
        85

최동우                                   MF                          187
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김용발                                   MF                          183
        77

김창민                                   MF                          191
        87

정대건                                   MF                          183
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정봉현                                   MF                          188
        74

정창민                                   MF                          181
        68

최동혁                                   MF                          185
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
백인석                                   MF                          179
        72

서혁수                                   MF                          178
        77

안광호                                   MF                          190
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
임종훈                                   MF                          182
        74

이진철                                   MF                          187
        75

한종성                                   MF                          177
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
호제리오                                 MF                          185
        85

황승주                                   MF                          176
        68

고관영                                   MF                          180
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정경량                                   MF                          173
        65

정은익                                   MF                          176
        63

레오마르                                 MF                          183
        77


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
명재용                                   MF                          173
        63

변재섭                                   MF                          170
        63

보띠                                     MF                          174
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
비에라                                   MF                          176
        73

서동원                                   MF                          184
        78

안대현                                   MF                          179
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
양현정                                   MF                          176
        72

유원섭                                   MF                          180
        77

김수철                                   MF                          171
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
임다한                                   MF                          181
        67

전경준                                   MF                          178
        68

이영훈                                   MF                          178
        71


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
추운기                                   MF                          173
        69

하은철                                   MF                          176
        69

고민기                                   MF                          178
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도훈                                   MF                          182
        77

정연건                                   MF                          188
        77

정현기                                   MF                          190
        82


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
남궁도                                   MF                          186
        80

문태혁                                   MF                          178
        74

최성배                                   MF                          181
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
에드밀손                                 MF                          184
        79

쿠키                                     MF                          170
        76

정은익                                   MF                          176
        65


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이순호                                   MF


유동관                                   MF


박기동                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김반코비                                 MF                          185
        78

김선우                                   MF                          174
        68

김여성                                   MF                          179
        63


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김용우                                   MF                          175
        70

김종민                                   MF                          174
        65

박용훈                                   MF                          175
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김만근                                   MF                          177
        67

김재민                                   MF                          180
        71

김현두                                   MF                          176
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이성용                                   MF                          173
        70

하태근                                   MF                          182
        75

미트로                                   MF                          192
        89


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최건하                                   MF                          180
        75

산드로                                   MF                          182
        78

윤화평                                   MF                          182
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김관희                                   MF                          180
        70

김광래                                   MF


김춘석                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
조재흠                                   MF


김영진                                   MF


정귀화                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최동석                                   MF                          190
        89

백민철                                   MF                          185
        78

조의손                                   MF                          192
        87


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
우태식                                   MF                          185
        75

정동진                                   MF                          182
        74

정성일                                   MF                          178
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정치곤                                   MF                          183
        76

최요셉                                   MF                          183
        75

최용호                                   MF                          182
        69


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최정석                                   MF                          182
        78

손현준                                   MF                          175
        70

안성훈                                   MF                          176
        63


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김상헌                                   MF                          185
        80

박성호                                   MF                          184
        71

이윤열                                   MF                          185
        79


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도용                                   MF                          168
        68

정민성                                   MF                          175
        64

조재필                                   MF                          180
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
조현국                                   MF                          172
        65

안드레                                   MF                          172
        69

안상현                                   MF                          176
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
우진석                                   MF                          176
        70

유상수                                   MF                          175
        67

김영표                                   MF                          176
        66


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김준기                                   MF                          183
        74

김지남                                   MF                          183
        68

박광민                                   MF                          180
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
박창근                                   MF                          170
        63

이원권                                   MF                          173
        65

정병채                                   MF                          180
        72


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정성재                                   MF                          178
        72

뚜따                                     MF                          187
        84

마르코                                   MF                          175
        77


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최성호                                   MF                          187
        73

최윤화                                   MF                          175
        67

최정환                                   MF                          178
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
왕정현                                   MF                          181
        73

김정수                                   MF                          184
        74

김원광                                   MF                          183
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
진순진                                   MF                          180
        78

이태욱                                   MF                          173
        66

한동원                                   MF                          174
        61


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
한정화                                   MF                          173
        63

히카르도                                 MF                          189
        71

권정혁                                   MF                          195
        80


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최창주                                   MF                          187
        86

서동명                                   MF                          196
        94

양지원                                   MF                          181
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이무림                                   MF                          185
        79

정윤구                                   MF                          182
        75

끌레베르                                 MF                          186
        79


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최경삼                                   MF                          188
        74

최종욱                                   MF                          185
        74

변성환                                   MF                          176
        69


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
손상호                                   MF                          187
        78

유재형                                   MF                          180
        79

김세권                                   MF                          184
        80


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
하성용                                   MF                          179
        75

한정일                                   MF                          172
        65

정건형                                   MF                          176
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도균                                   MF                          184
        78

최기욱                                   MF                          175
        68

최진섭                                   MF                          179
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
서덕규                                   MF                          182
        72

에디                                     MF                          182
        70

김길용                                   MF                          183
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김윤섭                                   MF                          184
        77

김천수                                   MF                          174
        65

장성욱                                   MF                          174
        71


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
장철민                                   MF                          179
        76

전광철                                   MF                          186
        74

전재운                                   MF                          177
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
박정수                                   MF                          170
        61

박주영                                   MF                          172
        65

김원희                                   MF                          178
        71


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
곽기훈                                   MF                          177
        72

정현석                                   MF                          178
        70

마르코스                                 MF                          170
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최규선                                   MF                          182
        66

알리송                                   MF                          171
        60

김태유                                   MF                          175
        64


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
박성훈                                   MF                          187
        83

이인석                                   MF                          181
        74

파울링뇨                                 MF                          174
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
현영민                                   MF                          179
        73

홍인기                                   MF                          182
        75

정기동                                   MF                          171
        66


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정기형                                   MF                          173
        64

정정현                                   MF                          176
        68

정한윤                                   MF                          185
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
남기일                                   MF                          177
        69

무스타파                                 MF                          180
        73

최정주                                   MF                          177
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
조현호                                   MF                          183
        71

윤정춘                                   MF                          173
        66

장경호                                   MF                          174
        66


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
이문식                                   MF                          173
        66

곽경근                                   MF                          184
        81

다보                                     MF                          183
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
최성철                                   MF                          190
        78

비탈리                                   MF                          183
        74

안승인                                   MF                          182
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
윤원철                                   MF                          184
        75

김성재                                   MF                          178
        67

김원식                                   MF                          172
        64


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김종민                                   MF                          184
        77

박필석                                   MF                          190
        83

제프유                                   MF                          184
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
롤란                                     MF                          184
        81

셀라하틴                                 MF                          180
        75

차경복                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정학범                                   MF


안익수                                   MF


차상광                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
권찬수                                   MF                          183
        77

정경두                                   MF                          194
        76

정해운                                   MF                          185
        79


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
양영민                                   MF                          190
        80

가이모토                                 MF                          182
        77

정두영                                   MF                          181
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정명휘                                   MF                          185
        76

정영철                                   MF                          183
        80

정정재                                   MF                          184
        80


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정현수                                   MF                          186
        80

노태경                                   MF                          175
        68

문삼진                                   MF                          173
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
민경인                                   MF                          177
        71

최종남                                   MF                          182
        76

최충균                                   MF                          184
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
배진수                                   MF                          178
        72

김영진                                   MF                          180
        75

임규식                                   MF                          182
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
곽치국                                   MF                          170
        68

정상식                                   MF                          184
        71

정용희                                   MF                          178
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
노규영                                   MF                          180
        83

최강조                                   MF                          165
        57

최남열                                   MF                          178
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
백영철                                   MF                          177
        71

조태용                                   MF                          174
        67

올리베                                   MF                          175
        73


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김리네                                   MF                          172
        69

쟈스민                                   MF                          180
        78

전재호                                   MF                          168
        64


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김진호                                   MF                          174
        68

이낙훈                                   MF                          172
        62

홍도표                                   MF                          173
        66


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정대의                                   MF                          174
        70

정우재                                   MF                          173
        71

샤샤                                     MF                          190
        84


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
서관수                                   MF                          179
        74

김성운                                   MF                          173
        64

김정운                                   MF                          170
        68


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
장동현                                   MF                          178
        67

황연석                                   MF                          192
        81

정호                                     MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
왕선재                                   MF


코샤                                     MF


윤성효                                   MF



선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정광수                                   MF                          182
        79

최호진                                   MF                          190
        82

조범철                                   MF                          185
        85


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김운재                                   MF                          182
        82

정영선                                   MF                          184
        81

정유진                                   MF                          188
        76


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
손승준                                   MF                          186
        72

조홍기                                   MF                          175
        66

안동원                                   MF                          184
        78


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김강진                                   MF                          181
        65

김병근                                   MF                          175
        63

김태권                                   MF                          180
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
김병국                                   MF                          183
        78

김성환                                   MF                          183
        75

가비                                     MF                          177
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
강대희                                   MF                          174
        65

고종수                                   MF                          176
        70

고창현                                   MF                          170
        64


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정기범                                   MF                          173
        65

정동현                                   MF                          175
        72

정두현                                   MF                          175
        67


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
정준                                     MF                          170
        65

정진우                                   MF                          179
        72

데니스                                   MF                          176
        71


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
서정원                                   MF                          173
        66

손대호                                   MF                          186
        79

오규찬                                   MF                          178
        71


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
윤원일                                   MF                          176
        70

김동욱                                   MF                          176
        68

장성철                                   MF                          176
        75


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
장윤정                                   MF                          173
        63

장서연                                   MF                          180
        60

고규억                                   MF                          175
        70


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
장재우                                   MF                          172
        63

오재진                                   MF                          173
        72

선원길                                   MF                          174
        66


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
안소정                                   MF                          174
        63

주시형                                   MF                          170
        72

홍종하                                   MF                          169
        74


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
오춘식                                   MF                          168
        75

박창우                                   MF                          177
        68

박진하                                   MF                          181
        62


선수명                                   위치                         키
---------------------------------------- -------------------- ----------
    몸무게
----------
박지성                                   MF                          178
        73

이청용                                   MF                          180
        69


482 행이 선택되었습니다.

SQL> SELECT PLAYER_NAME "선수 이름", POSITION "그라운드 포지션", HEIGHT "키", WEIGHT "몸무게"
  2  FROM PLAYER;

선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
우르모브                                 MF                          180
        70

윤희준                                   MF                          180
        74

김규호                                   MF                          177
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김민성                                   MF                          182
        73

김장관                                   MF                          170
        61

김정효                                   MF                          174
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
장대일                                   MF                          184
        79

박상수                                   MF                          173
        65

정재영                                   MF                          187
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정태민                                   MF                          180
        71

정현우                                   MF                          178
        70

송종국                                   MF                          177
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
오정석                                   MF                          178
        74

이고르                                   MF                          181
        76

김용하                                   MF                          173
        66


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
전상배                                   MF                          176
        67

전우근                                   MF                          175
        68

이태성                                   MF                          177
        64


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
황철민                                   MF                          175
        68

정관규                                   MF                          178
        71

정기종                                   MF                          182
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정창오                                   MF                          186
        82

디디                                     MF                          179
        78

마니치                                   MF                          184
        80


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
우성용                                   MF                          191
        76

장기봉                                   MF                          180
        71

이광수                                   MF                          177
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
하리                                     MF                          168
        65

박상남                                   MF                          188
        80

빅토르                                   MF                          183
        79


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이윤겸                                   MF                          178
        80

하재훈                                   MF                          174
        67

김충호                                   MF                          185
        83


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
임기한                                   MF                          177
        85

김경태                                   MF


남현우                                   MF                          180
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김충호                                   MF                          185
        83

이현                                     MF                          192
        85

한동진                                   MF                          183
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
다오                                     MF                          190
        80

최철                                     MF                          176
        77

송창남                                   MF                          175
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
조승호                                   MF                          179
        70

윤중희                                   MF                          177
        75

김범직                                   MF                          182
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김상홍                                   MF                          178
        68

김태호                                   MF


정상수                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
유동우                                   MF                          177
        70

전기현                                   MF


강성일                                   MF                          182
        80


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김승준                                   MF                          183
        77

이은성                                   MF                          184
        82

정대수                                   MF                          184
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정민기                                   MF                          171
        65

정성근                                   MF                          180
        73

정영근                                   MF                          180
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정정수                                   MF                          180
        74

김창엽                                   MF                          174
        64

장철우                                   MF                          172
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
콜리                                     MF                          182
        75

홍광철                                   MF                          172
        65

강정훈                                   MF                          175
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
공오균                                   MF                          177
        72

정국진                                   MF                          172
        62

정동선                                   MF                          170
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최경규                                   MF                          177
        72

최내철                                   MF                          177
        71

배성재                                   MF                          178
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
샴                                       MF                          174
        69

오비나                                   MF                          169
        70

김관우                                   MF                          175
        69


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김광진                                   MF                          175
        75

김상규                                   MF                          175
        65

임영주                                   MF                          176
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
박영훈                                   MF                          174
        73

한정국                                   MF                          179
        71

정광선                                   MF                          175
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정은중                                   MF                          184
        72

정찬중                                   MF                          182
        72

김석                                     MF                          194
        85


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
탁준석                                   MF                          178
        69

정호곤                                   MF                          172
        77

최경훈                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정동훈                                   MF                          180
        88

정남표                                   MF                          180
        77

정광재                                   MF                          180
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
권혁준                                   MF                          173
        82

정경진                                   MF                          186
        78

정용대                                   MF                          189
        83


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정지혁                                   MF                          187
        77

박유석                                   MF                          186
        78

정진우                                   MF                          180
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정학철                                   MF                          176
        73

류병훈                                   MF                          184
        68

최준홍                                   MF                          178
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
서용혁                                   MF                          183
        79

심재원                                   MF                          184
        77

김임생                                   MF                          183
        80


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
장형석                                   MF                          181
        72

박진성                                   MF                          184
        76

이거룩                                   MF                          183
        77


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이정민                                   MF                          183
        78

페르난도                                 MF                          178
        74

김무건                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정병지                                   MF                          184
        77

최주호                                   MF                          185
        75

김대희                                   MF                          192
        88


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김준호                                   MF                          185
        77

허인무                                   MF                          187
        81

강용                                     MF                          179
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
고병운                                   MF                          180
        73

정광석                                   MF                          183
        72

정상훈                                   MF                          183
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정석우                                   MF                          181
        72

정은석                                   MF                          185
        80

최민서                                   MF                          180
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
성종현                                   MF                          178
        74

싸빅                                     MF                          185
        78

오명관                                   MF                          185
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김동식                                   MF                          183
        77

김수길                                   MF                          179
        69

김승엽                                   MF                          180
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김종화                                   MF                          182
        76

하석주                                   MF                          174
        71

허제정                                   MF                          175
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
홍명보                                   MF                          181
        72

정기남                                   MF                          174
        72

정상록                                   MF                          173
        63


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
나희근                                   MF                          178
        72

레오                                     MF                          179
        74

메도                                     MF                          180
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최길영                                   MF                          172
        64

최상인                                   MF                          174
        63

옐라                                     MF                          184
        79


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
유현구                                   MF                          170
        68

김기부                                   MF                          183
        76

김상인                                   MF                          178
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김정운                                   MF                          178
        70

김중규                                   MF                          170
        64

김창호                                   MF                          175
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이종범                                   MF                          178
        68

남익경                                   MF                          177
        70

윤보영                                   MF                          177
        63


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김동국                                   MF                          185
        80

박종완                                   MF                          188
        82

김징요                                   MF                          174
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이철우                                   MF                          185
        78

코난                                     MF                          180
        76

정민규                                   MF                          178
        71


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
제형진                                   MF                          179
        75

곽기훈                                   MF                          177
        72

최민영                                   MF                          174
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김회택                                   MF


서현옥                                   MF


정상호                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최철우                                   MF


정영광                                   MF                          185
        80

최종문                                   MF                          185
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
염동균                                   MF                          189
        83

김정래                                   MF                          185
        81

강철                                     MF                          178
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정강선                                   MF                          180
        73

정인호                                   MF                          184
        79

정태영                                   MF                          180
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정현수                                   MF                          176
        74

정형주                                   MF


정홍철                                   MF                          181
        69


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
마시엘                                   MF                          177
        70

김창원                                   MF                          183
        75

장경진                                   MF                          184
        82


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
주영호                                   MF                          185
        80

홍성요                                   MF                          184
        78

정경일                                   MF                          170
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정길식                                   MF                          178
        72

정남일                                   MF                          182
        76

정대욱                                   MF                          182
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도근                                   MF                          181
        69

정동희                                   MF                          174
        64

정명곤                                   MF                          177
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정성진                                   MF                          178
        68

정승현                                   MF                          181
        71

정요환                                   MF                          170
        62


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정정겸                                   MF                          172
        65

정종현                                   MF                          173
        68

노병준                                   MF                          177
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최종우                                   MF                          176
        69

조진원                                   MF                          176
        75

실바                                     MF                          173
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
윤용구                                   MF                          168
        60

김반                                     MF                          174
        69

김영수                                   MF                          175
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
임관식                                   MF                          172
        68

이정호                                   MF                          176
        71

하기윤                                   MF                          180
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정대철                                   MF                          183
        78

꼬레아                                   MF                          172
        70

노상래                                   MF                          175
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
성한수                                   MF                          177
        69

세자르                                   MF                          180
        78

조병호                                   MF                          177
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
찌코                                     MF                          180
        67

하성룡                                   MF                          179
        68

홍복표                                   MF                          182
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김윤환                                   MF


정은철                                   MF


김경춘                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최동우                                   MF


전명구                                   MF


박경치                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정이섭                                   MF                          185
        78

최관민                                   MF                          188
        85

최동우                                   MF                          187
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김용발                                   MF                          183
        77

김창민                                   MF                          191
        87

정대건                                   MF                          183
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정봉현                                   MF                          188
        74

정창민                                   MF                          181
        68

최동혁                                   MF                          185
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
백인석                                   MF                          179
        72

서혁수                                   MF                          178
        77

안광호                                   MF                          190
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
임종훈                                   MF                          182
        74

이진철                                   MF                          187
        75

한종성                                   MF                          177
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
호제리오                                 MF                          185
        85

황승주                                   MF                          176
        68

고관영                                   MF                          180
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정경량                                   MF                          173
        65

정은익                                   MF                          176
        63

레오마르                                 MF                          183
        77


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
명재용                                   MF                          173
        63

변재섭                                   MF                          170
        63

보띠                                     MF                          174
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
비에라                                   MF                          176
        73

서동원                                   MF                          184
        78

안대현                                   MF                          179
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
양현정                                   MF                          176
        72

유원섭                                   MF                          180
        77

김수철                                   MF                          171
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
임다한                                   MF                          181
        67

전경준                                   MF                          178
        68

이영훈                                   MF                          178
        71


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
추운기                                   MF                          173
        69

하은철                                   MF                          176
        69

고민기                                   MF                          178
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도훈                                   MF                          182
        77

정연건                                   MF                          188
        77

정현기                                   MF                          190
        82


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
남궁도                                   MF                          186
        80

문태혁                                   MF                          178
        74

최성배                                   MF                          181
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
에드밀손                                 MF                          184
        79

쿠키                                     MF                          170
        76

정은익                                   MF                          176
        65


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이순호                                   MF


유동관                                   MF


박기동                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김반코비                                 MF                          185
        78

김선우                                   MF                          174
        68

김여성                                   MF                          179
        63


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김용우                                   MF                          175
        70

김종민                                   MF                          174
        65

박용훈                                   MF                          175
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김만근                                   MF                          177
        67

김재민                                   MF                          180
        71

김현두                                   MF                          176
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이성용                                   MF                          173
        70

하태근                                   MF                          182
        75

미트로                                   MF                          192
        89


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최건하                                   MF                          180
        75

산드로                                   MF                          182
        78

윤화평                                   MF                          182
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김관희                                   MF                          180
        70

김광래                                   MF


김춘석                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
조재흠                                   MF


김영진                                   MF


정귀화                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최동석                                   MF                          190
        89

백민철                                   MF                          185
        78

조의손                                   MF                          192
        87


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
우태식                                   MF                          185
        75

정동진                                   MF                          182
        74

정성일                                   MF                          178
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정치곤                                   MF                          183
        76

최요셉                                   MF                          183
        75

최용호                                   MF                          182
        69


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최정석                                   MF                          182
        78

손현준                                   MF                          175
        70

안성훈                                   MF                          176
        63


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김상헌                                   MF                          185
        80

박성호                                   MF                          184
        71

이윤열                                   MF                          185
        79


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도용                                   MF                          168
        68

정민성                                   MF                          175
        64

조재필                                   MF                          180
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
조현국                                   MF                          172
        65

안드레                                   MF                          172
        69

안상현                                   MF                          176
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
우진석                                   MF                          176
        70

유상수                                   MF                          175
        67

김영표                                   MF                          176
        66


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김준기                                   MF                          183
        74

김지남                                   MF                          183
        68

박광민                                   MF                          180
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
박창근                                   MF                          170
        63

이원권                                   MF                          173
        65

정병채                                   MF                          180
        72


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정성재                                   MF                          178
        72

뚜따                                     MF                          187
        84

마르코                                   MF                          175
        77


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최성호                                   MF                          187
        73

최윤화                                   MF                          175
        67

최정환                                   MF                          178
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
왕정현                                   MF                          181
        73

김정수                                   MF                          184
        74

김원광                                   MF                          183
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
진순진                                   MF                          180
        78

이태욱                                   MF                          173
        66

한동원                                   MF                          174
        61


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
한정화                                   MF                          173
        63

히카르도                                 MF                          189
        71

권정혁                                   MF                          195
        80


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최창주                                   MF                          187
        86

서동명                                   MF                          196
        94

양지원                                   MF                          181
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이무림                                   MF                          185
        79

정윤구                                   MF                          182
        75

끌레베르                                 MF                          186
        79


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최경삼                                   MF                          188
        74

최종욱                                   MF                          185
        74

변성환                                   MF                          176
        69


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
손상호                                   MF                          187
        78

유재형                                   MF                          180
        79

김세권                                   MF                          184
        80


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
하성용                                   MF                          179
        75

한정일                                   MF                          172
        65

정건형                                   MF                          176
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정도균                                   MF                          184
        78

최기욱                                   MF                          175
        68

최진섭                                   MF                          179
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
서덕규                                   MF                          182
        72

에디                                     MF                          182
        70

김길용                                   MF                          183
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김윤섭                                   MF                          184
        77

김천수                                   MF                          174
        65

장성욱                                   MF                          174
        71


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
장철민                                   MF                          179
        76

전광철                                   MF                          186
        74

전재운                                   MF                          177
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
박정수                                   MF                          170
        61

박주영                                   MF                          172
        65

김원희                                   MF                          178
        71


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
곽기훈                                   MF                          177
        72

정현석                                   MF                          178
        70

마르코스                                 MF                          170
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최규선                                   MF                          182
        66

알리송                                   MF                          171
        60

김태유                                   MF                          175
        64


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
박성훈                                   MF                          187
        83

이인석                                   MF                          181
        74

파울링뇨                                 MF                          174
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
현영민                                   MF                          179
        73

홍인기                                   MF                          182
        75

정기동                                   MF                          171
        66


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정기형                                   MF                          173
        64

정정현                                   MF                          176
        68

정한윤                                   MF                          185
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
남기일                                   MF                          177
        69

무스타파                                 MF                          180
        73

최정주                                   MF                          177
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
조현호                                   MF                          183
        71

윤정춘                                   MF                          173
        66

장경호                                   MF                          174
        66


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
이문식                                   MF                          173
        66

곽경근                                   MF                          184
        81

다보                                     MF                          183
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
최성철                                   MF                          190
        78

비탈리                                   MF                          183
        74

안승인                                   MF                          182
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
윤원철                                   MF                          184
        75

김성재                                   MF                          178
        67

김원식                                   MF                          172
        64


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김종민                                   MF                          184
        77

박필석                                   MF                          190
        83

제프유                                   MF                          184
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
롤란                                     MF                          184
        81

셀라하틴                                 MF                          180
        75

차경복                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정학범                                   MF


안익수                                   MF


차상광                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
권찬수                                   MF                          183
        77

정경두                                   MF                          194
        76

정해운                                   MF                          185
        79


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
양영민                                   MF                          190
        80

가이모토                                 MF                          182
        77

정두영                                   MF                          181
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정명휘                                   MF                          185
        76

정영철                                   MF                          183
        80

정정재                                   MF                          184
        80


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정현수                                   MF                          186
        80

노태경                                   MF                          175
        68

문삼진                                   MF                          173
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
민경인                                   MF                          177
        71

최종남                                   MF                          182
        76

최충균                                   MF                          184
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
배진수                                   MF                          178
        72

김영진                                   MF                          180
        75

임규식                                   MF                          182
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
곽치국                                   MF                          170
        68

정상식                                   MF                          184
        71

정용희                                   MF                          178
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
노규영                                   MF                          180
        83

최강조                                   MF                          165
        57

최남열                                   MF                          178
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
백영철                                   MF                          177
        71

조태용                                   MF                          174
        67

올리베                                   MF                          175
        73


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김리네                                   MF                          172
        69

쟈스민                                   MF                          180
        78

전재호                                   MF                          168
        64


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김진호                                   MF                          174
        68

이낙훈                                   MF                          172
        62

홍도표                                   MF                          173
        66


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정대의                                   MF                          174
        70

정우재                                   MF                          173
        71

샤샤                                     MF                          190
        84


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
서관수                                   MF                          179
        74

김성운                                   MF                          173
        64

김정운                                   MF                          170
        68


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
장동현                                   MF                          178
        67

황연석                                   MF                          192
        81

정호                                     MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
왕선재                                   MF


코샤                                     MF


윤성효                                   MF



선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정광수                                   MF                          182
        79

최호진                                   MF                          190
        82

조범철                                   MF                          185
        85


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김운재                                   MF                          182
        82

정영선                                   MF                          184
        81

정유진                                   MF                          188
        76


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
손승준                                   MF                          186
        72

조홍기                                   MF                          175
        66

안동원                                   MF                          184
        78


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김강진                                   MF                          181
        65

김병근                                   MF                          175
        63

김태권                                   MF                          180
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
김병국                                   MF                          183
        78

김성환                                   MF                          183
        75

가비                                     MF                          177
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
강대희                                   MF                          174
        65

고종수                                   MF                          176
        70

고창현                                   MF                          170
        64


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정기범                                   MF                          173
        65

정동현                                   MF                          175
        72

정두현                                   MF                          175
        67


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
정준                                     MF                          170
        65

정진우                                   MF                          179
        72

데니스                                   MF                          176
        71


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
서정원                                   MF                          173
        66

손대호                                   MF                          186
        79

오규찬                                   MF                          178
        71


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
윤원일                                   MF                          176
        70

김동욱                                   MF                          176
        68

장성철                                   MF                          176
        75


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
장윤정                                   MF                          173
        63

장서연                                   MF                          180
        60

고규억                                   MF                          175
        70


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
장재우                                   MF                          172
        63

오재진                                   MF                          173
        72

선원길                                   MF                          174
        66


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
안소정                                   MF                          174
        63

주시형                                   MF                          170
        72

홍종하                                   MF                          169
        74


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
오춘식                                   MF                          168
        75

박창우                                   MF                          177
        68

박진하                                   MF                          181
        62


선수 이름                                그라운드 포지션              키
---------------------------------------- -------------------- ----------
    몸무게
----------
박지성                                   MF                          178
        73

이청용                                   MF                          180
        69


482 행이 선택되었습니다.

SQL> SELECT PLAYER_NAME 이름, HEIGHT - WEIGHT "키-몸무게"
  2  FROM PLAYER;

이름                                      키-몸무게
---------------------------------------- ----------
우르모브                                        110
윤희준                                          106
김규호                                          105
김민성                                          109
김장관                                          109
김정효                                          106
장대일                                          105
박상수                                          108
정재영                                          112
정태민                                          109
정현우                                          108

이름                                      키-몸무게
---------------------------------------- ----------
송종국                                          104
오정석                                          104
이고르                                          105
김용하                                          107
전상배                                          109
전우근                                          107
이태성                                          113
황철민                                          107
정관규                                          107
정기종                                          104
정창오                                          104

이름                                      키-몸무게
---------------------------------------- ----------
디디                                            101
마니치                                          104
우성용                                          115
장기봉                                          109
이광수                                          104
하리                                            103
박상남                                          108
빅토르                                          104
이윤겸                                           98
하재훈                                          107
김충호                                          102

이름                                      키-몸무게
---------------------------------------- ----------
임기한                                           92
김경태
남현우                                          108
김충호                                          102
이현                                            107
한동진                                          105
다오                                            110
최철                                             99
송창남                                          108
조승호                                          109
윤중희                                          102

이름                                      키-몸무게
---------------------------------------- ----------
김범직                                          107
김상홍                                          110
김태호
정상수
유동우                                          107
전기현
강성일                                          102
김승준                                          106
이은성                                          102
정대수                                          110
정민기                                          106

이름                                      키-몸무게
---------------------------------------- ----------
정성근                                          107
정영근                                          110
정정수                                          106
김창엽                                          110
장철우                                          107
콜리                                            107
홍광철                                          107
강정훈                                          110
공오균                                          105
정국진                                          110
정동선                                          105

이름                                      키-몸무게
---------------------------------------- ----------
최경규                                          105
최내철                                          106
배성재                                          104
샴                                              105
오비나                                           99
김관우                                          106
김광진                                          100
김상규                                          110
임영주                                          108
박영훈                                          101
한정국                                          108

이름                                      키-몸무게
---------------------------------------- ----------
정광선                                          107
정은중                                          112
정찬중                                          110
김석                                            109
탁준석                                          109
정호곤                                           95
최경훈
정동훈                                           92
정남표                                          103
정광재                                          105
권혁준                                           91

이름                                      키-몸무게
---------------------------------------- ----------
정경진                                          108
정용대                                          106
정지혁                                          110
박유석                                          108
정진우                                          104
정학철                                          103
류병훈                                          116
최준홍                                          108
서용혁                                          104
심재원                                          107
김임생                                          103

이름                                      키-몸무게
---------------------------------------- ----------
장형석                                          109
박진성                                          108
이거룩                                          106
이정민                                          105
페르난도                                        104
김무건
정병지                                          107
최주호                                          110
김대희                                          104
김준호                                          108
허인무                                          106

이름                                      키-몸무게
---------------------------------------- ----------
강용                                            107
고병운                                          107
정광석                                          111
정상훈                                          107
정석우                                          109
정은석                                          105
최민서                                          102
성종현                                          104
싸빅                                            107
오명관                                          109
김동식                                          106

이름                                      키-몸무게
---------------------------------------- ----------
김수길                                          110
김승엽                                          106
김종화                                          106
하석주                                          103
허제정                                          105
홍명보                                          109
정기남                                          102
정상록                                          110
나희근                                          106
레오                                            105
메도                                            102

이름                                      키-몸무게
---------------------------------------- ----------
최길영                                          108
최상인                                          111
옐라                                            105
유현구                                          102
김기부                                          107
김상인                                          108
김정운                                          108
김중규                                          106
김창호                                          100
이종범                                          110
남익경                                          107

이름                                      키-몸무게
---------------------------------------- ----------
윤보영                                          114
김동국                                          105
박종완                                          106
김징요                                          104
이철우                                          107
코난                                            104
정민규                                          107
제형진                                          104
곽기훈                                          105
최민영                                          107
김회택

이름                                      키-몸무게
---------------------------------------- ----------
서현옥
정상호
최철우
정영광                                          105
최종문                                          109
염동균                                          106
김정래                                          104
강철                                            106
정강선                                          107
정인호                                          105
정태영                                          106

이름                                      키-몸무게
---------------------------------------- ----------
정현수                                          102
정형주
정홍철                                          112
마시엘                                          107
김창원                                          108
장경진                                          102
주영호                                          105
홍성요                                          106
정경일                                          105
정길식                                          106
정남일                                          106

이름                                      키-몸무게
---------------------------------------- ----------
정대욱                                          109
정도근                                          112
정동희                                          110
정명곤                                          104
정성진                                          110
정승현                                          110
정요환                                          108
정정겸                                          107
정종현                                          105
노병준                                          110
최종우                                          107

이름                                      키-몸무게
---------------------------------------- ----------
조진원                                          101
실바                                            106
윤용구                                          108
김반                                            105
김영수                                          110
임관식                                          104
이정호                                          105
하기윤                                          115
정대철                                          105
꼬레아                                          102
노상래                                          101

이름                                      키-몸무게
---------------------------------------- ----------
성한수                                          108
세자르                                          102
조병호                                          102
찌코                                            113
하성룡                                          111
홍복표                                          109
김윤환
정은철
김경춘
최동우
전명구

이름                                      키-몸무게
---------------------------------------- ----------
박경치
정이섭                                          107
최관민                                          103
최동우                                          109
김용발                                          106
김창민                                          104
정대건                                          105
정봉현                                          114
정창민                                          113
최동혁                                          107
백인석                                          107

이름                                      키-몸무게
---------------------------------------- ----------
서혁수                                          101
안광호                                          112
임종훈                                          108
이진철                                          112
한종성                                          107
호제리오                                        100
황승주                                          108
고관영                                          108
정경량                                          108
정은익                                          113
레오마르                                        106

이름                                      키-몸무게
---------------------------------------- ----------
명재용                                          110
변재섭                                          107
보띠                                            106
비에라                                          103
서동원                                          106
안대현                                          107
양현정                                          104
유원섭                                          103
김수철                                          103
임다한                                          114
전경준                                          110

이름                                      키-몸무게
---------------------------------------- ----------
이영훈                                          107
추운기                                          104
하은철                                          107
고민기                                          108
정도훈                                          105
정연건                                          111
정현기                                          108
남궁도                                          106
문태혁                                          104
최성배                                          105
에드밀손                                        105

이름                                      키-몸무게
---------------------------------------- ----------
쿠키                                             94
정은익                                          111
이순호
유동관
박기동
김반코비                                        107
김선우                                          106
김여성                                          116
김용우                                          105
김종민                                          109
박용훈                                          108

이름                                      키-몸무게
---------------------------------------- ----------
김만근                                          110
김재민                                          109
김현두                                          108
이성용                                          103
하태근                                          107
미트로                                          103
최건하                                          105
산드로                                          104
윤화평                                          108
김관희                                          110
김광래

이름                                      키-몸무게
---------------------------------------- ----------
김춘석
조재흠
김영진
정귀화
최동석                                          101
백민철                                          107
조의손                                          105
우태식                                          110
정동진                                          108
정성일                                          103
정치곤                                          107

이름                                      키-몸무게
---------------------------------------- ----------
최요셉                                          108
최용호                                          113
최정석                                          104
손현준                                          105
안성훈                                          113
김상헌                                          105
박성호                                          113
이윤열                                          106
정도용                                          100
정민성                                          111
조재필                                          110

이름                                      키-몸무게
---------------------------------------- ----------
조현국                                          107
안드레                                          103
안상현                                          109
우진석                                          106
유상수                                          108
김영표                                          110
김준기                                          109
김지남                                          115
박광민                                          110
박창근                                          107
이원권                                          108

이름                                      키-몸무게
---------------------------------------- ----------
정병채                                          108
정성재                                          106
뚜따                                            103
마르코                                           98
최성호                                          114
최윤화                                          108
최정환                                          108
왕정현                                          108
김정수                                          110
김원광                                          115
진순진                                          102

이름                                      키-몸무게
---------------------------------------- ----------
이태욱                                          107
한동원                                          113
한정화                                          110
히카르도                                        118
권정혁                                          115
최창주                                          101
서동명                                          102
양지원                                          106
이무림                                          106
정윤구                                          107
끌레베르                                        107

이름                                      키-몸무게
---------------------------------------- ----------
최경삼                                          114
최종욱                                          111
변성환                                          107
손상호                                          109
유재형                                          101
김세권                                          104
하성용                                          104
한정일                                          107
정건형                                          106
정도균                                          106
최기욱                                          107

이름                                      키-몸무게
---------------------------------------- ----------
최진섭                                          111
서덕규                                          110
에디                                            112
김길용                                          105
김윤섭                                          107
김천수                                          109
장성욱                                          103
장철민                                          103
전광철                                          112
전재운                                          110
박정수                                          109

이름                                      키-몸무게
---------------------------------------- ----------
박주영                                          107
김원희                                          107
곽기훈                                          105
정현석                                          108
마르코스                                         97
최규선                                          116
알리송                                          111
김태유                                          111
박성훈                                          104
이인석                                          107
파울링뇨                                         99

이름                                      키-몸무게
---------------------------------------- ----------
현영민                                          106
홍인기                                          107
정기동                                          105
정기형                                          109
정정현                                          108
정한윤                                          111
남기일                                          108
무스타파                                        107
최정주                                          104
조현호                                          112
윤정춘                                          107

이름                                      키-몸무게
---------------------------------------- ----------
장경호                                          108
이문식                                          107
곽경근                                          103
다보                                            107
최성철                                          112
비탈리                                          109
안승인                                          107
윤원철                                          109
김성재                                          111
김원식                                          108
김종민                                          107

이름                                      키-몸무게
---------------------------------------- ----------
박필석                                          107
제프유                                          108
롤란                                            103
셀라하틴                                        105
차경복
정학범
안익수
차상광
권찬수                                          106
정경두                                          118
정해운                                          106

이름                                      키-몸무게
---------------------------------------- ----------
양영민                                          110
가이모토                                        105
정두영                                          106
정명휘                                          109
정영철                                          103
정정재                                          104
정현수                                          106
노태경                                          107
문삼진                                          105
민경인                                          106
최종남                                          106

이름                                      키-몸무게
---------------------------------------- ----------
최충균                                          114
배진수                                          106
김영진                                          105
임규식                                          107
곽치국                                          102
정상식                                          113
정용희                                          108
노규영                                           97
최강조                                          108
최남열                                          108
백영철                                          106

이름                                      키-몸무게
---------------------------------------- ----------
조태용                                          107
올리베                                          102
김리네                                          103
쟈스민                                          102
전재호                                          104
김진호                                          106
이낙훈                                          110
홍도표                                          107
정대의                                          104
정우재                                          102
샤샤                                            106

이름                                      키-몸무게
---------------------------------------- ----------
서관수                                          105
김성운                                          109
김정운                                          102
장동현                                          111
황연석                                          111
정호
왕선재
코샤
윤성효
정광수                                          103
최호진                                          108

이름                                      키-몸무게
---------------------------------------- ----------
조범철                                          100
김운재                                          100
정영선                                          103
정유진                                          112
손승준                                          114
조홍기                                          109
안동원                                          106
김강진                                          116
김병근                                          112
김태권                                          105
김병국                                          105

이름                                      키-몸무게
---------------------------------------- ----------
김성환                                          108
가비                                            103
강대희                                          109
고종수                                          106
고창현                                          106
정기범                                          108
정동현                                          103
정두현                                          108
정준                                            105
정진우                                          107
데니스                                          105

이름                                      키-몸무게
---------------------------------------- ----------
서정원                                          107
손대호                                          107
오규찬                                          107
윤원일                                          106
김동욱                                          108
장성철                                          101
장윤정                                          110
장서연                                          120
고규억                                          105
장재우                                          109
오재진                                          101

이름                                      키-몸무게
---------------------------------------- ----------
선원길                                          108
안소정                                          111
주시형                                           98
홍종하                                           95
오춘식                                           93
박창우                                          109
박진하                                          119
박지성                                          105
이청용                                          111

482 행이 선택되었습니다.

SQL> SELECT PLAYER_NAME 이름, ROUND(WEIGHT/((HEIGHT/100)*(HEIGHT/100)), 2)
  2  "BMI 비만지수"
  3  FROM PLAYER;

이름                                     BMI 비만지수
---------------------------------------- ------------
우르모브                                         21.6
윤희준                                          22.84
김규호                                          22.98
김민성                                          22.04
김장관                                          21.11
김정효                                          22.46
장대일                                          23.33
박상수                                          21.72
정재영                                          21.45
정태민                                          21.91
정현우                                          22.09

이름                                     BMI 비만지수
---------------------------------------- ------------
송종국                                           23.3
오정석                                          23.36
이고르                                           23.2
김용하                                          22.05
전상배                                          21.63
전우근                                           22.2
이태성                                          20.43
황철민                                           22.2
정관규                                          22.41
정기종                                          23.55
정창오                                           23.7

이름                                     BMI 비만지수
---------------------------------------- ------------
디디                                            24.34
마니치                                          23.63
우성용                                          20.83
장기봉                                          21.91
이광수                                           23.3
하리                                            23.03
박상남                                          22.63
빅토르                                          23.59
이윤겸                                          25.25
하재훈                                          22.13
김충호                                          24.25

이름                                     BMI 비만지수
---------------------------------------- ------------
임기한                                          27.13
김경태
남현우                                          22.22
김충호                                          24.25
이현                                            23.06
한동진                                          23.29
다오                                            22.16
최철                                            24.86
송창남                                          21.88
조승호                                          21.85
윤중희                                          23.94

이름                                     BMI 비만지수
---------------------------------------- ------------
김범직                                          22.64
김상홍                                          21.46
김태호
정상수
유동우                                          22.34
전기현
강성일                                          24.15
김승준                                          22.99
이은성                                          24.22
정대수                                          21.86
정민기                                          22.23

이름                                     BMI 비만지수
---------------------------------------- ------------
정성근                                          22.53
정영근                                           21.6
정정수                                          22.84
김창엽                                          21.14
장철우                                          21.97
콜리                                            22.64
홍광철                                          21.97
강정훈                                          21.22
공오균                                          22.98
정국진                                          20.96
정동선                                          22.49

이름                                     BMI 비만지수
---------------------------------------- ------------
최경규                                          22.98
최내철                                          22.66
배성재                                          23.36
샴                                              22.79
오비나                                          24.51
김관우                                          22.53
김광진                                          24.49
김상규                                          21.22
임영주                                          21.95
박영훈                                          24.11
한정국                                          22.16

이름                                     BMI 비만지수
---------------------------------------- ------------
정광선                                           22.2
정은중                                          21.27
정찬중                                          21.74
김석                                            22.58
탁준석                                          21.78
정호곤                                          26.03
최경훈
정동훈                                          27.16
정남표                                          23.77
정광재                                          23.15
권혁준                                           27.4

이름                                     BMI 비만지수
---------------------------------------- ------------
정경진                                          22.55
정용대                                          23.24
정지혁                                          22.02
박유석                                          22.55
정진우                                          23.46
정학철                                          23.57
류병훈                                          20.09
최준홍                                          22.09
서용혁                                          23.59
심재원                                          22.74
김임생                                          23.89

이름                                     BMI 비만지수
---------------------------------------- ------------
장형석                                          21.98
박진성                                          22.45
이거룩                                          22.99
이정민                                          23.29
페르난도                                        23.36
김무건
정병지                                          22.74
최주호                                          21.91
김대희                                          23.87
김준호                                           22.5
허인무                                          23.16

이름                                     BMI 비만지수
---------------------------------------- ------------
강용                                            22.47
고병운                                          22.53
정광석                                           21.5
정상훈                                          22.69
정석우                                          21.98
정은석                                          23.37
최민서                                          24.07
성종현                                          23.36
싸빅                                            22.79
오명관                                          22.21
김동식                                          22.99

이름                                     BMI 비만지수
---------------------------------------- ------------
김수길                                          21.53
김승엽                                          22.84
김종화                                          22.94
하석주                                          23.45
허제정                                          22.86
홍명보                                          21.98
정기남                                          23.78
정상록                                          21.05
나희근                                          22.72
레오                                             23.1
메도                                            24.07

이름                                     BMI 비만지수
---------------------------------------- ------------
최길영                                          21.63
최상인                                          20.81
옐라                                            23.33
유현구                                          23.53
김기부                                          22.69
김상인                                          22.09
김정운                                          22.09
김중규                                          22.15
김창호                                          24.49
이종범                                          21.46
남익경                                          22.34

이름                                     BMI 비만지수
---------------------------------------- ------------
윤보영                                          20.11
김동국                                          23.37
박종완                                           23.2
김징요                                          23.12
이철우                                          22.79
코난                                            23.46
정민규                                          22.41
제형진                                          23.41
곽기훈                                          22.98
최민영                                          22.13
김회택

이름                                     BMI 비만지수
---------------------------------------- ------------
서현옥
정상호
최철우
정영광                                          23.37
최종문                                          22.21
염동균                                          23.24
김정래                                          23.67
강철                                            22.72
정강선                                          22.53
정인호                                          23.33
정태영                                          22.84

이름                                     BMI 비만지수
---------------------------------------- ------------
정현수                                          23.89
정형주
정홍철                                          21.06
마시엘                                          22.34
김창원                                           22.4
장경진                                          24.22
주영호                                          23.37
홍성요                                          23.04
정경일                                          22.49
정길식                                          22.72
정남일                                          22.94

이름                                     BMI 비만지수
---------------------------------------- ------------
정대욱                                          22.04
정도근                                          21.06
정동희                                          21.14
정명곤                                           23.3
정성진                                          21.46
정승현                                          21.67
정요환                                          21.45
정정겸                                          21.97
정종현                                          22.72
노병준                                          21.39
최종우                                          22.28

이름                                     BMI 비만지수
---------------------------------------- ------------
조진원                                          24.21
실바                                            22.39
윤용구                                          21.26
김반                                            22.79
김영수                                          21.22
임관식                                          22.99
이정호                                          22.92
하기윤                                          20.06
정대철                                          23.29
꼬레아                                          23.66
노상래                                          24.16

이름                                     BMI 비만지수
---------------------------------------- ------------
성한수                                          22.02
세자르                                          24.07
조병호                                          23.94
찌코                                            20.68
하성룡                                          21.22
홍복표                                          22.04
김윤환
정은철
김경춘
최동우
전명구

이름                                     BMI 비만지수
---------------------------------------- ------------
박경치
정이섭                                          22.79
최관민                                          24.05
최동우                                          22.31
김용발                                          22.99
김창민                                          23.85
정대건                                          23.29
정봉현                                          20.94
정창민                                          20.76
최동혁                                          22.79
백인석                                          22.47

이름                                     BMI 비만지수
---------------------------------------- ------------
서혁수                                           24.3
안광호                                          21.61
임종훈                                          22.34
이진철                                          21.45
한종성                                          22.34
호제리오                                        24.84
황승주                                          21.95
고관영                                          22.22
정경량                                          21.72
정은익                                          20.34
레오마르                                        22.99

이름                                     BMI 비만지수
---------------------------------------- ------------
명재용                                          21.05
변재섭                                           21.8
보띠                                            22.46
비에라                                          23.57
서동원                                          23.04
안대현                                          22.47
양현정                                          23.24
유원섭                                          23.77
김수철                                          23.26
임다한                                          20.45
전경준                                          21.46

이름                                     BMI 비만지수
---------------------------------------- ------------
이영훈                                          22.41
추운기                                          23.05
하은철                                          22.28
고민기                                          22.09
정도훈                                          23.25
정연건                                          21.79
정현기                                          22.71
남궁도                                          23.12
문태혁                                          23.36
최성배                                           23.2
에드밀손                                        23.33

이름                                     BMI 비만지수
---------------------------------------- ------------
쿠키                                             26.3
정은익                                          20.98
이순호
유동관
박기동
김반코비                                        22.79
김선우                                          22.46
김여성                                          19.66
김용우                                          22.86
김종민                                          21.47
박용훈                                          21.88

이름                                     BMI 비만지수
---------------------------------------- ------------
김만근                                          21.39
김재민                                          21.91
김현두                                          21.95
이성용                                          23.39
하태근                                          22.64
미트로                                          24.14
최건하                                          23.15
산드로                                          23.55
윤화평                                          22.34
김관희                                           21.6
김광래

이름                                     BMI 비만지수
---------------------------------------- ------------
김춘석
조재흠
김영진
정귀화
최동석                                          24.65
백민철                                          22.79
조의손                                           23.6
우태식                                          21.91
정동진                                          22.34
정성일                                          23.67
정치곤                                          22.69

이름                                     BMI 비만지수
---------------------------------------- ------------
최요셉                                           22.4
최용호                                          20.83
최정석                                          23.55
손현준                                          22.86
안성훈                                          20.34
김상헌                                          23.37
박성호                                          20.97
이윤열                                          23.08
정도용                                          24.09
정민성                                           20.9
조재필                                           21.6

이름                                     BMI 비만지수
---------------------------------------- ------------
조현국                                          21.97
안드레                                          23.32
안상현                                          21.63
우진석                                           22.6
유상수                                          21.88
김영표                                          21.31
김준기                                           22.1
김지남                                          20.31
박광민                                           21.6
박창근                                           21.8
이원권                                          21.72

이름                                     BMI 비만지수
---------------------------------------- ------------
정병채                                          22.22
정성재                                          22.72
뚜따                                            24.02
마르코                                          25.14
최성호                                          20.88
최윤화                                          21.88
최정환                                          22.09
왕정현                                          22.28
김정수                                          21.86
김원광                                          20.31
진순진                                          24.07

이름                                     BMI 비만지수
---------------------------------------- ------------
이태욱                                          22.05
한동원                                          20.15
한정화                                          21.05
히카르도                                        19.88
권정혁                                          21.04
최창주                                          24.59
서동명                                          24.47
양지원                                          22.89
이무림                                          23.08
정윤구                                          22.64
끌레베르                                        22.84

이름                                     BMI 비만지수
---------------------------------------- ------------
최경삼                                          20.94
최종욱                                          21.62
변성환                                          22.28
손상호                                          22.31
유재형                                          24.38
김세권                                          23.63
하성용                                          23.41
한정일                                          21.97
정건형                                           22.6
정도균                                          23.04
최기욱                                           22.2

이름                                     BMI 비만지수
---------------------------------------- ------------
최진섭                                          21.22
서덕규                                          21.74
에디                                            21.13
김길용                                          23.29
김윤섭                                          22.74
김천수                                          21.47
장성욱                                          23.45
장철민                                          23.72
전광철                                          21.39
전재운                                          21.39
박정수                                          21.11

이름                                     BMI 비만지수
---------------------------------------- ------------
박주영                                          21.97
김원희                                          22.41
곽기훈                                          22.98
정현석                                          22.09
마르코스                                        25.26
최규선                                          19.93
알리송                                          20.52
김태유                                           20.9
박성훈                                          23.74
이인석                                          22.59
파울링뇨                                        24.77

이름                                     BMI 비만지수
---------------------------------------- ------------
현영민                                          22.78
홍인기                                          22.64
정기동                                          22.57
정기형                                          21.38
정정현                                          21.95
정한윤                                          21.62
남기일                                          22.02
무스타파                                        22.53
최정주                                           23.3
조현호                                           21.2
윤정춘                                          22.05

이름                                     BMI 비만지수
---------------------------------------- ------------
장경호                                           21.8
이문식                                          22.05
곽경근                                          23.92
다보                                            22.69
최성철                                          21.61
비탈리                                           22.1
안승인                                          22.64
윤원철                                          22.15
김성재                                          21.15
김원식                                          21.63
김종민                                          22.74

이름                                     BMI 비만지수
---------------------------------------- ------------
박필석                                          22.99
제프유                                          22.45
롤란                                            23.92
셀라하틴                                        23.15
차경복
정학범
안익수
차상광
권찬수                                          22.99
정경두                                          20.19
정해운                                          23.08

이름                                     BMI 비만지수
---------------------------------------- ------------
양영민                                          22.16
가이모토                                        23.25
정두영                                          22.89
정명휘                                          22.21
정영철                                          23.89
정정재                                          23.63
정현수                                          23.12
노태경                                           22.2
문삼진                                          22.72
민경인                                          22.66
최종남                                          22.94

이름                                     BMI 비만지수
---------------------------------------- ------------
최충균                                          20.68
배진수                                          22.72
김영진                                          23.15
임규식                                          22.64
곽치국                                          23.53
정상식                                          20.97
정용희                                          22.09
노규영                                          25.62
최강조                                          20.94
최남열                                          22.09
백영철                                          22.66

이름                                     BMI 비만지수
---------------------------------------- ------------
조태용                                          22.13
올리베                                          23.84
김리네                                          23.32
쟈스민                                          24.07
전재호                                          22.68
김진호                                          22.46
이낙훈                                          20.96
홍도표                                          22.05
정대의                                          23.12
정우재                                          23.72
샤샤                                            23.27

이름                                     BMI 비만지수
---------------------------------------- ------------
서관수                                           23.1
김성운                                          21.38
김정운                                          23.53
장동현                                          21.15
황연석                                          21.97
정호
왕선재
코샤
윤성효
정광수                                          23.85
최호진                                          22.71

이름                                     BMI 비만지수
---------------------------------------- ------------
조범철                                          24.84
김운재                                          24.76
정영선                                          23.92
정유진                                           21.5
손승준                                          20.81
조홍기                                          21.55
안동원                                          23.04
김강진                                          19.84
김병근                                          20.57
김태권                                          23.15
김병국                                          23.29

이름                                     BMI 비만지수
---------------------------------------- ------------
김성환                                           22.4
가비                                            23.62
강대희                                          21.47
고종수                                           22.6
고창현                                          22.15
정기범                                          21.72
정동현                                          23.51
정두현                                          21.88
정준                                            22.49
정진우                                          22.47
데니스                                          22.92

이름                                     BMI 비만지수
---------------------------------------- ------------
서정원                                          22.05
손대호                                          22.84
오규찬                                          22.41
윤원일                                           22.6
김동욱                                          21.95
장성철                                          24.21
장윤정                                          21.05
장서연                                          18.52
고규억                                          22.86
장재우                                           21.3
오재진                                          24.06

이름                                     BMI 비만지수
---------------------------------------- ------------
선원길                                           21.8
안소정                                          20.81
주시형                                          24.91
홍종하                                          25.91
오춘식                                          26.57
박창우                                          21.71
박진하                                          18.92
박지성                                          23.04
이청용                                           21.3

482 행이 선택되었습니다.

SQL> SELECT PLAYER_NAME || '선수,' || HEIGHT || 'cm,' || WEIGHT || 'kg' 체격정보
  2  FROM PLAYER;

체격정보
--------------------------------------------------------------------------------
우르모브선수,180cm,70kg
윤희준선수,180cm,74kg
김규호선수,177cm,72kg
김민성선수,182cm,73kg
김장관선수,170cm,61kg
김정효선수,174cm,68kg
장대일선수,184cm,79kg
박상수선수,173cm,65kg
정재영선수,187cm,75kg
정태민선수,180cm,71kg
정현우선수,178cm,70kg

체격정보
--------------------------------------------------------------------------------
송종국선수,177cm,73kg
오정석선수,178cm,74kg
이고르선수,181cm,76kg
김용하선수,173cm,66kg
전상배선수,176cm,67kg
전우근선수,175cm,68kg
이태성선수,177cm,64kg
황철민선수,175cm,68kg
정관규선수,178cm,71kg
정기종선수,182cm,78kg
정창오선수,186cm,82kg

체격정보
--------------------------------------------------------------------------------
디디선수,179cm,78kg
마니치선수,184cm,80kg
우성용선수,191cm,76kg
장기봉선수,180cm,71kg
이광수선수,177cm,73kg
하리선수,168cm,65kg
박상남선수,188cm,80kg
빅토르선수,183cm,79kg
이윤겸선수,178cm,80kg
하재훈선수,174cm,67kg
김충호선수,185cm,83kg

체격정보
--------------------------------------------------------------------------------
임기한선수,177cm,85kg
김경태선수,cm,kg
남현우선수,180cm,72kg
김충호선수,185cm,83kg
이현선수,192cm,85kg
한동진선수,183cm,78kg
다오선수,190cm,80kg
최철선수,176cm,77kg
송창남선수,175cm,67kg
조승호선수,179cm,70kg
윤중희선수,177cm,75kg

체격정보
--------------------------------------------------------------------------------
김범직선수,182cm,75kg
김상홍선수,178cm,68kg
김태호선수,cm,kg
정상수선수,cm,kg
유동우선수,177cm,70kg
전기현선수,cm,kg
강성일선수,182cm,80kg
김승준선수,183cm,77kg
이은성선수,184cm,82kg
정대수선수,184cm,74kg
정민기선수,171cm,65kg

체격정보
--------------------------------------------------------------------------------
정성근선수,180cm,73kg
정영근선수,180cm,70kg
정정수선수,180cm,74kg
김창엽선수,174cm,64kg
장철우선수,172cm,65kg
콜리선수,182cm,75kg
홍광철선수,172cm,65kg
강정훈선수,175cm,65kg
공오균선수,177cm,72kg
정국진선수,172cm,62kg
정동선선수,170cm,65kg

체격정보
--------------------------------------------------------------------------------
최경규선수,177cm,72kg
최내철선수,177cm,71kg
배성재선수,178cm,74kg
샴선수,174cm,69kg
오비나선수,169cm,70kg
김관우선수,175cm,69kg
김광진선수,175cm,75kg
김상규선수,175cm,65kg
임영주선수,176cm,68kg
박영훈선수,174cm,73kg
한정국선수,179cm,71kg

체격정보
--------------------------------------------------------------------------------
정광선선수,175cm,68kg
정은중선수,184cm,72kg
정찬중선수,182cm,72kg
김석선수,194cm,85kg
탁준석선수,178cm,69kg
정호곤선수,172cm,77kg
최경훈선수,cm,kg
정동훈선수,180cm,88kg
정남표선수,180cm,77kg
정광재선수,180cm,75kg
권혁준선수,173cm,82kg

체격정보
--------------------------------------------------------------------------------
정경진선수,186cm,78kg
정용대선수,189cm,83kg
정지혁선수,187cm,77kg
박유석선수,186cm,78kg
정진우선수,180cm,76kg
정학철선수,176cm,73kg
류병훈선수,184cm,68kg
최준홍선수,178cm,70kg
서용혁선수,183cm,79kg
심재원선수,184cm,77kg
김임생선수,183cm,80kg

체격정보
--------------------------------------------------------------------------------
장형석선수,181cm,72kg
박진성선수,184cm,76kg
이거룩선수,183cm,77kg
이정민선수,183cm,78kg
페르난도선수,178cm,74kg
김무건선수,cm,kg
정병지선수,184cm,77kg
최주호선수,185cm,75kg
김대희선수,192cm,88kg
김준호선수,185cm,77kg
허인무선수,187cm,81kg

체격정보
--------------------------------------------------------------------------------
강용선수,179cm,72kg
고병운선수,180cm,73kg
정광석선수,183cm,72kg
정상훈선수,183cm,76kg
정석우선수,181cm,72kg
정은석선수,185cm,80kg
최민서선수,180cm,78kg
성종현선수,178cm,74kg
싸빅선수,185cm,78kg
오명관선수,185cm,76kg
김동식선수,183cm,77kg

체격정보
--------------------------------------------------------------------------------
김수길선수,179cm,69kg
김승엽선수,180cm,74kg
김종화선수,182cm,76kg
하석주선수,174cm,71kg
허제정선수,175cm,70kg
홍명보선수,181cm,72kg
정기남선수,174cm,72kg
정상록선수,173cm,63kg
나희근선수,178cm,72kg
레오선수,179cm,74kg
메도선수,180cm,78kg

체격정보
--------------------------------------------------------------------------------
최길영선수,172cm,64kg
최상인선수,174cm,63kg
옐라선수,184cm,79kg
유현구선수,170cm,68kg
김기부선수,183cm,76kg
김상인선수,178cm,70kg
김정운선수,178cm,70kg
김중규선수,170cm,64kg
김창호선수,175cm,75kg
이종범선수,178cm,68kg
남익경선수,177cm,70kg

체격정보
--------------------------------------------------------------------------------
윤보영선수,177cm,63kg
김동국선수,185cm,80kg
박종완선수,188cm,82kg
김징요선수,174cm,70kg
이철우선수,185cm,78kg
코난선수,180cm,76kg
정민규선수,178cm,71kg
제형진선수,179cm,75kg
곽기훈선수,177cm,72kg
최민영선수,174cm,67kg
김회택선수,cm,kg

체격정보
--------------------------------------------------------------------------------
서현옥선수,cm,kg
정상호선수,cm,kg
최철우선수,cm,kg
정영광선수,185cm,80kg
최종문선수,185cm,76kg
염동균선수,189cm,83kg
김정래선수,185cm,81kg
강철선수,178cm,72kg
정강선선수,180cm,73kg
정인호선수,184cm,79kg
정태영선수,180cm,74kg

체격정보
--------------------------------------------------------------------------------
정현수선수,176cm,74kg
정형주선수,cm,kg
정홍철선수,181cm,69kg
마시엘선수,177cm,70kg
김창원선수,183cm,75kg
장경진선수,184cm,82kg
주영호선수,185cm,80kg
홍성요선수,184cm,78kg
정경일선수,170cm,65kg
정길식선수,178cm,72kg
정남일선수,182cm,76kg

체격정보
--------------------------------------------------------------------------------
정대욱선수,182cm,73kg
정도근선수,181cm,69kg
정동희선수,174cm,64kg
정명곤선수,177cm,73kg
정성진선수,178cm,68kg
정승현선수,181cm,71kg
정요환선수,170cm,62kg
정정겸선수,172cm,65kg
정종현선수,173cm,68kg
노병준선수,177cm,67kg
최종우선수,176cm,69kg

체격정보
--------------------------------------------------------------------------------
조진원선수,176cm,75kg
실바선수,173cm,67kg
윤용구선수,168cm,60kg
김반선수,174cm,69kg
김영수선수,175cm,65kg
임관식선수,172cm,68kg
이정호선수,176cm,71kg
하기윤선수,180cm,65kg
정대철선수,183cm,78kg
꼬레아선수,172cm,70kg
노상래선수,175cm,74kg

체격정보
--------------------------------------------------------------------------------
성한수선수,177cm,69kg
세자르선수,180cm,78kg
조병호선수,177cm,75kg
찌코선수,180cm,67kg
하성룡선수,179cm,68kg
홍복표선수,182cm,73kg
김윤환선수,cm,kg
정은철선수,cm,kg
김경춘선수,cm,kg
최동우선수,cm,kg
전명구선수,cm,kg

체격정보
--------------------------------------------------------------------------------
박경치선수,cm,kg
정이섭선수,185cm,78kg
최관민선수,188cm,85kg
최동우선수,187cm,78kg
김용발선수,183cm,77kg
김창민선수,191cm,87kg
정대건선수,183cm,78kg
정봉현선수,188cm,74kg
정창민선수,181cm,68kg
최동혁선수,185cm,78kg
백인석선수,179cm,72kg

체격정보
--------------------------------------------------------------------------------
서혁수선수,178cm,77kg
안광호선수,190cm,78kg
임종훈선수,182cm,74kg
이진철선수,187cm,75kg
한종성선수,177cm,70kg
호제리오선수,185cm,85kg
황승주선수,176cm,68kg
고관영선수,180cm,72kg
정경량선수,173cm,65kg
정은익선수,176cm,63kg
레오마르선수,183cm,77kg

체격정보
--------------------------------------------------------------------------------
명재용선수,173cm,63kg
변재섭선수,170cm,63kg
보띠선수,174cm,68kg
비에라선수,176cm,73kg
서동원선수,184cm,78kg
안대현선수,179cm,72kg
양현정선수,176cm,72kg
유원섭선수,180cm,77kg
김수철선수,171cm,68kg
임다한선수,181cm,67kg
전경준선수,178cm,68kg

체격정보
--------------------------------------------------------------------------------
이영훈선수,178cm,71kg
추운기선수,173cm,69kg
하은철선수,176cm,69kg
고민기선수,178cm,70kg
정도훈선수,182cm,77kg
정연건선수,188cm,77kg
정현기선수,190cm,82kg
남궁도선수,186cm,80kg
문태혁선수,178cm,74kg
최성배선수,181cm,76kg
에드밀손선수,184cm,79kg

체격정보
--------------------------------------------------------------------------------
쿠키선수,170cm,76kg
정은익선수,176cm,65kg
이순호선수,cm,kg
유동관선수,cm,kg
박기동선수,cm,kg
김반코비선수,185cm,78kg
김선우선수,174cm,68kg
김여성선수,179cm,63kg
김용우선수,175cm,70kg
김종민선수,174cm,65kg
박용훈선수,175cm,67kg

체격정보
--------------------------------------------------------------------------------
김만근선수,177cm,67kg
김재민선수,180cm,71kg
김현두선수,176cm,68kg
이성용선수,173cm,70kg
하태근선수,182cm,75kg
미트로선수,192cm,89kg
최건하선수,180cm,75kg
산드로선수,182cm,78kg
윤화평선수,182cm,74kg
김관희선수,180cm,70kg
김광래선수,cm,kg

체격정보
--------------------------------------------------------------------------------
김춘석선수,cm,kg
조재흠선수,cm,kg
김영진선수,cm,kg
정귀화선수,cm,kg
최동석선수,190cm,89kg
백민철선수,185cm,78kg
조의손선수,192cm,87kg
우태식선수,185cm,75kg
정동진선수,182cm,74kg
정성일선수,178cm,75kg
정치곤선수,183cm,76kg

체격정보
--------------------------------------------------------------------------------
최요셉선수,183cm,75kg
최용호선수,182cm,69kg
최정석선수,182cm,78kg
손현준선수,175cm,70kg
안성훈선수,176cm,63kg
김상헌선수,185cm,80kg
박성호선수,184cm,71kg
이윤열선수,185cm,79kg
정도용선수,168cm,68kg
정민성선수,175cm,64kg
조재필선수,180cm,70kg

체격정보
--------------------------------------------------------------------------------
조현국선수,172cm,65kg
안드레선수,172cm,69kg
안상현선수,176cm,67kg
우진석선수,176cm,70kg
유상수선수,175cm,67kg
김영표선수,176cm,66kg
김준기선수,183cm,74kg
김지남선수,183cm,68kg
박광민선수,180cm,70kg
박창근선수,170cm,63kg
이원권선수,173cm,65kg

체격정보
--------------------------------------------------------------------------------
정병채선수,180cm,72kg
정성재선수,178cm,72kg
뚜따선수,187cm,84kg
마르코선수,175cm,77kg
최성호선수,187cm,73kg
최윤화선수,175cm,67kg
최정환선수,178cm,70kg
왕정현선수,181cm,73kg
김정수선수,184cm,74kg
김원광선수,183cm,68kg
진순진선수,180cm,78kg

체격정보
--------------------------------------------------------------------------------
이태욱선수,173cm,66kg
한동원선수,174cm,61kg
한정화선수,173cm,63kg
히카르도선수,189cm,71kg
권정혁선수,195cm,80kg
최창주선수,187cm,86kg
서동명선수,196cm,94kg
양지원선수,181cm,75kg
이무림선수,185cm,79kg
정윤구선수,182cm,75kg
끌레베르선수,186cm,79kg

체격정보
--------------------------------------------------------------------------------
최경삼선수,188cm,74kg
최종욱선수,185cm,74kg
변성환선수,176cm,69kg
손상호선수,187cm,78kg
유재형선수,180cm,79kg
김세권선수,184cm,80kg
하성용선수,179cm,75kg
한정일선수,172cm,65kg
정건형선수,176cm,70kg
정도균선수,184cm,78kg
최기욱선수,175cm,68kg

체격정보
--------------------------------------------------------------------------------
최진섭선수,179cm,68kg
서덕규선수,182cm,72kg
에디선수,182cm,70kg
김길용선수,183cm,78kg
김윤섭선수,184cm,77kg
김천수선수,174cm,65kg
장성욱선수,174cm,71kg
장철민선수,179cm,76kg
전광철선수,186cm,74kg
전재운선수,177cm,67kg
박정수선수,170cm,61kg

체격정보
--------------------------------------------------------------------------------
박주영선수,172cm,65kg
김원희선수,178cm,71kg
곽기훈선수,177cm,72kg
정현석선수,178cm,70kg
마르코스선수,170cm,73kg
최규선선수,182cm,66kg
알리송선수,171cm,60kg
김태유선수,175cm,64kg
박성훈선수,187cm,83kg
이인석선수,181cm,74kg
파울링뇨선수,174cm,75kg

체격정보
--------------------------------------------------------------------------------
현영민선수,179cm,73kg
홍인기선수,182cm,75kg
정기동선수,171cm,66kg
정기형선수,173cm,64kg
정정현선수,176cm,68kg
정한윤선수,185cm,74kg
남기일선수,177cm,69kg
무스타파선수,180cm,73kg
최정주선수,177cm,73kg
조현호선수,183cm,71kg
윤정춘선수,173cm,66kg

체격정보
--------------------------------------------------------------------------------
장경호선수,174cm,66kg
이문식선수,173cm,66kg
곽경근선수,184cm,81kg
다보선수,183cm,76kg
최성철선수,190cm,78kg
비탈리선수,183cm,74kg
안승인선수,182cm,75kg
윤원철선수,184cm,75kg
김성재선수,178cm,67kg
김원식선수,172cm,64kg
김종민선수,184cm,77kg

체격정보
--------------------------------------------------------------------------------
박필석선수,190cm,83kg
제프유선수,184cm,76kg
롤란선수,184cm,81kg
셀라하틴선수,180cm,75kg
차경복선수,cm,kg
정학범선수,cm,kg
안익수선수,cm,kg
차상광선수,cm,kg
권찬수선수,183cm,77kg
정경두선수,194cm,76kg
정해운선수,185cm,79kg

체격정보
--------------------------------------------------------------------------------
양영민선수,190cm,80kg
가이모토선수,182cm,77kg
정두영선수,181cm,75kg
정명휘선수,185cm,76kg
정영철선수,183cm,80kg
정정재선수,184cm,80kg
정현수선수,186cm,80kg
노태경선수,175cm,68kg
문삼진선수,173cm,68kg
민경인선수,177cm,71kg
최종남선수,182cm,76kg

체격정보
--------------------------------------------------------------------------------
최충균선수,184cm,70kg
배진수선수,178cm,72kg
김영진선수,180cm,75kg
임규식선수,182cm,75kg
곽치국선수,170cm,68kg
정상식선수,184cm,71kg
정용희선수,178cm,70kg
노규영선수,180cm,83kg
최강조선수,165cm,57kg
최남열선수,178cm,70kg
백영철선수,177cm,71kg

체격정보
--------------------------------------------------------------------------------
조태용선수,174cm,67kg
올리베선수,175cm,73kg
김리네선수,172cm,69kg
쟈스민선수,180cm,78kg
전재호선수,168cm,64kg
김진호선수,174cm,68kg
이낙훈선수,172cm,62kg
홍도표선수,173cm,66kg
정대의선수,174cm,70kg
정우재선수,173cm,71kg
샤샤선수,190cm,84kg

체격정보
--------------------------------------------------------------------------------
서관수선수,179cm,74kg
김성운선수,173cm,64kg
김정운선수,170cm,68kg
장동현선수,178cm,67kg
황연석선수,192cm,81kg
정호선수,cm,kg
왕선재선수,cm,kg
코샤선수,cm,kg
윤성효선수,cm,kg
정광수선수,182cm,79kg
최호진선수,190cm,82kg

체격정보
--------------------------------------------------------------------------------
조범철선수,185cm,85kg
김운재선수,182cm,82kg
정영선선수,184cm,81kg
정유진선수,188cm,76kg
손승준선수,186cm,72kg
조홍기선수,175cm,66kg
안동원선수,184cm,78kg
김강진선수,181cm,65kg
김병근선수,175cm,63kg
김태권선수,180cm,75kg
김병국선수,183cm,78kg

체격정보
--------------------------------------------------------------------------------
김성환선수,183cm,75kg
가비선수,177cm,74kg
강대희선수,174cm,65kg
고종수선수,176cm,70kg
고창현선수,170cm,64kg
정기범선수,173cm,65kg
정동현선수,175cm,72kg
정두현선수,175cm,67kg
정준선수,170cm,65kg
정진우선수,179cm,72kg
데니스선수,176cm,71kg

체격정보
--------------------------------------------------------------------------------
서정원선수,173cm,66kg
손대호선수,186cm,79kg
오규찬선수,178cm,71kg
윤원일선수,176cm,70kg
김동욱선수,176cm,68kg
장성철선수,176cm,75kg
장윤정선수,173cm,63kg
장서연선수,180cm,60kg
고규억선수,175cm,70kg
장재우선수,172cm,63kg
오재진선수,173cm,72kg

체격정보
--------------------------------------------------------------------------------
선원길선수,174cm,66kg
안소정선수,174cm,63kg
주시형선수,170cm,72kg
홍종하선수,169cm,74kg
오춘식선수,168cm,75kg
박창우선수,177cm,68kg
박진하선수,181cm,62kg
박지성선수,178cm,73kg
이청용선수,180cm,69kg

482 행이 선택되었습니다.


<<TCL>>
SQL> INSERT INTO PLAYER
  2  (PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
  3  VALUES ('1997035', 'K02', '이운재', 'GK', 182, 82, 1);

1 개의 행이 만들어졌습니다.

SQL> COMMIT;

커밋이 완료되었습니다.


SQL> UPDATE PLAYER
  2  SET HEIGHT = 100;

483 행이 업데이트되었습니다.

SQL> COMMIT;

커밋이 완료되었습니다.

SQL> DELETE FROM PLAYER;

483 행이 삭제되었습니다.

SQL> COMMIT;

커밋이 완료되었습니다.

SQL> INSERT INTO PLAYER
  2  (PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
  3  VALUES ('1997035', 'K02', '이운재', 'GK', 182, 82, 1);

1 개의 행이 만들어졌습니다.

SQL> ROLLBACK;

롤백이 완료되었습니다.

SQL> UPDATE PLAYER
  2  SET HEIGHT = 100;

480 행이 업데이트되었습니다.

SQL> ROLLBACK;

롤백이 완료되었습니다.

SQL> DELETE FROM PLAYER;

480 행이 삭제되었습니다.

SQL> ROLLBACK;

롤백이 완료되었습니다.

SQL> SAVEPOINT SVPT1;

저장점이 생성되었습니다.

SQL> INSERT INTO PLAYER
  2  (PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
  3  VALUES ('1999035', 'K02', '이운재', 'GK', 182, 82, 1);

1 개의 행이 만들어졌습니다.

SQL> ROLLBACK TO SVPT1;

롤백이 완료되었습니다.

SQL> SAVEPOINT SVPT2;

저장점이 생성되었습니다.

SQL> UPDATE PLAYER
  2  SET WEIGHT = 100;

480 행이 업데이트되었습니다.

SQL> ROLLBACK TO SVPT2;

롤백이 완료되었습니다.

SQL> SAVEPOINT SVPT3;

저장점이 생성되었습니다.

SQL> DELETE FROM PLAYER;

480 행이 삭제되었습니다.

SQL> ROLLBACK TO SVPT3;

롤백이 완료되었습니다.

SQL> SELECT COUNT(*)
  2  FROM PLAYER;

  COUNT(*)
----------
       480

SQL> SELECT COUNT(*)
  2  FROM PLAYER
  3  WHERE WEIGHT = 100;

  COUNT(*)
----------
         0

SQL> INSERT INTO PLAYER
  2  (PLAYER_ID, TEAM_ID, PLAYER_NAME, POSITION, HEIGHT, WEIGHT, BACK_NO)
  3  VALUES ('1999035', 'K02', '이운재', 'GK', 182, 82, 1);

1 개의 행이 만들어졌습니다.

SQL> SAVEPOINT SVPT_A;

저장점이 생성되었습니다.

SQL> UPDATE PLAYER
  2  SET WEIGHT = 100;

481 행이 업데이트되었습니다.

SQL> SAVEPOINT SVPT_B;

저장점이 생성되었습니다.

SQL> DELETE FROM PLAYER;

481 행이 삭제되었습니다.

SQL> SELECT COUNT(*)
  2  FROM PLAYER;

  COUNT(*)
----------
         0

SQL> ROLLBACK TO SVPT_B;

롤백이 완료되었습니다.

SQL> SELECT COUNT(*)
  2  FROM PLAYER;

  COUNT(*)
----------
       481

SQL> SELECT COUNT(*)
  2  FROM PLAYER
  3  WHERE WEIGHT = 100;

  COUNT(*)
----------
       481

SQL> ROLLBACK TO SVPT_A;

롤백이 완료되었습니다.

SQL> SELECT COUNT(*)
  2  FROM PLAYER
  3  WHERE WEIGHT = 100;

  COUNT(*)
----------
         0

SQL> SELECT COUNT(*)
  2  FROM PLAYER;

  COUNT(*)
----------
       481

SQL> ROLLBACK;

롤백이 완료되었습니다.

SQL> SELECT COUNT(*)
  2  FROM PLAYER;

  COUNT(*)
----------
       480