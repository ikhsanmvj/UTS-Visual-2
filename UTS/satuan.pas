unit satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btnSimpan: TButton;
    btnEdit: TButton;
    btnHapus: TButton;
    btnBatal: TButton;
    dbgrd1: TDBGrid;
    lbl3: TLabel;
    edt3: TEdit;
    procedure bersih;
    procedure btnSimpanClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnHapusClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure edt3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

uses
  data_module;

{$R *.dfm}

procedure TForm1.bersih;
begin
edt1.Clear;
edt2.Clear;
end;


procedure TForm1.btnSimpanClick(Sender: TObject);
begin
  if edt1.Text = '' then
  begin
    ShowMessage('Nama Tidak Boleh Kosong!');
  end 
  else if edt2.Text = '' then
  begin
    ShowMessage('Deskripsi Tidak Boleh Kosong!');
  end
  else if DataModule1.Zsatuan.Locate('nama', edt1.Text, []) then
  begin
    ShowMessage('Nama Satuan ' + edt1.Text + ' Sudah Ada Didalam Sistem');
  end 
  else
  begin
    // simpan
    with DataModule1.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('insert into satuan (nama, deskripsi) values("' + edt1.Text + '", "' + edt2.Text + '")');
      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Disimpan!');
  end;
end;


procedure TForm1.btnEditClick(Sender: TObject);
begin
  if edt1.Text = '' then
  begin
    ShowMessage('Nama Satuan Tidak Boleh Kosong!');
  end
  else if edt2.Text = '' then
  begin
    ShowMessage('Deskripsi Tidak Boleh Kosong!');
  end
  else if (edt1.Text = DataModule1.Zsatuan.FieldByName('nama').AsString) and
          (edt2.Text = DataModule1.Zsatuan.FieldByName('deskripsi').AsString) then
  begin
    ShowMessage('Data Satuan ' + edt1.Text + ' Tidak Ada Perubahan');
  end
  else
  begin
    // Update operation
    with DataModule1.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('update satuan set nama = "' + edt1.Text + '", deskripsi = "' + edt2.Text + '" where id = "' + a + '"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Diupdate!');
  end;
end;



procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
edt1.Text:= DataModule1.Zsatuan.Fields[1].AsString;
edt2.Text:= DataModule1.Zsatuan.Fields[2].AsString;
a:= DataModule1.Zsatuan.Fields[0].AsString;
btnSimpan.Enabled:=False;
btnEdit.Enabled:=True;
btnHapus.Enabled:=True;
btnBatal.Enabled:=True;
end;

procedure TForm1.btnHapusClick(Sender: TObject);
begin
  if MessageDlg('Apakah Anda Yakin Menghapus Data ini', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    with DataModule1.Zsatuan do
    begin
      SQL.Clear;
      SQL.Add('delete from satuan where id = "' + a + '"');
      ExecSQL;

      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Dihapus!');

    // Clear form fields and reset button
    edt1.Clear;
    edt2.Clear;
    a := ''; // Clear the variable  ID
    btnSimpan.Enabled := True;
    btnEdit.Enabled := False;
    btnHapus.Enabled := False;
    btnBatal.Enabled := False;
  end
  else
  begin
    ShowMessage('Data Batal Dihapus!');
  end;
end;



procedure TForm1.btnBatalClick(Sender: TObject);
begin
  edt1.Clear;
  edt2.Clear;
  a := '';

  btnSimpan.Enabled := True;
  btnEdit.Enabled := False;
  btnHapus.Enabled := False;
  btnBatal.Enabled := False;
end;


procedure TForm1.edt3Change(Sender: TObject);
begin
with DataModule1.Zsatuan do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM satuan WHERE nama like "%'+edt3.Text+'%"');
    Open;
  end;
end;

end.
