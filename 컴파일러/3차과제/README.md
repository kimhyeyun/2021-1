# Program Assignment #3

## 개요
### Program assignment 2의 프로그램을 개선할 것
* File로 input/output 처리할 것
* 숫자(num) 외에 identifier (변수)를 입력으로 받을 수 있음
  * identifier 의 경우 입력 file 가장 앞부분에 type id; 으로 선언되어 있음 (여러줄에 걸쳐 선언될 수 있음)
  * type은 int와 float 두 가지임
* Assignment statement를 처리할 것 ex) A = B + 5
* 사칙연산 (+,-,*,/) 이 포함된 수식으 3-address code로 출력
  * 입력에 사용된 변수와 숫자는 그대로 출력
  * 임시변수는 t0,t1,t2,..., 로 할당할 것

### Error handling
* 선언부에 선언되지 않은 변수가 사용될 경우
* 이미 선언된 변수가 중복 선언될 경우
* type check -> mismatch 시 warning 

## 코드 
 ### Type Checking은 변수 type을 읽어 int 는 i, float는 f를 return. expr에서 각 숫자의 type을 flag에 저장함으로써 식의 전체 type과 변수의 type을 비교함.

### cal.y
```
def	: TYPE ID {	/* 이미 symbol table에 있는지 확인 */
			if(lookup($2) != -1){
			/* 있다면, 이미 선언되었다고 에러 출력 */
				fprintf(fp, "ERROR!\n(%s is already declared)\n", $2);
				exit(0);
			}
			/* 없으면 추가 */
			insert_exp($2, $1,"\n");
		}

	| TYPE ID ASSIGN expr	{	/* 선언과 동시에 값을 넣은 경우 */
					ok = lookup($2);
					if(ok != -1){
						fprintf(fp, "ERROR!\n(%s is already declared)\n", $2);
						exit(0);
					}

					insert_exp($2, $1, $4);
					
					fprintf(fp, "%s = %s\n", $2, $4);
					/* 다시 한번 탐색 해야함 */
					ok = lookup($2);
					if(flag != symbol_table[ok].type)
						fprintf(fp, "//warning: type mismatch\n"); 

					flag = 'i';
				}
				
	| ID ASSIGN expr {	/* ID가 symbol table에 있는지 확인 */
				ok = lookup($1);
				/* 없다면 */
				if(ok == -1){
					fprintf(fp, "ERROR!\n(%s is unknown id)\n", $1);
					exit(0);
				}
				
				/* 있으면 symbol table에 식 넣어주기 */
				strcpy(symbol_table[ok].exp, $3);

				/* three-address code 출력 */
				fprintf(fp, "%s = %s\n", $1, $3);

				/* type mismatch check => expr의 type과 id의 type이 같은지*/
				if(flag != symbol_table[ok].type)
					fprintf(fp, "//warning: type mismatch\n");

				flag = 'i';
				
			}
	;

 ```

## 빌드
```
% flex cal.l
% bison -d cal.y
% gcc -o cal cal.tab.c lex.yy.c
```

## 실행
```
./cal
```

## 예시
 * input.txt
 ```
 int a;
 int b;
 a = 2 + 6 * 3;
 b = -a + 2 * 2 + 10;
 ```
 * result.txt
 ```
 t0 = 6 * 3
 t1 = 2 + t0
 a = t1
 t2 = -a;
 t3 = 2 * 2
 t4 = t2 + t3
 t5 = t4 + 10
 b = t5
 ```
 
 * input.txt
 ```
 float a;
 float b;
 a = 2.0E-2+0.5;
 b = a*2+15;
 ```
 * result.txt
 ```
 t0 = 2.0E-2 + 0.5
 a = t0
 t1 = a * 2
 t2 = t1 + 15
 b = t2
 ```
 
 * input.txt
 ```
 int a;
 int a;
 int b;
 a = 2 + 6 * 3;
 b = -a + 2 * 2 + 10;
 ```
 * result.txt
 ```
 ERROR!
 (a is already declared)
 ```
 
 * input.txt
 ```
 float a;
 float b;
 a = 2.0E - 2;
 b = a + c;
 ```
 * result.txt
 ```
 a = 2.0E - 2
 ERROR!
 (c is unknown id)
 ```
 
 * input.txt
 ```
 int a;
 float b;
 a = 2.0E-2 + 0.5;
 b = a * 2 + 15;
 ```
 * result.txt
 ```
 t0 = 2.0E-2 + 0.5
 a = t0
 //warning: type mismatch
 t1 = a * 2
 t2 = t1 + 15
 b = t2
 //warning: type mismatch
 ```
 ### 2021.06.14 변수 선언 동시에 값 할당
 * input.txt
 ```
 int a = 2 + 6 * 3;
 int b;
 b = -a + 2 * 2 + 10;
 ```
 * result.txt
 ```
 t0 = 6 * 3
 t1 = 2 + t0
 a = t1
 t2 = -a;
 t3 = 2 * 2
 t4 = t2 + t3
 t5 = t4 + 10
 b = t5
 ```
 ### 변수를 포함한 식을 입력했는데 변수에 값이 없다면 에러
 * input.txt
 ```
 int a;
 int b = -a + 2 * 2 + 10;
 a = 2 + 6 * 3;
 ```
 * result.txt
 ```
 ERROR!
 (a doesn't have value)
 ```
 
