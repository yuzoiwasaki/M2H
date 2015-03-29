#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use Text::Markdown::Discount qw/markdown/;

my $file = shift;
my $script_dir = $FindBin::Bin;

if (!$file || $file eq "-h" || $file eq "--help") {
  print <<"EOM";

Can't find Markdown file.

<Usage>
m2h hoge.md                 print Markdown file in HTML format, and see it in browser.
m2h (-s|--silent) hoge.md   only print HTML format.


EOM
exit;
}

my $option;
if ($file eq "-s" || $file eq "--silent") {
  $option = 1;
  $file = shift;
}

my $OUTFILE = "/tmp/$$.html";
open my $fh1, '>', $OUTFILE;

my $contents = do {
  local $/;
  open my ($fh2), '<', $file or die qq{Can't open Markdown file.};
  <$fh2>;
};

my $header = <<"EOM";
<html>
<head>
<meta charset="utf-8">
<title>M2H</title>
<link rel="stylesheet" href="$script_dir/github.css">
</head>
<body>
EOM

my $footer = <<"EOM";
</body>
</html>
EOM

my $html = markdown($contents);

print $fh1 $header;
print $fh1 $html;
print $fh1 $footer;
close $fh1;

unless ($option) {
  system("open -a Safari $OUTFILE");
}
print $html;
