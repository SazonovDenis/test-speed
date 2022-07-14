program main_primes;
{$APPTYPE CONSOLE}

uses
  primes,
  DateUtils,
  SysUtils; 


var
  attempts, count: Integer;
  attempt: Integer;
  dt1, dt2: TDateTime;
  duration: Double;
begin
  attempts := StrToInt(ParamStr(1));
  count := StrToInt(ParamStr(2));

  dt1:=Now();
  for attempt:=1 to attempts do
  begin
    print_primes(100000000, count);
  end;
  dt2:=Now();

  duration:=MilliSecondsBetween(dt1, dt2)/1000;
  Writeln('---');
  Writeln('Attempts: '+IntToStr(attempts)+', duration: '+FloatToStr(duration)+' sec');
end.
