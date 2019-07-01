unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TTime = record
    imsyak, shubuh, sunrise, dzuhur, ashar, maghrib, isya: extended;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

function calctime(latitude, longitude: extended; timezone, Height: integer;
  tanggal: TDate): TTime; stdcall; external 'STime.dll';

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  calc: TTime;
begin
  calc := calctime(-6.21522, 106.818, 7, 100, now);
  Memo1.Lines.Add('imsyak ' + FormatDateTime('hh:mm:ss', calc.imsyak));
  Memo1.Lines.Add('shubuh ' + FormatDateTime('hh:mm:ss', calc.shubuh));
  Memo1.Lines.Add('sunrise ' + FormatDateTime('hh:mm:ss', calc.sunrise));
  Memo1.Lines.Add('dzuhur ' + FormatDateTime('hh:mm:ss', calc.dzuhur));
  Memo1.Lines.Add('ashar ' + FormatDateTime('hh:mm:ss', calc.ashar));
  Memo1.Lines.Add('maghrib ' + FormatDateTime('hh:mm:ss', calc.maghrib));
  Memo1.Lines.Add('isya ' + FormatDateTime('hh:mm:ss', calc.isya));
end;

end.
