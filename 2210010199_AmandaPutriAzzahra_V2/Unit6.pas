unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    Edit5: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure bersih;
    procedure FormShow(Sender: TObject);
    procedure posisiawal;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  a: String;

implementation

{$R *.dfm}
uses unit4;

procedure TForm6.bersih;
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
ComboBox1.Clear;
edit6.Clear;
edit7.Clear;
edit8.Clear;

end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  Button1.Enabled:=false;
  Button2.Enabled:=true;
  Button3.Enabled:=true;
  Button4.Enabled:=true;
  Button5.Enabled:=true;
  Edit1.enabled:=true;
  Edit2.enabled:=true;
  Edit3.enabled:=true;
  Edit4.enabled:=true;
  ComboBox1.enabled:=true;
  Edit6.enabled:=true;
  Edit7.enabled:=true;
  Edit8.enabled:=true;
end;

procedure TForm6.Button2Click(Sender: TObject);    //simpan
begin
begin
  // Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') or
     (Edit3.Text = '') or
     (Edit4.Text = '') or
     (ComboBox1.Text = '') or
     (Edit6.Text = '') or
     (Edit7.Text = '') or
     (Edit8.Text = '') then
  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;
  // Menyimpan data menggunakan dataset Zuser
  with DataModule4.Zuser do
  begin
    Append; // Menambahkan record baru
    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('nik').AsString := Edit1.Text;
    FieldByName('username').AsString := Edit2.Text;
    FieldByName('full_name').AsString := Edit3.Text;
    FieldByName('password').AsString := Edit4.Text;
    FieldByName('tipe').AsString := ComboBox1.Text;
    FieldByName('email').AsString := Edit6.Text;
    FieldByName('alamat').AsString := Edit7.Text;
    FieldByName('telp').AsString := Edit8.Text;
    // Menyimpan perubahan ke database
    Post;
    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    ComboBox1.Clear;
    Edit6.Clear;
    Edit7.Clear;
    Edit8.Clear;
  end;
  ShowMessage('Data berhasil disimpan');
  posisiawal;
end;
end;

procedure TForm6.Button3Click(Sender: TObject);   //ubah
begin
// Memastikan semua input sudah diisi dengan benar
  if (Edit1.Text = '') or
     (Edit2.Text = '') or
     (Edit3.Text = '') or
     (Edit4.Text = '') or
     (ComboBox1.Text = '') or
     (Edit6.Text = '') or
     (Edit7.Text = '') or
     (Edit8.Text = '') then
  begin
    ShowMessage('Semua kolom harus diisi!');
    Exit;
  end;

  if DataModule4.Zuser.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk diupdate.');
    Exit;
  end;

  with DataModule4.Zuser do
  begin
    Edit; // Mengedit record saat ini

    // Mengisi nilai pada kolom-kolom yang sesuai
    FieldByName('nik').AsString := Edit1.Text;
    FieldByName('username').AsString := Edit2.Text;
    FieldByName('full_name').AsString := Edit3.Text;
    FieldByName('password').AsString := Edit4.Text;
    FieldByName('tipe').AsString := ComboBox1.Text;
    FieldByName('email').AsString := Edit6.Text;
    FieldByName('alamat').AsString := Edit7.Text;
    FieldByName('telp').AsString := Edit8.Text;

    // Menyimpan perubahan ke database
    Post;

    // Membersihkan isi dari kontrol-kontrol input
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Edit4.Clear;
    ComboBox1.Clear;
    Edit6.Clear;
    Edit7.Clear;
    Edit8.Clear;
  end;
  ShowMessage('Data berhasil diupdate');
  posisiawal;
end;

procedure TForm6.Button4Click(Sender: TObject);      //hapus
begin
// Memastikan ada record yang dipilih untuk dihapus
  if DataModule4.Zuser.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk dihapus.');
    Exit;
  end;
  // Konfirmasi penghapusan
  if MessageDlg('Apakah Anda yakin menghapus data ini?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule4.Zuser do
    begin
      // Menghapus record saat ini
      Delete;
      // Membersihkan kontrol-kontrol input setelah penghapusan
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
      Edit4.Clear;
      ComboBox1.Clear;
      Edit6.Clear;
      Edit7.Clear;
      Edit8.Clear;
    end;
    ShowMessage('Data berhasil dihapus');
  end;
  posisiawal;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
close;
end;

procedure TForm6.Edit5Change(Sender: TObject);
begin
  with DataModule4.Zuser do
  begin
    sql.Clear;
    sql.Add('select * from user where username like "%'+edit5.text+'%"');
    open;
  end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.posisiawal;
begin
  Button1.Enabled:=true;
  Button2.Enabled:=false;
  Button3.Enabled:=false;
  Button4.Enabled:=false;
  Button5.Enabled:=false;
  Edit1.enabled:=false;
  Edit2.enabled:=false;
  Edit3.enabled:=false;
  Edit4.enabled:=false;
  ComboBox1.enabled:=false;
  Edit6.enabled:=false;
  Edit7.enabled:=false;
  Edit8.enabled:=false;

end;

end.
