unit Service;

interface

type
  TServiceObject = class(TInterfacedObject)
  private
  protected
    procedure DI(); virtual;
  public
    constructor Create(); virtual;
  end;

  TServiceClass = class of TServiceObject;

implementation

{ TServiceObject }

constructor TServiceObject.Create;
begin
  inherited;
  DI();
end;

procedure TServiceObject.DI;
begin
 { empty }
end;

end.
