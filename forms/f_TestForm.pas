unit f_TestForm;

interface

uses
  i_ConfigurationService,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfTestForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fConfigurationService: IConfigurationService;
    fMockConfigurationService: IConfigurationService;
  public
  end;

implementation

uses
  ServiceManager;

{$R *.DFM}

procedure TfTestForm.Button1Click(Sender: TObject);
begin
  Label1.Caption := fConfigurationService.Parameter;

  Label2.Caption := fMockConfigurationService.Parameter;
end;

procedure TfTestForm.FormCreate(Sender: TObject);
begin
  fConfigurationService := (TServiceManager.ResolveType( IConfigurationService )) as IConfigurationService;

  fMockConfigurationService := ( TServiceManager.ResolveType( IConfigurationService, 'mock' ) ) as IConfigurationService;
end;

procedure TfTestForm.FormDestroy(Sender: TObject);
begin
  fConfigurationService := nil;

  fMockConfigurationService := nil;
end;

end.
