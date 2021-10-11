object Form3: TForm3
  Left = 326
  Top = 90
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1086#1083#1103' '#1082#1088#1086#1089#1089#1074#1086#1088#1076#1072
  ClientHeight = 112
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 112
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074':'
  end
  object Label2: TLabel
    Left = 144
    Top = 8
    Width = 94
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082':'
  end
  object Button1: TButton
    Left = 40
    Top = 80
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object SpinEdit1: TSpinEdit
    Left = 24
    Top = 32
    Width = 81
    Height = 42
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxValue = 500
    MinValue = 10
    ParentFont = False
    TabOrder = 2
    Value = 20
  end
  object SpinEdit2: TSpinEdit
    Left = 152
    Top = 32
    Width = 81
    Height = 42
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxValue = 500
    MinValue = 10
    ParentFont = False
    TabOrder = 3
    Value = 20
  end
end
