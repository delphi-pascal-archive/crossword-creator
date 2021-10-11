object Form5: TForm5
  Left = 675
  Top = 134
  Width = 268
  Height = 411
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = #1057#1083#1086#1074#1072' '#1082#1088#1086#1089#1089#1074#1086#1088#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 0
    Top = 15
    Width = 260
    Height = 138
    Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1074#1086#1087#1088#1086#1089#1072' '#1082' '#1089#1083#1086#1074#1091
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
  end
  object ListBox2: TListBox
    Left = 0
    Top = 168
    Width = 260
    Height = 139
    Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1076#1083#1103' '#1074#1074#1086#1076#1072' '#1074#1086#1087#1088#1086#1089#1072' '#1082' '#1089#1083#1086#1074#1091
    Align = alClient
    BevelEdges = []
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ListBox2Click
    OnDblClick = ListBox2DblClick
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 307
    Width = 260
    Height = 70
    Align = alBottom
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074#1074#1086#1076#1072' '#1089#1083#1086#1074#1072
    ItemIndex = 0
    Items.Strings = (
      #1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080
      #1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 153
    Width = 260
    Height = 15
    Align = alTop
    Anchors = [akTop]
    Caption = #1055#1054' '#1042#1045#1056#1058#1048#1050#1040#1051#1048
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 15
    Align = alTop
    Caption = #1055#1054' '#1043#1054#1056#1048#1047#1054#1053#1058#1040#1051#1048
    TabOrder = 4
  end
end
