package Geo::Google::StaticMaps::V2::Markers;
use warnings;
use strict;
use base qw{Geo::Google::StaticMaps::V2::Base};
our $VERSION = '0.03';
our $PACKAGE = __PACKAGE__;

=head1 NAME

Geo::Google::StaticMaps::V2::Markers - Generate Images from Google Static Maps API V2 API

=head1 SYNOPSIS

  use Geo::Google::StaticMaps::V2;
  my $map=Geo::Google::StaticMaps::V2->new;
  my $marker=$map->marker(lacation=>[$lat=>$lon]); #isa Geo::Google::StaticMaps::V2::Markers

=head1 DESCRIPTION

The packages generates images from the Google Static Maps API V2 API which can be saved locally for use in accordance with your license with Google.

=head1 USAGE

=head1 PROPERTIES

=cut

sub _styles {
  my $self=shift;
  my @styles=();
  push @styles, join ":", size   => $self->size                      if defined $self->size;
  push @styles, join ":", color  => $self->color                     if defined $self->color;
  push @styles, join ":", label  => $self->label                     if defined $self->label;
  push @styles, join ":", icon   => $self->icon                      if defined $self->icon;
  push @styles, join ":", shadow => $self->shadow ? "true" : "false" if defined $self->shadow;
  return @styles;
}

=head2 size

size: (optional) specifies the size of marker from the set {tiny, mid, small}. If no size parameter is set, the marker will appear in its default (normal) size. 

=cut

sub size {
  my $self=shift;
  $self->{"size"}=shift if @_;
  return $self->{"size"};
}

=head2 color

color: (optional) specifies a 24-bit color (example: color=0xFFFFCC) or a predefined color from the set {black, brown, green, purple, yellow, blue, gray, orange, red, white}.

=head2 label

label: (optional) specifies a single uppercase alphanumeric character from the set {A-Z, 0-9}. (The requirement for uppercase characters is new to this version of the API.) Note that default and mid sized markers are the only markers capable of displaying an alphanumeric-character parameter. tiny and small markers are not capable of displaying an alphanumeric-character. 

=cut

sub label {
  my $self=shift;
  $self->{"label"}=shift if @_;
  return $self->{"label"};
}

=head2 icon

icon specifies a URL to use as the marker's custom icon. Images may be in PNG, JPEG or GIF formats, though PNG is recommended. 

The icon parameter must be specified using a URL (which should be URL-encoded). You may use any valid URL of your choosing, or a URL-shortening service such as http://goo.gl. Most URL-shortening services have the advantage of automatically encoding URLs. Icons are limited to sizes of 4096 pixels (64x64 for square images), and the Static Maps service allows up to five unique custom icons per request. Note that each of these unique icons may be used multiple times within the static map.

Custom icons that have a shadow:true descriptor (the default) will have their "anchor point" set as the bottom center of the provided icon image, from which the shadow is cast. Icons without a shadow (setting a shadow:false descriptor) are instead assumed to be icons centered on their specified locations, so their anchor points are set as the center of the image.

=cut

sub icon {
  my $self=shift;
  $self->{"icon"}=shift if @_;
  return $self->{"icon"};
}

=head2 shadow

shadow (default true) indicates that the Static Maps service should construct an appropriate shadow for the image. This shadow is based on the image's visible region and its opacity/transparency.

=cut

sub shadow {
  my $self=shift;
  $self->{"shadow"}=shift if @_;
  return $self->{"shadow"};
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
