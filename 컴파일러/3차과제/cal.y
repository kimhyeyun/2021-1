/*
	cal.y
		by.kimhyeyun
*/

%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void yyerror();
int yylex(void);

FILE *fp, *yyin;

char tmp_var[5];
int tmp_idx = 0;

struct str{
	char name[256];
	int type;
};

struct str symbol_table[512];
int table_idx = 0;
int lookup(const char *);

enum{
	INT_TYPE = 1,
	FLOAT_TYPE
};

int flag = 0;
int idx;

%}

/* yylval에 float, int, char 을 담기 위한 union */
%union {
	float fval;
	int ival;
	char sval[256];
}

%token <sval> INT
%token <sval> FLOAT
%token <ival> TYPE
%token <sval> ID
%token <sval> ASSIGN

/* 연산자 우선순위 */
%left '+' '-'
%left '*' '/'
%right UMINUS

%type<sval> expr

%%

lines 	: lines stmts
	| lines '\n'
	|
	;

stmts	: stmt ';'	
	;

stmt	: asign
	| def
	;

asign	: ID ASSIGN expr {	/* ID가 symbol table에 있는지 확인 */
				idx = lookup($1);
				/* 없다면 */
				if(idx == -1){
					fprintf(fp, "ERROR!\n(%s is unknown id)\n", $1);
					exit(0);
				}
				/* three-address code 출력 */
				fprintf(fp, "%s = %s\n", $1, $3);

				/* type mismatch check */
				if(flag != symbol_table[idx].type)
					fprintf(fp, "//warning: type mismatch\n");
				flag = 0;
			}
	;

def	: TYPE ID {	/* 이미 symbol table에 있는지 확인 */
			if(lookup($2) != -1){
			/* 있다면 */
				fprintf(fp, "ERROR!\n(%s is already declared)\n", $2);
				exit(0);
			}
			/* 없으면 추가 */
			strcpy(symbol_table[table_idx].name, $2);
			symbol_table[table_idx++].type = $1;
			}
	;

expr	: FLOAT	{
			flag = FLOAT_TYPE;
			strcpy($$, $1);
		}
	| INT	{	
			if(flag == FLOAT_TYPE)
				flag = FLOAT_TYPE;
			else
				flag = INT_TYPE;

			strcpy($$, $1);
		}
	| ID	{	
			/* symbol table 확인 */
			idx = lookup($1);
			if(idx == -1){
				fprintf(fp, "ERROR!\n(%s is unknown id)\n", $1);
				exit(0);
			}
			if(flag == FLOAT_TYPE)
				flag = FLOAT_TYPE;
			else
				flag = symbol_table[idx].type;
		
			strcpy($$, $1);
		}
	| expr '+' expr	{
				sprintf(tmp_var, "t%d", tmp_idx++);
				strcpy($$, tmp_var);
				fprintf(fp, "%s = %s + %s\n", tmp_var, $1, $3);
			}
	| expr '-' expr	{
			
				sprintf(tmp_var, "t%d", tmp_idx++);
				strcpy($$, tmp_var);
				fprintf(fp, "%s = %s - %s\n", tmp_var, $1, $3);
			}
	| expr '*' expr 	{
				sprintf(tmp_var, "t%d", tmp_idx++);
				strcpy($$, tmp_var);
				fprintf(fp, "%s = %s * %s\n", tmp_var, $1, $3);
			}
	| expr '/' expr	{
				sprintf(tmp_var, "t%d", tmp_idx++);
				strcpy($$, tmp_var);
				fprintf(fp, "%s = %s / %s\n", tmp_var, $1, $3);
			}
	| '(' expr ')'	{
				strcpy($$, $2);
			}
	| '-' expr %prec UMINUS	{
					sprintf(tmp_var, "t%d", tmp_idx++);
					strcpy($$, tmp_var);
					fprintf(fp, "%s = -%s\n", $$, $2);
				}
	;

%%

/* error 처리 함수 */
void yyerror()
{
	fprintf(fp,"error!\n");
}

int lookup(const char * id){
	int ans = -1;
	for(int i=0;i<table_idx;++i){
		if(!strcmp(symbol_table[i].name, id)){
			ans = i;
			break;
		}
	}
	return ans;
}

 /* c code */
int main()
{
	fp = fopen("result.txt","w");
	FILE *input = fopen("input.txt","r");

	yyin = input;
	
	yyparse();

	return 0;
}
