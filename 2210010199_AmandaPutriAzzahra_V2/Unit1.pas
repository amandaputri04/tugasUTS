unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    FILE1: TMenuItem;
    FILE2: TMenuItem;
    LOGOUT1: TMenuItem;
    LOGOUT2: TMenuItem;
    KATEGORI1: TMenuItem;
    KATEGORI2: TMenuItem;
    SUPPLIER1: TMenuItem;
    SUPPLIER2: TMenuItem;
    RANSAKSI1: TMenuItem;
    RANSAKSI2: TMenuItem;
    PEMBELIAN1: TMenuItem;
    PEMBELIAN2: TMenuItem;
    LAPORANPENJUALAN1: TMenuItem;
    LAPORANPENJUALAN2: TMenuItem;
    LAPORANBARANG1: TMenuItem;
    USER1: TMenuItem;
    BARANG1: TMenuItem;
    procedure FILE2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KATEGORI1Click(Sender: TObject);
    procedure KATEGORI2Click(Sender: TObject);
    procedure USER1Click(Sender: TObject);
    procedure SUPPLIER2Click(Sender: TObject);
    procedure SUPPLIER1Click(Sender: TObject);
    procedure BARANG1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses unit2, Unit3,unit5,unit6,unit7,unit8,unit9;
{$R *.dfm}

procedure TForm1.BARANG1Click(Sender: TObject);
begin
form9.Show;
end;

procedure TForm1.FILE2Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  mm1.Items[1].Visible:=false;
  mm1.Items[2].Visible:=false;
  mm1.Items[3].Visible:=false;
end;

procedure TForm1.KATEGORI1Click(Sender: TObject);
begin
form3.Show;
end;

procedure TForm1.KATEGORI2Click(Sender: TObject);
begin
form5.Show;
end;

procedure TForm1.SUPPLIER1Click(Sender: TObject);
begin
form8.Show;
end;

procedure TForm1.SUPPLIER2Click(Sender: TObject);
begin
form7.show;
end;

procedure TForm1.USER1Click(Sender: TObject);
begin
form6.show;

end;

end.
