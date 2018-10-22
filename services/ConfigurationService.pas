unit ConfigurationService;

interface

uses
  Service, i_ConfigurationService;

type
  TConfigurationService = class(TServiceObject, IConfigurationService)
  private
    fParameter: String;
    function  GetParameter(): String;
    procedure SetParameter(const v: String);
  public
    constructor Create(); override;
    destructor Destroy(); override;
  end;

implementation

uses
  ServiceManager;

{ TConfigurationService }

constructor TConfigurationService.Create;
begin
  inherited;
end;

destructor TConfigurationService.Destroy;
begin
  inherited;
end;

function TConfigurationService.GetParameter(): String;
begin
  Result := fParameter;
end;

procedure TConfigurationService.SetParameter(const v: String);
begin
  fParameter := v;
end;

end.
 