# -*- perl -*-

use strict;
use warnings;

use Test::More tests => 3;
BEGIN { use_ok( 'Geo::Google::StaticMaps::V2' ); }

my $file="google_staticmap.png";

unlink $file if -f $file;

ok(not -f $file);

my $map=Geo::Google::StaticMaps::V2->new();

$map->marker(location=>"Clifton,VA");

$map->save($file);

ok(-f $file);
