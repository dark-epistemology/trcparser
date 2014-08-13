%{
#include "y.tab.h"
%}

digit    [0-9]
letter   [a-z]

%%
"PARSING IN CURSOR"   { return ACT_PIC;            }
"len="                { return ATR_LENGTH;         }
"dep="                { return ATR_DEPTH;          }
"uid="                { return ATR_UID;            } /* effective user id */
"oct="                { return ATR_SQLCOMMAND;     }
"lid="                { return ATR_RID;            } /* real user id */
"tim="                { return ATR_EPOCH;          }
"hv="                 { return ATR_HASHVALUE;      }
"ad="                 { return ATR_ADDRESS;        }
"sqlid="              { return ATR_SQLID;          }

"PARSE"               { return ACT_PARSE;          }
"EXEC"                { return ACT_EXEC;           }
"FETCH"               { return ACT_FETCH;           }
"c="                  { return ATR_CPU;            }
"e="                  { return ATR_ELAPSED;        }
"p="                  { return ATR_PHYSRD;         }
"cr="                 { return ATR_CONSISTENT;     }
"cu="                 { return ATR_CURRENT;        }
"mis="                { return ATR_MISS;           }
"r="                  { return ATR_NUMROWS;        }
"og="                 { return ATR_OPTGOAL;        }
"plh="                { return ATR_PLANHASH;       }

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


