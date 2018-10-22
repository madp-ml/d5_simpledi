unit MockConfigurationService;

interface

uses
  Service,
  i_ConfigurationService;

type
  TMockConfigurationService = class(TServiceObject, IConfigurationService)
  private
    fParameter: String;
    function  GetParameter(): String;
    procedure SetParameter(const v: String);
  public
    constructor Create(); override;
    destructor Destroy(); override;
  end;

implementation

{ TMockConfigurationService }

constructor TMockConfigurationService.Create;
begin
  inherited;
  fParameter := '123';
end;

destructor TMockConfigurationService.Destroy;
begin
  inherited;
end;

function TMockConfigurationService.GetParameter(): String;
begin
  Result := 'mock_'+fParameter;
end;

procedure TMockConfigurationService.SetParameter(const v: String);
begin
  fParameter := v;
end;

end.
 