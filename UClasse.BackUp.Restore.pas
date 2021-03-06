unit UClasse.BackUp.Restore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Def, FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Vcl.StdCtrls;

type

  TClasseBackUPAndRestore = class
  private
    Fuser_password: string;
    FlocalBackUpBancoDeDados: string;
    Fuser_name: string;
    Fhost: string;
    FlocalBancoDeDados: string;
    FDI_Restore: TFDIBRestore;
    FDI_Backup: TFDIBBackup;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FdataHora: string;
    procedure Sethost(const Value: string);
    procedure SetlocalBackUpBancoDeDados(const Value: string);
    procedure SetlocalBancoDeDados(const Value: string);
    procedure Setuser_name(const Value: string);
    procedure Setuser_password(const Value: string);
    procedure SetdataHora(const Value: string);
  public

    procedure iniciarBackUP;
    procedure iniciarRestore;
    procedure eventoBackUP(componete:TMemo);

    property localBancoDeDados: string read FlocalBancoDeDados
      write SetlocalBancoDeDados;
    property localBackUpBancoDeDados: string read FlocalBackUpBancoDeDados
      write SetlocalBackUpBancoDeDados;
    property user_name: string read Fuser_name write Setuser_name;
    property user_password: string read Fuser_password write Setuser_password;
    property host: string read Fhost write Sethost;
    property dataHora: string read FdataHora write SetdataHora;

    constructor create;
    destructor destroy; override;
  end;

implementation

{ TClasseBackUPAndRestore }

constructor TClasseBackUPAndRestore.create;
begin

  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.create(nil);

  FDPhysFBDriverLink1.VendorLib :=
    'C:\Users\noels\Documents\GitHub\SmartEstoque\Banco\fbclient.dll';
end;

destructor TClasseBackUPAndRestore.destroy;
begin
  // FDPhysFBDriverLink1.Free;
  inherited;
end;

procedure TClasseBackUPAndRestore.eventoBackUP(componete: TMemo);
begin

end;

procedure TClasseBackUPAndRestore.iniciarBackUP;
var
  data: string;
  hora: string;
begin

  data := FormatDateTime('ddmmyy', date);
  hora := FormatDateTime('hhmmss', time);

  try

    FDI_Backup := TFDIBBackup.create(nil);

    try

      FDI_Backup.DriverLink := FDPhysFBDriverLink1;
      FDI_Backup.UserName := 'sysdba';
      FDI_Backup.Password := 'masterkey';
      FDI_Backup.host := 'localhost';
      FDI_Backup.Protocol := ipTCPIP;
      FDI_Backup.Verbose := True;
      FDI_Backup.Database := localBancoDeDados;
      FDI_Backup.BackupFiles.Add(ExtractFilePath(Application.ExeName) +
        'BackUp\' + 'BackUp_' + data + hora + '.fbk');
      FDI_Backup.BackUp;

      MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOK], 0);

    except
      on E: Exception do
      begin
        raise Exception.create('Ocorreu um erro ao tentar realizar o BackUp' +
          E.Message);
      end;
    end;
  finally
    FDI_Backup.Free;
  end;

end;

procedure TClasseBackUPAndRestore.iniciarRestore;
begin
  try

    if FileExists(localBancoDeDados) then
    begin
      DeleteFile(Pchar(localBancoDeDados));
    end;

    FDI_Restore := TFDIBRestore.create(nil);

    FDI_Restore.DriverLink := FDPhysFBDriverLink1;
    FDI_Restore.UserName := 'sysdba';
    FDI_Restore.Password := 'masterkey';
    FDI_Restore.host := 'localhost';
    FDI_Restore.Protocol := ipTCPIP;
    FDI_Restore.Verbose := True;
    FDI_Restore.Database := localBancoDeDados;
    FDI_Restore.BackupFiles.Add(localBackUpBancoDeDados);
    FDI_Restore.Restore;
    FDI_Restore.BackupFiles.Clear;

    MessageDlg('Restauração do banco de dados realizado com sucesso!',
      mtInformation, [mbOK], 0);

  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gerar restore!' + sLineBreak + E.Message, mtError,
        [mbOK], 0);
    end;
  end;

  FDI_Restore.Free;

end;

procedure TClasseBackUPAndRestore.SetdataHora(const Value: string);
var
  data: string;
  hora: string;
begin

  data := FormatDateTime('ddmmyy', date);
  hora := FormatDateTime('hhmmss', time);

  FdataHora := data + hora;

end;

procedure TClasseBackUPAndRestore.Sethost(const Value: string);
begin
  Fhost := Value;
end;

procedure TClasseBackUPAndRestore.SetlocalBackUpBancoDeDados
  (const Value: string);
begin
  FlocalBackUpBancoDeDados := Value;
end;

procedure TClasseBackUPAndRestore.SetlocalBancoDeDados(const Value: string);
begin
  FlocalBancoDeDados := Value;
end;

procedure TClasseBackUPAndRestore.Setuser_name(const Value: string);
begin
  Fuser_name := Value;
end;

procedure TClasseBackUPAndRestore.Setuser_password(const Value: string);
begin
  Fuser_password := Value;
end;

end.
