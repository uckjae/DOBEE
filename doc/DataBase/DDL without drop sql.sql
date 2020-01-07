-- 사원
CREATE TABLE `MEMBER` (
	`MAIL`     VARCHAR(60)  NOT NULL COMMENT '사원메일', -- 사원메일
	`PASSWORD` VARCHAR(100) NULL     COMMENT '비밀번호', -- 비밀번호
	`NAME`     VARCHAR(20)  NOT NULL COMMENT '사원이름', -- 사원이름
	`MYPIC`    VARCHAR(255) NOT NULL COMMENT '사원사진', -- 사원사진
	`AUTHCODE` INT          NOT NULL COMMENT '권한코드', -- 권한코드
	`TCODE`    INT          NOT NULL COMMENT '팀코드' -- 팀코드
)
COMMENT '사원';

-- 사원
ALTER TABLE `MEMBER`
	ADD CONSTRAINT `PK_MEMBER` -- 사원 기본키
		PRIMARY KEY (
			`MAIL` -- 사원메일
		);

-- 공지사항
CREATE TABLE `NOTICE` (
	`NSEQ`    INT          NOT NULL COMMENT '글번호', -- 글번호
	`TITLE`   VARCHAR(255) NOT NULL COMMENT '글제목', -- 글제목
	`CONTENT` MEDIUMBLOB         NOT NULL COMMENT '글내용', -- 글내용
	`REGDATE` DATETIME     NOT NULL COMMENT '작성시간', -- 작성시간
	`COUNT`   INT          NOT NULL COMMENT '조회수' -- 조회수
)
COMMENT '공지사항';

-- 공지사항
ALTER TABLE `NOTICE`
	ADD CONSTRAINT `PK_NOTICE` -- 공지사항 기본키
		PRIMARY KEY (
			`NSEQ` -- 글번호
		);

ALTER TABLE `NOTICE`
	MODIFY COLUMN `NSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 프로젝트
CREATE TABLE `PROJECT` (
	`PSEQ`      INT         NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`PNAME`     VARCHAR(60) NOT NULL COMMENT '이름', -- 이름
	`PSTARTAT`  DATE        NOT NULL COMMENT '시작일', -- 시작일
	`PENDAT`    DATE        NOT NULL COMMENT '종료일', -- 종료일
	`PPROGRESS` VARCHAR(30) NOT NULL COMMENT '진행상황' -- 진행상황
)
COMMENT '프로젝트';

-- 프로젝트
ALTER TABLE `PROJECT`
	ADD CONSTRAINT `PK_PROJECT` -- 프로젝트 기본키
		PRIMARY KEY (
			`PSEQ` -- 프로젝트번호
		);

ALTER TABLE `PROJECT`
	MODIFY COLUMN `PSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '프로젝트번호';

-- 업무
CREATE TABLE `TASK` (
	`TSEQ`     INT          NOT NULL COMMENT '업무번호', -- 업무번호
	`TITLE`    VARCHAR(100) NOT NULL COMMENT '업무 제목', -- 업무 제목
	`PROGRESS` VARCHAR(30)  NOT NULL COMMENT '진행상황', -- 진행상황
	`IMPORT`   INT          NOT NULL COMMENT '중요도', -- 중요도
	`STARTAT`  DATE         NOT NULL COMMENT '시작일', -- 시작일
	`ENDAT`    DATE         NOT NULL COMMENT '완료일', -- 완료일
	`MAIL`     VARCHAR(60)  NOT NULL COMMENT '사원메일', -- 사원메일
	`PSEQ`     INT          NOT NULL COMMENT '프로젝트번호' -- 프로젝트번호
)
COMMENT '업무';

-- 업무
ALTER TABLE `TASK`
	ADD CONSTRAINT `PK_TASK` -- 업무 기본키
		PRIMARY KEY (
			`TSEQ` -- 업무번호
		);

ALTER TABLE `TASK`
	MODIFY COLUMN `TSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '업무번호';

-- 상세업무
CREATE TABLE `TASKDETAIL` (
	`TDSEQ`     INT          NOT NULL COMMENT '상세업무번호', -- 상세업무번호
	`TDCONTENT` VARCHAR(100) NOT NULL COMMENT '상세업무내용', -- 상세업무내용
	`TSEQ`      INT          NOT NULL COMMENT '업무번호' -- 업무번호
)
COMMENT '상세업무';

-- 상세업무
ALTER TABLE `TASKDETAIL`
	ADD CONSTRAINT `PK_TASKDETAIL` -- 상세업무 기본키
		PRIMARY KEY (
			`TDSEQ` -- 상세업무번호
		);

ALTER TABLE `TASKDETAIL`
	MODIFY COLUMN `TDSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '상세업무번호';

-- 신용카드
CREATE TABLE `DEBIT` (
	`CARDNUM`  INT         NOT NULL COMMENT '카드번호', -- 카드번호
	`CORP`     VARCHAR(60) NOT NULL COMMENT '카드사', -- 카드사
	`NAME`     VARCHAR(60) NOT NULL COMMENT '명의자이름', -- 명의자이름
	`NICKNAME` VARCHAR(60) NULL     COMMENT '카드별칭', -- 카드별칭
	`ENTRY`    VARCHAR(60) NOT NULL COMMENT '카드구분', -- 카드구분
	`VALDATE`  DATE        NOT NULL COMMENT '유효기간' -- 유효기간
)
COMMENT '신용카드';

-- 신용카드
ALTER TABLE `DEBIT`
	ADD CONSTRAINT `PK_DEBIT` -- 신용카드 기본키
		PRIMARY KEY (
			`CARDNUM` -- 카드번호
		);

-- 체크리스트
CREATE TABLE `CHECKLIST` (
	`CHKSEQ`  INT          NOT NULL COMMENT '체크리스트번호', -- 체크리스트번호
	`CONTENT` VARCHAR(100) NOT NULL COMMENT '항목', -- 항목
	`ISCHECK` BOOLEAN      NOT NULL COMMENT '체크여부', -- 체크여부
	`TSEQ`    INT          NOT NULL COMMENT '업무번호' -- 업무번호
)
COMMENT '체크리스트';

-- 체크리스트
ALTER TABLE `CHECKLIST`
	ADD CONSTRAINT `PK_CHECKLIST` -- 체크리스트 기본키
		PRIMARY KEY (
			`CHKSEQ` -- 체크리스트번호
		);

ALTER TABLE `CHECKLIST`
	MODIFY COLUMN `CHKSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '체크리스트번호';

-- 프로젝트일정
CREATE TABLE `PROJSCHEDULE` (
	`PSSEQ` INT NOT NULL COMMENT '프로젝트일정번호', -- 프로젝트일정번호
	`PSEQ`  INT NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`SSEQ`  INT NOT NULL COMMENT '일정번호' -- 일정번호
)
COMMENT '프로젝트일정';

-- 프로젝트일정
ALTER TABLE `PROJSCHEDULE`
	ADD CONSTRAINT `PK_PROJSCHEDULE` -- 프로젝트일정 기본키
		PRIMARY KEY (
			`PSSEQ` -- 프로젝트일정번호
		);

ALTER TABLE `PROJSCHEDULE`
	MODIFY COLUMN `PSSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '프로젝트일정번호';

-- 근태
CREATE TABLE `ATTEND` (
	`ASEQ`    INT         NOT NULL COMMENT '근태목록번호', -- 근태목록번호
	`ATTTIME` DATE        NOT NULL COMMENT '출퇴근시간', -- 출퇴근시간
	`MAIL`    VARCHAR(60) NOT NULL COMMENT '사원메일', -- 사원메일
	`ATTSEQ`  INT         NOT NULL COMMENT '근태코드' -- 근태코드
)
COMMENT '근태';

-- 근태
ALTER TABLE `ATTEND`
	ADD CONSTRAINT `PK_ATTEND` -- 근태 기본키
		PRIMARY KEY (
			`ASEQ` -- 근태목록번호
		);

ALTER TABLE `ATTEND`
	MODIFY COLUMN `ASEQ` INT NOT NULL AUTO_INCREMENT COMMENT '근태목록번호';

-- 근태코드
CREATE TABLE `ATTENDCODE` (
	`ATTSEQ` INT         NOT NULL COMMENT '근태코드', -- 근태코드
	`ATTDIV` VARCHAR(60) NOT NULL COMMENT '근태구분' -- 근태구분
)
COMMENT '근태코드';

-- 근태코드
ALTER TABLE `ATTENDCODE`
	ADD CONSTRAINT `PK_ATTENDCODE` -- 근태코드 기본키
		PRIMARY KEY (
			`ATTSEQ` -- 근태코드
		);

-- 비용처리목록
CREATE TABLE `COSTLIST` (
	`CSEQ`    INT          NOT NULL COMMENT '비용처리번호', -- 비용처리번호
	`REGDATE` DATE         NOT NULL COMMENT '작성일', -- 작성일
	`USEDATE` DATETIME     NULL     COMMENT '사용일', -- 사용일
	`USEAT`   VARCHAR(60)  NOT NULL COMMENT '사용처', -- 사용처
	`COST`    INT          NOT NULL COMMENT '사용금액', -- 사용금액
	`DETAIL`  VARCHAR(100) NULL     COMMENT '상세내용', -- 상세내용
	`CODE`    INT          NOT NULL COMMENT '비용처리코드', -- 비용처리코드
	`CARDNUM` INT          NOT NULL COMMENT '카드번호', -- 카드번호
	`MAIL`    VARCHAR(60)  NOT NULL COMMENT '사원메일' -- 사원메일
)
COMMENT '비용처리목록';

-- 비용처리목록
ALTER TABLE `COSTLIST`
	ADD CONSTRAINT `PK_COSTLIST` -- 비용처리목록 기본키
		PRIMARY KEY (
			`CSEQ` -- 비용처리번호
		);

ALTER TABLE `COSTLIST`
	MODIFY COLUMN `CSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '비용처리번호';

-- 비용처리코드
CREATE TABLE `COSTCODE` (
	`CODE`  INT         NOT NULL COMMENT '비용처리코드', -- 비용처리코드
	`ENTRY` VARCHAR(60) NOT NULL COMMENT '비용항목' -- 비용항목
)
COMMENT '비용처리코드';

-- 비용처리코드
ALTER TABLE `COSTCODE`
	ADD CONSTRAINT `PK_COSTCODE` -- 비용처리코드 기본키
		PRIMARY KEY (
			`CODE` -- 비용처리코드
		);

-- 일정
CREATE TABLE `SCHEDULE` (
	`SSEQ`      INT      NOT NULL COMMENT '일정번호', -- 일정번호
	`STARTTIME` DATETIME NOT NULL COMMENT '시작시간', -- 시작시간
	`ENDTIME`   DATETIME NOT NULL COMMENT '종료시간' -- 종료시간
)
COMMENT '일정';

-- 일정
ALTER TABLE `SCHEDULE`
	ADD CONSTRAINT `PK_SCHEDULE` -- 일정 기본키
		PRIMARY KEY (
			`SSEQ` -- 일정번호
		);

ALTER TABLE `SCHEDULE`
	MODIFY COLUMN `SSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '일정번호';

-- 공지사항일정
CREATE TABLE `NOTSCHEDULE` (
	`NSSEQ`     INT         NOT NULL COMMENT '공지관련일정번호', -- 공지관련일정번호
	`NSCONTENT` VARCHAR(60) NOT NULL COMMENT '공지사항일정내용', -- 공지사항일정내용
	`SSEQ`      INT         NOT NULL COMMENT '일정번호', -- 일정번호
	`NSEQ`      INT         NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '공지사항일정';

-- 공지사항일정
ALTER TABLE `NOTSCHEDULE`
	ADD CONSTRAINT `PK_NOTSCHEDULE` -- 공지사항일정 기본키
		PRIMARY KEY (
			`NSSEQ` -- 공지관련일정번호
		);

ALTER TABLE `NOTSCHEDULE`
	MODIFY COLUMN `NSSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '공지관련일정번호';

-- 공지사항파일
CREATE TABLE `NOTICEFILE` (
	`NFSEQ`    INT          NOT NULL COMMENT '공지사항첨부파일번호', -- 공지사항첨부파일번호
	`ORGNAME`  VARCHAR(255) NOT NULL COMMENT '원본이름', -- 원본이름
	`SAVENAME` VARCHAR(255) NOT NULL COMMENT '저장이름', -- 저장이름
	`NSEQ`     INT          NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '공지사항파일';

-- 공지사항파일
ALTER TABLE `NOTICEFILE`
	ADD CONSTRAINT `PK_NOTICEFILE` -- 공지사항파일 기본키
		PRIMARY KEY (
			`NFSEQ` -- 공지사항첨부파일번호
		);

ALTER TABLE `NOTICEFILE`
	MODIFY COLUMN `NFSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '공지사항첨부파일번호';

-- 업무일정
CREATE TABLE `TASKSCHEDULE` (
	`TSSEQ` INT NOT NULL COMMENT '업무일정번호', -- 업무일정번호
	`PSEQ`  INT NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	`SSEQ`  INT NOT NULL COMMENT '일정번호', -- 일정번호
	`TSEQ`  INT NOT NULL COMMENT '업무번호' -- 업무번호
)
COMMENT '업무일정';

-- 업무일정
ALTER TABLE `TASKSCHEDULE`
	ADD CONSTRAINT `PK_TASKSCHEDULE` -- 업무일정 기본키
		PRIMARY KEY (
			`TSSEQ` -- 업무일정번호
		);

ALTER TABLE `TASKSCHEDULE`
	MODIFY COLUMN `TSSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '업무일정번호';

-- 신청목록
CREATE TABLE `APPLYCODE` (
	`ACODE` INT         NOT NULL COMMENT '신청항목코드', -- 신청항목코드
	`ENTRY` VARCHAR(60) NOT NULL COMMENT '신청항목' -- 신청항목
)
COMMENT '신청목록';

-- 신청목록
ALTER TABLE `APPLYCODE`
	ADD CONSTRAINT `PK_APPLYCODE` -- 신청목록 기본키
		PRIMARY KEY (
			`ACODE` -- 신청항목코드
		);

-- 신청
CREATE TABLE `APPLY` (
	`ASEQ`      INT          NOT NULL COMMENT '신청번호', -- 신청번호
	`REQDATE`   DATE         NOT NULL COMMENT '신청일', -- 신청일
	`REASON`    VARCHAR(150) NOT NULL COMMENT '사유', -- 사유
	`STARTAT`   DATETIME     NOT NULL COMMENT '시작일', -- 시작일
	`ENDAT`     DATETIME     NOT NULL COMMENT '종료일', -- 종료일
	`ISAUTH`    VARCHAR(50)  NOT NULL COMMENT '승인여부', -- 승인여부
	`REJREASON` VARCHAR(150) NULL     COMMENT '반려사유', -- 반려사유
	`DRAFTER`   VARCHAR(60)  NOT NULL COMMENT '신청자', -- 신청자
	`APPROVAL`  VARCHAR(60)  NOT NULL COMMENT '결재자', -- 결재자
	`ACODE`     INT          NOT NULL COMMENT '신청항목코드' -- 신청항목코드
)
COMMENT '신청';

-- 신청
ALTER TABLE `APPLY`
	ADD CONSTRAINT `PK_APPLY` -- 신청 기본키
		PRIMARY KEY (
			`ASEQ` -- 신청번호
		);

ALTER TABLE `APPLY`
	MODIFY COLUMN `ASEQ` INT NOT NULL AUTO_INCREMENT COMMENT '신청번호';

-- 회사일정
CREATE TABLE `CORPSCHEDULE` (
	`CSSEQ`     INT         NOT NULL COMMENT '회사일정번호', -- 회사일정번호
	`CSCONTENT` VARCHAR(60) NOT NULL COMMENT '회사일정내용', -- 회사일정내용
	`SSEQ`      INT         NOT NULL COMMENT '일정번호' -- 일정번호
)
COMMENT '회사일정';

-- 회사일정
ALTER TABLE `CORPSCHEDULE`
	ADD CONSTRAINT `PK_CORPSCHEDULE` -- 회사일정 기본키
		PRIMARY KEY (
			`CSSEQ` -- 회사일정번호
		);

ALTER TABLE `CORPSCHEDULE`
	MODIFY COLUMN `CSSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '회사일정번호';

-- 권한
CREATE TABLE `AUTHORITY` (
	`AUTHCODE` INT         NOT NULL COMMENT '권한코드', -- 권한코드
	`AUTH`     VARCHAR(30) NOT NULL COMMENT '권한명' -- 권한명
)
COMMENT '권한';

-- 권한
ALTER TABLE `AUTHORITY`
	ADD CONSTRAINT `PK_AUTHORITY` -- 권한 기본키
		PRIMARY KEY (
			`AUTHCODE` -- 권한코드
		);

-- 팀목록
CREATE TABLE `TEAMLIST` (
	`TCODE` INT         NOT NULL COMMENT '팀코드', -- 팀코드
	`TNAME` VARCHAR(60) NOT NULL COMMENT '팀이름' -- 팀이름
)
COMMENT '팀목록';

-- 팀목록
ALTER TABLE `TEAMLIST`
	ADD CONSTRAINT `PK_TEAMLIST` -- 팀목록 기본키
		PRIMARY KEY (
			`TCODE` -- 팀코드
		);

-- 프로젝트그룹
CREATE TABLE `PROJECTMEMBER` (
	`MAIL` VARCHAR(60) NOT NULL COMMENT '사원메일', -- 사원메일
	`PSEQ` INT         NOT NULL COMMENT '프로젝트번호' -- 프로젝트번호
)
COMMENT '프로젝트그룹';

-- 프로젝트그룹
ALTER TABLE `PROJECTMEMBER`
	ADD CONSTRAINT `PK_PROJECTMEMBER` -- 프로젝트그룹 기본키
		PRIMARY KEY (
			`MAIL`, -- 사원메일
			`PSEQ`  -- 프로젝트번호
		);

-- 휴가
CREATE TABLE `BREAK` (
	`MAIL`       VARCHAR(60) NOT NULL COMMENT '사원메일', -- 사원메일
	`TOTALBREAK` INT         NOT NULL COMMENT '총연차', -- 총연차
	`USEDBREAK`  INT         NOT NULL COMMENT '사용연차일수' -- 사용연차일수
)
COMMENT '휴가';

-- 휴가
ALTER TABLE `BREAK`
	ADD CONSTRAINT `PK_BREAK` -- 휴가 기본키
		PRIMARY KEY (
			`MAIL` -- 사원메일
		);

-- 휴가목록
CREATE TABLE `BREAKLIST` (
	`BSEQ`       INT         NOT NULL COMMENT '연차사용목록시퀀스', -- 연차사용목록시퀀스
	`ASEQ`       INT         NOT NULL COMMENT '신청번호', -- 신청번호
	`MAIL`       VARCHAR(60) NOT NULL COMMENT '사원메일', -- 사원메일
	`USINGBREAK` INT         NOT NULL COMMENT '연차사용일수' -- 연차사용일수
)
COMMENT '휴가목록';

-- 휴가목록
ALTER TABLE `BREAKLIST`
	ADD CONSTRAINT `PK_BREAKLIST` -- 휴가목록 기본키
		PRIMARY KEY (
			`BSEQ` -- 연차사용목록시퀀스
		);

ALTER TABLE `BREAKLIST`
	MODIFY COLUMN `BSEQ` INT NOT NULL AUTO_INCREMENT COMMENT '연차사용목록시퀀스';

-- 사원정보
CREATE TABLE `MEMBERINFO` (
	`MAIL`     VARCHAR(60) NOT NULL COMMENT '사원메일', -- 사원메일
	`REGDATE`  DATE        NOT NULL COMMENT '입사일', -- 입사일
	`SERVE`    VARCHAR(60) NOT NULL COMMENT '재직상태', -- 재직상태
	`EMP`      VARCHAR(60) NOT NULL COMMENT '고용형태', -- 고용형태
	`POSITION` VARCHAR(60) NOT NULL COMMENT '직책', -- 직책
	`PHONE`    VARCHAR(30) NULL     COMMENT '휴대폰번호' -- 휴대폰번호
)
COMMENT '사원정보';

-- 사원정보
ALTER TABLE `MEMBERINFO`
	ADD CONSTRAINT `PK_MEMBERINFO` -- 사원정보 기본키
		PRIMARY KEY (
			`MAIL` -- 사원메일
		);

-- 사원
ALTER TABLE `MEMBER`
	ADD CONSTRAINT `FK_AUTHORITY_TO_MEMBER` -- 권한 -> 사원
		FOREIGN KEY (
			`AUTHCODE` -- 권한코드
		)
		REFERENCES `AUTHORITY` ( -- 권한
			`AUTHCODE` -- 권한코드
		);

-- 사원
ALTER TABLE `MEMBER`
	ADD CONSTRAINT `FK_TEAMLIST_TO_MEMBER` -- 팀목록 -> 사원
		FOREIGN KEY (
			`TCODE` -- 팀코드
		)
		REFERENCES `TEAMLIST` ( -- 팀목록
			`TCODE` -- 팀코드
		);

-- 업무
ALTER TABLE `TASK`
	ADD CONSTRAINT `FK_PROJECTMEMBER_TO_TASK` -- 프로젝트그룹 -> 업무
		FOREIGN KEY (
			`MAIL`, -- 사원메일
			`PSEQ`  -- 프로젝트번호
		)
		REFERENCES `PROJECTMEMBER` ( -- 프로젝트그룹
			`MAIL`, -- 사원메일
			`PSEQ`  -- 프로젝트번호
		);

-- 상세업무
ALTER TABLE `TASKDETAIL`
	ADD CONSTRAINT `FK_TASK_TO_TASKDETAIL` -- 업무 -> 상세업무
		FOREIGN KEY (
			`TSEQ` -- 업무번호
		)
		REFERENCES `TASK` ( -- 업무
			`TSEQ` -- 업무번호
		);

-- 체크리스트
ALTER TABLE `CHECKLIST`
	ADD CONSTRAINT `FK_TASK_TO_CHECKLIST` -- 업무 -> 체크리스트
		FOREIGN KEY (
			`TSEQ` -- 업무번호
		)
		REFERENCES `TASK` ( -- 업무
			`TSEQ` -- 업무번호
		);

-- 프로젝트일정
ALTER TABLE `PROJSCHEDULE`
	ADD CONSTRAINT `FK_PROJECT_TO_PROJSCHEDULE` -- 프로젝트 -> 프로젝트일정
		FOREIGN KEY (
			`PSEQ` -- 프로젝트번호
		)
		REFERENCES `PROJECT` ( -- 프로젝트
			`PSEQ` -- 프로젝트번호
		);

-- 프로젝트일정
ALTER TABLE `PROJSCHEDULE`
	ADD CONSTRAINT `FK_SCHEDULE_TO_PROJSCHEDULE` -- 일정 -> 프로젝트일정
		FOREIGN KEY (
			`SSEQ` -- 일정번호
		)
		REFERENCES `SCHEDULE` ( -- 일정
			`SSEQ` -- 일정번호
		);

-- 근태
ALTER TABLE `ATTEND`
	ADD CONSTRAINT `FK_ATTENDCODE_TO_ATTEND` -- 근태코드 -> 근태
		FOREIGN KEY (
			`ATTSEQ` -- 근태코드
		)
		REFERENCES `ATTENDCODE` ( -- 근태코드
			`ATTSEQ` -- 근태코드
		);

-- 근태
ALTER TABLE `ATTEND`
	ADD CONSTRAINT `FK_MEMBER_TO_ATTEND` -- 사원 -> 근태
		FOREIGN KEY (
			`MAIL` -- 사원메일
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

-- 비용처리목록
ALTER TABLE `COSTLIST`
	ADD CONSTRAINT `FK_COSTCODE_TO_COSTLIST` -- 비용처리코드 -> 비용처리목록
		FOREIGN KEY (
			`CODE` -- 비용처리코드
		)
		REFERENCES `COSTCODE` ( -- 비용처리코드
			`CODE` -- 비용처리코드
		);

-- 비용처리목록
ALTER TABLE `COSTLIST`
	ADD CONSTRAINT `FK_DEBIT_TO_COSTLIST` -- 신용카드 -> 비용처리목록
		FOREIGN KEY (
			`CARDNUM` -- 카드번호
		)
		REFERENCES `DEBIT` ( -- 신용카드
			`CARDNUM` -- 카드번호
		);

-- 비용처리목록
ALTER TABLE `COSTLIST`
	ADD CONSTRAINT `FK_MEMBER_TO_COSTLIST` -- 사원 -> 비용처리목록
		FOREIGN KEY (
			`MAIL` -- 사원메일
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

-- 공지사항일정
ALTER TABLE `NOTSCHEDULE`
	ADD CONSTRAINT `FK_SCHEDULE_TO_NOTSCHEDULE` -- 일정 -> 공지사항일정
		FOREIGN KEY (
			`SSEQ` -- 일정번호
		)
		REFERENCES `SCHEDULE` ( -- 일정
			`SSEQ` -- 일정번호
		);

-- 공지사항일정
ALTER TABLE `NOTSCHEDULE`
	ADD CONSTRAINT `FK_NOTICE_TO_NOTSCHEDULE` -- 공지사항 -> 공지사항일정
		FOREIGN KEY (
			`NSEQ` -- 글번호
		)
		REFERENCES `NOTICE` ( -- 공지사항
			`NSEQ` -- 글번호
		);

-- 공지사항파일
ALTER TABLE `NOTICEFILE`
	ADD CONSTRAINT `FK_NOTICE_TO_NOTICEFILE` -- 공지사항 -> 공지사항파일
		FOREIGN KEY (
			`NSEQ` -- 글번호
		)
		REFERENCES `NOTICE` ( -- 공지사항
			`NSEQ` -- 글번호
		);

-- 업무일정
ALTER TABLE `TASKSCHEDULE`
	ADD CONSTRAINT `FK_PROJECT_TO_TASKSCHEDULE` -- 프로젝트 -> 업무일정
		FOREIGN KEY (
			`PSEQ` -- 프로젝트번호
		)
		REFERENCES `PROJECT` ( -- 프로젝트
			`PSEQ` -- 프로젝트번호
		);

-- 업무일정
ALTER TABLE `TASKSCHEDULE`
	ADD CONSTRAINT `FK_SCHEDULE_TO_TASKSCHEDULE` -- 일정 -> 업무일정
		FOREIGN KEY (
			`SSEQ` -- 일정번호
		)
		REFERENCES `SCHEDULE` ( -- 일정
			`SSEQ` -- 일정번호
		);

-- 업무일정
ALTER TABLE `TASKSCHEDULE`
	ADD CONSTRAINT `FK_TASK_TO_TASKSCHEDULE` -- 업무 -> 업무일정
		FOREIGN KEY (
			`TSEQ` -- 업무번호
		)
		REFERENCES `TASK` ( -- 업무
			`TSEQ` -- 업무번호
		);

-- 신청
ALTER TABLE `APPLY`
	ADD CONSTRAINT `FK_APPLYCODE_TO_APPLY` -- 신청목록 -> 신청
		FOREIGN KEY (
			`ACODE` -- 신청항목코드
		)
		REFERENCES `APPLYCODE` ( -- 신청목록
			`ACODE` -- 신청항목코드
		);

-- 신청
ALTER TABLE `APPLY`
	ADD CONSTRAINT `FK_MEMBER_TO_DRAFTER` -- 사원 -> 신청
		FOREIGN KEY (
			`DRAFTER` -- 신청자
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

-- 신청
ALTER TABLE `APPLY`
	ADD CONSTRAINT `FK_MEMBER_TO_APPROVAL` -- 사원 -> 신청2
		FOREIGN KEY (
			`APPROVAL` -- 결재자
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

-- 회사일정
ALTER TABLE `CORPSCHEDULE`
	ADD CONSTRAINT `FK_SCHEDULE_TO_CORPSCHEDULE` -- 일정 -> 회사일정
		FOREIGN KEY (
			`SSEQ` -- 일정번호
		)
		REFERENCES `SCHEDULE` ( -- 일정
			`SSEQ` -- 일정번호
		);

-- 프로젝트그룹
ALTER TABLE `PROJECTMEMBER`
	ADD CONSTRAINT `FK_MEMBER_TO_PROJECTMEMBER` -- 사원 -> 프로젝트그룹
		FOREIGN KEY (
			`MAIL` -- 사원메일
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

-- 프로젝트그룹
ALTER TABLE `PROJECTMEMBER`
	ADD CONSTRAINT `FK_PROJECT_TO_PROJECTMEMBER` -- 프로젝트 -> 프로젝트그룹
		FOREIGN KEY (
			`PSEQ` -- 프로젝트번호
		)
		REFERENCES `PROJECT` ( -- 프로젝트
			`PSEQ` -- 프로젝트번호
		);

-- 휴가
ALTER TABLE `BREAK`
	ADD CONSTRAINT `FK_MEMBER_TO_BREAK` -- 사원 -> 휴가
		FOREIGN KEY (
			`MAIL` -- 사원메일
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

-- 휴가목록
ALTER TABLE `BREAKLIST`
	ADD CONSTRAINT `FK_APPLY_TO_BREAKLIST` -- 신청 -> 휴가목록
		FOREIGN KEY (
			`ASEQ` -- 신청번호
		)
		REFERENCES `APPLY` ( -- 신청
			`ASEQ` -- 신청번호
		);

-- 휴가목록
ALTER TABLE `BREAKLIST`
	ADD CONSTRAINT `FK_BREAK_TO_BREAKLIST` -- 휴가 -> 휴가목록
		FOREIGN KEY (
			`MAIL` -- 사원메일
		)
		REFERENCES `BREAK` ( -- 휴가
			`MAIL` -- 사원메일
		);

-- 사원정보
ALTER TABLE `MEMBERINFO`
	ADD CONSTRAINT `FK_MEMBER_TO_MEMBERINFO` -- 사원 -> 사원정보
		FOREIGN KEY (
			`MAIL` -- 사원메일
		)
		REFERENCES `MEMBER` ( -- 사원
			`MAIL` -- 사원메일
		);

INSERT INTO AUTHORITY (AUTHCODE, AUTH) VALUES(1, 'ROLE_ADMIN');
INSERT INTO AUTHORITY (AUTHCODE, AUTH) VALUES(2, 'ROLE_USER');
INSERT INTO AUTHORITY (AUTHCODE, AUTH) VALUES(3, 'ROLE_MANAGER');

INSERT INTO ATTENDCODE (ATTSEQ, ATTDIV) VALUES(1, '출근');
INSERT INTO ATTENDCODE (ATTSEQ, ATTDIV) VALUES(2, '퇴근');
INSERT INTO ATTENDCODE (ATTSEQ, ATTDIV) VALUES(3, '부재시작');
INSERT INTO ATTENDCODE (ATTSEQ, ATTDIV) VALUES(4, '부재끝');

INSERT INTO APPLYCODE (ACODE, ENTRY) VALUES(1, '연차');
INSERT INTO APPLYCODE (ACODE, ENTRY) VALUES(2, '반일연차');
INSERT INTO APPLYCODE (ACODE, ENTRY) VALUES(3, '출장');
INSERT INTO APPLYCODE (ACODE, ENTRY) VALUES(4, '외근');
INSERT INTO APPLYCODE (ACODE, ENTRY) VALUES(5, '경조휴가');
INSERT INTO APPLYCODE (ACODE, ENTRY) VALUES(6, '연장근무');
 
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(1, '회식비');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(2, '식비');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(3, '소모품');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(4, '워크샵');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(5, '교통비');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(6, '접대비');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(7, '통신비');
INSERT INTO COSTCODE (CODE, ENTRY) VALUES(8, '기타');
