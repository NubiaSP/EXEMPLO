unit uJogoVelha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlResetar: TPanel;
    Panel4: TPanel;
    pnl13: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    Panel1: TPanel;
    pnl33: TPanel;
    pnl31: TPanel;
    pnl32: TPanel;
    Panel10: TPanel;
    pnl23: TPanel;
    pnl21: TPanel;
    pnl22: TPanel;
  private
    { Private declarations }
    procedure ValidaGanhador;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.ValidaGanhador;
var
  aLinha1: array [3] of String;
  aLinha2: array [3] of String;
  aLinha3: array [3] of String;
  sGanhador: String;
begin
  aLinha1[0] := pnl11.Caption;
  aLinha1[1] := pnl12.Caption;
  aLinha1[2] := pnl13.Caption;

  aLinha2[0] := pnl21.Caption;
  aLinha2[1] := pnl22.Caption;
  aLinha2[2] := pnl23.Caption;

  aLinha3[0] := pnl31.Caption;
  aLinha3[1] := pnl32.Caption;
  aLinha3[2] := pnl33.Caption;

  // Valida linhas
  if (aLinha1[0] = aLinha1[1]) and (aLinha1[0] = aLinha1[2]) then
  begin
    sGanhador := aLinha1[0];
  end
  else
  if (aLinha2[0] = aLinha2[1]) and (aLinha2[0] = aLinha2[2]) then
  begin
    sGanhador := aLinha2[0];
  end
  else
  if (aLinha3[0] = aLinha3[1]) and (aLinha3[0] = aLinha3[2]) then
  begin
    sGanhador := aLinha3[0];
  end
  else // valida colunas
  if (aLinha1[0] = aLinha2[0]) and (aLinha1[0] = aLinha3[0]) then
  begin
    sGanhador := aLinha1[0];
  end
  else
  if (aLinha1[1] = aLinha2[1]) and (aLinha1[1] = aLinha3[1]) then
  begin
    sGanhador := aLinha1[1];
  end
  else
  if (aLinha1[2] = aLinha2[2]) and (aLinha1[2] = aLinha3[2]) then
  begin
    sGanhador := aLinha1[2];
  end
  else // diagonal
  if (aLinha1[0] = aLinha2[1]) and (aLinha1[0] = aLinha3[2]) then
  begin
    sGanhador := aLinha1[0];
  end
  else
  if (aLinha1[2] = aLinha2[1]) and (aLinha1[2] = aLinha3[0]) then
  begin
    sGanhador := aLinha1[2];
  end;

  ShowMessage('Ganhador ' + sGanhador);
end;

end.
