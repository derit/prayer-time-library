**MIT License**

you allowed combine the library for your own program but your must included copyright from original author

how to use

Required

Lazarus and FPC Compiler

Parameter latitude and longitude and timezone and Height for location

example for Jakarta 
 latitude = -6.21522
 longitude = 106.818
 timezone = +7
 Height =100

 
```
delphi or lazarus :

  TTime = record
    imsyak, shubuh, sunset, dzuhur, ashar, maghrib, isya: extended;
  end;

function calctime(latitude, longitude: extended; timezone, Height: integer;
  tanggal: TDate): TTime; stdcall; external 'STime.dll';


procedure TForm1.Button1Click(Sender: TObject);
var
  calc: TTime;
begin
  calc := calctime(-6.21522, 106.818, 7, 100, now);
  Memo1.Lines.Add('imsyak ' + FormatDateTime('hh:mm:ss', calc.imsyak));
  Memo1.Lines.Add('shubuh ' + FormatDateTime('hh:mm:ss', calc.shubuh));
  Memo1.Lines.Add('sunset ' + FormatDateTime('hh:mm:ss', calc.sunset));
  Memo1.Lines.Add('dzuhur ' + FormatDateTime('hh:mm:ss', calc.dzuhur));
  Memo1.Lines.Add('ashar ' + FormatDateTime('hh:mm:ss', calc.ashar));
  Memo1.Lines.Add('maghrib ' + FormatDateTime('hh:mm:ss', calc.maghrib));
  Memo1.Lines.Add('isya ' + FormatDateTime('hh:mm:ss', calc.isya));
end;             
```

*if your want to donate*

*0618031766* 

*BNI syariah/an derit agustin*