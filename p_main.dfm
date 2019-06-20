object frm_ConvertColor: Tfrm_ConvertColor
  Left = 0
  Top = 0
  Caption = 'Delphi'#39068#33394#36716#25442#24037#20855
  ClientHeight = 291
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object pnl_total: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 291
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 617
    ExplicitHeight = 385
    object lbl_title: TLabel
      Left = 76
      Top = 16
      Width = 195
      Height = 28
      Caption = 'Delphi'#39068#33394#36716#25442#24037#20855
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -21
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
    end
    object shp_colorPicker: TShape
      Left = 60
      Top = 232
      Width = 102
      Height = 46
      OnMouseDown = shp_colorPickerMouseDown
    end
    object btn_convert: TBitBtn
      Left = 178
      Top = 232
      Width = 113
      Height = 46
      Caption = 'Convert'
      TabOrder = 4
      OnClick = btn_convertClick
    end
    object edt_HTML: TEdit
      Left = 139
      Top = 69
      Width = 152
      Height = 27
      TabOrder = 0
    end
    object edt_dephiHEX: TEdit
      Left = 139
      Top = 152
      Width = 152
      Height = 27
      TabOrder = 2
    end
    object edt_delphiInt: TEdit
      Left = 139
      Top = 110
      Width = 152
      Height = 27
      TabOrder = 1
    end
    object edt_delphiNorm: TEdit
      Left = 139
      Top = 193
      Width = 152
      Height = 27
      TabOrder = 3
    end
    object rb_Html: TRadioButton
      Left = 75
      Top = 74
      Width = 55
      Height = 17
      Caption = 'Html'
      Checked = True
      TabOrder = 5
      TabStop = True
    end
    object rb_delphiInt: TRadioButton
      Left = 51
      Top = 115
      Width = 79
      Height = 17
      Caption = 'delphiInt'
      TabOrder = 6
    end
    object rb_delphiHex: TRadioButton
      Left = 45
      Top = 157
      Width = 79
      Height = 17
      Caption = 'delphiHex'
      TabOrder = 7
    end
    object rb_delphiNorm: TRadioButton
      Left = 33
      Top = 198
      Width = 95
      Height = 17
      Caption = 'delphiNorm'
      TabOrder = 8
    end
  end
  object dlgColor_picker: TColorDialog
    Left = 24
    Top = 48
  end
end
