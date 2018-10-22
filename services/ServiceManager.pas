unit ServiceManager;

interface

uses
  Service,
  Classes;

type
  TServiceItem = class(TCollectionItem)
  private
    i: TGUID;
    ic: TServiceClass;
    o: IUnknown;
    n: String;
  public
    constructor Create(Collection: TCollection); override;
  end;

  TServiceManager = class(TCollection)
  private
    function  GetItem(const index: integer): TServiceItem;
    procedure SetItem(const index: integer; const v: TServiceItem);

    function Add(): TServiceItem; overload;
    function FindServiceItem(i: TGUID; n: String): IUnknown;

    property Items[const index: Integer]: TServiceItem read GetItem write SetItem; default;
  public

    destructor Destroy(); override;

    class procedure RegisterType(i: TGUID; c: TServiceClass; n: String = 'default'); overload;
    class function  ResolveType(i: TGUID; n: String = 'default'): IUnknown;

  end;

function IsEqualGUID(const guid1, guid2: TGUID): Boolean; stdcall;

implementation

var
  _context: TServiceManager;

function IsEqualGUID; external 'ole32.dll' name 'IsEqualGUID';

{ TServiceItem }

constructor TServiceItem.Create(Collection: TCollection);
begin
  inherited;
  o := nil;
  ic := nil;
end;

{ TServiceManager }

class procedure TServiceManager.RegisterType(i: TGUID; c: TServiceClass; n: String);
var
  serviceItem: TServiceItem;
begin
  serviceItem := _context.Add();
  serviceItem.i := i;
  serviceItem.ic := c;
  serviceItem.n := n;
end;

class function  TServiceManager.ResolveType(i: TGUID; n: String): IUnknown;
begin
  Result := _context.FindServiceItem( i, n );
end;

function TServiceManager.Add: TServiceItem;
begin
  Result := TServiceItem( inherited Add );
end;

function TServiceManager.FindServiceItem(i: TGUID; n: String): IUnknown;
var
  idx: Byte;
begin
  Result := nil;
  idx := 0;

  while (idx < Count) and (Result = nil) do
  begin
    if ( IsEqualGUID(Items[idx].i, i) ) and ( Items[Idx].n = n ) then
    begin
      if ( Items[idx].o = nil ) then
        Items[idx].o := Items[idx].ic.Create();
      Result := Items[idx].o;
    end;
    Inc(idx);
  end;

end;

function TServiceManager.GetItem(const index: integer): TServiceItem;
begin
  Result := TServiceItem( inherited GetItem(index) );
end;

procedure TServiceManager.SetItem(const index: integer; const v: TServiceItem);
begin
  inherited SetItem(index, v);
end;

destructor TServiceManager.Destroy;
var
  idx: Byte;
begin
  if (Count > 0) then
  begin
    for idx := 0 to Count-1 do
      if (Items[idx].o <> nil) then
        Items[idx].o := nil;
  end;
  inherited;
end;

initialization
  _context := TServiceManager.Create( TServiceItem );

finalization

  _context.Free;
  _context := nil;

end.




