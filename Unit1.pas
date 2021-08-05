unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Diagnostics, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    mmoLog: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    srchbxFile: TSearchBox;
    btnBuffer: TButton;
    btnFile: TButton;
    dlgOpen1: TOpenDialog;
    procedure btnBufferClick(Sender: TObject);
    procedure btnFileClick(Sender: TObject);
    procedure srchbxFileInvokeSearch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses db.CRC32, System.ZLib, IdHashCRC;

{ Indy CRC32 String }
function TestIndyCRC32(const strValue: String): DWORD;
var
  MyCRC: TIdHashCRC32;
begin
  MyCRC  := TIdHashCRC32.Create;
  Result := MyCRC.HashValue(strValue);
  MyCRC.Free;
end;

{ zlib CRC32 String }
function TestZlibCRC32(const strValue: String): DWORD;
var
  Buffer: TBytes;
begin
  SetLength(Buffer, Length(strValue));
  Buffer := BytesOf(strValue);
  Result := CRC32(0, @Buffer[0], Length(strValue));
end;

procedure TForm1.btnBufferClick(Sender: TObject);
var
  strTemp: String;
  Buffer : TBytes;
begin
  if Trim(edt1.Text) <> '' then
  begin
    mmoLog.Clear;
    strTemp := edt1.Text;
    SetLength(Buffer, Length(strTemp));
    Buffer := BytesOf(strTemp);
    mmoLog.Lines.Add('CRC32I Table: $' + IntToHex(CRC32I_Table(@Buffer[0], Length(strTemp)), 8));
    mmoLog.Lines.Add('CRC32I Indy : $' + IntToHex(TestIndyCRC32(strTemp), 8));
    mmoLog.Lines.Add('CRC32I zlib : $' + IntToHex(TestZlibCRC32(strTemp), 8));
    mmoLog.Lines.Add('CRC32C Table: $' + IntToHex(CRC32C_Table(@Buffer[0], Length(strTemp)), 8));
    mmoLog.Lines.Add('CRC32C SSE42: $' + IntToHex(CRC32C_SSE42(@Buffer[0], Length(strTemp)), 8));
  end;
end;

procedure TForm1.btnFileClick(Sender: TObject);
var
  strFileName: String;
begin
  if not FileExists(srchbxFile.Text) then
    Exit;

  mmoLog.Clear;
  strFileName := srchbxFile.Text;
  with TStopwatch.StartNew do
  begin
    mmoLog.Lines.Add(Format('CRC32I Table_File: $%x；用时：%.5d 毫秒', [CRC32I_Table_File(strFileName), ElapsedMilliseconds]));
  end;

  with TStopwatch.StartNew do
  begin
    mmoLog.Lines.Add(Format('CRC32C Table_File: $%x；用时：%.5d 毫秒', [CRC32C_Table_File(strFileName), ElapsedMilliseconds]));
  end;

  with TStopwatch.StartNew do
  begin
    mmoLog.Lines.Add(Format('CRC32C SSE42_File: $%x；用时：%.5d 毫秒', [CRC32C_SSE42_File(strFileName), ElapsedMilliseconds]));
  end;
end;

procedure TForm1.srchbxFileInvokeSearch(Sender: TObject);
begin
  if not dlgOpen1.Execute() then
    Exit;

  srchbxFile.Text := dlgOpen1.FileName;
end;

end.
