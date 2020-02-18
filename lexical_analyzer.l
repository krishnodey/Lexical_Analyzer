%{

%}
%option noyywrap

%%
[''|,|;(|)|{|}|.|_] {fprintf(yyout,"this is Delimiter:%s\n",yytext);}

[[]] {fprintf(yyout,"this is Delimiter:%s\n",yytext);}

[+|-|*|/|<|>]  {fprintf(yyout,"this is Operator:%s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"this is Identifier:%s\n",yytext);}

[0-9]*"."[0-9]+ {fprintf("this is float : %s\n", yytext);} 

[0-9]+ {fprintf(yyout,"this is Integer:%s\n",yytext);}

[\t\n]+

"auto"|"double""|"int"|"struct"|"break"|"else"|"long"|"switch"|"case"|"enum"|"register"|"typedef"|"char"|"extern"|"return"|"union"|"const"|"short"|"float"|"unsigned"|"continue"|"for"|"signed"|"void"|"default"|"goto"|"sizeof"|"volatile"|"do"|"if"|"static"|"while" {fprintf(yyout,"this is Keyword:%s\n",yytext);}

[\t\n]"#include <stdio.h>"|"#include <stdlib.h>"|"#include <string.h>"|"#include <math.h>" {fprintf(yyout,"this is Pre-processor directive:%s\n",yytext);}
. {fprintf(yyout,"",yytext);}

%%


main(){

extern FILE *yyin,*yyout;
yyin=fopen("input.txt","r");
yyout=fopen("output.txt","w");
yylex();

}



