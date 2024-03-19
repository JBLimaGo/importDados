program P_Importa_Dados;

uses
  Forms,
  U_Importa_Dados in 'U_Importa_Dados.pas' {F_Importacao},
  DM_Modulo in 'DM_Modulo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Importacao, F_Importacao);
  Application.CreateForm(TData_Modulo, Data_Modulo);
  Application.Run;
end.
