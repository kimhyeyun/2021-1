#Program Assignment #1
##과제 개요
Infix representation을 postfix representation으로 변환
<ul>
   <li>정수,+,- 의 operatorㄹ 구성된 수식(infix) 문자열을 postfix(후위표기법)으로 변환시켜 출력하는 program을 작성</li>
  <li>제약사항 : 잘못된 형식으 입력이 들어올 경우(unknow symbol 이나 infix 형식이 아닌 수식), error메세지 출력</li>
  <li>LEX(Flex, winflex) 사용할 것</li>
</ul>
<h2>개발 환경</h2>
<ul>
  <li>OS : MacOS Big Sur</li>
  <li>Language : C</li>
</ul>
<h2>빌드</h2>
```

$ lex ToPostfix.l
$ gcc lex.yy.c -o ToPostfix -ll

```
<h2>실행</h2>
<code>$ ./ToPostfix</code>
<h2>예시</h2>
<code>$ 10+2-11<br>10 2 + 11 -</code>

