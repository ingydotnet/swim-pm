use strict; use warnings;
package Swim;
use Pegex::Base;

our $VERSION = '0.1.40';

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
  my $man = $self->get_man;
  if ($man =~ /\n\.IX Header "Name"\n(.*) \\- (.*)/) {
    my ($name, $title) = ($1, $2);
    $man =~ s/IO::FILE=IO\(0X\S+\)/$name/g;
    $man =~ s/"User Contributed Perl Documentation"/"$title"/;
    $man =~ s/"perl v5\.\d+\.\d+"/"Generated by Swim v$VERSION"/
  }
  return $man;
# .IX Title "IO::FILE=IO(0X1BBB880) 1"
# .TH IO::FILE=IO(0X1BBB880) 1 "2015-10-10" "perl v5.18.2" "Hello Mom"
# .\" For nroff, turn off justification.  Always turn off hyphenation; it makes
# .\" way too many mistakes in technical documents.
# .if n .ad l
# .nh
# .SH "Name"
# .IX Header "Name"
# paas-tools \- A Toolbox of \s-1HP\s0 PaaS Automations
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
  $self->option->{complete} = 1;
  my $in = $self->convert('Swim::Pod');
  my ($out, $err);

  my @cmd = ('pod2man', '--utf8');
  IPC::Run::run(\@cmd, \$in, \$out, \$err, IPC::Run::timeout(10))
    or die "$0: $? - $!";
  die "$err" if $err;

  $out;
}

1;
