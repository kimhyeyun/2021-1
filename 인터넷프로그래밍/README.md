# ![home](https://user-images.githubusercontent.com/50236501/121794768-06df3300-cc46-11eb-9aef-5f3d4ce24169.png) YUNCASE
> 아이폰, 에어팟 케이스를 비롯해 다양한 액세사리들을 판매!
>
> YUN CASE 입니다.

## 💻 개발 환경
* MacOS BigSur
* Eclipse EE
* JSP, Servlet
* MySQL, MyBatis
* Tomcat 8.5

## 🛒 Main 화면
<img width="442" alt="main" src="https://user-images.githubusercontent.com/50236501/121794814-558ccd00-cc46-11eb-8547-19d92a694692.png">

## DATABASE
### user Table
```
Table user(
userid  varchar(20) primary key,
userpw  char(64),
username  varchar(20),
userphone varchar(13),
admin int);
```
### product Table
```
Table product(
pid int Auto_increment primary key,
pname text,
pcontent  text,
pprice  varchar(100),
pimage  text,
pcode text
pcode int);
```
### cart Table
```
Table cart(
userid  varchar(20),
pid int,
pname varchar(120),
pprice  varchar(100),
pimage  varchar(100));
```
### qa Table
```
Table qa(
qid int Auto_increment primary key,
qtitle  varchar(120),
qcontent  longtext,
qdate datetime default current_datetime,
userid  varchar(120),
admin int);
```
### comment Table
```
Table comment(
cid int Auto_increment primary key,
qid int,
ccontent  varchar(120),
userid  varchar(100),
cdate datetime default current_datetime);
```



