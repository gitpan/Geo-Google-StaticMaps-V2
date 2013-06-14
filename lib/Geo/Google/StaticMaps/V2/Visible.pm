package Geo::Google::StaticMaps::V2::Visible;
use warnings;
use strict;
use base qw{Package::New};
our $VERSION = '0.07';
our $PACKAGE = __PACKAGE__;

=head1 NAME

Geo::Google::StaticMaps::V2::Visible - Generate Images from Google Static Maps V2 API

=head1 SYNOPSIS

  use base qw{Geo::Google::StaticMaps::V2::Visible};

=head1 DESCRIPTION

The packages generates images from the Google Static Maps V2 API which can be saved locally for use in accordance with your license with Google.

=head1 USAGE

  use base qw{Geo::Google::StaticMaps::V2::Visible};

=head2 initialize

Sets all passed in arguments and folds location parameter into the locations array.

=cut

sub initialize {
  my $self=shift;
  %$self=@_;
  $self->addLocation(delete $self->{"location"}) if exists $self->{"location"};
}

=head2 stringify

Handles various formats for locations seamlessly.

=cut

sub stringify {
  my $self=shift;
  my @p=();
  push @p, $self->_styles;
  foreach my $location ($self->locations) {
    my $string="";
    if (ref($location) eq "HASH") {
      $string=sprintf("%0.6f,%0.6f", $location->{"lat"}, $location->{"lon"});
    } elsif (ref($location) eq "ARRAY") {
      $string=sprintf("%0.6f,%0.6f", @$location);
    } else {
      $string="$location"; #or any object that overloads
    }
    push @p, $string;
  }
  return join "|", @p;
}

=head2 locations

Returns the locations array which can be set upon construction.

=cut

sub locations {
  my $self=shift;
  $self->{"locations"}=[] unless ref($self->{"locations"}) eq "ARRAY";
  return wantarray ? @{$self->{"locations"}} : $self->{"locations"};
}

sub _styles {
  my $self=shift;
  my @styles=();
  return @styles;
}

=head1 METHODS

=head2 addLocation

  $marker->addLocation("Clifton, VA");

=cut

sub addLocation {
  my $self=shift;
  push @{$self->locations}, @_;
  return $self;
}

=head1 BUGS

Please log on RT and send an email to the author.

=head1 SUPPORT

DavisNetworks.com supports all Perl applications including this package.

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

L<Geo::Google::StaticMaps::V2>, L<Geo::Google::StaticMaps::V2::Path>, L<Geo::Google::StaticMaps::V2::Markers>

=cut

1;
