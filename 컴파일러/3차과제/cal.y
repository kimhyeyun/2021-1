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
int lookup(const char*);			/* 선언된 id가 symbol_table에 저장되어있는지 찾는 함수 */
void insert(const char*, char type);	/* symbol_table에 선언한 변수 넣는 함수 */

FILE *fp, *yyin;


struct str{				/* 변수의 type과 변수명을 저장 할 구조체 */
	char name[512];
	char type;
};


char tmp_var[10];		/* 임시변수 이름*/
int tmp_idx = 0;			/* 임시변수의 번호 (ex. t1, t2...) */
struct str symbol_table[512];	/* 변수의 이름과 type을 저장할 struct */
int table_idx = 0;		/* symbol_table의 index */	
char flag = 'i';			/* type check를 위한 변수 */
int ok;				/* id가 symbol_table에 저장된 index를 저장할 변수 */
char INT_TYPE = 'i';		/* type check를 위한 변수들 */
char FLOAT_TYPE = 'f';

%}


%union {
	char str[512]; /* 식 등*/
	char type;	/* type */
}

%token <str> INT
%token <str> FLOAT
%token <type> TYPE
%token <str> ID
%token <str> ASSIGN

/* 연산자 우선순위 */
%left '+' '-'
%left '*' '/'
%right UMINUS

%type<str> expr

%%

lines 	: lines stmts
	| lines '\n'
	|
	;

stmts	: stmt ';'	
	;

stmt	: def
	| asign
	;

def	: TYPE ID {	/* 이미 symbol table에 있는지 확인 */
			if(lookup($2) != -1){
			/* 있다면, 이미 선언되었다고 에러 출력 */
				fprintf(fp, "ERROR!\n(%s is already declared)\n", $2);
				exit(0);
			}
			/* 없으면 추가 */
			insert($2, $1);
		}
	;


asign	: ID ASSIGN expr {	/* ID가 symbol table에 있는지 확인 */
				ok = lookup($1);
				/* 없다면 */
				if(ok == -1){
					fprintf(fp, "ERROR!\n(%s is unknown id)\n", $1);
					exit(0);
				}
				/* three-address code 출력 */
				fprintf(fp, "%s = %s\n", $1, $3);

				/* type mismatch check => expr의 type과 id의 type이 같은지*/
				if(flag != symbol_table[ok].type)
					fprintf(fp, "//warning: type mismatch\n");
				flag = 'i';
			}
	;

expr	: FLOAT	{
			/* flag를 float type으로 */
			flag = FLOAT_TYPE;
			strcpy($$, $1);
		}
	| INT	{	
			/* 이전에 float type 이었다면 그대로 */
			if(flag == FLOAT_TYPE)
				flag = FLOAT_TYPE;
			else
				flag = INT_TYPE;

			strcpy($$, $1);
		}
	| ID	{	
			/* symbol table 확인 */
			ok = lookup($1);
			/* 존재하지않음 */
			if(ok == -1){
				fprintf(fp, "ERROR!\n(%s is unknown id)\n", $1);
				exit(0);
			}
			/* 존재함 */
			/* 1. 이전에 float type이 나왔으면 */
			if(flag == FLOAT_TYPE)
				flag = FLOAT_TYPE;
			/* 2. 이전에 int type 이었다면 id(변수)의 type으로 변경 */
			else
				flag = symbol_table[ok].type;
		
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
					fprintf(fp, "%s = -%s;\n", $$, $2);
				}
	;

%%

/* error 처리 함수 */
void yyerror()
{
	fprintf(fp,"error!\n");
}

void insert(const char *id, char type){
	strcpy(symbol_table[table_idx].name, id);
	symbol_table[table_idx].type = type;
	table_idx++;
}

/* symbol_table에서 찾는 함수 */
int lookup(const char* id){
	int ans = -1;
	for(int i=0;i<table_idx;i++){
		if(!strcmp(symbol_table[i].name,id)){
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
	
	do{
		yyparse();

	}while(!feof(yyin));

	return 0;
}
