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
    btnConfig: TSpeedButton;
    Label1: TLabel;
    pnlEsquerda: TPanel;
    btnContas: TSpeedButton;
    procedure btnConfigClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  fPrincipal: TfPrincipal;
  config_file_ini: string;

implementation

uses
  uConfiguraBancoDados;

{$R *.lfm}

{ TfPrincipal }

procedure TfPrincipal.btnSairClick(Sender: TObject);
begin
  ShowMessage('Encerrando o sistema. Até breve!');
  Application.Terminate;
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  config_file_ini := ChangeFileExt(ParamStr(0), '.ini');
end;

procedure TfPrincipal.btnConfigClick(Sender: TObject);
begin
  fConfiguraBancoDados := TfConfiguraBancoDados.Create(Self);
  try
    fConfiguraBancoDados.ShowModal;
  finally
    FreeAndNil(fConfiguraBancoDados);
  end;
end;

end.

