/*
	cal.y
		by.kimhyeyun
*/

%{
#include<stdio.h>

void yyerror();
int yylex(void);

FILE *fp, *yyin;

%}

/* yylval에 double을 담기 위한 union */
%union {
	double dval;
}

%token <dval>NUMBER

/* 연산자 우선순위 */
%left '+' '-'
%left '*' '/'
%right UMINUS

%type<dval> expr

%%

lines 	: lines stmt
	| lines '\n'
	|
	;

stmt	: expr ';'	{fprintf(fp,"%g\n",$1);} 
	;

expr	: NUMBER
	| expr '+' expr	{$$ = $1 + $3;}
	| expr '-' expr {$$ = $1 - $3;}
	| expr '*' expr {$$ = $1 * $3;}
	| expr '/' expr {$$ = $1 / $3;}
	| '(' expr ')'	{$$ = $2;}
	| '-'expr %prec UMINUS {$$ = -$2;}
	;

%%

/* error 처리 함수 */
void yyerror()
{
	fprintf(fp,"error!\n");
}

 /* c code */
int main()
{
	fp = fopen("result.txt","w");
	FILE *input = fopen("input.txt","r");

	yyin = input;
	
	do{
		yyparse();

	}while(!feof(yyin));

	return 0;
}
