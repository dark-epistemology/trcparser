#include <stdint.h>
#ifndef _TRC_H_
#define _TRC_H_
typedef enum {
   INVAL=0,
   PIC,
   PARSE,
   EXEC,
   FETCH,
   CLOSE,
   WAIT, 
   STAT,
   BIND
}  ELEMS;

typedef struct PIC_tag {
   ELEMS nature;
   uint_fast64_t  cursor;
   uint_fast64_t  epoch;
   uint_fast32_t  length;
   uint_fast32_t  depth;
   uint_fast32_t  uid;
   uint_fast32_t  oct;
   uint_fast32_t  rid;
   uint_fast64_t  hv;
   uint_fast64_t  address;
   char * sqlid;
}  PIC_t;


typedef struct PEF_tag {
   ELEMS nature;
   uint_fast64_t  cursor;
   uint_fast64_t  epoch;
   uint_fast32_t  cpu;
   uint_fast32_t  elapsed;
   uint_fast32_t  physical_reads;
   uint_fast32_t  consistent_reads;
   uint_fast32_t  current_reads;
   uint_fast32_t  miss;
   uint_fast32_t  rows;
   uint_fast32_t  depth;
   uint_fast32_t  optimizer_goal;
   uint_fast32_t  plan_hash_value;
}  PEF_t;

   
typedef  struct CLO_tag {
   ELEMS nature;
   uint_fast64_t  cursor;
   uint_fast64_t  epoch;
   uint_fast32_t  cpu;
   uint_fast32_t  elapsed;
   uint_fast32_t  depth;
   uint_fast32_t  type;
}  CLO_t;


typedef  struct WAI_tag {
   ELEMS nature;
   uint_fast64_t  cursor;
   uint_fast64_t  epoch;
   char  *        event;
   uint_fast32_t  elapsed;
   uint_fast64_t  p1;
   uint_fast64_t  p2;
   uint_fast64_t  p3;
   int            obj;
} WAI_t;


typedef  struct STA_tag {
   ELEMS nature;
   uint_fast64_t  cursor;
   uint_fast64_t  epoch;   /* useless here */
   uint_fast16_t  id; 
   uint_fast16_t  cnt; 
   uint_fast16_t  pid; 
   uint_fast16_t  pos; 
   uint_fast32_t  obj; 
   char *         plan_line;
} STA_t;

typedef struct {
   ELEMS nature;
   uint_fast64_t  cursor;
   uint_fast64_t  epoch;   
}  ELEM_t;



ELEM_t * new_elem( ELEMS nature );
#define new_pic      (PIC_t*) new_elem( PIC )
#define new_parse    (PEF_t*) new_elem( PARSE )
#define new_exec     (PEF_t*) new_elem( EXEC )
#define new_fetch    (PEF_t*) new_elem( FETCH )
#define new_close    (CLO_t*) new_elem( CLOSE )
#define new_wait     (WAI_t*) new_elem( WAIT )
#define new_stat     (STA_t*) new_elem( STAT )

#endif
