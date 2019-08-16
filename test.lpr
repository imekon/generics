program test;

uses props, thing;

var
  aThing: TThing;

begin
  WriteLn('Generic Properties');

  aThing := TThing.Create;
  aThing.Dump;
  aThing.Free;

  WriteLn('Press RETURN...');
  ReadLn;
end.

