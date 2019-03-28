unit DatabaseService;

interface

uses
  Service, i_DatabaseService;

type
  TDatabaseService = class(TServiceObject, IDatabaseService)
  private
    function GetDbName(): String;
  end;

implementation

{ TDatabaseService }

function TDatabaseService.GetDbName: String;
begin
  Result := '1.2..3...';
end;

end.
