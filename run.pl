#!/usr/bin/perl -X

use List::MoreUtils qw{minmax};
use Data::Dumper;
use Finance::NASDAQ::Markets;
use Finance::Google::Sector::Mean;
use Statistics::Basic qw(:all);
my @keys;
my @sector = sectorsummary();
my @idx = index();
my @sec = sector();
my $sorter = {"markets"=>{},"symbols"=>{},"sector"=>{}};
my ($symbol,$direction,@pct,$longshort);
foreach(@idx){
$symbol = sprintf "[%s] %s",$_->[0],$_->[1];
@pct = split(" ",$_->[3]);
$longshort = $_->[6];
$sorter->{markets}->{$longshort}->{$pct[1]}=$symbol;
}
@keys = keys %{$sorter->{markets}->{down}};
$sorter->{markets}->{mean}->{down}={'mean'=>sprintf( "%3.3f",mean(@keys)),'maxmin'=>[minmax(@keys)]};
@keys = keys %{$sorter->{markets}->{up}};
$sorter->{markets}->{mean}->{up}={'mean'=>sprintf( "%3.3f",mean(@keys)),'maxmin'=>[minmax(@keys)]};
 printf("\n#####################%s#####################\n","UP MARKETS");
 @keys = reverse sort { $a <=> $b  }  keys %{$sorter->{markets}->{up}};
 foreach (@keys) { printf("\n%3.3f %s",$_,$sorter->{markets}->{up}->{$_}); }
 printf("\n#####################%s#####################\n","DOWN MARKETS");
   @keys = reverse sort { $a <=> $b  }  keys %{$sorter->{markets}->{down}};
 foreach (@keys) { printf("\n%3.3f %s",$_,$sorter->{markets}->{down}->{$_}); }
foreach(@sec){
$symbol = sprintf "[%s] %s",$_->[0],$_->[1];
@pct = split(" ",$_->[3]);
$longshort = $_->[6];
$sorter->{sector}->{$longshort}->{$pct[1]}=$symbol;
}
@keys = keys %{$sorter->{sector}->{down}};
$sorter->{sector}->{mean}->{down}={'mean'=>sprintf( "%s",mean(@keys)),'maxmin'=>[minmax(@keys)]};
 printf("\n#####################%s#####################\n","SECTOR UP");
@keys = reverse sort { $a cmp $b  }  keys %{$sorter->{sector}->{up}};
 foreach (@keys) { printf("\n%s %s",$_,$sorter->{sector}->{up}->{$_}); }
 printf("\n#####################%s#####################\n","SECTOR DOWN");
@keys = reverse sort { $a cmp $b  }  keys %{$sorter->{sector}->{down}};
 foreach (@keys) { printf("\n%s %s",$_,$sorter->{sector}->{down}->{$_}); }
