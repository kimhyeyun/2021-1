# Program Assignment #2
## 과제개요
### 수식 계산기 프로그램
* 다양한 형태의 숫자르 입력받을 수 있어야 함 (음수 및 소수, 부동소숫점 표기)
* ()가 포함된 infix 표기법인 사칙 연산식을 입력으로 받음
* File로 input/output 처리할 것

## 개발환경
* OS : MacOS BigSur
* Language : C

## 빌드
<pre><code>% flex cal.l
% bison -d cal.y
% gcc -o cal cal.tab.c lex.yy.c</pre></code>

## 실행
<pre><code>% ./cal</code></pre>

## 예시
* Input.txt
<pre><code>2-(3+5);
2+(6*3);
(3+2)*2+5;
5+10;
2.0E-2+0.5;
5+10</code></pre>

* Result.txt
<pre><code>-6
20
15
15
0.52
error!</code></pre>

## FLOW CHART
![flowchart](https://user-images.githubusercontent.com/50236501/121793705-cf1fbd80-cc3c-11eb-9d93-3b7068d9259f.jpg)
