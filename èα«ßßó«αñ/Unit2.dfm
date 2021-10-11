object Form2: TForm2
  Left = 240
  Top = 205
  Width = 513
  Height = 403
  HorzScrollBar.Increment = 10
  VertScrollBar.Increment = 10
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = #1055#1086#1083#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 503
    Height = 375
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
    OnClick = PaintBox1Click
    OnContextPopup = PaintBox1ContextPopup
    OnMouseMove = PaintBox1MouseMove
    OnPaint = PaintBox1Paint
  end
end
