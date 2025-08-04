%{
#include <stdio.h>
int count_key = 0;
%}

%%

int([^a-zA-z0-9_]) { count_key++; }
float([^a-zA-z0-9_]) { count_key++; }


[ \t\n]+ { /* skip */ }


. { /* skip */ }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[])
{
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error: Could not open file %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex();

    printf("Number of keywords = %d\n", count_key);
    return 0;
}
