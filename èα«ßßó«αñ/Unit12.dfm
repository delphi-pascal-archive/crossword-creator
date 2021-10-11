object Form12: TForm12
  Left = 533
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1080#1089#1091#1085#1082#1072
  ClientHeight = 375
  ClientWidth = 155
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText3: TStaticText
    Left = 8
    Top = 8
    Width = 78
    Height = 17
    Caption = #1056#1072#1079#1084#1077#1088' '#1103#1095#1077#1077#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object SpinEdit1: TSpinEdit
    Left = 24
    Top = 32
    Width = 81
    Height = 34
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 40
    MinValue = 15
    ParentFont = False
    TabOrder = 1
    Value = 20
  end
  object Panel3: TPanel
    Left = 8
    Top = 105
    Width = 121
    Height = 32
    Align = alCustom
    Color = clWhite
    TabOrder = 2
    OnClick = Panel3Click
  end
  object Panel5: TPanel
    Left = 7
    Top = 169
    Width = 121
    Height = 32
    Align = alCustom
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Panel5Click
  end
  object Panel4: TPanel
    Left = 8
    Top = 233
    Width = 121
    Height = 32
    Align = alCustom
    Color = clWhite
    TabOrder = 4
    OnClick = Panel4Click
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 80
    Width = 61
    Height = 17
    Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 144
    Width = 65
    Height = 17
    Caption = #1062#1074#1077#1090' '#1083#1080#1085#1080#1081':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object StaticText4: TStaticText
    Left = 8
    Top = 216
    Width = 145
    Height = 17
    Caption = #1062#1074#1077#1090' '#1079#1072#1083#1080#1074#1082#1080' '#1082#1074#1072#1076#1088#1072#1090#1080#1082#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object StaticText5: TStaticText
    Left = 8
    Top = 280
    Width = 83
    Height = 17
    Caption = #1058#1086#1083#1097#1080#1085#1072' '#1083#1080#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object SpinEdit2: TSpinEdit
    Left = 24
    Top = 296
    Width = 81
    Height = 34
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 5
    MinValue = 1
    ParentFont = False
    TabOrder = 9
    Value = 2
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 344
    Width = 75
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object ColorDialog1: TColorDialog
    Left = 72
    Top = 248
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 248
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1080#1089#1091#1085#1086#1082' '#1082#1088#1086#1089#1089#1074#1086#1088#1076#1072
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1086#1087#1088#1086#1089#1099' '#1082' '#1082#1088#1086#1089#1089#1074#1086#1088#1076#1091
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1074#1099#1093#1086#1076
        OnClick = N4Click
      end
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 32
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.txt'
    Filter = '*.txt|*.txt'
    Left = 96
    Top = 8
  end
end
