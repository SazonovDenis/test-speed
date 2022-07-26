program main_horse;
{$APPTYPE CONSOLE}

{$IFDEF release} 
{$R-,Q-,S-,O+} 
{$ELSE} 
{$R+,Q+,S+,O-} 
{$ENDIF}

uses
  horse,
  DateUtils,
  SysUtils;


var
  attempts, size_x, size_y: Integer;
  attempt: Integer;
  dt1, dt2: TDateTime;
  duration: Double;
begin
  attempts := StrToInt(ParamStr(1));
  size_x := StrToInt(ParamStr(2));
  size_y := StrToInt(ParamStr(3));

  dt1:=Now();
  for attempt:=1 to attempts do
  begin
    calc_horse(size_x, size_y, 0, 0);
    Writeln('');
  end;
  dt2:=Now();

  duration:=MilliSecondsBetween(dt1, dt2)/1000;
  Writeln('---');
  Writeln('Attempts: '+IntToStr(attempts)+', duration: '+FloatToStr(duration)+' sec');
end.

