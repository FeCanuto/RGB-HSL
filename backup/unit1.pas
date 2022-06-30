unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label6Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var R, G, B : Real;
    H, S, L : Real;
    maximo, minimo, delta: Real;
begin
     R := StrToFloat(Edit1.Text);
     G := StrToFloat(Edit2.text);
     B := StrToFloat(Edit3.text);

     if (R >= 0.0) AND (R <= 255.0) then
        if (G >= 0.0) AND (G <= 255.0) then
           if (B >= 0.0) AND (B <= 255.0) then
              begin
                R := R/255.0;
                G := G/255.0;
                B := B/255.0;
                maximo := Max(R,Max(G,B));
                minimo := Min(R,Min(G,B));
                delta := maximo - minimo;
                L := (maximo + minimo)/2.0;

                if delta = 0.0 then
                   H := 0.0

                else if maximo = R then
                   H := ((G - B) / delta) mod 6

                else if maximo = G then
                   H := ((B - R) / delta + 2)

                else
                    H := (R - G) / delta + 4;

                H := round(H * 60);

                if H < 0.0 then
                  H := H + 360;

                if delta = 0.0 then
                  S := 0.0
                else
                  S := delta / (1 - abs(2 * L - 1));

                S := S + (S * 100);
                L := L + (L * 100);

                Edit4.Text:= FloatToStr(Round((H * 239)/360));
                Edit5.Text:= FloatToStr(Round(S * 2.40));
                Edit6.Text:= FloatToStr(Round(L * 2.40));
              end
              else
              ShowMessage('O valor de B tem que estar entre 0 - 255')
         else
         ShowMessage('O valor de G tem que estar entre 0 - 255')
     else
     ShowMessage('O valor de R tem que estar entre 0 - 255');
end;

procedure TForm1.Button2Click(Sender: TObject);
var H, S, L : Real;
    R, G, B: Real;
    X, M, C : Real;
begin
     R:=0; G:=0; B:=0;
     H := StrToFloat(Edit4.text);
     S := StrToFloat(Edit5.text);
     L := StrToFloat(Edit6.text);

     if (H >= 0) AND (H <= 239) then
        if (S >= 0) AND (S <= 240) then
           if (L >= 0) AND (L <= 240) then
              begin
                   H := abs((360 * H) / 239);
                   S := ((100 * S) / 240);
                   L := ((100 * L) / 240);

                   S := S / 100;
                   L := L / 100;

                   C := (1 - abs(2* L - 1)) * S;
                   X := C * (1 - abs(((H / 60) mod 2) - 1));
                   M := L - (C/2);

                   if (0 <= H) and (H < 60) then
                     begin
                     R := C; G:= X; B :=0;
                     end
                   else if (60 <= H) and (H < 120) then
                     begin
                          R:=x; G:=C; B:=0;
                     end
                   else if (120 <= H) and (H < 180) then
                     begin
                          R:=0; G:=C; B:=X;
                     end
                   else if (180 <= H) and (H < 240) then
                     begin
                          R:=0; G:=X; B:=C;
                     end
                   else if (240 <= H) and (H < 300) then
                     begin
                          R:=X; G:=0; B:=C;
                     end
                   else if (300 <= H) and (H < 360) then
                          R:=C; G:=0; B:=X;



                   Edit1.Text:= FloatToStr(Round((R + M) * 255));
                   Edit2.Text:= FloatToStr(Round((G + M) * 255));
                   Edit3.Text:= FloatToStr(Round((B + M) * 255));
                end
           else
              ShowMessage('O valor de H tem que estar entre 0 - 239')
         else
         ShowMessage('O valor de S tem que estar entre 0 - 240')
     else
     ShowMessage('O valor de L tem que estar entre 0 - 240');

end;
end.

