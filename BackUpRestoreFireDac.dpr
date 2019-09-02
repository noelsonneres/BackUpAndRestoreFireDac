program BackUpRestoreFireDac;

uses
  Vcl.Forms,
  BackUP_Restore_FireDac in 'BackUP_Restore_FireDac.pas' {Form1},
  UClasse.BackUp.Restore in 'UClasse.BackUp.Restore.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
