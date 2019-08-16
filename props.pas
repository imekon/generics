unit props;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FGL;

type
  TProperty = class
  private
    _name: string;
    function GetName: string;
  public
    constructor Create(const aName: string); virtual;
    destructor Destroy; override;
    property Name: string read GetName;
  end;

  generic TValueProperty<T> = class(TProperty)
  protected
    _value: T;
    function GetValue: T; virtual;
    procedure SetValue(value: T); virtual;
  public
    property Value: T read GetValue write SetValue;
  end;

  TProperties = specialize TFPGMap<string, TProperty>;

  TFloatProperty = specialize TValueProperty<single>;
  TStringProperty = specialize TValueProperty<string>;

implementation

constructor TProperty.Create(const aName: string);
begin
  _name := aName;
end;

destructor TProperty.Destroy;
begin
  inherited;
end;

function TProperty.GetName: string;
begin
  result := _name;
end;

function TValueProperty.GetValue: T;
begin
  result := _value;
end;

procedure TValueProperty.SetValue(value: T);
begin
  _value := value;
end;

end.

