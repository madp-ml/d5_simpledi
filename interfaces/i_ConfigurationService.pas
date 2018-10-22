unit i_ConfigurationService;

interface

type
  IConfigurationService = interface
  ['{EF3B6AE6-D2C0-41D6-8A77-F3E707A4DF73}']
    function  GetParameter(): String;
    procedure SetParameter(const v: String);

    property Parameter: String read GetParameter write SetParameter;
  end;

implementation

end.
 