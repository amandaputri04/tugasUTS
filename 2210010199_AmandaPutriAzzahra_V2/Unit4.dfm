object DataModule4: TDataModule4
  OldCreateOrder = True
  Height = 750
  Width = 1000
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP'
      'controls_cp=CP_UTF16')
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualandb'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 'D:\Kuliah\Semester 4\Pemrograman Visual 2\libmysql.dll'
    Left = 136
    Top = 232
  end
  object Zkategori: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from kategori'
      '')
    Params = <>
    Left = 216
    Top = 176
  end
  object Zsatuan: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    DataSource = dsbarang
    Left = 288
    Top = 176
  end
  object Zsupplier: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from supplier')
    Params = <>
    Left = 424
    Top = 176
  end
  object Zbarang: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from barang;')
    Params = <>
    Left = 488
    Top = 176
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 248
    Top = 272
  end
  object dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 328
    Top = 272
  end
  object dssupplier: TDataSource
    DataSet = Zsupplier
    Left = 464
    Top = 280
  end
  object dsbarang: TDataSource
    DataSet = Zbarang
    Left = 528
    Top = 280
  end
  object Zuser: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from user')
    Params = <>
    Left = 360
    Top = 176
  end
  object dsuser: TDataSource
    DataSet = Zuser
    Left = 400
    Top = 272
  end
  object Zkostumer: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from kostumer')
    Params = <>
    Left = 568
    Top = 176
  end
  object dbkostumer: TDataSource
    DataSet = Zkostumer
    Left = 640
    Top = 600
  end
end
