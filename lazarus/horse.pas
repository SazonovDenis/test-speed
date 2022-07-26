unit horse;
{$IFDEF FPC}
{$mode ObjFPC}
{$ENDIF}

interface

procedure calc_horse(size_x: Integer; size_y: Integer; x0: Integer; y0: Integer);


implementation

uses
  DateUtils,
  StrUtils,
  SysUtils;


type
  TState = record
    path_count_total: Integer;
    path_count_ok: Integer;
  end;

  TBoard = array of array of Integer;



//{$IFNDEF FPC}
function PadLeft(s: String; len: Integer): String;
var
  i: integer;
begin
  Result:=s;
  for i:=Length(s)+1 to len do
  begin
    Result:=' '+Result;
  end;
end;
//{$ENDIF}


procedure print_board(const position: TBoard);
var
  size_x, size_y: Integer;
  x, y: Integer;
  v: Integer;
begin
  size_y:=Length(position);
  size_x:=Length(position[0]);

  y:=0;
  while (y < size_y) do
  begin
    x:=0;
    while (x < size_x) do
    begin
      v:=position[y][x];
      if (v = 0) then
      begin
        Write(PadLeft('*', 3) + ' ');
      end
      else
      begin
        Write(PadLeft(IntToStr(v), 3) + ' ');
      end;
      x:=x + 1;
    end;
    Writeln('');
    y:=y + 1;
  end;{}
end;


procedure step_horce(step_no: Integer; var state: TState; x0: Integer; y0: Integer; var position: TBoard);
var
  size_x, size_y: Integer;
  board_size: Integer;
  steps_done: Integer;
  s: Integer;
  x1, y1: Integer;
const
  step_diffs: array[0..7, 0..1] of Integer = ((1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2));
begin
  // ---------------------
  // Make my step
  position[y0][x0]:=step_no;

  // ---------------------
  // Print board after my step
  // print_board(position);
  // Writeln('');

  // ---------------------
  // Try to do next 8 step
  size_y:=Length(position);
  size_x:=Length(position[0]);
  board_size:=size_x * size_y;

  steps_done:=0;
  for s:=0 to 7 do
  begin
    x1:=x0 + step_diffs[s][0];
    y1:=y0 + step_diffs[s][1];

    if (x1 < 0) or (x1 >= size_x) then
    begin
      continue;
    end;
    if (y1 < 0) or (y1 >= size_y) then
    begin
      continue;
    end;
    if (position[y1][x1] <> 0) then
    begin
      continue;
    end;

    step_horce(step_no + 1, state, x1, y1, position);

    steps_done:=steps_done + 1;
  end;

  // ---------------------
  // Whe nave no more steps?
  if (steps_done = 0) then
  begin
    state.path_count_total:=state.path_count_total + 1;
  end;

  if (steps_done = 0) and (step_no = board_size) then
  begin
    state.path_count_ok:=state.path_count_ok + 1;
    // Writeln('Full path count: '+IntToStr(state.path_count_ok)+'/'+IntToStr(state.path_count_total));
    // print_board(position);
    // Writeln('');
  end;

  // ---------------------
  // Make my step back
  position[y0][x0]:=0;
end;


procedure calc_horse(size_x: Integer; size_y: Integer; x0: Integer; y0: Integer);
var
  dt1, dt2: TDateTime;
  duration_sec: Double;
  grid: TBoard;
  state: TState;
begin
  Writeln('Hello, horse, board '+IntToStr(size_x)+'x'+IntToStr(size_y));

  SetLength(grid, size_y, size_x);

  state.path_count_ok := 0;
  state.path_count_total := 0;

  dt1:=Now();
  step_horce(1, state, x0, y0, grid);
  dt2:=Now();

  Writeln('Board '+IntToStr(size_x)+'x'+IntToStr(size_y)+', full path count: '+IntToStr(state.path_count_ok)+', total path count: '+IntToStr(state.path_count_total));

  duration_sec:=MilliSecondsBetween(dt1, dt2)/1000;
  Writeln('duration: ' + FloatToStr(duration_sec) + ' sec');
end;


end.
