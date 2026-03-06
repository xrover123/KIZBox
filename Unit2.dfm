object GatheringForm: TGatheringForm
  Left = 309
  Top = 13
  Width = 1305
  Height = 675
  Caption = 'Mark gethering'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1289
    Height = 25
    Align = alTop
    TabOrder = 0
    OnResize = Panel1Resize
    object MRK: TEdit
      Left = 0
      Top = 3
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = MRKKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 62
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
    end
    object Panel3: TPanel
      Left = 1040
      Top = 1
      Width = 248
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        248
        39)
      object ADDButton: TButton
        Left = 0
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Add'
        Default = True
        TabOrder = 0
        OnClick = ADDButtonClick
      end
      object OKButton: TButton
        Left = 80
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'OK'
        TabOrder = 1
        OnClick = OKButtonClick
      end
      object CANCELButton: TButton
        Left = 160
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = CANCELButtonClick
      end
    end
    object CNT: TSpinEdit
      Left = 72
      Top = 8
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = CNTChange
    end
  end
  object LST: TListBox
    Left = 0
    Top = 25
    Width = 1289
    Height = 570
    Align = alClient
    ItemHeight = 13
    TabOrder = 2
    OnClick = LSTClick
  end
end
