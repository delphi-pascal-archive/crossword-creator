object Form9: TForm9
  Left = 394
  Top = 293
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1057#1076#1074#1080#1075' '#1082#1088#1086#1089#1089#1074#1086#1088#1076#1072
  ClientHeight = 121
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 84
    Height = 13
    Caption = #1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080':'
  end
  object Label2: TLabel
    Left = 120
    Top = 8
    Width = 73
    Height = 13
    Caption = #1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080':'
  end
  object SpinEdit1: TSpinEdit
    Left = 16
    Top = 32
    Width = 73
    Height = 42
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxValue = 50
    MinValue = -100
    ParentFont = False
    TabOrder = 0
    Value = 0
  end
  object SpinEdit2: TSpinEdit
    Left = 120
    Top = 32
    Width = 73
    Height = 42
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxValue = 50
    MinValue = -100
    ParentFont = False
    TabOrder = 1
    Value = 0
  end
  object Button1: TButton
    Left = 16
    Top = 88
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 88
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = Button2Click
  end
end
