object Form7: TForm7
  Left = 238
  Top = 215
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1042#1074#1086#1076' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 319
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 144
    Width = 353
    Height = 24
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1089#1090#1080' '#1074#1074#1086#1076#1072' '#1087#1072#1088#1086#1083#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 200
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 425
    Height = 81
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '  '#1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' ('#1084#1072#1082#1089#1080#1084#1091#1084' 15 '#1089#1080#1084#1074#1086#1083#1086#1074'), '
      #1082#1086#1090#1086#1088#1099#1081' '#1087#1086#1079#1074#1086#1083#1080#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1082#1088#1086#1089#1089#1074#1086#1088#1076' '
      #1090#1086#1083#1100#1082#1086' '#1090#1086#1084#1091', '#1082#1090#1086' '#1077#1075#1086' '#1079#1085#1072#1077#1090'.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 144
    Top = 104
    Width = 121
    Height = 32
    Hint = #1055#1072#1088#1086#1083#1100' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1074#1074#1077#1076#1077#1085' '#1090#1086#1083#1100#1082#1086' '#1088#1091#1089#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 144
    Top = 184
    Width = 121
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 2
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 24
    Top = 264
    Width = 177
    Height = 41
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 264
    Width = 177
    Height = 41
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 232
    Width = 329
    Height = 17
    Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1082#1088#1086#1089#1089#1074#1086#1088#1076' '#1073#1077#1079' '#1087#1072#1088#1086#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = CheckBox1Click
  end
end
