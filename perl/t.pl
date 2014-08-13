#!/bin/env perl

sub nvl {
   my $param = shift;
   return (defined $param) ? $param : "undefined";
}
sub mpar {
   my ($un, $deux, $trois) = @_;
   printf("Un: %s - deux: %s - trois: %s\n", nvl($un), nvl($deux), nvl($trois));
}


mpar( "un" );
mpar( "un","deux" );
mpar( "un","deux", "trois" );
mpar( "un","deux", "trois", "quatre" );
