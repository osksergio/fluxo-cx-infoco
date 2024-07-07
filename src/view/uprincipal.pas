unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, IniFiles;

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
    procedure carregar_ini;
  public

  end;

var
  fPrincipal: TfPrincipal;
  config_file_ini: string;
  cfg_path_app: string;
  cfg_db: string;
  cfg_server: string;
  cfg_user: string;
  cfg_passwd: string;
  cfg_port: Integer;

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
  cfg_path_app:= ExtractFilePath(ParamStr(0));
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

procedure TfPrincipal.carregar_ini;
var
  arquivo_ini: TIniFile;
begin
  arquivo_ini := TIniFile.Create(config_file_ini);
  try
    cfg_db := arquivo_ini.ReadString('ConexaoBD', 'Banco', '');
    cfg_server := arquivo_ini.ReadString('ConexaoBD', 'Servidor', '');
    cfg_port   := arquivo_ini.ReadInteger('ConexaoBD', 'Porta', 3306);
    cfg_user   := arquivo_ini.ReadString('ConexaoBD', 'Usuario', '');
    cfg_passwd := arquivo_ini.ReadString('ConexaoBD', 'Senha', '');
  finally
    arquivo_ini.Free;
  end;
end;

end.

