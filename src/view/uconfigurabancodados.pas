unit uConfiguraBancoDados;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, IniFiles;

type

  { TfConfiguraBancoDados }

  TfConfiguraBancoDados = class(TForm)
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    edtUsuario: TEdit;
    edtPorta: TEdit;
    edtBaseDados: TEdit;
    edtServidor: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    pnlDetalheEsquerda: TPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure salvar_ini;
    procedure carregar_ini;
  public

  end;

var
  fConfiguraBancoDados: TfConfiguraBancoDados;

implementation

uses
  uPrincipal;

{$R *.lfm}

{ TfConfiguraBancoDados }

procedure TfConfiguraBancoDados.FormShow(Sender: TObject);
begin
  carregar_ini;
end;

procedure TfConfiguraBancoDados.btnSalvarClick(Sender: TObject);
begin
  salvar_ini;
  Close;
end;

procedure TfConfiguraBancoDados.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfConfiguraBancoDados.salvar_ini;
var
  arquivo_ini: TIniFile;
begin
  arquivo_ini := TIniFile.Create(config_file_ini);
  try
    arquivo_ini.WriteString('ConexaoBD', 'Banco', edtBaseDados.Text);
    arquivo_ini.WriteString('ConexaoBD', 'Servidor', edtServidor.Text);
    arquivo_ini.WriteInteger('ConexaoBD', 'Porta', StrToIntDef(edtPorta.Text, 3306));
    arquivo_ini.WriteString('ConexaoBD', 'Usuario', edtUsuario.Text);
    arquivo_ini.WriteString('ConexaoBD', 'Senha', edtSenha.Text);
  finally
    arquivo_ini.Free;
  end;
end;

procedure TfConfiguraBancoDados.carregar_ini;
var
  arquivo_ini: TIniFile;
begin
  arquivo_ini := TIniFile.Create(config_file_ini);
  try
    edtBaseDados.Text := arquivo_ini.ReadString('ConexaoBD', 'Banco', '');
    edtServidor.Text  := arquivo_ini.ReadString('ConexaoBD', 'Servidor', '');
    edtPorta.Text     := IntToStr(arquivo_ini.ReadInteger('ConexaoBD', 'Porta', 3306));
    edtUsuario.Text   := arquivo_ini.ReadString('ConexaoBD', 'Usuario', '');
    edtSenha.Text     := arquivo_ini.ReadString('ConexaoBD', 'Senha', '');
  finally
    arquivo_ini.Free;
  end;
end;

end.

