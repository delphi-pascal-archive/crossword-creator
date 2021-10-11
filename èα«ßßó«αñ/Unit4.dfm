object Form4: TForm4
  Left = 505
  Top = 139
  VertScrollBar.Increment = 10
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 228
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 71
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1103#1095#1077#1077#1082
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 81
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1096#1088#1080#1092#1090#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 96
    Width = 34
    Height = 13
    Caption = #1064#1088#1080#1092#1090
  end
  object Button1: TButton
    Left = 8
    Top = 200
    Width = 81
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 200
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object SpinEdit1: TSpinEdit
    Left = 104
    Top = 8
    Width = 49
    Height = 22
    EditorEnabled = False
    MaxValue = 40
    MinValue = 15
    TabOrder = 2
    Value = 20
    OnChange = SpinEdit1Change
  end
  object SpinEdit2: TSpinEdit
    Left = 104
    Top = 48
    Width = 49
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxValue = 32
    MinValue = 8
    ParentFont = False
    TabOrder = 3
    Value = 12
    OnChange = SpinEdit2Change
  end
  object Button4: TButton
    Left = 184
    Top = 200
    Width = 81
    Height = 25
    Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 4
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 48
    Top = 88
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = ComboBox1Change
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 152
    Width = 169
    Height = 17
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1089#1083#1086#1074
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 120
    Width = 121
    Height = 25
    Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072
    TabOrder = 7
    OnClick = Panel1Click
  end
  object Button3: TBitBtn
    Left = 208
    Top = 40
    Width = 20
    Height = 20
    Caption = #1064
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Layout = blGlyphBottom
  end
  object StaticText1: TStaticText
    Left = 208
    Top = 28
    Width = 10
    Height = 12
    AutoSize = False
    BevelInner = bvNone
    Caption = '5'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 120
    Width = 121
    Height = 25
    Caption = #1062#1074#1077#1090' '#1096#1088#1080#1092#1090#1072
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 176
    Width = 169
    Height = 17
    Caption = #1040#1074#1090#1086#1088#1072#1079#1084#1077#1088' '#1087#1086#1083#1103
    TabOrder = 11
    OnClick = CheckBox1Click
  end
  object ColorDialog1: TColorDialog
    CustomColors.Strings = (
      'ColorA=000000'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 32
    Top = 8
  end
end
