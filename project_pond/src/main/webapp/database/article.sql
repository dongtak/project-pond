create table article(
	moon_num VARCHAR(10) primary key,
    admin_id VARCHAR(30) not null,
    article_title VARCHAR(50) not null,
    article_content VARCHAR(3000) not null,
    article_createAt timestamp default current_timestamp,
    
    foreign key(admin_id) references `admin`(admin_id),
	foreign key(moon_num) references fullmoon(moon_num)
);

INSERT INTO article (moon_num, admin_id, article_title, article_content)
VALUES 
('FM001', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM002', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM003', 'admin', '산불화재 모금', '타닥 화르르'),
('FM004', 'admin', '생필품 후원 모금', '모여봐요'),
('FM005', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM006', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM007', 'admin', '산불화재 모금', '타닥 화르르'),
('FM008', 'admin', '생필품 후원 모금', '모여봐요'),
('FM009', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM010', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM011', 'admin', '산불화재 모금', '타닥 화르르'),
('FM012', 'admin', '생필품 후원 모금', '모여봐요'),
('FM013', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM014', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM015', 'admin', '산불화재 모금', '타닥 화르르'),
('FM016', 'admin', '생필품 후원 모금', '모여봐요'),
('FM017', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM018', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM019', 'admin', '산불화재 모금', '타닥 화르르'),
('FM020', 'admin', '생필품 후원 모금', '모여봐요'),
('FM021', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM022', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM023', 'admin', '산불화재 모금', '타닥 화르르'),
('FM024', 'admin', '생필품 후원 모금', '모여봐요'),
('FM025', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM026', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM027', 'admin', '산불화재 모금', '타닥 화르르'),
('FM028', 'admin', '생필품 후원 모금', '모여봐요'),
('FM029', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM030', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM031', 'admin', '산불화재 모금', '타닥 화르르'),
('FM032', 'admin', '생필품 후원 모금', '모여봐요'),
('FM033', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM034', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM035', 'admin', '산불화재 모금', '타닥 화르르'),
('FM036', 'admin', '생필품 후원 모금', '모여봐요'),
('FM037', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요'),
('FM038', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM039', 'admin', '산불화재 모금', '타닥 화르르'),
('FM040', 'admin', '생필품 후원 모금', '모여봐요'),
('FM041', 'admin', '유기견 후원센터 모금', '왈왈 멍멍'),
('FM042', 'admin', '어린이 봉사활동', '꺄르륵'),
('FM043', 'admin', '산불화재 모금', '타닥 화르르'),
('FM044', 'admin', '생필품 후원 모금', '모여봐요'),
('FM045', 'admin', '학대아동 지원 모금', '아이들을 지켜주세요');



select * from article;