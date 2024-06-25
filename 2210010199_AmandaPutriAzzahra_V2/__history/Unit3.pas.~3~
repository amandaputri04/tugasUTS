unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Button5: TButton;
    Button6: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a: String;

implementation

{$R *.dfm}

uses Unit4;

procedure TForm3.bersih;
begin
edit1.Clear;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  if Edit1.Text=''then
  begin
    ShowMessage('nama kategori tidak boleh kosoong!');
  end else
  if DataModule4.Zkategori.Locate('name',Edit1.Text,[]) then
  begin
     ShowMessage('nama kategori'+Edit1.Text+'sudah ada didalam sistem') ;
  end else

with datamodule4.Zkategori do
begin  //simpan
  sql.Clear;
  sql.Add('insert into kategori values(null,"'+ edit1.Text+'" )') ;
  ExecSQL;

  sql.Clear;
  sql.Add('select * from kategori');
  open;
end;
ShowMessage('data berhasil di simpan');
posisiawal;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 if Edit1.Text=''then
  begin
    ShowMessage('nama kategori tidak boleh kosoong!');
  end else
  if Edit1.Text = DataModule4.Zkategori.Fields[1].AsString then

  begin
     ShowMessage('nama kategori'+Edit1.Text+'tidak ada perubahan') ;
  end else

with datamodule4.Zkategori do
begin      //updste
  sql.Clear;
  sql.Add('update kategori set name="'+edit1.Text+'" where id= "'+a+ '"');
  ExecSQL;

  sql.Clear;
  sql.Add('select * from kategori');
  open;
end;
ShowMessage('data berhasil diupdate');
posisiawal;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
if MessageDlg('apakah anda yakin menghapus data ini',mtWarning,[mbyes,mbno],0)=mryes then
begin
with datamodule4.Zkategori do
begin
  sql.Clear;
  sql.Add('delete from kategori  where id= "'+a+ '"');
  ExecSQL;

  sql.Clear;
  sql.Add('select * from kategori');
  open;
end;
ShowMessage('data berhasil didelete')  ;
end else
begin
  ShowMessage('data batal di hapus') ;
end;
posisiawal;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
     with DataModule4.Zkategori do
     begin
       SQL.Clear;
       SQL.Add('select * from kategori where name="'+edit2.text+ '" ');
       Open;
     end;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
Edit1.Enabled:=True;
Button1.Enabled:=True;
Button6.Enabled:=True;
Button2.Enabled:=false;
Button3.Enabled:=false;
Button5.Enabled:=false;

end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text:=datamodule4.Zkategori.Fields[1].AsString;
a:= datamodule4.Zkategori.Fields[0].AsString;
Edit1.Enabled:=false;
Button1.Enabled:=True;
Button6.Enabled:=false;
Button2.Enabled:=true;
Button3.Enabled:=true;
Button5.Enabled:=true;

end;

procedure TForm3.Edit2Change(Sender: TObject);
begin
  with DataModule4.Zkategori do
  begin
    sql.Clear;
    sql.Add('select * from kategori where name like "%'+edit2.text+'%"');
    open;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
 posisiawal;
end;

procedure TForm3.posisiawal;
begin
 Button5.Enabled:=True;
 Button1.Enabled:=False;
 Button2.Enabled:=False;
 Button6.Enabled:=False;
 Button3.Enabled:=False;
 Edit1.Enabled:=False;

end;

end.
