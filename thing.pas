unit thing;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, props;

type
  TThing = class
    _properties: TProperties;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Dump;
  end;

implementation

constructor TThing.Create;
var
  stringProperty: TStringProperty;
  floatProperty: TFloatProperty;

begin
  _properties := TProperties.Create;

  stringProperty := TStringProperty.Create('Name');
  stringProperty.Value := 'thing';
  _properties.Add('Name', stringProperty);

  floatProperty := TFloatProperty.Create('Strength');
  floatProperty.Value := 100.0;
  _properties.Add('Strength', floatProperty);
end;

destructor TThing.Destroy;
begin
  _properties.Free;
end;

procedure TThing.Dump;
var
  i: integer;
  prop: TProperty;

begin
  for i := 0 to _properties.Count - 1 do
  begin
    prop := TProperty(_properties.Items[i]);
    WriteLn(i + 1, ' ''', prop.Name, '''');
  end;
end;

end.

