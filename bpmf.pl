# make a bopomofo cheatsheet from Wikipedia table
#   https://en.wikipedia.org/wiki/Bopomofo#Etymology
use strict;
use warnings;
use v5.10;
use Data::Dumper;

$/ = undef;
binmode DATA, ":utf8";
my $table = <DATA>;
$table =~ s/\r//msg;

binmode STDOUT, ":utf8";
#print $table;

my @lines = split /\n/, $table;

my @table;
my $numlines = 0;
for (@lines) {
  #say $_;
  my ($bi, $pi, $z, $b, $p) = split / +/;
  push @table, [ $bi, $pi, $z, $b, $p ];
  $numlines++;
  #last if $numlines > 10;
}

#print Dumper(\@table);

say <<END;
<style>
tr.item0 { font-size: 1.0em; }
tr.item1 { font-size: 0.5em; }
tr.item2 { font-size: 0.8em; }
tr.item3 { font-size: 0.4em; }
tr.item4 { font-size: 0.5em; }
td { width: 50px; }
</style>
END

print_table(1) for (1..4);
print_table();

sub print_table {
  say '<table>';
  print_col_as_line(0,6);
  print_col_as_line(2,6);
  print_col_as_line(3,5);
  print_col_as_line(1,7);
  print_col_as_line(4,7);
  say '</table>';
  say '<p>&nbsp;</p>' if shift;
}

sub print_col_as_line {
  my $colnum = shift;
  my $width = shift;
  say "<tr class=\"item$colnum\">\n";
  for my $i (0..$numlines-1) {
    my $line = $table[$i];
    printf "<td>%-*s</td>", $width, $line->[$colnum];
  }
  say "\n</tr>";

}
say "";

__DATA__
ㄅ b    八 ㄅㄚ bā
ㄆ p    杷 ㄆㄚˊ pá
ㄇ m    馬 ㄇㄚˇ mǎ
ㄈ f    法 ㄈㄚˇ fǎ
ㄉ d    地 ㄉㄧˋ dì
ㄊ t    提 ㄊㄧˊ tí
ㄋ n    你 ㄋㄧˇ nǐ
ㄌ l    利 ㄌㄧˋ lì
ㄍ g    告 ㄍㄠˋ gào
ㄎ k    考 ㄎㄠˇ kǎo
ㄏ h    好 ㄏㄠˇ hǎo
ㄐ j    叫 ㄐㄧㄠˋ jiào
ㄑ q    巧 ㄑㄧㄠˇ qiǎo
ㄒ x    小 ㄒㄧㄠˇ xiǎo
ㄓ zh   主 ㄓㄨˇ zhǔ
ㄔ ch   出 ㄔㄨ chū
ㄕ sh   束 ㄕㄨˋ shù
ㄖ r    入 ㄖㄨˋ rù
ㄗ z    在 ㄗㄞˋ zài
ㄘ c    才 ㄘㄞˊ cái
ㄙ s    塞 ㄙㄞ sāi
ㄚ a    大 ㄉㄚˋ dà
ㄛ o    多 ㄉㄨㄛ duō
ㄜ e    得 ㄉㄜˊ dé
ㄝ ê    爹 ㄉㄧㄝ diē
ㄞ ai   晒 ㄕㄞˋ shài
ㄟ ei   誰 ㄕㄟˊ shéi
ㄠ ao   少 ㄕㄠˇ shǎo
ㄡ ou   收 ㄕㄡ shōu
ㄢ an   山 ㄕㄢ shān
ㄣ en   申 ㄕㄣ shēn
ㄤ ang  上 ㄕㄤˋ shàng
ㄥ eng  生 ㄕㄥ shēng
ㄦ er   而 ㄦˊ ér
ㄧ i/y  逆 ㄋㄧˋ nì
ㄨ u/w  努 ㄋㄨˇ nǔ
ㄩ ü/yu 女 ㄋㄩˇ nǚ
