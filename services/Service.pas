unit Service;

interface

type
  TServiceObject = class(TInterfacedObject)
  private
  public
    constructor Create(); virtual;
  end;

  TServiceClass = class of TServiceObject;

implementation

{ TServiceObject }

constructor TServiceObject.Create;
begin
  inherited;
end;

end.
