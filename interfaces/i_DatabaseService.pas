unit i_DatabaseService;

interface

type
  IDatabaseService = interface
  ['{5FCB14A0-0E4A-4B9C-9905-BE727401A2E4}']
    function GetDbName(): String;

    property DbName: string read GetDbName;
  end;

implementation

end.
