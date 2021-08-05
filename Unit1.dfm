object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CRC32 '#26657#39564#65306
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    635
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 21
    Top = 12
    Width = 90
    Height = 15
    Caption = #23383#31526#20018#26657#39564#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 36
    Top = 41
    Width = 75
    Height = 15
    Caption = #25991#20214#26657#39564#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object mmoLog: TMemo
    Left = 8
    Top = 72
    Width = 619
    Height = 219
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edt1: TEdit
    Left = 108
    Top = 12
    Width = 445
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '1234567890'
  end
  object srchbxFile: TSearchBox
    Left = 108
    Top = 39
    Width = 445
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'C:\Windows\notepad.exe'
    OnInvokeSearch = srchbxFileInvokeSearch
  end
  object btnBuffer: TButton
    Left = 564
    Top = 10
    Width = 63
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'calc'
    TabOrder = 3
    OnClick = btnBufferClick
  end
  object btnFile: TButton
    Left = 564
    Top = 38
    Width = 63
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'calc'
    TabOrder = 4
    OnClick = btnFileClick
  end
  object dlgOpen1: TOpenDialog
    Filter = '*.*|*.*'
    Left = 156
    Top = 132
  end
end
