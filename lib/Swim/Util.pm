use strict; use warnings;
package Swim::Util;
use Encode;

sub merge_meta {
    require YAML::XS;
    require Hash::Merge;
    my ($self, $meta, $yaml) = @_;
    my $data = eval {
        YAML::XS::Load(Encode::encode 'UTF-8', $yaml);
    };
    if ($@) {
        warn "Swim meta failed to load:\n$@";
        $data = {};
    }
    Hash::Merge::merge($data, $meta);
}

sub slurp {
    my ($self, $file) = @_;
    open my $fh, $file
        or die "Can't open '$file' for input";
    binmode($fh, ':encoding(UTF-8)');
    local $/;
    my $meta = <$fh>;
    close $fh;
    return $meta;
}

1;
