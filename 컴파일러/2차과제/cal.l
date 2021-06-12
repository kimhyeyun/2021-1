/* 
	cal.l
	by. kimhyeyun
*/


%{
#include "cal.tab.h"
#include <stdlib.h>

void yyerror();
%}

delim [ \t]
ws {delim}+
digit [0-9]	
integer {digit}+	
real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)	
exp ({integer}|{real})[eE]-?{integer}	
op [-+()=/*]	
semi ;
newline \n

%%
({integer}|{real}|{exp}) {yylval.dval = atof(yytext); return NUMBER;}
{op} {return *yytext; }
{ws} ;
{semi} {return *yytext;}
{newline} {return *yytext;}


%%
/* 파일(입력)의 끝에 호출됨. 1을 반환하면 파싱 종료 */
int yywrap(void){
	return 1;
}
