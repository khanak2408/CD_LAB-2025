%{
#include<stdio.h>
#include<string.h>
int count_key = 0;
%}

%%
int { count_key++; } 
float { count_key++; }

[\t\n] {;}
.      {;}
%% 

int main(int argc, char *argv[])
{
    FILE *file = fopen(argv[1],"r");
    yyin = file;
    yylex();
    printf("\n Number of keywords = %d\n", count_key);
    return 0;
}

int yywrap(){
    return 1;
}