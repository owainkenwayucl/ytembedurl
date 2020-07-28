unit yteu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, StrUtils;

type

  { TTYEmbedForm }

  TTYEmbedForm = class(TForm)
    Convert: TButton;
    VideoURL: TEdit;
    EmbedURL: TEdit;
    procedure ConvertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  TYEmbedForm: TTYEmbedForm;
  EmbedBaseURL, videoid: string;
  SplitArray: TStringArray;

implementation

{$R *.lfm}

{ TTYEmbedForm }

procedure TTYEmbedForm.FormCreate(Sender: TObject);
begin
  EmbedBaseURL := 'https://www.youtube.com/embed/';
end;

procedure TTYEmbedForm.ConvertClick(Sender: TObject);
begin
  if AnsiContainsStr(TYEmbedForm.VideoURL.text, '=') then
    begin
       videoid :=  TYEmbedForm.VideoURL.text;
       SplitArray := videoid.Split('=');
       TYEmbedForm.EmbedURL.text := EmbedBaseURL + SplitArray[Length(SplitArray)-1];
    end
  else if AnsiContainsStr(TYEmbedForm.VideoURL.text, '/') then
    begin
       videoid :=  TYEmbedForm.VideoURL.text;
       SplitArray := videoid.Split('/');
       TYEmbedForm.EmbedURL.text := EmbedBaseURL + SplitArray[Length(SplitArray)-1];
    end
  else
    begin
       TYEmbedForm.EmbedURL.text := 'INVALID';
    end;
end;

end.

