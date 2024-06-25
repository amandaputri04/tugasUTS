unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  a: string;

implementation

{$R *.dfm}

uses Unit4;

procedure TForm5.bersih;
begin
edit1.Clear;
edit2.Clear;
end;

procedure TForm5.posisiawal;
begin
 bersih;
 Button1.Enabled:=true;
 Button2.Enabled:=true;
 Button3.Enabled:=true;
 Button4.Enabled:=true;
 Button5.Enabled:=true;
 Edit1.Enabled:=true;
 Edit2.Enabled:=true;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
Edit1.Enabled:=True;
edit2.Enabled:=True;
Button1.Enabled:=false;
Button2.Enabled:=True;
Button3.Enabled:=false;
Button4.Enabled:=false;
Button5.Enabled:=true;
end;

procedure TForm5.Button2Click(Sender: TObject);    //simpan
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Nama satuan tidak boleh kosong!');
    Exit;
  end;
  if Edit2.Text = '' then
  begin
    ShowMessage('Deskripsi satuan tidak boleh kosong!');
    Exit;
  end;
  // Perbaiki penggunaan Locate untuk mencari data
  if DataModule4.Zsatuan.Locate('name', Edit1.Text, []) then
  begin
    ShowMessage('Nama satuan "' + Edit1.Text + '" sudah ada di dalam sistem');
    Exit;
  end;
  if DataModule4.Zsatuan.Locate('deskripsi', Edit2.Text, []) then
  begin
    ShowMessage('Deskripsi satuan "' + Edit2.Text + '" sudah ada di dalam sistem');
    Exit;
  end;
  with DataModule4.Zsatuan do
  begin
    // Simpan data
    SQL.Clear;
    SQL.Add('INSERT INTO satuan (name, deskripsi) VALUES (:name, :deskripsi)');
    ParamByName('name').AsString := Edit1.Text;
    ParamByName('deskripsi').AsString := Edit2.Text;
    ExecSQL;
    // Refresh data setelah insert
    SQL.Clear;
    SQL.Add('SELECT * FROM satuan');
    Open;
  end;
  ShowMessage('Data berhasil disimpan');
  posisiawal;
end;

procedure TForm5.Button3Click(Sender: TObject);       //ubah
begin
 // Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') then

  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;

  if DataModule4.Zsatuan.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk diupdate.');
    Exit;
  end;

  with DataModule4.Zsatuan do
  begin
    Edit; // Mengedit record saat ini

    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('name').AsString := Edit1.Text;
    FieldByName('deskripsi').AsString := Edit2.Text;


    // Menyimpan perubahan ke database
    Post;

    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;

  end;

  ShowMessage('Data berhasil diupdate');
end;

procedure TForm5.Button4Click(Sender: TObject);   //hapus
begin
 // Memastikan ada record yang dipilih untuk dihapus
  if DataModule4.Zsatuan.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
    Exit;
  end;

  // Konfirmasi penghapusan
  if MessageDlg('Apakah Anda yakin menghapus data ini?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule4.Zsatuan do
    begin
      // Menghapus record saat ini
      Delete;

      // Membersihkan kontrol-kontrol input setelah penghapusan
      Edit1.Clear;
      Edit2.Clear;
    end;

    ShowMessage('Data berhasil dihapus');
  end;

  posisiawal;

end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text:=datamodule4.Zsatuan.Fields[1].AsString;
edit2.Text:=datamodule4.Zsatuan.Fields[1].AsString;
a:= datamodule4.Zkategori.Fields[0].AsString;
Edit1.Enabled:=true;
edit2.Enabled:=true;
Button1.Enabled:=True;
Button2.Enabled:=true;
Button3.Enabled:=true;
Button4.Enabled:=true;
Button5.Enabled:=false;
end;

procedure TForm5.Edit3Change(Sender: TObject);
begin
with DataModule4.Zsatuan do
  begin
    sql.Clear;
    sql.Add('select * from satuan where name like "%'+edit3.text+'%"');
    open;
  end;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
 posisiawal;
end;

end.
