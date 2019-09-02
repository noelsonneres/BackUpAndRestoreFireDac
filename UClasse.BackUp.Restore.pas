unit UClasse.BackUp.Restore;

interface

uses
  System.SysUtils, FireDAC.Stan.Def, FireDAC.Phys.IBWrapper, FireDAC.Phys.FBDef,
  FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Intf,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Vcl.Dialogs, Winapi.Windows;

type

  TClasseBackUPAndRestore = class
  private
    Fuser_password: string;
    FlocalBackUpBancoDeDados: string;
    Fuser_name: string;
    Fhost: string;
    FlocalBancoDeDados: string;
    FDI_Restore: TFDIBBackup;
    FDI_Backup: TFDIBBackup;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure Sethost(const Value: string);
    procedure SetlocalBackUpBancoDeDados(const Value: string);
    procedure SetlocalBancoDeDados(const Value: string);
    procedure Setuser_name(const Value: string);
    procedure Setuser_password(const Value: string);
  public

    procedure iniciarBackUP;
    procedure iniciarRestore;

    property localBancoDeDados: string read FlocalBancoDeDados
      write SetlocalBancoDeDados;
    property localBackUpBancoDeDados: string read FlocalBackUpBancoDeDados
      write SetlocalBackUpBancoDeDados;
    property user_name: string read Fuser_name write Setuser_name;
    property user_password: string read Fuser_password write Setuser_password;
    property host: string read Fhost write Sethost;

    constructor create;
    destructor destroy; override;
  end;

implementation

uses
  Vcl.Forms;

{ TClasseBackUPAndRestore }

constructor TClasseBackUPAndRestore.create;
begin

end;

destructor TClasseBackUPAndRestore.destroy;
begin

  inherited;
end;

procedure TClasseBackUPAndRestore.iniciarBackUP;
begin
 try
 
  FDI_Backup := TFDIBBackup.create(nil);

  try

    FDI_Backup.UserName := 'sysdba'; 
    FDI_Backup.Password := 'masterkey'; 
    FDI_Backup.host := 'localhost'; 
    FDI_Backup.Protocol := ipTCPIP; 
    FDI_Backup.Verbose := True;
    FDI_Backup.Database := localBancoDeDados;
    FDI_Backup.BackupFiles.Add(ExtractFilePath(Application.ExeName) + 'BackUp\'
      + 'BackUp_' + datetostr(date)+timetostr(time) + '.fbk');
    FDI_Backup.BackUp;

    MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOK], 0);

  except
    on E: Exception do
    begin
      MessageDlg('Erro ao gerar backup!' + sLineBreak + E.Message, mtError,
        [mbOK], 0);
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
//      DeleteFile();
    end;

    FDI_Restore.UserName := 'sysdba'; // usuario da base de dados
    FDI_Restore.Password := 'masterkey'; // senha da base de dados
    FDI_Restore.host := 'localhost';
    // 'db_srv_host' local do servidor da base de dados
    FDI_Restore.Protocol := ipTCPIP;
    // protocolo de conexao com a base de dados
    FDI_Restore.Verbose := True;
    // capturar retorno/saida do servico da base de dados
    FDI_Restore.Database := localBancoDeDados;
    // local e nome da base de dados a ser restaurada
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
