unit primes;

interface

procedure print_primes(start_from: Integer);


implementation

uses
  DateUtils,
  SysUtils;


function is_prime_number(number: Integer): Boolean;
var
  i: Integer;
begin
  i:=2;
  while (i < number) do
  begin
      if (number mod i = 0) then
      begin
          Result:=False;
          exit;
      end;
      i:=i + 1;
  end;

  Result:=true;
end;


procedure print_primes(start_from: Integer);
var
  dt1, dt2: TDateTime;
  duration: Integer;
  n: Integer;
  is_prime: Boolean;
begin
  Writeln('Hello, print_primes!');

  n:=start_from;
  while (True) do
  begin
    dt1:=Now();
    is_prime:=is_prime_number(n);
    dt2:=Now();

    if (is_prime) then
    begin
      duration:=MilliSecondsBetween(dt1, dt2);
      Writeln(IntToStr(n) + ', duration: ' + IntToStr(duration) + ' msec');
    end;

    n:=n + 1;
  end;
end;


end.
