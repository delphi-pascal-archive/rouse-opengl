program Rosier;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  TriD in 'TriD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rosier2';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
