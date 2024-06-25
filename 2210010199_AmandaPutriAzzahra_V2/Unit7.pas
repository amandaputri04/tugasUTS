unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Edit6: TEdit;
    Label6: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  a: String;

implementation

{$R *.dfm}
uses unit4;

procedure TForm7.Button2Click(Sender: TObject);
begin
// Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') or
     (Edit3.Text = '') or
     (Edit4.Text = '') or
     (Edit5.Text = '') then
  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;

  // Menyimpan data menggunakan dataset Zkostumer
  with DataModule4.Zkostumer do
  begin
    Append; // Menambahkan record baru

    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('nik').AsString := Edit1.Text;
    FieldByName('name').AsString := Edit2.Text;
    FieldByName('alamat').AsString := Edit3.Text;
    FieldByName('telp').AsString := Edit4.Text;
    FieldByName('email').AsString := Edit5.Text;

    // Menyimpan perubahan ke database
    Post;

    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
  end;

  ShowMessage('Data berhasil disimpan');
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
// Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') or
     (Edit3.Text = '') or
     (Edit4.Text = '') or
     (Edit5.Text = '') then
  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;

  if DataModule4.Zkostumer.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk diupdate.');
    Exit;
  end;

  with DataModule4.Zkostumer do
  begin
    Edit; // Mengedit record saat ini

    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('nik').AsString := Edit1.Text;
    FieldByName('name').AsString := Edit2.Text;
    FieldByName('alamat').AsString := Edit3.Text;
    FieldByName('telp').AsString := Edit4.Text;
    FieldByName('email').AsString := Edit5.Text;

    // Menyimpan perubahan ke database
    Post;

    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
  end;

  ShowMessage('Data berhasil diupdate');
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
// Memastikan ada record yang dipilih untuk dihapus
  if DataModule4.Zkostumer.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
    Exit;
  end;

  // Konfirmasi penghapusan
  if MessageDlg('Apakah Anda yakin menghapus data ini?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule4.Zkostumer do
    begin
      // Menghapus record saat ini
      Delete;

      // Membersihkan kontrol-kontrol input setelah penghapusan
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Edit5.Clear;
    end;

    ShowMessage('Data berhasil dihapus');
  end
  else
  begin
    ShowMessage('Data batal dihapus');
  end;

end;

procedure TForm7.Button5Click(Sender: TObject);
begin
close;
end;

procedure TForm7.Edit6Change(Sender: TObject);
begin
with DataModule4.Zkostumer do
  begin
    sql.Clear;
    sql.Add('select * from kostumer where name like "%'+edit6.text+'%"');
    open;
  end;
end;

end.
