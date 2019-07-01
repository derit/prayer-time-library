library STime;

{ 
  Copyright Derit Agustin (derit.agustin@gmail.com)
}

{$mode objfpc}{$H+}

uses
  Classes,
  SysUtils,
  Math,
  dateutils { you can add units after this };

type

  TTime = record
    imsyak, subuh, terbit, dzuhur, ashar, maghrib, isya: extended;
  end;

  function calctime(latitude, longitude: extended; timezone, Height: integer;
    tanggal: TDate): TTime; stdcall;
  var
    beta: real;
    j: word;
    s: string;
    d, t, U, Vd, W, Vn: ValReal;
    b, l, Z, hasil: extended;
    R, h, Gd, Gn: integer;
  begin

    j := dayoftheyear(tanggal);
    Gd := 19;
    Gn := 19;
    beta := 2 * pi() * J / dayoftheyear(
      StrToDate(CONCAT('31/12/', IntToStr(YearOf(now))), 'dd/mm/yyyy'));
    d := (180 / pi()) * (0.006918 - (0.399912 * cos(beta)) +
      (0.070257 * sin(beta)) - (0.006758 * cos(2 * beta)) +
      (0.000907 * sin(2 * beta)) - (0.002697 * cos(3 * beta)) +
      (0.001480 * sin(3 * beta)));
    t := 229.18 * (0.000075 + (0.001868 * cos(beta)) - (0.032077 * sin(beta)) -
      (0.014615 * cos(2 * beta)) - (0.040849 * sin(2 * beta)));
    b := latitude;// -6.21522;  //latitude
    l := longitude;//106.818;   //longitude
    R := timezone * 15;     //timezone
    h := 100;      //ketinggian
    Z := 12 + ((R - L) / 15) - (T / 60);
    U := (180 / (15 * pi())) * arccos(
      (SIN((-0.8333 - (0.0347 * SIGN(H) * SQRT(ABS(H)))) * pi() / 180) -
      SIN(D * pi() / 180) * SIN(B * pi() / 180)) /
      (COS(D * pi() / 180) * COS(B * pi() / 180)));
    Vd := (180 / (15 * pi())) * arccos(
      (-1 * SIN(Gd * pi() / 180) - SIN(D * pi() / 180) * SIN(B * pi() / 180)) /
      (COS(D * pi() / 180) * COS(B * pi() / 180)));
    Vn := (180 / (15 * pi())) * arccos(
      (-1 * SIN(Gn * pi() / 180) - SIN(D * pi() / 180) * SIN(B * pi() / 180)) /
      (COS(D * pi() / 180) * COS(B * pi() / 180)));
    W := (180 / (15 * pi())) * arccos(
      (SIN(arctan(1 / (1 + TAN(ABS(B - D) * pi() / 180)))) -
      SIN(D * pi() / 180) * SIN(B * pi() / 180)) /
      (COS(D * pi() / 180) * COS(B * pi() / 180)));

    Result.imsyak := (((z - Vd) - 0.134) * 3600 / 86400);
    Result.subuh := (((z - Vd) - 0.033) * 3600 / 86400);
    Result.terbit := ((Z - U) * 3600 / 86400);
    Result.dzuhur := ((Z + 0.05) * 3600 / 86400);
    Result.ashar := ((Z + W + 0.033) * 3600 / 86400);
    Result.maghrib := ((Z + U + 0.033) * 3600 / 86400);
    Result.isya := ((Z + Vn - 0.0167) * 3600 / 86400);
  
  end;

exports
  calctime;

{$R *.res}

begin
end.
