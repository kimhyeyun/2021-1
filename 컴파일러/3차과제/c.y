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

char tmp_name[5];
int tmp_cnt = 0;
int next_tmp();

struct symbol_struct{
	char name[256];
	int type;
};

struct symbol_struct sym_tab[512];
int sym_cnt = 0;

int lookup_sym_tab(const char *);

enum{
	INT_TYPE = 1,
	FLOAT_TYPE
};

int type_check_flag = 0;
int idx;

%}

%union {
	int ival;
	float fval;
	char sval[256];
}

%token <sval> FLOAT
%token <sval> INT
%token <ival> TYPE
%token <sval> ID
%token <sval> EQ


/* 연산자 우선순위 */
%left '+' '-'
%left '*' '/'
%right UMINUS

%type<sval> expr

%%
lines : lines stmts
      | lines '\n'
      | /* empty */
      ;

stmts : stmt ';'
      ;

stmt : asgn
     | decl
     ;

asgn : ID EQ expr { /* 심볼테이블에 없다면 에러문을 출력합니다 */
                            idx = lookup_sym_tab($1);
                            if (idx == -1) {
                                fprintf(fp, "Error!\n%s is unknown id\n",
                                $1);
                                exit(0);
                            }

                            /* 3-address code를 출력합니다 */
                            fprintf(fp, "%s = %s\n", $1, $3);

                            /* 계산 도중 타입 미스매치가 있는지 확인하고,
                            있다면 워닝문을 출력합니다. */
                            if (type_check_flag != sym_tab[idx].type)
                                fprintf(fp, "//warning: type mismatch\n");

                            /* 타입체크 플래그를 클리어합니다 */
                            type_check_flag = 0;}
     ;

decl : TYPE ID{ /* 이미 심볼테이블에 있다면 에러문을 출력합니다 */
                         if (lookup_sym_tab($2) != -1) {
                            fprintf(fp, "Error!\n%s is already declared\n",
                             $2);
                            exit(0);
                         }
                         strcpy(sym_tab[sym_cnt].name, $2);
                         sym_tab[sym_cnt++].type = $1; }
     ;

expr : FLOAT               { /* 해당 타입에 따라 플래그를 토글합니다. */
                             type_check_flag = FLOAT_TYPE;
                             strcpy($$, $1); }
     | INT                 { /* 해당 타입에 따라 플래그를 토글합니다. */
                             if(type_check_flag == FLOAT_TYPE)
				type_check_flag = FLOAT_TYPE;
			    else
				type_check_flag = INT_TYPE;

                             strcpy($$, $1); }
     | ID        { /* 심볼테이블에 없다면 에러문을 출력합니다 */
                             idx = lookup_sym_tab($1);
                             if (idx == -1) {
                                fprintf(fp, "Error!\n%s is unknown id\n",
                                $1);
                                exit(0);
                             }
                             /* 해당 타입에 따라 플래그를 토글합니다. */
                             if(type_check_flag == FLOAT_TYPE)
				type_check_flag = FLOAT_TYPE;
			else
				type_check_flag = sym_tab[idx].type;
                             strcpy($$, $1); }
     | expr '+' expr       { /* 새로운 임시변수 번호를 할당하고
                                3-address code를 출력합니다. */
                             sprintf(tmp_name, "t%d", next_tmp());
                             strcpy($$, tmp_name);
                             fprintf(fp, "%s = %s + %s\n", tmp_name, $1,
                             $3); }
     | expr '-' expr       { sprintf(tmp_name, "t%d", next_tmp());
                             strcpy($$, tmp_name);
                             fprintf(fp, "%s = %s - %s\n", $$, $1, $3); }
     | expr '*' expr       { sprintf(tmp_name, "t%d", next_tmp());
                             strcpy($$, tmp_name);
                             fprintf(fp, "%s = %s * %s\n", $$, $1, $3); }
     | expr '/' expr       { sprintf(tmp_name, "t%d", next_tmp());
                             strcpy($$, tmp_name);
                             fprintf(fp, "%s = %s / %s\n", $$, $1, $3); }
     | '(' expr ')'        { strcpy($$, $2); }
     | '-' expr %prec UMINUS { sprintf(tmp_name, "t%d", next_tmp());
                               strcpy($$, tmp_name);
                               fprintf(fp, "%s = -%s\n", $$, $2); }
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
	
	yyparse();

	fclose(yyin);
	fclose(fp);

	
	return 0;
}

int next_tmp(){
	return tmp_cnt++;
}

int lookup_sym_tab(const char *name){
	int ret = -1;
	for(int i = 0;i<sym_cnt;++i){
		if(!strcmp(sym_tab[i].name, name)){
			ret = i;
			break;
		}
	}
	return ret;
}