object fMain: TfMain
  Left = 323
  Top = 204
  Width = 768
  Height = 330
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 352
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 352
    Top = 112
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object btnTConfigurationServiceGetParameter: TButton
    Left = 16
    Top = 8
    Width = 329
    Height = 25
    Caption = 'TConfigurationService.Get.Parameter'
    TabOrder = 0
    OnClick = btnTConfigurationServiceGetParameterClick
  end
  object btnTMockConfigurationServiceGetParameter: TButton
    Left = 16
    Top = 104
    Width = 329
    Height = 25
    Caption = 'TMockConfigurationService.Get.Parameter'
    TabOrder = 1
    OnClick = btnTMockConfigurationServiceGetParameterClick
  end
  object btnTConfigurationServiceSetParameter: TButton
    Left = 16
    Top = 40
    Width = 329
    Height = 25
    Caption = 'TConfigurationService.Set.Parameter'
    TabOrder = 2
    OnClick = btnTConfigurationServiceSetParameterClick
  end
  object Edit1: TEdit
    Left = 352
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object btnTMockConfigurationServiceSetParameter: TButton
    Left = 16
    Top = 136
    Width = 329
    Height = 25
    Caption = 'TMockConfigurationService.Set.Parameter'
    TabOrder = 4
    OnClick = btnTMockConfigurationServiceSetParameterClick
  end
  object Edit2: TEdit
    Left = 352
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
  end
  object btnTestForm: TButton
    Left = 16
    Top = 184
    Width = 75
    Height = 25
    Caption = 'TestForm'
    TabOrder = 6
    OnClick = btnTestFormClick
  end
end
