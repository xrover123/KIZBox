unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TGatheringForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LST: TListBox;
    Panel3: TPanel;
    ADDButton: TButton;
    OKButton: TButton;
    CANCELButton: TButton;
    CNT: TSpinEdit;
    MRK: TEdit;
    Label1: TLabel;
    procedure Panel1Resize(Sender: TObject);
    procedure ADDButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CANCELButtonClick(Sender: TObject);
    procedure CNTChange(Sender: TObject);
    procedure LSTClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MRKKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CurrKey: char;
  public
    FileNameKIZ: String;
    FileNameCNT: String;
    FileNameEOF: String;
    { Public declarations }
    procedure Clear;
    procedure CloseFiles;
  end;

var
  GatheringForm: TGatheringForm;
  AQuant: array of integer;

implementation

{$R *.dfm}


procedure EraseFile(const FName: String);
var F: File;
begin
AssignFile(F,FName);
Erase(F);
end;

procedure TGatheringForm.CloseFiles;
var F: File;
begin
AssignFile(F,FileNameEOF);
rewrite(F);
CloseFile(F);
end;

procedure TGatheringForm.Panel1Resize(Sender: TObject);
begin
MRK.Width:=Panel1.Width;
end;
procedure TGatheringForm.Clear;
begin
LST.Items.Clear;
SetLength(AQuant,0);
end;

procedure TGatheringForm.ADDButtonClick(Sender: TObject);
var i: integer;
begin
if Length(trim(MRK.Text))=0 then exit;
i:=LST.Items.IndexOf(MRK.Text);
if i>=0 then
  begin
  LST.ItemIndex:=i;
  AQuant[i]:=AQuant[i]+1;
  CNT.Value:=AQuant[i]
  end
  else
  begin
  LST.Items.Add(MRK.Text);
  i:=LST.Items.Count;
  SetLength(AQuant,i);
  dec(i);
  LST.ItemIndex:=i;
  AQuant[i]:=1;
  CNT.Value:=1;
  end;
MRK.SelectAll;
end;

procedure TGatheringForm.OKButtonClick(Sender: TObject);
var i, j: integer;
    SS: TStringList;
begin
if FileExists(FileNameKIZ) then
  EraseFile(FileNameKIZ);
if FileExists(FileNameCNT) then
  EraseFile(FileNameCNT);
LST.Items.SaveToFile(FileNameKIZ);
j:=LST.Items.Count-1;
LST.Items.Clear;
if j>=0 then
  begin
  SS:=TStringList.Create;
  for i:=0 to j do SS.Add(IntToStr(AQuant[i]));
  SS.SaveToFile(FileNameCNT);
  SS.Free;
  CloseFiles;
  end;
Close;
end;

procedure TGatheringForm.CANCELButtonClick(Sender: TObject);
begin
if FileExists(FileNameKIZ) then
  EraseFile(FileNameKIZ);
if FileExists(FileNameCNT) then
  EraseFile(FileNameCNT);
Close;
end;

procedure TGatheringForm.CNTChange(Sender: TObject);
var i: integer;
begin
i:=LST.ItemIndex;
if i<0 then
  CNT.Value:=0
  else
  AQuant[i]:=CNT.Value;
end;

procedure TGatheringForm.LSTClick(Sender: TObject);
var i: integer;
begin
i:=LST.ItemIndex;
if i<0 then
  CNT.Value:=0
  else
  CNT.Value:=AQuant[i];
end;
//begin
//Application.CreateForm(TGatheringForm, GatheringForm);
procedure TGatheringForm.FormShow(Sender: TObject);
var F: File;
begin
FileNameKIZ:=ExtractFilePath(ParamStr(0))+'KIZ.lst';
FileNameCNT:=ExtractFilePath(ParamStr(0))+'CNT.lst';
FileNameEOF:=ExtractFilePath(ParamStr(0))+'EOF.stp';
if FileExists(FileNameKIZ) then
  EraseFile(FileNameKIZ);
if FileExists(FileNameCNT) then
  EraseFile(FileNameCNT);
end;

procedure TGatheringForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
CloseFiles;
end;

procedure TGatheringForm.MRKKeyPress(Sender: TObject; var Key: Char);
begin
if ord(Key) in [10,13] then
  begin
  if ord(CurrKey) in [10,13] then exit;
  ADDButtonClick(Sender);
  end;
end;

end.
