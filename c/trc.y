%{
int yylval;
#include "trc.h"
#include <stdio.h>
%}

%token   NB HEXNUM ACT_PIC ATR_LENGTH ATR_DEPTH ATTR_UID ATR_SQLCOMMAND ATR_RID ATR_EPOCH ATR_HASHVALUE ATR_ADDRESS ATR_SQLID SQLID QUOTE 

%%

/*
PLAN  :  PIC
         |  PEF
         |  CLOSE
         |  WAIT
         |  BIND
         |  STAT;
*/

PIC   :  ACT_PIC NB ATR_LENGTH NB ATR_DEPTH NB ATTR_UID NB ATR_SQLCOMMAND NB ATR_RID NB ATR_EPOCH NB ATR_HASHVALUE NB ATR_ADDRESS QUOTE HEXNUM QUOTE ATR_SQLID QUOTE SQLID QUOTE {
            printf( "%s: %ld\n", $1, $2 );
         }
%%
int main( void ) {
        yyparse() ;
       }
    int yyerror(char *msg) { 
        printf("\n%s\n", msg);
    }
