use strict; use warnings;
package Swim;
use Pegex::Base;

our $VERSION = '0.1.34';

has text => ();
has meta => {};
has option => {};
has debug => 0;

use Pegex::Parser;
use Swim::Grammar;

sub convert {
  my ($self, $receiver_class) = @_;
  eval "require $receiver_class; 1"
    or die "$@";

  my $parser = Pegex::Parser->new(
    grammar => 'Swim::Grammar'->new,
    receiver => $receiver_class->new(
      meta => $self->meta,
      option => $self->option,
    ),
    debug => $self->debug,
  );
  $parser->parse($self->text);
}

sub to_pod {
  my ($self) = @_;
  $self->convert('Swim::Pod');
}

sub to_md {
  my ($self) = @_;
  $self->convert('Swim::Markdown');
}

sub to_html {
  my ($self) = @_;
  $self->convert('Swim::HTML');
}

sub to_txt {
  require IPC::Run;
  my ($self) = @_;
  my $in = $self->convert('Swim::Pod');
  my ($out, $err);
  my @cmd = ('pod2text');

  IPC::Run::run(\@cmd, \$in, \$out, \$err, IPC::Run::timeout(10))
    or die "$0: $?: $!";
  die "$err" if $err;

  $out;
}

sub to_man {
  my ($self) = @_;
  $self->get_man;
}

sub to_pdf {
  require IPC::Run;
  my ($self) = @_;
  my ($in, $out, $err) = $self->get_man;
  my @cmd = ('groffer', '--pdf', '--to-stdout');
  IPC::Run::run(\@cmd, \$in, \$out, \$err, IPC::Run::timeout(10))
    or die "$cmd[0]: $?: $!";
  die "$err" if $err;
  $out;
}

sub to_dvi {
  require IPC::Run;
  my ($self) = @_;
  my ($in, $out, $err) = $self->get_man;
  my @cmd = ('groffer', '--dvi', '--to-stdout');
  IPC::Run::run(\@cmd, \$in, \$out, \$err, IPC::Run::timeout(10))
    or die "$cmd[0]: $?";
  die "$err" if $err;
  $out;
}

sub to_ps {
  require IPC::Run;
  my ($self) = @_;
  my ($in, $out, $err) = $self->get_man;
  my @cmd = ('groffer', '--ps', '--to-stdout');
  IPC::Run::run(\@cmd, \$in, \$out, \$err, IPC::Run::timeout(10))
    or die "$cmd[0]: $?";
  die "$err" if $err;
  $out;
}

sub get_man {
  require IPC::Run;
  my ($self) = @_;
  my $in = $self->convert('Swim::Pod');
  my ($out, $err);

  my @cmd = ('pod2man', '--utf8');
  IPC::Run::run(\@cmd, \$in, \$out, \$err, IPC::Run::timeout(10))
    or die "$0: $?";
  die "$err" if $err;

  $out;
}

1;
