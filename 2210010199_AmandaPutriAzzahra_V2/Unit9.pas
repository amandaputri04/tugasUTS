unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label10: TLabel;
    Edit10: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  a: String;

implementation

{$R *.dfm}
uses unit4;



procedure TForm9.Button2Click(Sender: TObject);       //insert
begin
// Memastikan semua input terisi sebelum menyimpan
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') or (Edit5.Text = '') or
     (ComboBox1.ItemIndex = -1) or (ComboBox2.ItemIndex = -1) or (ComboBox3.ItemIndex = -1) or (ComboBox4.ItemIndex = -1) then
  begin
    ShowMessage('Silakan lengkapi semua data.');
    Exit;
  end;

  // Simpan data ke dalam dataset Zbarang
  DataModule4.Zbarang.Append;  // Memulai mode penambahan data baru

  // Mengisi kolom-kolom pada dataset Zbarang
  DataModule4.Zbarang.FieldByName('barkode').AsString := Edit1.Text;
  DataModule4.Zbarang.FieldByName('name').AsString := Edit2.Text;
  DataModule4.Zbarang.FieldByName('harga_jual').AsFloat := StrToFloat(Edit3.Text);
  DataModule4.Zbarang.FieldByName('harga_beli').AsFloat := StrToFloat(Edit4.Text);
  DataModule4.Zbarang.FieldByName('stok').AsInteger := StrToInt(Edit5.Text);

  // Mengisi kolom-kolom ID yang berasal dari ComboBox
  DataModule4.Zbarang.FieldByName('kategori_id').AsInteger := StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
  DataModule4.Zbarang.FieldByName('satuan_id').AsInteger := StrToInt(ComboBox2.Items[ComboBox2.ItemIndex]);
  DataModule4.Zbarang.FieldByName('supplier_id').AsInteger := StrToInt(ComboBox3.Items[ComboBox3.ItemIndex]);
  DataModule4.Zbarang.FieldByName('user_id').AsInteger := StrToInt(ComboBox4.Items[ComboBox4.ItemIndex]);

  // Menyimpan perubahan ke dalam database
  DataModule4.Zbarang.Post;  // Menyimpan data yang sudah diisi ke dalam dataset
  DataModule4.Zbarang.ApplyUpdates;  // Menyimpan perubahan ke dalam database

  ShowMessage('Data barang berhasil disimpan.');

  // Membersihkan input setelah disimpan
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := -1;
  ComboBox2.ItemIndex := -1;
  ComboBox3.ItemIndex := -1;
  ComboBox4.ItemIndex := -1;
end;

procedure TForm9.Button3Click(Sender: TObject);       //update
begin
  // Memastikan data yang akan diubah sudah terpilih
  if DataModule4.Zbarang.IsEmpty then
  begin
    ShowMessage('Tidak ada data barang untuk diubah.');
    Exit;
  end;

  // Memastikan semua input terisi sebelum mengubah
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') or (Edit5.Text = '') or
     (ComboBox1.ItemIndex = -1) or (ComboBox2.ItemIndex = -1) or (ComboBox3.ItemIndex = -1) or (ComboBox4.ItemIndex = -1) then
  begin
    ShowMessage('Silakan lengkapi semua data.');
    Exit;
  end;

  // Mengubah data yang dipilih dalam dataset Zbarang
  DataModule4.Zbarang.Edit;  // Memulai mode edit data yang sudah ada

  // Mengisi kolom-kolom pada dataset Zbarang
  DataModule4.Zbarang.FieldByName('barkode').AsString := Edit1.Text;
  DataModule4.Zbarang.FieldByName('name').AsString := Edit2.Text;
  DataModule4.Zbarang.FieldByName('harga_jual').AsFloat := StrToFloat(Edit3.Text);
  DataModule4.Zbarang.FieldByName('harga_beli').AsFloat := StrToFloat(Edit4.Text);
  DataModule4.Zbarang.FieldByName('stok').AsInteger := StrToInt(Edit5.Text);

  // Mengisi kolom-kolom ID yang berasal dari ComboBox
  DataModule4.Zbarang.FieldByName('kategori_id').AsInteger := StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
  DataModule4.Zbarang.FieldByName('satuan_id').AsInteger := StrToInt(ComboBox2.Items[ComboBox2.ItemIndex]);
  DataModule4.Zbarang.FieldByName('supplier_id').AsInteger := StrToInt(ComboBox3.Items[ComboBox3.ItemIndex]);
  DataModule4.Zbarang.FieldByName('user_id').AsInteger := StrToInt(ComboBox4.Items[ComboBox4.ItemIndex]);

  // Menyimpan perubahan ke dalam database
  DataModule4.Zbarang.Post;  // Menyimpan data yang sudah diisi ke dalam dataset
  DataModule4.Zbarang.ApplyUpdates;  // Menyimpan perubahan ke dalam database

  ShowMessage('Data barang berhasil diubah.');

  // Membersihkan input setelah diubah
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  ComboBox1.ItemIndex := -1;
  ComboBox2.ItemIndex := -1;
  ComboBox3.ItemIndex := -1;
  ComboBox4.ItemIndex := -1;
end;

procedure TForm9.Button4Click(Sender: TObject);      //delete
begin
  // Memastikan data yang akan dihapus sudah terpilih
  if DataModule4.Zbarang.IsEmpty then
  begin
    ShowMessage('Tidak ada data barang untuk dihapus.');
    Exit;
  end;

  // Konfirmasi pengguna sebelum menghapus data
  if MessageDlg('Apakah Anda yakin ingin menghapus data barang ini?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Menghapus data yang dipilih dalam dataset Zbarang
    DataModule4.Zbarang.Delete;  // Menghapus data yang sedang dipilih dalam dataset

    // Menyimpan perubahan ke dalam database
    DataModule4.Zbarang.ApplyUpdates;  // Menyimpan perubahan ke dalam database

    ShowMessage('Data barang berhasil dihapus.');
  end;
end;

procedure TForm9.Button5Click(Sender: TObject);
begin
close;
end;

procedure TForm9.Edit10Change(Sender: TObject);
begin
with DataModule4.Zbarang do
  begin
    sql.Clear;
    sql.Add('select * from barang where name like "%'+edit10.text+'%"');
    open;
  end;
end;

procedure TForm9.FormCreate(Sender: TObject);     // all comboxbox
begin
// Mengisi ComboBox1 dengan data ID dari Zkategori
  DataModule4.Zkategori.Open;
  ComboBox1.Items.Clear;
  DataModule4.Zkategori.First;
  while not DataModule4.Zkategori.Eof do
  begin
    ComboBox1.Items.Add(DataModule4.Zkategori.FieldByName('id').AsString);
    DataModule4.Zkategori.Next;
  end;
  DataModule4.Zkategori.Close;

  // Mengisi ComboBox2 dengan data ID dari Zsatuan
  DataModule4.Zsatuan.Open;
  ComboBox2.Items.Clear;
  DataModule4.Zsatuan.First;
  while not DataModule4.Zsatuan.Eof do
  begin
    ComboBox2.Items.Add(DataModule4.Zsatuan.FieldByName('id').AsString);
    DataModule4.Zsatuan.Next;
  end;
  DataModule4.Zsatuan.Close;

  // Mengisi ComboBox3 dengan data ID dari Zsupplier
  DataModule4.Zsupplier.Open;
  ComboBox3.Items.Clear;
  DataModule4.Zsupplier.First;
  while not DataModule4.Zsupplier.Eof do
  begin
    ComboBox3.Items.Add(DataModule4.Zsupplier.FieldByName('id').AsString);
    DataModule4.Zsupplier.Next;
  end;
  DataModule4.Zsupplier.Close;

  // Mengisi ComboBox4 dengan data ID dari Zuser
  DataModule4.Zuser.Open;
  ComboBox4.Items.Clear;
  DataModule4.Zuser.First;
  while not DataModule4.Zuser.Eof do
  begin
    ComboBox4.Items.Add(DataModule4.Zuser.FieldByName('id').AsString);
    DataModule4.Zuser.Next;
  end;
  DataModule4.Zuser.Close;

  // Pilih item pertama secara default untuk setiap ComboBox, jika ada
  if ComboBox1.Items.Count > 0 then
    ComboBox1.ItemIndex := 0;
  if ComboBox2.Items.Count > 0 then
    ComboBox2.ItemIndex := 0;
  if ComboBox3.Items.Count > 0 then
    ComboBox3.ItemIndex := 0;
  if ComboBox4.Items.Count > 0 then
    ComboBox4.ItemIndex := 0;

 end;
end.
