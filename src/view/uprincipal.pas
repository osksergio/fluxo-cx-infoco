unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TfPrincipal }

  TfPrincipal = class(TForm)
    btnPlanos: TSpeedButton;
    btnLancamentos: TSpeedButton;
    btnSair: TSpeedButton;
    Label1: TLabel;
    pnlEsquerda: TPanel;
    btnContas: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
  private

  public

  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.lfm}

{ TfPrincipal }

procedure TfPrincipal.btnSairClick(Sender: TObject);
begin
  ShowMessage('Encerrando o sistema. Até breve!');
  Application.Terminate;
end;

end.

