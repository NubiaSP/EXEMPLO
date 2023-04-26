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
    procedure FormCreate(Sender: TObject);
    procedure ClickPNL(Sender: TObject);
    procedure pnlResetarClick(Sender: TObject);
  private
    FVez: Integer;
    { Private declarations }
    procedure ValidaGanhador;
    procedure SetPanel(pnl : TPanel);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FVez := 0;
end;

procedure TForm1.pnlResetarClick(Sender: TObject);
begin
  pnl11.Caption := '';
  pnl12.Caption := '';
  pnl13.Caption := '';

  pnl21.Caption := '';
  pnl22.Caption := '';
  pnl23.Caption := '';

  pnl31.Caption := '';
  pnl32.Caption := '';
  pnl33.Caption := '';
end;

procedure TForm1.ClickPNL(Sender: TObject);
begin
  SetPanel(TPanel(Sender));
end;

procedure TForm1.SetPanel(pnl: TPanel);
begin
  if not Trim(pnl.Caption).IsEmpty then
    Exit;

  if FVez = 0 then
  begin
    pnl.Caption := 'X';
    FVez := 1;
  end
  else
  begin
    pnl.Caption := 'O';
    FVez := 0;
  end;

  ValidaGanhador;
end;

procedure TForm1.ValidaGanhador;
var
  aLinha1: array [0..2] of String;
  aLinha2: array [0..2] of String;
  aLinha3: array [0..2] of String;
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
  if (not aLinha1[0].IsEmpty) and
     (aLinha1[0] = aLinha1[1]) and
     (aLinha1[0] = aLinha1[2]) then
  begin
    sGanhador := aLinha1[0]
  end
  else
  if (not aLinha2[0].IsEmpty)  and
     (aLinha2[0] = aLinha2[1]) and
     (aLinha2[0] = aLinha2[2]) then
  begin
    sGanhador := aLinha2[0];
  end
  else
  if (not aLinha3[0].IsEmpty)  and
     (aLinha3[0] = aLinha3[1]) and
     (aLinha3[0] = aLinha3[2]) then
  begin
    sGanhador := aLinha3[0];
  end
  else // valida colunas
  if (not aLinha1[0].IsEmpty)  and
     (aLinha1[0] = aLinha2[0]) and
     (aLinha1[0] = aLinha3[0]) then
  begin
    sGanhador := aLinha1[0];
  end
  else
  if (not aLinha1[1].IsEmpty)  and
     (aLinha1[1] = aLinha2[1]) and
     (aLinha1[1] = aLinha3[1]) then
  begin
    sGanhador := aLinha1[1];
  end
  else
  if (not aLinha1[2].IsEmpty) and
     (aLinha1[2] = aLinha2[2]) and
     (aLinha1[2] = aLinha3[2]) then
  begin
    sGanhador := aLinha1[2];
  end
  else // diagonal
  if (not aLinha1[0].IsEmpty) and
     (aLinha1[0] = aLinha2[1]) and
     (aLinha1[0] = aLinha3[2]) then
  begin
    sGanhador := aLinha1[0];
  end
  else
  if (not aLinha1[2].IsEmpty) and
     (aLinha1[2] = aLinha2[1]) and
     (aLinha1[2] = aLinha3[0]) then
  begin
    sGanhador := aLinha1[2];
  end;

  if not sGanhador.Trim.IsEmpty then
    ShowMessage('Ganhador ' + sGanhador);
end;

end.
