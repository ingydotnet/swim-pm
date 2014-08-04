use strict;
package Swim::Markup;
use Pegex::Base;
extends 'Swim::Tree';

has option => {};

use constant top_block_separator => '';

sub BUILD {
    $_[0]->{option} ||= {};
}

sub final {
    my ($self, $tree) = @_;
    $self->{stack} = [];
    $self->{bullet} = [];
    my $out = $self->render($tree);
    if ($self->option->{'complete'}) {
        if ($self->can('render_complete')) {
            $out = $self->render_complete($out);
        }
    }
    $out;
}

sub render {
    my ($self, $node, $separator) = @_;
    my $out;
    if (not ref $node) {
        $out = $self->render_text($node);
    }
    elsif (ref($node) eq 'HASH') {
        $out = $self->render_node($node);
    }
    else {
        $separator ||=
            $self->at_top_level ? $self->top_block_separator : '';
        $out = join $separator, grep $_, map { $self->render($_) } @$node;
    }
    return $out;
}

sub render_node {
    my ($self, $hash) = @_;
    my ($name, $node) = each %$hash;
    my $number = $name =~ s/(\d)$// ? $1 : 0;
    my $method = "render_$name";
    push @{$self->{stack}}, $name;
    my $out = $self->$method($node, $number);
    pop @{$self->{stack}};
    $out;
}

sub render_func {
    my ($self, $node) = @_;
    if ($node =~ /^([\-\w]+)(?:[\ \:]|\z)((?s:.*)?)$/) {
        my ($name, $args) = ($1, $2);
        (my $method = "phrase_func_$name") =~ s/-/_/g;
        (my $plugin = "Swim::Plugin::$name") =~ s/-/::/g;
        while (1) {
            if ($self->can($method)) {
                my $out = $self->$method($args);
                return $out if defined $out;
            }
            last if $plugin eq "Swim::Plugin";
            eval "require $plugin";
            $plugin =~ s/(.*)::.*/$1/;
        }
    }
    "<$node>";
}

sub at_top_level {
    @{$_[0]->{stack}} == 0
}

1;
