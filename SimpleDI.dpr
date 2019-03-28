program SimpleDI;

uses
  Forms,
  f_Main in 'forms\f_Main.pas' {fMain},
  f_TestForm in 'forms\f_TestForm.pas' {fTestForm},
  i_ConfigurationService in 'interfaces\i_ConfigurationService.pas',
  ConfigurationService in 'services\ConfigurationService.pas',
  Service in 'services\Service.pas',
  ServiceManager in 'services\ServiceManager.pas',
  MockConfigurationService in 'services\MockConfigurationService.pas',
  i_DatabaseService in 'interfaces\i_DatabaseService.pas',
  DatabaseService in 'services\DatabaseService.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
