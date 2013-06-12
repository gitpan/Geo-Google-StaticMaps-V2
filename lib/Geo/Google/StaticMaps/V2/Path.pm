package Geo::Google::StaticMaps::V2::Path;
use warnings;
use strict;
use base qw{Geo::Google::StaticMaps::V2::Base};
our $VERSION = '0.03';
our $PACKAGE = __PACKAGE__;

=head1 NAME

Geo::Google::StaticMaps::V2::Path - Generate Images from Google Static Maps API V2 API

=head1 SYNOPSIS

  use Geo::Google::StaticMaps::V2;
  my $map=Geo::Google::StaticMaps::V2->new;
  my $marker=$map->marker(lacation=>[$lat=>$lon]); #isa Geo::Google::StaticMaps::V2::Path

=head1 DESCRIPTION

The packages generates images from the Google Static Maps API V2 API which can be saved locally for use in accordance with your license with Google.

=head1 USAGE

=head1 PROPERTIES

=cut

sub _styles {
  my $self=shift;
  my @styles=();
  push @styles, join ":", weight    => $self->weight                      if defined $self->weight;
  push @styles, join ":", color     => $self->color                       if defined $self->color;
  push @styles, join ":", fillcolor => $self->fillcolor                   if defined $self->fillcolor;
  push @styles, join ":", geodesic  => $self->geodesic ? "true" : "false" if defined $self->geodesic;
  return @styles;
}

=head2 weight

weight: (optional) specifies the thickness of the path in pixels. If no weight parameter is set, the path will appear in its default thickness (5 pixels). 

=cut

sub weight {
  my $self=shift;
  $self->{"weight"}=shift if @_;
  return $self->{"weight"};
}

=head2 color

color: (optional) specifies a color either as a 24-bit (example: color=0xFFFFCC) or 32-bit hexadecimal value (example: color=0xFFFFCCFF), or from the set {black, brown, green, purple, yellow, blue, gray, orange, red, white}.

When a 32-bit hex value is specified, the last two characters specify the 8-bit alpha transparency value. This value varies between 00 (completely transparent) and FF (completely opaque). Note that transparencies are supported in paths, though they are not supported for markers.

=head2 fillcolor

fillcolor: (optional) indicates both that the path marks off a polygonal area and specifies the fill color to use as an overlay within that area. The set of locations following need not be a "closed" loop; the Static Map server will automatically join the first and last points. Note, however, that any stroke on the exterior of the filled area will not be closed unless you specifically provide the same beginning and end location. 

=cut

sub fillcolor {
  my $self=shift;
  $self->{"fillcolor"}=shift if @_;
  return $self->{"fillcolor"};
}

=head2 geodesic

geodesic: (optional) indicates that the requested path should be interpreted as a geodesic line that follows the curvature of the Earth. When false, the path is rendered as a straight line in screen space. Defaults to false.

=cut

sub geodesic {
  my $self=shift;
  $self->{"geodesic"}=shift if @_;
  return $self->{"geodesic"};
}

=head1 METHODS

=head2 addLocation

  $marker->addLocation("Clifton, VA");

=head1 BUGS

=head1 SUPPORT

=head1 AUTHOR

  Michael R. Davis
  CPAN ID: MRDVT
  Satellite Tracking of People, LLC
  mdavis@stopllc.com
  http://www.stopllc.com/

=head1 COPYRIGHT

This program is free software licensed under the...

  The General Public License (GPL) Version 2, June 1991

The full text of the license can be found in the LICENSE file included with this module.

=head1 SEE ALSO

L<Geo::Google::StaticMaps>, L<Geo::Google::MapObject>, L<Net::Flickr::Geo::GoogleMaps>

=cut

1;
