unit ConfigurationService;

interface

uses
  Service, i_ConfigurationService, i_DatabaseService;

type
  TConfigurationService = class(TServiceObject, IConfigurationService)
  private
    fParameter: String;
    // -- DI
    fDatabaseService: IDatabaseService;
    // -- DI
    function  GetParameter(): String;
    procedure SetParameter(const v: String);
  protected
    // -- DI
    procedure DI(); override;
    // -- DI
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

procedure TConfigurationService.DI;
begin
  fDatabaseService := TServiceManager.ResolveType( IDatabaseService ) as IDatabaseService;
end;

function TConfigurationService.GetParameter(): String;
begin
  Result := fDatabaseService.DbName+' '+fParameter;
end;

procedure TConfigurationService.SetParameter(const v: String);
begin
  fParameter := v;
end;

end.
 