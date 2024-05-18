@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64"
set path=P:\services\MyFirstService;%path%

set CommonCompilerFlags=-MTd -nologo -fp:fast -Gm- -GR- -EHsc -EHa- -Zo -O2 -Oi -WX -W3 -wd4201 -wd4100 -wd4189 -wd4505 -wd4127 -DHANDMADE_INTERNAL=1 -DHANDMADE_SLOW=1 -DHANDMADE_WIN32=1 -FC -Z7
set CommonLinkerFlags= -incremental:no -opt:ref -subsystem:windows Kernel32.lib Advapi32.lib

IF NOT EXIST .\build mkdir .\build
pushd .\build

cl %CommonCompilerFlags% ..\code\win32_service.cpp -Fmwin32_service.map -LD /link %CommonLinkerFlags%

popd