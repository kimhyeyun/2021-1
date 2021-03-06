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
integer (0|([1-9]{digit}*))
number {integer}\.{digit}+((E|e)[+\-]?{digit}+)?
letter [A-Za-z]
id {letter}({letter}|{digit})*

op [-+()/*]	
semi ;
newline \n

%%

{number} {strcpy(yylval.str, yytext);
	return FLOAT;}
{integer} {strcpy(yylval.str, yytext);
	return INT;}
(int)	{yylval.type = 'i';
	return TYPE;}
(float)	{yylval.type = 'f';
	return TYPE;}
{id} 	{strcpy(yylval.str, yytext);
	return ID;}
{op} {return *yytext; }
(=) 	{strcpy(yylval.str, yytext);
	return ASSIGN;}
{ws} ;
{semi} {return *yytext;}
{newline} {return *yytext;}


%%

/* 파일(입력)의 끝에 호출됨. 1을 반환하면 파싱 종료 */
int yywrap(void){
	return 1;
}
