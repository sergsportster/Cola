program Cola;

uses
  Forms,
  playlst in 'playlst.pas' {Play};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPlay, Play);
  Application.Run;
end.
