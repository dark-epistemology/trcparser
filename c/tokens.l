%{
#include "y.tab.h"
%}

digit    [0-9]+
sqlid    '[0123456789abcdfghjkmnpqrstuvwxyz]{13}'
address  '[0123456789abcdf]{1,8}'

%s PIC
%x SQLTEXT

%%
"^PARSING IN CURSOR #"  { BEGIN(PIC); return ACT_PIC;    }
<PIC>digit              { return NB;                     }
<PIC>" len="            { return ATR_LENGTH;             }
<PIC>" dep="            { return ATR_DEPTH;              }
<PIC>" uid="            { return ATR_UID;                } /* effective user id */
<PIC>" oct="            { return ATR_SQLCOMMAND;         }
<PIC>" lid="            { return ATR_RID;                } /* real user id */
<PIC>" tim="            { return ATR_PIC_EPOCH;          }
<PIC>" hv="             { return ATR_HASHVALUE;          }
<PIC>" ad="             { return ATR_ADDRESS;            }
<PIC>address            { return ADDRESS;                }
<PIC>" sqlid='"         { return ATR_SQLID;              }
<PIC>sqlid              { return SQLID;                  }
<PIC>\n                 BEGIN( SQLTEXT );

<SQLTEXT>.*             { return TEXT;                   }
<SQLTEXT>"END OF STMT$" { BEGIN(INITIAL);                }

"^PARSE #"              { BEGIN(PEF);  return ACT_PARSE; }
"^EXEC #"               { BEGIN(PEF);  return ACT_EXEC;  }
"^FETCH"                { BEGIN(PEF);  return ACT_FETCH; }
<PEF>digit              { return NB;                     }
<PEF>":c="                 { return ATR_CPU;            }
<PEF>",e="                 { return ATR_ELAPSED;        }
<PEF>",p="                 { return ATR_PHYSRD;         }
<PEF>",cr="                { return ATR_CONSISTENT;     }
<PEF>",cu="                { return ATR_CURRENT;        }
<PEF>",mis="               { return ATR_MISS;           }
<PEF>",r="                 { return ATR_NUMROWS;        }
<PEF>",og="                { return ATR_OPTGOAL;        }
<PEF>",plh="               { return ATR_PLANHASH;       }
<PEF>",tim="               { return ATR_PEF_EPOCH;      }

"CLOSE"               { return ACT_CLOSE;          }
"type="               { return ATR_TYPE;           }

"PARSE ERROR"         { return ACT_PRSERROR;       }
"err="                { return ATR_ERROR;          }

"WAIT"                { return ACT_WAIT;           }
"nam="                { return ATR_EVENT;          }

"STAT"                { return ACT_PLANLINE;       }
"id="                 { return ATR_PLANRANK;       }
"cnt="                { return ATR_CARDINALITY;    }
"pid="                { return ATR_TABPOS;         }
"pos="                { return ATR_TABRANK;        }
"obj="                { return ATR_OBJID;          }
"op="                 { return ATR_OPERATION;      }

%%


