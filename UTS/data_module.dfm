object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 605
  Top = 177
  Height = 150
  Width = 215
  object Zconnection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Properties.Strings = (
      'SELECT * FROM satuan'
      'controls_cp=GET_ACP')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 
      'D:\Windows 10\Tugas Kuliah Semester 4\VISUAL 2\UTS\UTS\libmysql.' +
      'dll'
    Left = 24
    Top = 32
  end
  object Zsatuan: TZQuery
    Connection = Zconnection
    SQL.Strings = (
      'SELECT * FROM satuan')
    Params = <>
    Left = 88
    Top = 32
  end
  object dsSatuan: TDataSource
    DataSet = Zsatuan
    Left = 144
    Top = 32
  end
end
