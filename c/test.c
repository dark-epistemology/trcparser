#include "trc.h"
#include <glib.h>
#include <stdio.h>
#include <stdarg.h>

char * natures[] = {
   [PIC]    =  "Parsing in Cursor",
   [PARSE]  =  "Parse",
   [EXEC]   =  "Execute",
   [FETCH]  =  "Fetch",
   [CLOSE]  =  "Close",
   [WAIT]   =  "Wait",
   [STAT]   =  "Plan Line"
};

int main( int argc, char ** argv ) {
   ELEMS nature;
   GPtrArray *array;
   array = g_ptr_array_new ();
   g_ptr_array_add (array, (gpointer) new_pic );
   g_ptr_array_add (array, (gpointer) new_parse );
   g_ptr_array_add (array, (gpointer) new_exec );
   g_ptr_array_add (array, (gpointer) new_fetch );
   g_ptr_array_add (array, (gpointer) new_close );
   g_ptr_array_add (array, (gpointer) new_wait );
   g_ptr_array_add (array, (gpointer) new_stat );

   printf( "Size of array : %d\n", array->len );
   for (uint8_t i=0; i< array->len ; i++) {
      printf( "Elem % 2d : %s\n", i, natures[ ((ELEM_t*)g_ptr_array_index(array, i))->nature ] );
   }
}
