unit f_Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfMain = class(TForm)
    btnTConfigurationServiceGetParameter: TButton;
    btnTMockConfigurationServiceGetParameter: TButton;
    btnTConfigurationServiceSetParameter: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnTMockConfigurationServiceSetParameter: TButton;
    Edit2: TEdit;
    btnTestForm: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnTConfigurationServiceGetParameterClick(Sender: TObject);
    procedure btnTMockConfigurationServiceGetParameterClick(Sender: TObject);
    procedure btnTConfigurationServiceSetParameterClick(Sender: TObject);
    procedure btnTMockConfigurationServiceSetParameterClick(Sender: TObject);
    procedure btnTestFormClick(Sender: TObject);
  private
  public
  end;

var
  fMain: TfMain;

implementation

uses
  f_TestForm,

  ServiceManager,
  i_ConfigurationService, i_DatabaseService,

  DatabaseService,
  ConfigurationService, MockConfigurationService;


{$R *.DFM}

procedure TfMain.FormCreate(Sender: TObject);
begin
  TServiceManager.RegisterType( IDatabaseService, TDatabaseService );

  TServiceManager.RegisterType( IConfigurationService, TConfigurationService );
  TServiceManager.RegisterType( IConfigurationService, TMockConfigurationService, 'mock' );
end;

procedure TfMain.btnTConfigurationServiceGetParameterClick(Sender: TObject);
begin
  with ( ( TServiceManager.ResolveType( IConfigurationService ) ) as IConfigurationService ) do
  begin
    Label1.Caption := Parameter;
  end;
end;

procedure TfMain.btnTConfigurationServiceSetParameterClick(Sender: TObject);
begin
  with ( ( TServiceManager.ResolveType( IConfigurationService ) ) as IConfigurationService ) do
  begin
    Parameter := Edit1.Text;
  end;
end;

procedure TfMain.btnTMockConfigurationServiceGetParameterClick(Sender: TObject);
begin
  with ( ( TServiceManager.ResolveType( IConfigurationService, 'mock' ) ) as IConfigurationService ) do
  begin
    Label2.Caption := Parameter;
  end;
end;

procedure TfMain.btnTMockConfigurationServiceSetParameterClick(Sender: TObject);
begin
  with ( ( TServiceManager.ResolveType( IConfigurationService, 'mock' ) ) as IConfigurationService ) do
  begin
    Parameter := Edit2.Text;
  end;
end;

procedure TfMain.btnTestFormClick(Sender: TObject);
begin
  with TfTestForm.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

end.
