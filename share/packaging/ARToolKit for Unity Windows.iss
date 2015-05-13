[Setup]
AppName="ARToolKit for Unity"
AppVerName="ARToolKit for Unity v5.2"
AppVersion=5.2
AppPublisher="DAQRI LLC"
AppPublisherURL=http://www.artoolkit.org/
AppSupportURL=http://www.artoolkit.org/documentation
AppUpdatesURL=http://www.artoolkit.org/download
DefaultDirName={pf}\ARUnity
DefaultGroupName=ARToolKit for Unity
;InfoBeforeFile=README.txt
Compression=lzma
SolidCompression=yes
SourceDir=../..
OutputBaseFilename="ARToolKit for Unity v5.2 Setup"
OutputDir=..
ChangesEnvironment=no

;[Code]
;function UnityEditorDir(Param: string): String;
;var
;  V: string;
;begin
;  if RegQueryStringValue(HKCU, 'Software\Unity Technologies\Unity Editor 4.x\Location', '', V) then
;    Result := ExtractFileDir(V);
;end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Types]
Name: full; Description: "Install full ARToolKit for Unity, including plugins, utilities, examples, and required editor runtime support."
Name: minimal; Description: "Install minimal ARToolKit for Unity, including only plugins and utilities."
Name: custom; Description: "Choose which parts of ARToolKit for Unity to install."; Flags: iscustom

[Components]
Name: plugins; Description: "ARToolKit for Unity plugins"; Types: full minimal custom; Flags: fixed
Name: utils; Description: "Essential ARToolKit for Unity utilities"; Types: full minimal custom; Flags: fixed
Name: examples; Description: "Examples of ARToolKit for Unity"; Types: full custom
Name: runtime; Description: "Install required DLLs for using the plugin in the Unity Editor"; Types: full custom

[InstallDelete]
; Here we remove obsolete files from earlier versions.
; Examples:
; Type: filesandordirs; Name: "{app}\somefolder\*"
; Type: files; Name: "{app}\somefile";
; Removed from v5.1.7
Type: files; Name: "{app}\ARToolKit5-Unity.unitypackage";
Type: files; Name: "{app}\bin\opencv_core246.dll";
Type: files; Name: "{app}\bin\opencv_calib3d246.dll";
Type: files; Name: "{app}\bin\opencv_imgproc246.dll";
Type: files; Name: "{app}\bin\opencv_flann246.dll";
Type: files; Name: "{app}\bin\opencv_features2d246.dll";
Type: files; Name: "{app}\redist\opencv_core246.dll";
Type: files; Name: "{app}\redist\opencv_flann246.dll";
Type: files; Name: "{app}\Assets\ARToolKit for Unity Readme.txt";
Type: files; Name: "{pf32}\Unity\Editor\opencv_core246.dll";
Type: files; Name: "{pf32}\Unity\Editor\opencv_flann246.dll";
; Removed from v5.0.5
Type: files; Name: "{app}\redist\msvcp71.dll";
Type: files; Name: "{app}\redist\msvcr71.dll";
Type: files; Name: "{app}\bin\msvcp71.dll";
Type: files; Name: "{app}\bin\msvcr71.dll";
; Removed from v5.0
Type: files; Name: "{app}\ARToolKit4Unity.unitypackage";
Type: files; Name: "{app}\bin\opencv_core220.dll";
Type: files; Name: "{app}\bin\opencv_calib3d220.dll";
Type: files; Name: "{app}\bin\opencv_imgproc220.dll";
Type: files; Name: "{app}\bin\opencv_flann220.dll";
Type: files; Name: "{app}\bin\opencv_features2d220.dll";
Type: files; Name: "{app}\bin\opencv_highgui220.dll";
Type: files; Name: "{app}\redist\opencv_core220.dll";
Type: files; Name: "{app}\redist\opencv_flann220.dll";
Type: files; Name: "{pf32}\Unity\Editor\opencv_core220.dll";
Type: files; Name: "{pf32}\Unity\Editor\opencv_flann220.dll";

[Files]
; Plugins
Source: "ARToolKit for Unity Readme.txt"; Components: plugins; DestDir: "{app}"; Flags: ignoreversion isreadme
Source: "Assets\*"; Components: plugins; DestDir: "{app}\Assets"; Flags: recursesubdirs ignoreversion
;Source: "Library\*"; Components: plugins; DestDir: "{app}\Library"; Flags: recursesubdirs ignoreversion
Source: "ProjectSettings\*"; Components: plugins; DestDir: "{app}\ProjectSettings"; Flags: recursesubdirs ignoreversion
;Source: "ARToolKit5-Unity.unitypackage"; Components: plugins; DestDir: "{app}"; Flags: ignoreversion
Source: "redist\*"; Excludes: ".svn\*"; Components: plugins; DestDir: "{app}\redist"; Flags: recursesubdirs ignoreversion
Source: "redist64\*"; Excludes: ".svn\*"; Components: plugins; DestDir: "{app}\redist64"; Flags: recursesubdirs ignoreversion

; Utilities
Source: "bin\mk_patt.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\calib_camera.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\calib_optical.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\calib_stereo.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\check_id.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\genMarkerSet.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\genTexData.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\checkResolution.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\dispImageSet.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\dispFeatureSet.exe"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\Data\*"; Excludes: ".svn\*"; Components: utils; DestDir: "{app}\bin\Data"; Flags: recursesubdirs ignoreversion comparetimestamp
Source: "bin\ARvideo.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\DSVL.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\pthreadVC2.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\glut32.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\opencv_calib3d2410.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\opencv_core2410.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\opencv_features2d2410.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\opencv_flann2410.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion
Source: "bin\opencv_imgproc2410.dll"; Components: utils; DestDir: "{app}\bin"; Flags: ignoreversion

; Examples
;Source: "Examples\*"; Excludes: ".svn\*"; Components: examples; DestDir: "{app}\Examples"; Flags: recursesubdirs ignoreversion
Source: "doc\*"; Excludes: ".svn\*"; Components: examples; DestDir: "{app}\doc"; Flags: recursesubdirs ignoreversion
Source: "extras\*"; Excludes: ".svn\*"; Components: examples; DestDir: "{app}\extras"; Flags: recursesubdirs ignoreversion
Source: "share\packaging\ARToolKit for Unity Windows.iss"; Components: examples; DestDir: "{app}\share\packaging"; Flags: ignoreversion

; Runtime
Source: "redist\ARvideo.dll"; Components: runtime; DestDir: "{pf32}\Unity\Editor"; Flags: ignoreversion
Source: "redist\DSVL.dll"; Components: runtime; DestDir: "{pf32}\Unity\Editor"; Flags: ignoreversion
Source: "redist\pthreadVC2.dll"; Components: runtime; DestDir: "{pf32}\Unity\Editor"; Flags: ignoreversion
Source: "redist\opencv_core2410.dll"; Components: runtime; DestDir: "{pf32}\Unity\Editor"; Flags: ignoreversion
Source: "redist\opencv_flann2410.dll"; Components: runtime; DestDir: "{pf32}\Unity\Editor"; Flags: ignoreversion

[Icons]
Name: "{group}\Open ARUnity directory"; Filename: "{app}";
Name: "{group}\Open command console in ARUnity binaries directory"; Filename: "{cmd}"; WorkingDir: "{app}\bin"
Name: "{group}\ARToolKit for Unity - Home (www)"; Filename: "http://www.artoolkit.org/"
Name: "{group}\ARToolKit for Unity - Documentation (www)"; Filename: "http://www.artoolkit.org/documentation"
Name: "{group}\{cm:UninstallProgram,ARToolKit for Unity}"; Filename: "{uninstallexe}"

[Run]
Filename: {app}\redist\vcredist_x86.exe; Components: runtime; Parameters: "/install /quiet /norestart"; StatusMsg: Installing Visual Studio 2013 RunTime...
