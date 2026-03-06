program KIZBox;

uses
  Forms,
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGatheringForm, GatheringForm);
  Application.Run;
end.
