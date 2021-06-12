/* ToPostfix.l
	by. kimhyeyun
 */

%{

/* header, define */
#include <stdio.h>
#include <string.h>

#define NUMBER 256 //숫자
#define OPERATOR 257 //덧셈, 뺄셈 연산자
#define BUFSIZE 100 // 버퍼 사이즈, 배열 크기
#define EOL 100 //end of line

%}

/* regular expression 정의*/
num [0-9]+
EOL \n

%%

{num} {return NUMBER;}
[+,-] {return OPERATOR;}
{EOL} {return EOL;}

%%

/* C code */
int main(){
	FILE *fp = fopen("result.txt","w");
	
	char stk[BUFSIZE]; //연산자 스택
	int stkTopIdx = -1; //스택의 Top Index
	int token;
	int flag = 1; //에러를 찾기위한 변수

	while((token = yylex()) != EOL){ //토큰이 끝이라면 종료
		switch(token){
			//토큰이 숫자라면 바로 출력파일에 작성
			case NUMBER:
			fputs(yytext,fp);
			fputc(' ',fp);
			flag = 0;
			break;
			
			case OPERATOR:
			//flag 가 true 라는 것은 바로 직전에 연산자가 나왔거나 맨처음이 연산자라는 의미라 옳지않은 infix 수식
			if(flag==1){
				fp = fopen("result.txt","w");
				fputs("ERROR!",fp);
				return 0;
			}
			else{
				//연산자는 스택이 비어있으면 넣고,
				if(stkTopIdx == -1){
					stk[++stkTopIdx] = yytext[0];
				}else{ 
					//스택이 비어있지 않으면 안에 있는 것을 빼서 파일에 쓰고, 새로운 연산자는 스택에 넣는다.	
					fputc(stk[stkTopIdx],fp);
					fputc(' ',fp);
					stk[stkTopIdx] = yytext[0];
				}
				flag = 1;
			}
			break;
			
			//숫자와 연산자 외 다른 문자라면 에러
			default:
				fp = fopen("result.txt","w");
				fputs("ERROR!",fp);
				return 0;
		}
	}
	
	//스택이 빌때 까지, 남은 연산자 출력	
	while(stkTopIdx > -1){
		fputc(stk[stkTopIdx--],fp);
		fputc(' ',fp);	
	}	
	fclose(fp);
}
