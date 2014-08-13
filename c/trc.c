#include "trc.h"

#include <stdlib.h>
#include <assert.h>
#include <glib.h>

#define defun( P_TYPE, P_NAME ) \
static ELEM_t * alloc_##P_NAME () { \
   P_TYPE * ptr = g_new0(P_TYPE,1); \
   assert(ptr); \
   return (ELEM_t*) ptr; \
}

defun( PIC_t, pic )
defun( PEF_t, pef )
defun( CLO_t, close )
defun( WAI_t, wait )
defun( STA_t, plan )

#undef defun
typedef ELEM_t *(*ALLOCATOR_t)(void);

ALLOCATOR_t allocators[] = {
   [PIC]    =  alloc_pic,
   [PARSE]  =  alloc_pef,
   [EXEC]   =  alloc_pef,
   [FETCH]  =  alloc_pef,
   [CLOSE]  =  alloc_close,
   [WAIT]   =  alloc_wait,
   [STAT]   =  alloc_plan
};
   
ELEM_t * new_elem( ELEMS nature ) {
   assert( nature >= PIC && nature <= STAT );
   ELEM_t * ptr = allocators[nature]();
   assert(ptr);
   ptr->nature = nature;
   return ptr;
} // new_elem

ELEM_t * new_pic( 
         uint64_t cursor,
         uint32_t length,
         uint32_t depth,
         uint32_t uid,
         uint32_t oct,
         uint32_t rid,
         uint64_t epoch,
         char *   hv,
         char *   sqlid
         ) {
   PIC_t * ptr = (PIC_t*) new_elem( PIC );
   ptr->cursor =  cursor;
   ptr->length =  length;
   ptr->depth  =  depth;
   ptr->uid    =  uid;
   ptr->oct    =  oct;
   ptr->rid    =  rid;
   ptr->epoch  =  epoch;
   ptr->address=  address;
   ptr->sqlid  =  sqlid;
   return (ELEM_t*)ptr;
} // new_pic
         
