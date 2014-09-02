%option noyywrap
%{
/* * * * * * * * * * * *
 * * * DEFINITIONS * * *
 * * * * * * * * * * * */
%}

digit    [0-9]+
sqlid    '[0123456789abcdfghjkmnpqrstuvwxyz]{13}'
address  '[0123456789abcdf]{1,8}'

%x PIC
%x SQLTEXT

%{
/* * * * * * * * * 
 * * * RULES * * *
 * * * * * * * * */
%}
%%
^"PARSING IN CURSOR #"  { BEGIN(PIC); printf("PIC %s", yytext ); /* return ACT_PIC; */    }
<PIC>digit              { printf("%s",  yytext ); /* return NB; */                     }
<PIC>" len="            { printf("%s",  yytext ); /* return ATR_LENGTH; */             }
<PIC>" dep="            { printf("%s",  yytext ); /* return ATR_DEPTH; */              }
<PIC>" uid="            { printf("%s",  yytext ); /* return ATR_UID; */                } /* effective user id */
<PIC>" oct="            { printf("%s",  yytext ); /* return ATR_SQLCOMMAND; */         }
<PIC>" lid="            { printf("%s",  yytext ); /* return ATR_RID; */                } /* real user id */
<PIC>" tim="            { printf("%s",  yytext ); /* return ATR_PIC_EPOCH; */          }
<PIC>" hv="             { printf("%s",  yytext ); /* return ATR_HASHVALUE; */          }
<PIC>" ad="             { printf("%s",  yytext ); /* return ATR_ADDRESS; */            }
<PIC>address            { printf("%s",  yytext ); /* return ADDRESS; */                }
<PIC>" sqlid='"         { printf("%s",  yytext ); /* return ATR_SQLID; */              }
<PIC>sqlid              { printf("%s",  yytext ); /* return SQLID; */                  }
<PIC>\n                 { BEGIN( SQLTEXT ); puts( "\nSQLTEXT:\n" );                   }

<SQLTEXT>^"END OF STMT"$ { BEGIN(INITIAL);                }
<SQLTEXT>.*        { printf(yytext);               }

. {}
%%

/* * * * * * * * * * * 
 * * * USER CODE * * *
 * * * * * * * * * * *
 */
int main(int argc, char *argv[]) {
  yylex();
}
