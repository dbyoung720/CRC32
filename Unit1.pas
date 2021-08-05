unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Diagnostics;

type
  TForm1 = class(TForm)
    mmoLog: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses db.CRC32;

procedure TForm1.FormCreate(Sender: TObject);
var
  strTemp    : String;
  strFileName: String;
  Buffer     : TBytes;
begin
  strTemp := '1234567890';
  SetLength(Buffer, Length(strTemp));
  Buffer := BytesOf(strTemp);
  mmoLog.Lines.Add('CRC32I Table: $' + IntToHex(CRC32I_Table(@Buffer[0], Length(strTemp)), 8));
  mmoLog.Lines.Add('CRC32C Table: $' + IntToHex(CRC32C_Table(@Buffer[0], Length(strTemp)), 8));
  mmoLog.Lines.Add('CRC32C SSE42: $' + IntToHex(CRC32C_SSE42(@Buffer[0], Length(strTemp)), 8));

  // strFileName := 'F:\Backup\OS\WIN10\2021.iso';
  // strFileName := 'C:\Windows\notepad.exe';
  strFileName := 'F:\Download\ArrayFire-v3.8.0-CUDA-11.2.exe';

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

end.
