unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm8 = class(TForm)
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
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
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
  Form8: TForm8;
  a: String;

implementation

{$R *.dfm}
USES unit4;

procedure TForm8.Button2Click(Sender: TObject);      //insert
begin
// Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') or
     (Edit3.Text = '') or
     (Edit4.Text = '') or
     (Edit5.Text = '') or
     (Edit6.Text = '') or
     (Edit7.Text = '') or
     (Edit8.Text = '') or
     (Edit9.Text = '') then
  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;

  // Menyimpan data menggunakan dataset Zsupplier
  with DataModule4.Zsupplier do
  begin
    Append; // Menambahkan record baru

    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('nik').AsString := Edit1.Text;
    FieldByName('name').AsString := Edit2.Text;
    FieldByName('telp').AsString := Edit3.Text;
    FieldByName('email').AsString := Edit4.Text;
    FieldByName('alamat').AsString := Edit5.Text;
    FieldByName('perusahaan').AsString := Edit6.Text;
    FieldByName('nama_bank').AsString := Edit7.Text;
    FieldByName('akun_bank').AsString := Edit8.Text;
    FieldByName('no_akun_bank').AsString := Edit9.Text;

    // Menyimpan perubahan ke database
    Post;

    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    Edit8.Clear;
    Edit9.Clear;
  end;

  ShowMessage('Data berhasil disimpan');
end;

procedure TForm8.Button3Click(Sender: TObject);       //update
begin
// Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') or
     (Edit3.Text = '') or
     (Edit4.Text = '') or
     (Edit5.Text = '') or
     (Edit6.Text = '') or
     (Edit7.Text = '') or
     (Edit8.Text = '') or
     (Edit9.Text = '') then
  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;

  if DataModule4.Zsupplier.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk diupdate.');
    Exit;
  end;

  with DataModule4.Zsupplier do
  begin
    Edit; // Mengedit record saat ini

    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('nik').AsString := Edit1.Text;
    FieldByName('name').AsString := Edit2.Text;
    FieldByName('telp').AsString := Edit3.Text;
    FieldByName('email').AsString := Edit4.Text;
    FieldByName('alamat').AsString := Edit5.Text;
    FieldByName('perusahaan').AsString := Edit6.Text;
    FieldByName('nama_bank').AsString := Edit7.Text;
    FieldByName('akun_bank').AsString := Edit8.Text;
    FieldByName('no_akun_bank').AsString := Edit9.Text;

    // Menyimpan perubahan ke database
    Post;

    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    Edit8.Clear;
    Edit9.Clear;
  end;

  ShowMessage('Data berhasil diupdate');
end;

procedure TForm8.Button4Click(Sender: TObject);      //delete
begin
 // Memastikan ada record yang dipilih untuk dihapus
  if DataModule4.Zsupplier.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
    Exit;
  end;

  // Konfirmasi penghapusan
  if MessageDlg('Apakah Anda yakin menghapus data ini?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule4.Zsupplier do
    begin
      // Menghapus record saat ini
      Delete;

      // Membersihkan kontrol-kontrol input setelah penghapusan
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      Edit5.Clear;
      Edit6.Clear;
      Edit7.Clear;
      Edit8.Clear;
      Edit9.Clear;
    end;

    ShowMessage('Data berhasil dihapus');
  end
  else
  begin
    ShowMessage('Data batal dihapus');
  end;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
close;
end;

procedure TForm8.Edit10Change(Sender: TObject);
begin
with DataModule4.Zsupplier do
  begin
    sql.Clear;
    sql.Add('select * from supplier where name like "%'+edit10.text+'%"');
    open;
  end;
end;

end.
