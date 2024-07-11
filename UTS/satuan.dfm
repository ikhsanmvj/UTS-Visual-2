object Form1: TForm1
  Left = 313
  Top = 200
  Width = 535
  Height = 475
  Caption = 'Satuan'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 56
    Top = 48
    Width = 34
    Height = 16
    Caption = 'NAMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 56
    Top = 96
    Width = 61
    Height = 16
    Caption = 'DESKRIPSI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 56
    Top = 360
    Width = 95
    Height = 16
    Caption = 'MASUKAN NAMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edt1: TEdit
    Left = 136
    Top = 48
    Width = 329
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 136
    Top = 88
    Width = 329
    Height = 21
    TabOrder = 1
  end
  object btnSimpan: TButton
    Left = 136
    Top = 152
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 2
    OnClick = btnSimpanClick
  end
  object btnEdit: TButton
    Left = 224
    Top = 152
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object btnHapus: TButton
    Left = 312
    Top = 152
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 4
    OnClick = btnHapusClick
  end
  object btnBatal: TButton
    Left = 400
    Top = 152
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 5
    OnClick = btnBatalClick
  end
  object dbgrd1: TDBGrid
    Left = 56
    Top = 208
    Width = 425
    Height = 120
    DataSource = DataModule1.dsSatuan
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt3: TEdit
    Left = 160
    Top = 360
    Width = 321
    Height = 21
    TabOrder = 7
    OnChange = edt3Change
  end
end
