unit playlst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Bass, FileCtrl, ExtCtrls, CommonTypes,
  ComCtrls, Mask, Menus, ImgList, IniFiles, Buttons;

type
  TPlayerMode = (StopSnd, PlaySnd, PausedSnd, RadioSnd); // режим воспроизведения
  TPlay = class(TForm)
    Timer1: TTimer;
    TimerRender: TTimer;
    drvlst: TListBox;
    pMenu: TPopupMenu;
    Panel2: TPanel;
    imPlay: TImage;
    imPause: TImage;
    imStop: TImage;
    imLeft: TImage;
    imRight: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    playlist: TListBox;
    posscr: TScrollBar;
    scrVolume: TScrollBar;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    imClose: TImage;
    lDrive: TLabel;
    imDrive: TImage;
    imRadio: TImage;
    imMin: TImage;
    Image1: TImage;
    ListBox1: TListBox;
    imFile: TImage;
    RadioList: TListBox;
    imOpen: TImage;
    lVol: TLabel;
    OpenDialog1: TOpenDialog;
    lStation: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure playlistDblClick(Sender: TObject);
    procedure PlaySound(song: string);
    procedure drvlstClick(Sender: TObject);
    procedure playlistDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure posscrScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure TimerRenderTimer(Sender: TObject);
    procedure posscrChange(Sender: TObject);
    procedure volscr(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    function BassInit: boolean;
    procedure playlistKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject; i: integer);
    procedure ChangeDrv(Sender: TObject);
    procedure pMenuPopup(Sender: TObject);
    procedure DriveClick(Sender: TObject);
    procedure edMaskChange(Sender: TObject);
    procedure imMinMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imDriveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Stop;
    procedure Pause;
    procedure imStopClick(Sender: TObject);
    procedure imPauseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure imPlayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imRightClick(Sender: TObject);
    procedure imLeftClick(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imRadioClick(Sender: TObject);
    function OpenIniFileInstance: TIniFile;
    procedure RestoreSettings(Sender: TObject);
    procedure ScrollBar2MouseLeave(Sender: TObject);
    procedure cbStationClick(Sender: TObject);
    procedure cbStationChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveOptions(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure imPlayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imCloseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function stname(st: string):string;
    function staddr(st: string):string;
    procedure SaveStation(Sender: TObject);
    procedure lDriveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lDriveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DeleteStation(Sender: TObject; station: String);
    procedure imMinMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imSaveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imSaveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imDelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imDelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imAddMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imHideMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imHideMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imFileMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imFileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imOpenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imRadioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imStopMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imPlayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imOpenClick(Sender: TObject);
    procedure Loadm3u(Sender: TObject; m3u: string);
    procedure RadioListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure RadioListDblClick(Sender: TObject);
    procedure RadioListClick(Sender: TObject);
    procedure imRightMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imLeftMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imPauseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imRadioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imStopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imPauseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imOpenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imCloseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
   chan: DWORD;
   Sliding: boolean;
   drvClick: boolean;
   m3u: string;
  procedure Error(msg: string);
    { Private declarations }
  public
  procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
  published
//   Destructor  Destroy; override;
  end;

var
  chan: DWORD;
  Play: TPlay;
  drive: string;
  mask: string;
  s: TStringList;
  Mode: TPlayerMode; // режим воспроизведения
//  mode: integer;
  stream:HSTREAM;

implementation


{$R *.dfm}

procedure TPlay.CreateParams(var Params: TCreateParams);
begin
  BorderStyle:= bsNone;
  inherited;
  Params.ExStyle:= Params.ExStyle or WS_EX_STATICEDGE;
  Params.Style:= Params.Style or WS_SIZEBOX;
end;

{destructor TPlay.Destroy;
begin
  SaveOptions(Self);
end;
 }
procedure TPlay.Error(msg: string);
var
	s: string;
begin
	s := msg + #13#10 + '(Error code: ' + IntToStr(BASS_ErrorGetCode) + ')';
	MessageBox(Handle, PChar(s), nil, 0);
end;

function TPlay.BassInit: boolean;
begin
 try
  if (HIWORD(BASS_GetVersion) <> BASSVERSION) then
  begin
		MessageBox(0,'An incorrect version of BASS.DLL was loaded', nil, MB_ICONERROR);
    Result:= False;
		Halt;
	end;
  if not BASS_Init(-1, 44100, 0, handle, nil) then
  begin
    Application.MessageBox('Can''t initialize device','Bass Initialize problem');
    Result:= False;
    Halt;
  end
  else
   Result:= True;
   BASS_Start;
   BASS_SetConfig(BASS_CONFIG_BUFFER,1000);
 finally
{ TODO : Добавить обработчик }
 end;
end;

function TPlay.OpenIniFileInstance: TIniFile;
begin
  Result := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
end;

procedure TPlay.RestoreSettings(Sender: TObject);
var
  SettingsFile : TIniFile;
begin
  SettingsFile := OpenIniFileInstance();
  try
    Top     := SettingsFile.ReadInteger(Name, 'Top', Top );
    Left    := SettingsFile.ReadInteger(Name, 'Left', Left );
    Width   := SettingsFile.ReadInteger(Name, 'Width', Width );
    Height  := SettingsFile.ReadInteger(Name, 'Height', Height );
    Caption := SettingsFile.ReadString (Name, 'Caption', Caption);
    drive:= SettingsFile.ReadString (Name, 'Drive', Drive);
    scrVolume.Position:= SettingsFile.ReadInteger(Name, 'Volume', scrVolume.Position);
    if Length(Drive)< 1 then Drive:= Copy(GetCurrentDir,1,3);
    case SettingsFile.ReadBool(Name, 'InitMax', WindowState = wsMaximized) of
      true : WindowState := wsMaximized;
      false: WindowState := wsNormal;
    end;
  finally
    SettingsFile.Free;
  end;
end;

procedure TPlay.FormCreate(Sender: TObject);
var NewItem: TMenuItem;
    i: integer;
    ini: TIniFile;
begin
  if not FileExists(ExtractFilePath(Application.ExeName)+ 'cola.ini') then
  begin
    ListBox1.Items.SaveToFile(ExtractFilePath(Application.ExeName)+ 'cola.ini');
  end;
  Play.Constraints.MinHeight:= 160;
  Play.Constraints.MinWidth:= 410;
  RestoreSettings(Sender);
  mode:= StopSnd;
  m3u:= 'pl.m3u';
  s:=TStringList.Create;
  mask:= '*.mp3';
//  drive:= Copy(GetCurrentDir,1,3);
  lDrive.Caption:= Copy(drive,1,3);
  if BassInit= False then exit else
  SendMessage(playlist.Handle, LB_DIR, DDL_DIRECTORY + DDL_EXCLUSIVE,
  integer(pchar(drive+'\*')));
  SendMessage(playlist.Handle, LB_DIR, DDL_ARCHIVE,
  integer(pchar(drive+'\'+mask)));
  { TODO : Добавить фильтр файлов }
  SendMessage(drvlst.Handle, LB_DIR, DDL_DRIVES, integer(pchar(drive)));
  lVol.Caption:= IntToStr(scrVolume.Position);
end;

procedure TPlay.PlaySound(song: string);
begin
  if mode= RadioSnd then
  begin
  try
   BASS_ChannelStop(stream);
   stream:=BASS_streamCreateURL(pansiChar(song), 0,0,nil, 0);
   BASS_ChannelPlay(stream, false);
   Label1.Visible:= False;
  finally
  end;
  end else
  begin
    Timer1.Enabled := False;
    BASS_StreamFree(chan);
    chan := BASS_StreamCreateFile(FALSE, PChar(drive+ song), 0, 0, BASS_SAMPLE_FX or BASS_SAMPLE_LOOP {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});
    if not BASS_ChannelPlay(chan, False) then
    Error('Error playing stream!') else
    posscr.Max := round(BASS_ChannelBytes2Seconds(chan, BASS_ChannelGetLength(chan, BASS_POS_BYTE)));
    BASS_ChannelPlay(chan, False);
    mode:= PlaySnd;
    Timer1.Enabled := true;
  end;
end;

procedure TPlay.ScrollBar2MouseLeave(Sender: TObject);
begin
  Label2.Caption:= 'Vol.';
end;

procedure TPlay.Stop;
begin
  BASS_ChannelStop(chan);
end;

procedure TPlay.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
 SC_DRAGMOVE : Longint = $F012;
begin
  if Button <> mbRight then
  begin
    ReleaseCapture;
    SendMessage(Handle, WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
  if DrvClick= True then
  begin
    lDrive.Top:= lDrive.Top- 1;
    lDrive.Left:= lDrive.Left- 1;
    imDrive.Top:= imDrive.Top- 1;
    imDrive.Left:= imDrive.Left- 1;
    drvClick:= False;
  end;

end;

procedure TPlay.Pause;
begin
  BASS_ChannelPause(chan);
end;

procedure TPlay.playlistDblClick(Sender: TObject);
var i: integer;
    updir: boolean;
begin
  if playlist.Items[playlist.ItemIndex]= '[..]' then updir:= True else updir:= False;
  i:= playlist.ItemIndex;
  if FileExists(drive+ playlist.Items[playlist.itemindex]) then
  begin
    PlaySound(playlist.Items[playlist.itemindex]);
    exit;
  end;
  if not updir then
  s.Add(IntToStr(playlist.itemindex));
  drive:= drive + copy(playlist.Items[playlist.itemindex], 2,
  length(playlist.Items[playlist.itemindex]) - 2) + '\';
  playlist.Clear;
  SendMessage(playlist.Handle, LB_DIR, DDL_DIRECTORY + DDL_EXCLUSIVE,
  integer(pchar(drive+'\*')));
  SendMessage(playlist.Handle, LB_DIR, DDL_ARCHIVE,
  integer(pchar(drive+'\'+mask)));
  if updir then
  begin
    if s.Count>= 0 then
    begin
      if s.Count= 0 then playlist.Selected[0]:= True else
      playlist.Selected[StrToInt(s[s.Count-1])]:= True;
      if s.count> 0 then
      s.Delete(s.Count-1);
    end;
  end else
  playlist.Selected[0]:= True;
end;


procedure TPlay.FormDestroy(Sender: TObject);
begin
  Bass_Stop();
  BASS_StreamFree(chan);
  BASS_Free();
  s.Destroy;
end;

procedure TPlay.FormShow(Sender: TObject);
begin
  playlist.SetFocus;
  if playlist.Count> 0 then playlist.Selected[0]:= True;
end;

procedure TPlay.Loadm3u(Sender: TObject; m3u:string);
var i, l: integer;
    s: string;
    stations: TStringList;
begin
   mode:= RadioSnd;
   Stop;
   try
    stations:= TStringList.Create;
    stations.LoadFromFile(m3u);
    for i:= 1 to stations.Count- 1 do
    begin
      s:= stations[i];
      if Copy(s, 1, 7)= '#EXTINF' then
      RadioList.Items.Add(s);
    end;
   finally stations.free;
   end;
end;

procedure TPlay.imRadioClick(Sender: TObject);
var i, l: integer;
    s: string;
    stations: TStringList;
begin
  if mode <> RadioSnd then
  begin
   mode:= RadioSnd;
   imOpen.Visible:= True;
   PlayList.Visible:= False;
   imFile.Visible:= True;
   imDrive.Visible:= False;
   ldrive.Visible:= False;
   Stop;
//   try
    stations:= TStringList.Create;
    stations.LoadFromFile(m3u);
    for i:= 1 to stations.Count- 1 do
    begin
      s:= stations[i];
      l:= Pos(',', s)+ 1;
      if Copy(s, 1, 7)= '#EXTINF' then
      RadioList.Items.Add(Copy(s, l, length(s)));
    end;
    radiolist.ItemIndex:= 0;
    lStation.Caption:= stations.Strings[2];
  end else
  begin
    imDrive.Visible:= True;
    ldrive.Visible:= True;
    imOpen.Visible:= False;
    BASS_ChannelStop(stream);
    mode:= StopSnd;
    PlayList.Visible:= True;
    mode:= StopSnd;
  end;
end;

procedure TPlay.imMinMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
//  p: TPoint;
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
//  Application.Minimize;
//  if Button = mbLeft then
//  begin
//    p:= imDrive.ClientToScreen(Point(X,Y));
//    PMenu.Popup(p.x,p.Y);
//  end;
end;

procedure TPlay.ButtonClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
  if Sender.ClassType= TLabel then
  lDrive.Top:= lDrive.Top+ 1;
  if Sender.ClassType= TLabel then
  lDrive.Left:= lDrive.Left+ 1;
  if Button = mbLeft then
  begin
    p:= imDrive.ClientToScreen(Point(X,Y));
    PMenu.Popup(p.x,p.Y);
  end;
end;

procedure TPlay.imDriveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  DrvClick:= True;
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
  lDrive.Top:= lDrive.Top+ 1;
  lDrive.Left:= lDrive.Left+ 1;
  if Button = mbLeft then
  begin
    p:= imDrive.ClientToScreen(Point(X,Y));
    PMenu.Popup(p.x,p.Y);
  end;
end;

procedure TPlay.imLeftClick(Sender: TObject);
begin
  if mode= RadioSnd then
  begin
    BASS_ChannelStop(stream);
    imPlay.OnClick(Self);
  end else
  if PlayList.Items.Count> 0 then
  begin
    if FileExists(drive+ playlist.Items[playlist.itemindex]) then
    begin
      if playlist.itemindex >1 then
      begin
        playlist.itemindex:= playlist.itemindex -1;
        playlistDblClick(Sender);
      end;
    end;
  end;
end;

procedure TPlay.imPauseClick(Sender: TObject);
begin
  if mode = RadioSnd then
  begin
    BASS_ChannelStop(stream);
    exit;
  end;
  if mode = StopSnd then exit else
  if mode= PlaySnd then
  begin
    Pause;
    mode:= PausedSnd;
  end else
  begin
    BASS_ChannelPlay(chan, False);
    mode:= PlaySnd;
  end;
end;

procedure TPlay.imPlayClick(Sender: TObject);
begin
  if mode = RadioSnd then
  begin
    try
     PlaySound(lStation.Caption);
    finally
    cursor:= crHourGlass;
    end;
    exit;
  end else
  try
   if FileExists(drive+ playlist.Items[playlist.itemindex]) then
   PlaySound(playlist.Items[playlist.itemindex]);
  finally
 end;
end;

procedure TPlay.imRightClick(Sender: TObject);
begin
  if mode= RadioSnd then
  begin
    BASS_ChannelStop(stream);
    radiolist.ItemIndex:= radiolist.ItemIndex+ 1;
    radiolistDblClick(Self);
  end else
  if PlayList.Items.Count> 0 then
  begin
    if FileExists(drive+ playlist.Items[playlist.itemindex]) then
    begin
      playlist.itemindex:= playlist.itemindex +1;
      playlistDblClick(Sender);
    end;
  end;
end;

procedure TPlay.imStopClick(Sender: TObject);
begin
  if mode = RadioSnd then
  begin
    BASS_ChannelStop(stream);
    exit;
  end;
  Stop;
  mode:= StopSnd;
end;

procedure TPlay.ChangeDrv(Sender: TObject);
begin
  drive:= Copy(drvlst.Items[drvlst.itemindex],3,1)+ ':\';
  playlist.Clear;
  SendMessage(playlist.Handle, LB_DIR, DDL_ARCHIVE + DDL_DIRECTORY,
  integer(pchar(drive+'*'+mask)));
end;

procedure TPlay.drvlstClick(Sender: TObject);
begin
  drive:= Copy(drvlst.Items[drvlst.itemindex],3,1)+ ':\';
  playlist.Clear;
  SendMessage(playlist.Handle, LB_DIR, DDL_ARCHIVE + DDL_DIRECTORY,
  integer(pchar(drive+'*'+mask)));
  drvlst.Hide;
end;

procedure TPlay.edMaskChange(Sender: TObject);
begin
//  mask:= edMask.Text;
end;

procedure TPlay.playlistDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  PlayList.Style:=lbOwnerDrawFixed;
  if odSelected in State then begin
    (Control as TListBox).Canvas.Brush.Color:=clGray;
    (Control as TListBox).Canvas.FillRect(Rect);
    (Control as TListBox).Canvas.TextOut(Rect.Left,Rect.Top,(control as TListBox).Items[index]);
  end else begin
    (Control as TListBox).Canvas.Brush.Color:=clWhite;
    (Control as TListBox).Canvas.FillRect(Rect);
    (Control as TListBox).Canvas.TextOut(Rect.Left,Rect.Top,(control as TListBox).Items[index]);
  end;
end;

procedure TPlay.playlistKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then playlistDblClick(Sender);
end;

procedure TPlay.pMenuPopup(Sender: TObject);
var
  mi, msub: TmenuItem;
  i: integer;
begin
  with (Sender as TPopupMenu) do
  begin
  // Удаляем все пункты меню
    while Items.Count > 0 do
    Items[0].Free;
    for I := 0 to drvLst.Count - 1 do
    begin
    mi := TMenuItem.Create(self);
    with mi do
    begin
      Caption := UpperCase(drvLst.Items[i]);
      OnClick := DriveClick;
    end;
    Items.Insert(0, mi);
    end;
  end;
end;

procedure TPLay.DriveClick(Sender: TObject);
begin
  drive:=TMenuItem(sender).Caption;
  drive:= Copy(drive, 3, 2)+ ':\';
  drive:=StringReplace(drive, '&', '', [rfReplaceAll, rfIgnoreCase]);
  lDrive.Caption:= UpperCase(drive);
  playlist.Clear;
  SendMessage(playlist.Handle, LB_DIR, DDL_DIRECTORY + DDL_EXCLUSIVE,
  integer(pchar(drive+'\*')));
  SendMessage(playlist.Handle, LB_DIR, DDL_ARCHIVE + DDL_DIRECTORY,
  integer(pchar(drive+mask)));
  if playlist.Count> 0 then
  playlist.Selected[0]:= True;
//ShowMessage('d');
  if drvClick= True then
  begin
    lDrive.Top:= lDrive.Top- 1;
    lDrive.Left:= lDrive.Left- 1;
    imDrive.Top:= imDrive.Top- 1;
    imDrive.Left:= imDrive.Left- 1;
    drvClick:= False;
  end;
end;

procedure TPlay.Timer1Timer(Sender: TObject);
begin
  if not Sliding then
  posscr.Position := round(BASS_ChannelBytes2Seconds(chan, BASS_ChannelGetPosition(chan, BASS_POS_BYTE)));
end;

procedure TPlay.posscrScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  Sliding := Scrollcode <> scEndScroll;
  if ScrollCode = scEndScroll then
    BASS_ChannelSetPosition(chan, BASS_ChannelSeconds2Bytes(chan, posscr.position), BASS_POS_BYTE);
end;

procedure TPlay.TimerRenderTimer(Sender: TObject);
var FFTFata : TFFTData;
begin
  if BASS_ChannelIsActive(Chan) <> BASS_ACTIVE_PLAYING then Exit;
  BASS_ChannelGetData(Chan, @FFTFata, BASS_DATA_FFT1024);
end;

procedure TPlay.posscrChange(Sender: TObject);
begin
  if posscr.Position= round(BASS_ChannelBytes2Seconds(chan, BASS_ChannelGetLength(chan, BASS_POS_BYTE))-1)
  then
  begin
    if playlist.ItemIndex<> playlist.Items.Count-1 then
    begin
      playlist.itemindex:= playlist.itemindex +1;
      playlistDblClick(Sender);
    end else
    Stop;
  end;
end;

procedure TPlay.volscr(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  lVol.Caption:= IntToStr(ScrollPos);
  BASS_SetVolume(ScrollPos/100+0.1);
end;

procedure TPlay.BitBtn1Click(Sender: TObject);
begin
  imPause.Enabled:= False;
end;

procedure TPlay.Button2Click(Sender: TObject; i: integer);
var NewItem: TMenuItem;
begin
  ShowMessage(IntToStr(i));
end;

procedure TPlay.cbStationClick(Sender: TObject);
begin
//  BASS_ChannelStop(stream);
end;

function TPlay.staddr(st: string):string;
begin
  st:=Copy(st, Pos('=', st)+1, Length(st));
  Result:= st;
end;

function TPlay.stname(st: string):string;
begin
  st:=Copy(st, 0, Pos('=', st)-1);
  Result:= st;
end;

procedure TPlay.cbStationChange(Sender: TObject);
var s: TStringList;
    i: integer;
    AppIni: TIniFile;
begin
  s:= TStringList.Create;
  try
   AppIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'cola.ini');
   AppIni.ReadSections(s);
   begin
//     showmessage(s[1]);
     lStation.Caption:= staddr(s[0]);
//     ShowMessage(staddr(s[0]));
   end;
  finally AppIni.Free;
//  imPlay.OnClick(Self);
{ Case cbStation.ItemIndex of
0: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/2';
1: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/3';
2: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/4';
3: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/6';
4: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/8';
5: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/10';
6: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/11';
7: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/12';
8: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/13';
9: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/14';
10: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/15';
11: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/17';
12: label4.Caption:='http://radio-1.avtograd.ru:8001/radio/18';
}end;
end;

procedure TPlay.SaveOptions(Sender: TObject);
var
  SettingsFile: TIniFile;
begin
  SettingsFile := OpenIniFileInstance();
  try
    SettingsFile.WriteInteger (Name, 'Top', Top);
    SettingsFile.WriteInteger (Name, 'Left', Left);
    SettingsFile.WriteInteger (Name, 'Width', Width);
    SettingsFile.WriteInteger (Name, 'Height', Height);
    SettingsFile.WriteString  (Name, 'Caption', Caption);
    SettingsFile.WriteBool    (Name, 'InitMax', WindowState = wsMaximized );
    SettingsFile.WriteDateTime(Name, 'LastRun', Now);
    SettingsFile.WriteString(Name, 'Drive', Drive);
//    SettingsFile.WriteString(Name, 'Mask', edMask.Text);
    SettingsFile.WriteInteger(Name, 'Volume', scrVolume.Position);
  finally
    SettingsFile.Free;
  end;
end;

procedure TPlay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveOptions(Self);
end;

procedure TPlay.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  SaveOptions(Self);
end;

procedure TPlay.imPlayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if mode = RadioSnd then label1.Visible:= True;
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

procedure TPlay.imCloseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Close;
end;

procedure TPlay.SaveStation(Sender: TObject);
var i: integer;
    stations: TStringList;
    AppIni: TIniFile;
begin
  try
   AppIni := TIniFile.Create(ExtractFilePath(Application.exeName)+'cola.ini');
   stations:= TStringList.Create;
   AppIni.ReadSections(stations);
   for i:= 1 to stations.Count- 1 do


//   try AppIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'playlist.ini');
    mode:= RadioSnd;
    stations:= TStringList.Create;
    AppIni.ReadSections(stations);
    for i:= 1 to stations.Count- 1 do
//    AppIni.WriteString(edStation.Text, 'Station', edAddress.Text);

   finally AppIni.Free;
   end;




//  finally AppIni.Free;
//    cbStation.Clear;
//    cbStation.onChange(Self);
//    cbStation.ItemIndex:=0;
//    cbStation.Refresh;
//    cbStation.onChange(Self);
//  end;
end;

procedure TPlay.lDriveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  drvClick:= True;
  (Sender as TLabel).Top:= (Sender as TLabel).Top+ 1;
  (Sender as TLabel).Left:= (Sender as TLabel).Left+ 1;
  imDrive.Top:= imDrive.Top+ 1;
  imDrive.Left:= imDrive.Left+ 1;
  if Button = mbLeft then
  begin
    p:= imDrive.ClientToScreen(Point(X,Y));
    PMenu.Popup(p.x,p.Y);
  end;
end;

procedure TPlay.lDriveMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
begin
  if Button = mbLeft then
  begin
    p:= imDrive.ClientToScreen(Point(X,Y));
    PMenu.Popup(p.x,p.Y);
  end;
end;

procedure TPlay.DeleteStation(Sender: TObject; Station: string);
var  AppIni: TIniFile;
     i: integer;
     stations: TStringList;
begin
  try
   AppIni := TIniFile.Create(ExtractFilePath(Application.exeName)+'cola.ini');
   AppIni.EraseSection(station);
    stations:= TStringList.Create;
    AppIni.ReadSections(stations);
  finally
   AppIni.Free;
  end;
end;

procedure TPlay.imMinMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
  Application.Minimize;
end;

procedure TPlay.imSaveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
//  imHide.OnClick(Self);
  SaveStation(Self);
end;

procedure TPlay.imSaveMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
//  edStation.Visible:= False;
//  edAddress.Visible:= False;
//  Label1.Visible:= False;
//  Label4.Visible:= False;
//  imSave.Visible:= False;
//  imHide.Visible:= False;
end;

procedure TPlay.imDelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
  if MessageDlg('Delete station?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
end;

procedure TPlay.imDelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imAddMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imHideMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

procedure TPlay.imHideMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imFileMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
  imRadio.Top:= imRadio.Top- 1;
  imRadio.Left:= imRadio.Left- 1;
  imFile.Visible:= False;
end;

procedure TPlay.imFileMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
  imRadio.Top:= imRadio.Top+ 1;
  imRadio.Left:= imRadio.Left+ 1;
end;

procedure TPlay.imOpenMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imRadioMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imStopMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imPlayMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imOpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute= true then
  begin
    Loadm3u(Sender, OpenDialog1.FileName);
  end;
end;

procedure TPlay.RadioListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  RadioList.Style:=lbOwnerDrawFixed;
  if odSelected in State then begin
    (Control as TListBox).Canvas.Brush.Color:=clGray;
    (Control as TListBox).Canvas.FillRect(Rect);
    (Control as TListBox).Canvas.TextOut(Rect.Left,Rect.Top,(control as TListBox).Items[index]);
  end else begin
    (Control as TListBox).Canvas.Brush.Color:=clWhite;
    (Control as TListBox).Canvas.FillRect(Rect);
    (Control as TListBox).Canvas.TextOut(Rect.Left,Rect.Top,(control as TListBox).Items[index]);
  end;
end;

procedure TPlay.RadioListDblClick(Sender: TObject);
var   stations, address: TStringList;
      i: Integer;
      s: string;
begin
   try
//  sleep(1000);
    application.ProcessMessages;
    label1.Visible:= True;
    application.ProcessMessages;
//  sleep(1000);
    stations:= TStringList.Create;
    address:= TStringList.Create;
    stations.LoadFromFile(m3u);
    stations.Delete(0);
    for i:= 0 to stations.Count- 1 do
    begin
      s:= stations[i];
      if Copy(s, 1, 4)= 'http' then
      address.Add(stations[i]);
    end;
//   ShowMessage(IntTostr(radiolist.itemIndex));
//   ShowMessage(stations[radiolist.itemIndex]);
   lStation.Caption:= address[radiolist.itemIndex];
   PlaySound(address[radiolist.itemIndex]);
   finally
    stations.free;
    address.Free;
   end;
end;

procedure TPlay.RadioListClick(Sender: TObject);
var   stations, address: TStringList;
      i: Integer;
      s: string;
begin
   try
    stations:= TStringList.Create;
    address:= TStringList.Create;
    stations.LoadFromFile(m3u);
    stations.Delete(0);
    for i:= 0 to stations.Count- 1 do
    begin
      s:= stations[i];
      if Copy(s, 1, 4)= 'http' then
      address.Add(stations[i]);
    end;
//   ShowMessage(IntTostr(radiolist.itemIndex));
//   ShowMessage(stations[radiolist.itemIndex]);
   lStation.Caption:= address[radiolist.itemIndex];
// PlaySound(address[radiolist.itemIndex]);
   finally               
    stations.free;
    address.Free;
   end;
end;

procedure TPlay.imRightMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imLeftMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imPauseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top- 1;
  (Sender as TImage).Left:= (Sender as TImage).Left- 1;
end;

procedure TPlay.imRadioMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

procedure TPlay.imStopMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

procedure TPlay.imPauseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

procedure TPlay.imOpenMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

procedure TPlay.imCloseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Top:= (Sender as TImage).Top+ 1;
  (Sender as TImage).Left:= (Sender as TImage).Left+ 1;
end;

end.
