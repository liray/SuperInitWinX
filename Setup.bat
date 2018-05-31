@ECHO off

rem * File��Setup.bat
rem * Version��v0.0.1
rem * Encoding��ANSI
rem * Author��Ray Li
rem * Date��May 21st 2018
rem ********************************************************************
rem *                                                                  *
rem *     ��������ʵ�����û������ʼ�� Windows 10 ϵͳ, ���ֲ��������� *
rem * ��ʵ�ֵĹ������ֶ������Ż�, ��ϸ�뿴�����ĵ�( readme.md ), �Ż�  *
rem * ��Ŀ��ϸ�������ͨ���鿴�� reg �ļ��˽�.                         *
rem *                                                                  *
rem ********************************************************************

PUSHD %~dp0

MODE con cols=82 lines=25
COLOR 9f
CALL :detectos

:mainmenu
rem �ӹ���:
rem   mainmenu
rem       �������˵�, �������
COLOR 9f
CALL :initvars
REM ����ϴβ˵�ѡ��
set choi=
cls
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.                      * ================================= *
ECHO.                      *                                   *
ECHO.                      *     Windows 10 ϵͳ��ʼ������     *
ECHO.                      *                                   *
ECHO.                      * ================================= *
ECHO.
ECHO.
ECHO.    * ===================================================================== *
ECHO.    *                                                                       *
ECHO.    *          [1] ���뵱ǰ���õ���ǰϵͳ                                   *
ECHO.    *                                                                       *
ECHO.    *          [2] ������Ҫ�ֶ����õĵط�                                   *
ECHO.    *                                                                       *
ECHO.    *          [0] �˳�����                                                 *
ECHO.    *                                                                       *
ECHO.    * ===================================================================== *
ECHO.
ECHO.
CALL :uibottom
set /p choi=-* ��ѡ���Ż�ѡ�� ( 0 - 2 ): 
IF not defined choi GOTO :mainmenu
cls
IF %choi%==1 (
    CALL :reg_com
    PAUSE
)
IF %choi%==2 GOTO :childmanualoptimizemenu
IF %choi%==4 GOTO :supportus
IF %choi%==0 GOTO :end
GOTO :mainmenu

:childmanualoptimizemenu
rem �ӹ���:
rem   childmanualoptimizemenu
rem       ���˵�ѡ��3 ---- �Ӳ˵� ������Ҫ�ֶ��Ż��ĵط�
REM ����ϴβ˵�ѡ��
set choi=
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.
ECHO.                              [1] ��� �ֶ��Ż�˵���ĵ�
ECHO.
ECHO.
ECHO.
ECHO.        [2] �� ����������                   [5] ���û�ر� Windows ����
ECHO.
ECHO.        [3] ���û�ر�������֪ͨ��ϵͳͼ��    [6] �� �Ż�����������
ECHO.
ECHO.        [4] �� ��Դѡ��                     [7] �� ϵͳ���Ը߼�ѡ�
ECHO.
ECHO.
ECHO.
CALL :uibacktomain
ECHO.
CALL :uibottom
set /p choi=-*��ѡ���Ż�ѡ�� ( 0 - 7 ): 
IF not defined choi GOTO :childmanualoptimizemenu
cls
IF %choi%==1 CALL :openhelpdoc
IF %choi%==2 CALL :uiopentaskbarprops
IF %choi%==3 CALL :uinotificationsystemiconsettings
IF %choi%==4 CALL :uipowercfg
IF %choi%==5 CALL :uiopenof
IF %choi%==6 CALL :uiopendefragui
IF %choi%==7 CALL :uiopensysdmadvace
IF %choi%==0 GOTO :mainmenu
GOTO :childmanualoptimizemenu

:uiopentaskbarprops
rem �ӳ���:
rem   uiopentaskbarprops
rem       UI ---- ������������, ����ʾ������Ϣ
CALL :opentaskbarprops
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    ��������������ѡ���޷���ע����Ż�, ��������Ҫ���������������ֶ�����.
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uinotificationsystemiconsettings
rem �ӳ���:
rem   uinotificationsystemiconsettings
rem       UI ---- �����û�ر�������ϵͳͼ������, ����ʾ������Ϣ
CALL :opennotificationsystemiconsettings
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    ����֪ͨ�����ϵͳͼ����ʱ�޷���ע������ùرջ���, ����Ҫ����"��
ECHO.  ������"��ͼ������ֶ�����.
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uipowercfg
rem �ӳ���:
rem   uipowercfg
rem       UI ---- �򿪵�Դѡ��, ����ʾ������Ϣ
CALL :openpowercfg
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    ��Դѡ��������ñȽϿ��׵Ļ����ֶ�����, �����������:
ECHO.       1. �޸�˯�ߺ���Ļ�ر�ʱ��.
ECHO.       2. ���û�����˯��, ��...
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopenof
rem �ӳ���:
rem   uiopenof
rem       UI ---- ��"���û�ر� Windows ����", ����ʾ������Ϣ
CALL :openof
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    ������ر� һЩ Windows ����, ����ǿ���ͨ����������������, ���˱Ƚ�
ECHO.  ϲ���ֶ�, ����:
ECHO.       1. �ر� Զ�̲��ѹ��
ECHO.       2. ��� .Net Framework 3.5 (���� .NET 2.0 �� 3.0), ��...
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopentaskschd
rem �ӳ���:
rem   uiopentaskschd
rem       UI ---- �򿪼ƻ��������, ����ʾ������Ϣ
CALL :opentaskschd
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    ���ڼƻ���������޷�ͨ��ע������޸�, ������Ҫ�Ż��ĵط�Ҳ�Ƚ϶�, ��
ECHO.  �߿������ĵ�(help_doc.txt), ���޸�!
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopensysdmadvace
rem �ӳ���:
rem   uiopensysdmadvace
rem       UI ---- ��ϵͳ���Ը߼�ѡ�, ����ʾ������Ϣ
CALL :opensysdmadvace
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    ^> ȥ��һЩ �Ӿ�Ч��(�߼�-�Ӿ�Ч��), ����:
ECHO.       1. �����ڵĶ����ؼ���Ԫ��
ECHO.       2. ���뵭���򻬶��˵�����ͼ
ECHO.       3. ��������Ͽ�
ECHO.       4. �������еĶ���
ECHO.       5. �ڵ����󵭳��˵�
ECHO.       6. ����ͼ�е��뵭���򻬶�������ʾ
ECHO.       7. ����󻯺���С��ʱ��ʾ���ڶ���
ECHO.
ECHO.    ^> ���� �����ڴ� ����λ�úʹ�С, ����ʹ��ϵͳ�й�!
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopendefragui
rem �ӳ���:
rem   uiopendefragui
rem       UI ---- ���Ż�����������Ƭ���������ý���
CALL :opendefragui
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  ������ʾ:
ECHO.
ECHO.    �����Ż��������޷�ͨ���������޸���Ҫ�Ż���Ӳ�����ͣ�һ��ֻ�Թ�̬Ӳ��
ECHO.  �ķ����������Ż�����Ƭ����������еӲ�̵ķ�������ȡ����ѡ��������Ƭ��
ECHO.  ��
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof


:uimanualoptimizetitle
rem �ӳ���:
rem   uimanualoptimizetitle
rem       UI ---- ���˵�ѡ��3���Ӳ˵�����
ECHO.                      * ================================= *
ECHO.                      *              �ֶ�����             *
ECHO.                      *                  -- Win10 ����    *
ECHO.                      * ================================= *
GOTO :eof

:uiback
REM �ӳ���:
REM   uiback
REM       UI ---- ��ʾ�����������
ECHO.                              ^>^> ����������� ^<^<
GOTO :eof

:uibacktomain
REM �ӳ���:
REM   uibacktomain
REM       UI ---- ��ʾ�ص����˵�ѡ��
ECHO.                              [0] �� �� �� �� ��
GOTO :eof

:uibottom
REM �ӳ���:
REM   uibottom
REM       UI ---- ��ʾ�ײ�����
ECHO. ===============================================================================
GOTO :eof

:supportus
REM �ӳ���:
REM   supportus
REM       ���˵�4 ---- ��ʾ��л֧��������Ϣ.
CALL :opensite
cls
ECHO. * =========================================================================== *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                          ** Windows 10 ϵͳ���� **                          *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                             ��л����ϲ����֧��!                             *
ECHO. *                                                                             *
ECHO. *                                 Thank you !                                 *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                         ^>^> �밴������ص����˵� ^<^<                          *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. * =========================================================================== *
PAUSE>nul
GOTO :mainmenu

rem ==================================== ���� ====================================

:initvars
rem �ӳ���:
rem   initvars
rem       ����ʱ��ʼ���ı���
rem ����:
rem   f_reg_com
rem       ͨ��ע����Ż��ļ�·������ʱ����
rem   f_serv_cfg
rem       ϵͳ�����Ż������ļ�·��
rem   f_emp_pic
rem       ��ݷ�ʽ��Ҫ�õ���͸��ͼ���·��
rem   f_help_doc
rem       �Ż������ĵ���·��
rem   f_reg_readme
rem       ע�������˵���ĵ���·����ע���Դ�ĵ��Ŀ��Ի�����
rem   f_reg
rem       ����f_reg_readmeָ����ע�������˵���ĵ������ɵ�ע����ļ�·��
rem   f_grand_control_4_reg
rem       ��¼����Ҫ��Ȩ����Ȩ��ע�������ļ���·��
rem   power_ac_monitor_timeout
rem       �������ӵ�Դ������£������ӹرպ�ر���ʾ����
rem       ����Ϊ0ʱΪ���ر���ʾ��
rem   power_ac_standby_timeout
rem       �������ӵ�Դ������£������ӽ���˯��״̬��
rem       ����Ϊ0ʱΪ��ֹ����˯��
rem   power_dc_monitor_timeout
rem       ����ʹ�õ�ص�����£������ӹرպ�ر���ʾ����
rem       ����Ϊ0ʱΪ���ر���ʾ��
rem   power_dc_standby_timeout
rem       ����ʹ�õ�ص�����£������ӽ���˯��״̬��
rem       ����Ϊ0ʱΪ��ֹ����˯��
set f_reg_com=.\reg\settings_%os_lang%.reg
set f_serv_cfg=.\cfg\services.ini
set f_scht_cfg=.\cfg\schedules.ini
set f_emp_pic=.\res\Empty.ico
set f_help_doc=.\readme.md
set f_reg_readme=.\reg\readme.md
set f_reg=.\reg\settings_zh.reg
set f_grand_control_4_reg=.\reg\grand_control.ini
set power_ac_monitor_timeout=60
set power_ac_standby_timeout=0
set power_dc_monitor_timeout=10
set power_dc_standby_timeout=10
GOTO :eof

rem ==================================== �߼� ====================================

:detectos
rem �ӳ���:
rem   detectos
rem       ���ϵͳ�汾, ���԰汾
rem ����:
rem   os_lang
rem       ���ϵͳ����, "cn" �� "en"
rem   os_ver
rem       ���ϵͳ�汾
rem   f_sysinfo
rem       ����SYSTEMINFO�������ɵ���ʱ�ļ�·�����ļ���
)
:: ����������Ƿ��Թ���Ա��ʽ����
set test_filename=C:\UAC_TEST.TXT
echo BAT TEST UAC IN TEMP.>%test_filename%
if exist %test_filename% (
    del /f /q %test_filename%
) else (
    cls
    color 47
    ECHO. ����:
    ECHO.
    ECHO.   ��װʧ�ܣ�û���㹻��Ȩ�ޣ�
    ECHO.
    ECHO.   ��رճ�����Ҽ��˵���ѡ���Թ���Ա������г���
    ECHO.
    ECHO.                            ^>^> ��������رճ��� ^<^<
    PAUSE>nul
    GOTO :end
)
ECHO. ���ڼ�����ϵͳ, ���Ե�...
set os_lang=
set os_ver=
set f_sysinfo=_sysinfo.tmp
SYSTEMINFO > %f_sysinfo%
rem ��⵱ǰϵͳ�Ƿ�Ϊ�����������Ի�Ӣ�İ�
FOR /f "tokens=1" %%i IN ( 'FINDSTR /c:"������" %f_sysinfo%') DO (
    IF /i "%%i"=="������:" (
        set os_lang=cn
        set str_osver_cn=OS �汾
        set str_osname_cn=OS ����
    )
)
FOR /f "tokens=1" %%i IN ( 'FINDSTR /c:"Host Name" %f_sysinfo%') DO (
    IF /i "%%i"=="Host" (
        set os_lang=en
        set str_osver_en=OS Version
        set str_osname_en=OS Name
    )
)
IF "%os_lang%"=="" (
    color 47
    ECHO. ����:
    ECHO.
    ECHO.   ����֧������ϵͳ���԰汾, ��ʹ�ü������İ��Ӣ�İ�.
    ECHO.
    ECHO.                            ^>^> ��������رճ��� ^<^<
    PAUSE>nul
    GOTO :end
)
setlocal enabledelayedexpansion
rem ��⵱ǰϵͳ�汾
FOR /f "tokens=3" %%i IN ( 'FINDSTR /r /c:"^!str_osver_%os_lang%!" %f_sysinfo%') DO (
    IF not "%%i"=="10.0.16299" (
        color 47
        ECHO. ����:
        ECHO.
        ECHO.   ����֧�����ϵͳ�汾, �ó���ֻ֧�� Windows 10 ϵͳ!
        ECHO.
        ECHO.                            ^>^> ��������رճ��� ^<^<
        PAUSE>nul
        GOTO :end
    )
)
rem ��⵱ǰϵͳ����
FOR /f "tokens=5" %%i IN ( 'FINDSTR /r /c:"^!str_osver_%os_lang%!" %f_sysinfo%' ) DO (
    IF not "%%i"=="10" (
        color 47
        ECHO. ����:
        ECHO.
        ECHO.   �����Ż��ݲ�֧�ַ�������ϵͳ, �ó���ֻ֧�� Windows 10 ϵͳ!
        ECHO.
        ECHO.                            ^>^> ��������رճ��� ^<^<
        PAUSE>nul
        GOTO :end
    )
)
endlocal
rem �Ƴ���ʱ�ļ�
DEL /f /q ".\%f_sysinfo%"
set os_ver=
set f_sysinfo=
set str_osver_%os_lang%=
set str_osname_%os_lang%=
GOTO :eof

:reg_com
rem �ӳ���:
rem   reg_com
rem       �Զ���ʼ��������
rem ���ƿ�ݷ�ʽ͸��ͼ�굽Windows�ļ���
taskkill /f /im explorer.exe
IF EXIST "%Windir%\Empty.ico" (
    DEL /f /q "%Windir%\Empty.ico"
    IF EXIST "%Windir%\Empty.ico" (
        color 47
        ECHO ����: ��û���㹻��Ȩ��, ��ʹ�ù���Ա�������!
        ECHO       ����ʧ��,û��ȥ����ݷ�ʽͼ���ͷ!
        GOTO :eof
    )
)
XCOPY /q "%f_emp_pic%" "%Windir%\"
IF not EXIST "%Windir%\Empty.ico" (
    color 47
    ECHO ����: ��û���㹻��Ȩ��, ��ʹ�ù���Ա�������!
    ECHO       ����ʧ��,û��ȥ����ݷ�ʽͼ���ͷ!
    GOTO :eof
)
rem ȥ���Ҽ�"���͵�"����˵�
CALL :del_sdto
rem ִ�з�������
CALL :servicestweaks
rem ִ������ƻ�����
CALL :schedulestweaks
rem �ؽ�����ͼ�껺��
CALL :rebuild_icon_cache
rem ��Դ����
CALL :monitor_and_standby_timeout_cfg %power_ac_monitor_timeout% %power_ac_standby_timeout% %power_dc_monitor_timeout% %power_dc_standby_timeout%
rem ж��OneDrive
CALL :uninstall_onedrive
rem ����ע�������
call :regtweak
echo.
echo �����������ԣ�����ر�......
shutdown -r -t 3
GOTO :eof

:servicestweaks
rem �ӳ���:
rem     servicestweaks
rem         �Ż�ϵͳ����
CALL :inifile %f_serv_cfg%
if not defined sections (
    echo servicestweaks: sections no defined!
) else (
    setlocal EnableDelayedExpansion
    for %%a in ( %sections% ) do (
        CALL :inifile %f_serv_cfg% %%a status
        sc config %%a start= !status! >nul
        IF not errorlevel 0 (
            IF not defined err_serv (
                set err_serv=%%a
            ) else (
                set err_serv=!err_serv! %%a
            )
        )
    )
    for /f "delims=" %%i in ( "err_serv=!err_serv!" ) do (
        endlocal & set %%i
    )
)
call :inifile /gc
IF defined err_serv (
    color 47
    ECHO ��Щ�����޷�����:%err_serv%
    GOTO :eof
)
GOTO :eof

:schedulestweaks
rem �ӳ���:
rem     schedulestweaks
rem         �Ż�����ƻ�
CALL :inifile %f_scht_cfg%
if not defined sections (
    echo schedulestweaks: sections no defined!
) else (
    setlocal EnableDelayedExpansion
    for %%a in ( %sections% ) do (
        CALL :inifile %f_scht_cfg% %%a location
        CALL :inifile %f_scht_cfg% %%a status
        schtasks /Change /!status! /tn "!location!">nul
        IF not errorlevel 0 (
            IF not defined err_scht (
                set err_scht=%%a
            ) else (
                set err_scht=!err_scht! %%a
            )
        )
    )
    endlocal & set "err_scht=%err_scht%"
)
call :inifile /gc
IF defined err_scht (
    color 47
    ECHO ��Щ����ƻ��޷�����:%err_scht%
    GOTO :eof
)
GOTO :eof

:regtweak
rem �ӳ���:
rem     tweaksreg
rem         ����ע�������
call :ignorelines4reg "%f_reg_readme%" "%f_reg%"
if exist "%f_reg%" (
    call :grand_control_for_reg %f_grand_control_4_reg%
    reg import "%f_reg%" > nul
    IF errorlevel 1 (
        color 47
        ECHO ����: ��û���㹻��Ȩ��, ����ע�����Ƿ�����ɾ��Ȩ��!
        ECHO       ע����Ż�����: "%f_reg%" !
    ) ELSE (
        ECHO ע����Ż��ɹ�!
    )
    call :grand_control_for_reg /d %f_grand_control_4_reg%
    del /f /q "%f_reg%"
) else (
    color 47
    ECHO ����: û������reg�ļ�
    ECHO       ע����Ż�����: δ�ҵ��ļ� "%f_reg%" !
)
goto :eof

:grand_control_for_reg
rem �ӳ���:
rem     grand_control_for_reg [/d] filepath
rem         Ϊע����ֵ��Ȩ��Ȩ,ʹ�����޸Ļ��ֹ�޸�ע����ֵ.
rem ����:
rem     /d
rem         ��ѡ����.
rem         ʹ�øò�����ʱ���Ƕ�ע�����н�Ȩ����;
rem         ��ʹ�øò���ʱ�Ƕ�ע��������Ȩ����.
rem     filepath
rem         ��¼����Ҫ��Ȩ����Ȩ��ע�������ļ���·����
setlocal
set "f_grand_control_4_reg="
if "%~1"=="" (
    echo ��Ч�Ĳ���������
    endlocal & goto :eof
)

if not "%~3"=="" (
    echo ��Ч�Ĳ���������
    endlocal & goto :eof
)

if "%~1"=="/d" (
    if "%~2"=="" (
        echo ��Ч�Ĳ���������
        endlocal & goto :eof
    ) else (
        if not exist "%~2" (
            echo �Ҳ���Ŀ���ļ� - "%~2" ��
            endlocal & goto :eof
        ) else (
            set "f_grand_control_4_reg=%~2"
            set "control=[19 2]"
        )
    )
) else (
    if not exist "%~1" (
        echo �Ҳ���Ŀ���ļ� - "%~1" ��
        endlocal & goto :eof
    ) else (
        set "f_grand_control_4_reg=%~1"
        set "control=[1 7]"
    )
)

rem ���ɷ���reginiʹ�õ������ļ�
set "f_regini=.\regset.ini"
(
    for /f "eol=; delims=" %%i in ('type "%f_grand_control_4_reg%"') do (
        echo.%%i %control%
    )
)>%f_regini%

rem ִ��regini����Ȩ��
if exist "%f_regini%" (
    rem �ж��ļ��Ƿ�Ϊ��
    for %%a in ("%f_regini%") do (
        if not "%%~za" equ "0" (
            regini "%f_regini%"
        )
    )
    del /f /q "%f_regini%"
) else (
    color 47
    ECHO ������ %f_regini% �ļ�, �޷��޸�ע����ֵȨ��!
    endlocal & GOTO :eof
)
endlocal
goto :eof

:inifile
rem �ӳ���:
rem     inifile [/gc] inifilepath [section] [key]
rem         ����INI�ļ�,��ȡ"��"��"ֵ"
rem ����:
rem     /gc
rem         ��ѡ, �ֶ�������������
rem     inifilepath
rem         ��ѡ, ָ��INI�ļ���·��
rem     section
rem         ��ѡ, ָ��"��"
rem     key
rem         ��ѡ, ָ��"��"
rem ����:
rem     exit_code
rem         ���ú�Ӱ��ERRORLEVEL��ֵ
rem ���صı�����ֵ:
rem     gc_key
rem         ���ص�"��"��ֵ, Ϊ�˷�����������
rem     key_and_value
rem         ����"��=ֵ"��ʽ����
rem     sections
rem         �������нڣ��Կո�ָ�ÿ��
rem ʾ��:
rem     inifile services.ini
rem         ��ȡ��ǰ·��services.ini�������"��", ����sections������ȡ
rem     inifile services.ini "[DiagTrack]" status
rem         ��ȡ��ǰ·��services.ini��"��"Ϊ[DiagTrack]��"��"Ϊstatus��ֵ, ����
rem         "��"��Ϊ������(����ı���Ϊstatus)��ȡֵ
rem     inifile /gc
rem         ��ɽ���INI�ļ���, ������������

::��ʼ������
:: out name of vars
::set out_nov_sections=
::set out_nov_key=
::set out_nov=

set exit_code=

:: �ж�INI�ļ��Ƿ����, �ж��Ƿ������������
if not "%~1"=="" (
    if "%~1"=="/gc" (
        CALL :inifile_gc
        GOTO :eof
    ) else (
        set inifilepath=%1
    )
) else (
    goto :file_err
)
if not exist %inifilepath% (
    goto :file_err
)

:: �����INI�ļ����С��ڡ�
if "%~2"=="" (
    CALL :inifile_getsections
    GOTO :eof
)

:: ��ȡ"��"��ֵ
setlocal
set "section=%~2"
set "key=%~3"

call :inifile_main
endlocal & (
    set "key_and_value=%key_and_value%"
) & (
    if defined key_and_value (
        set "%key_and_value%"
        set gc_key=%gc_key%
    )
)
goto :eof

:inifile_gc
rem �ӳ���:
rem     inifile_gc
rem         ���inifile�ӳ������ɵ����б���, ��������
if defined gc_key (
    set %gc_key%=
    set gc_key=
)
set key_and_value=
set inifilepath=
set exit_code=
set sections=
GOTO :eof

:inifile_main
rem �ӳ���:
rem     inifile_main
rem         ����INI�ļ�, ��ȡָ�����ڡ��¡������ġ�ֵ��
rem ����:
rem     start_line_no
rem         ָ��"��"�����ļ��еĿ�ʼ��

set start_line_no=
:: �ҳ�ָ�������ڵڼ���
for /f "usebackq delims=[] skip=2" %%i in (`find /i "%section%" /n %inifilepath%`) do (
    set start_line_no=%%i
)
:: ��û���ҵ�ָ���Ľ������У���ֹͣ����ִ��
if not defined start_line_no (
    GOTO :eof
) else (
    if "%start_line_no%"=="" (
        goto :eof
    )
)
:: ѭ����ָ�����»�ȡ�������ġ�ֵ��
for /f "eol=; usebackq tokens=1* skip=%start_line_no% delims==" %%i in (`type %inifilepath%`) do (
    call :inifile_getkeyandvalue "%%i" "%%j"
    ::ǿ���˳���������һ���˳�����
    if defined exit_code (
        exit /b %exit_code%
    )
)
goto :eof

:inifile_getkeyandvalue
rem �ӳ���:
rem     inifile_getkeyandvalue key value
rem         ȡ��"��"��ֵ
rem ����:
rem     key
rem         ����, ָ����Ҫ���ҵ�"��"
rem     value
rem         ����, "��"��Ӧ��ֵ

set "cur_key=%~1"
:: ��������ǰ��Ŀո�
setlocal EnableDelayedExpansion
call :trim cur_key
endlocal & set "cur_key=%cur_key%"
:: �����ȡ���ĵ�һ���ַ���"["��˵�������Ѿ�������ɡ��˳�������0
if "%cur_key:~0,1%"=="[" (
    set exit_code=0&goto :eof
)
:: ��ΪINI�ļ�һ�㡰;���Ժ���ע�ͷ�������ȥ��ע�͡�
for /f "delims=;" %%x in ("%cur_key%=%~2") do (
    if not DEFINED key (
        echo %%x
    ) else (
        :: �ж��Ƿ��Ѿ��ҵ���ָ����"��"
        if /i "%cur_key%"=="%key%" (
            set exit_code=0
            set "key_and_value=%%x"
            set "gc_key=%cur_key%"
        )
    )
)
goto :eof

:inifile_getsections
rem �ӳ���:
rem     inifile_getsections
rem         ��ȡINI�ļ��������еġ��ڡ�
rem ���ر�����ֵ:
rem     sections
rem         ����INI�ļ���������"��"
setlocal EnableDelayedExpansion
set sections=
set section_tmp=
for /f "eol=; usebackq delims== skip=2" %%a in (`find /i "[" %inifilepath%`) do (
    :: ȥ�����ڡ�ǰ��������
    set section_tmp=%%a
    set section_tmp=!section_tmp:~1!
    set section_tmp=!section_tmp:~0,-1!
    :: �����еĽڷ���һ���ֶ��У��Ա����
    if not defined sections (
        set sections=!section_tmp!
    ) else (
        set sections=!sections! !section_tmp!
    )
)
endlocal & set "sections=%sections%"
goto :eof

:trim
rem �ӳ���:
rem     trim str
rem         ȥ���ַ����������ߵĿո���Ʊ��
rem ����:
rem     str
rem         ����, ��Ҫȥ�����߿ո���ַ���
rem ʾ�����룺
rem set "str=	   abcde    	  "
rem echo before: %str%
rem setlocal EnableDelayedExpansion :: ע��ʹ��ǰ�������ӳٱ�����
rem call :trim str                  :: ���ﴫ��ı������������Ǳ�����ֵ!
rem endlocal & set str=%str%        :: ע��������ȡ�Ĺ̶�д�����벻Ҫ�ֿ�д��
rem echo after: %str%

:: ɾ���ַ���ǰ�����пո�
if "!%1:~0,1!"==" " (
    set %1=!%1:~1!
    goto :trim
)
:: ɾ���ַ���ǰ�������Ʊ��
if "!%1:~0,1!"=="	" (
    set %1=!%1:~1!
    goto :trim
)
:: ɾ���ַ����������пո�
if "!%1:~-1!"==" " (
    set %1=!%1:~0,-1!
    goto :trim
)
:: ɾ���ַ������������Ʊ��
if "!%1:~-1!"=="	" (
    set %1=!%1:~0,-1!
    goto :trim
)
goto :eof

:file_err
rem �ӳ���:
rem     file_err [filepath]
rem         ��ʾ����, û���ҵ�ָ�����ļ�
rem ����:
rem     filepath
rem         ��ѡ, �ļ�·��
echo.
echo %1�ļ�δ�ҵ���δ����!
echo.
exit /b 100
goto :eof

:grand_admin_full_control_for_dir_and_files
rem �ӳ���:
rem     grand_admin_full_control_for_dir_and_files filepath
rem         �����ļ��л��ļ�ȡ�ù���Ա����Ȩ��
rem ����:
rem     filepath
rem         �ļ��л��ļ�·��
takeown /f "%~1" /r /d y && icacls "%~1" /grant administrators:F /t
goto :eof

:ignorelines4reg
rem �ӳ���:
rem     ignorelines4reg 
rem         ��.\reg\readme.md�ļ�ת��Ϊreg�ļ�
rem ����:
rem     sc_filepath
rem         Դ�ļ�����Ҫת�����ļ��ľ��Ի����·����
rem     tg_filepath
rem         Ŀ���ļ���ת��Ϊreg�ļ��ľ��Ի����·����
setlocal
if "%1"=="" (
    echo ��Ч�Ĳ���������
    exit /b 4
)

if not exist "%~1" (
    echo �Ҳ���Ŀ���ļ� - %~1 ��
    exit /b 4
)

if /i "%~1"=="%~2" (
    echo ������Ŀ���ļ�����Ŀ���ļ���������ͬ��
    exit /b 4
)

if exist "%~2" (
    del /f /q "%~2"
)

set "input_filepath=%~1"
set "output_filepath=%~2"

rem REG��ͷ����
echo Windows Registry Editor Version 5.00>%output_filepath%
echo.>>%output_filepath%

rem �����ж�д�����ļ�
for /f "eol== skip=3 delims=" %%a in ('findstr /i /n .* "%input_filepath%"') do (
    setlocal enabledelayedexpansion
    set "line=%%a"
    set "line=!line:*:=!"

    rem ����Ϊ���У�������С�
    if defined line (
        set "tmp=!line: =!"
        rem ����ȫΪ�ո�Ŀ��У�������С�
        if /i not "!tmp!"=="" (
            set "first_char_of_line=!tmp:~0,1!"
            rem �����׸��ַ�Ϊ˫����ʱ��������ı���
            if "!first_char_of_line!!first_char_of_line!"=="""" (
                echo !line!>>%output_filepath%
            ) else (
                rem �����׸��ַ�Ϊ"["ʱ��������ı���
                if "!first_char_of_line!"=="[" (
                    echo !line!>>%output_filepath%
                ) else (
                    rem �����׸��ַ�Ϊ"["ʱ��������ı���
                    if "!first_char_of_line!"=="@" (
                        echo !line!>>%output_filepath%
                    )
                )
            )
        ) else (
            echo.>>%output_filepath%
        )
    ) else (
        echo.>>%output_filepath%
    )

    endlocal
)
endlocal
goto :eof

:uninstall_onedrive
rem �ӳ���:
rem     uninstall_onedrive [/a]
rem         ж�غ����ϵͳ�Դ���OneDrive
rem ����:
rem     /a
rem         ͬʱ���OneDrive�����ļ���ע�����
if not "%~1"=="" (
    if not "%~1"=="/a" (
        echo �﷨����
        exit /b 1
    )
)

taskkill /F /IM OneDrive.exe

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "onedrive_dir=%windir%\SysWOW64\OneDriveSetup.exe"
) else (
    if "%PROCESSOR_ARCHITECTURE%"=="x86" (
        set "onedrive_dir=%windir%\System32\OneDriveSetup.exe"
    )
)

:: ʹ��OneDriveж�س���
if not "%onedrive_dir%"=="" (
    "%onedrive_dir%" /uninstall
) else (
    echo δ�ҵ�OneDriveSetup.exe����
    goto :eof
)

:: ����ļ���ע�����
if "%~1"=="/a" (
    if exist "%onedrive_dir%" (
        taskkill /F /IM explorer.exe
        
        if exist "%USERPROFILE%\OneDrive" (
            rd /s /q "%USERPROFILE%\OneDrive"
        )
        
        if exist "%SystemDrive%\OneDriveTemp" (
            rd /s /q "%SystemDrive%\OneDriveTemp"
        )
        
        if exist "%LOCALAPPDATA%\Microsoft\OneDrive" (
            call :grand_admin_full_control_for_dir_and_files "%LOCALAPPDATA%\Microsoft\OneDrive"
            rd /s /q "%LOCALAPPDATA%\Microsoft\OneDrive"
        )
        
        if exist "%ProgramData%\Microsoft OneDrive" (
            rd /s /q "%ProgramData%\Microsoft OneDrive"
        )
        
        reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
        reg delete "HKEY_CURRENT_USER\Software\Classes\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
    )
)
goto :eof

:monitor_and_standby_timeout_cfg
rem �ӳ���
rem     monitor_and_standby_timeout_cfg power_ac_monitor_timeout power_ac_standby_timeout power_dc_monitor_timeout power_dc_standby_timeout
rem         �������ӵ�Դ��ʹ�õ��ʱ����Ļ�ر�ʱ����Զ�����˯��״̬��ʱ��
rem ����
rem     power_ac_monitor_timeout
rem         �������ӵ�Դ������£������ӹرպ�ر���ʾ����
rem         ����Ϊ0ʱΪ���ر���ʾ��
rem     power_ac_standby_timeout
rem         �������ӵ�Դ������£������ӽ���˯��״̬��
rem         ����Ϊ0ʱΪ��ֹ����˯��
rem     power_dc_monitor_timeout
rem         ����ʹ�õ�ص�����£������ӹرպ�ر���ʾ��
rem         ����Ϊ0ʱΪ���ر���ʾ��
rem     power_dc_standby_timeout
rem         ����ʹ�õ�ص�����£������ӽ���˯��״̬��
rem         ����Ϊ0ʱΪ��ֹ����˯��
:: ���ӵ�Դ�������磩ʱ��������Ļ�ر�ʱ����Զ�����˯��״̬��ʱ��(����)
powercfg /X monitor-timeout-ac %~1
powercfg /X standby-timeout-ac %~2
:: ʹ�õ�أ�ֱ���磩ʱ��������Ļ�ر�ʱ����Զ�����˯��״̬��ʱ��(����)
powercfg /X monitor-timeout-dc %~3
powercfg /X standby-timeout-dc %~4
goto :eof

:closeslp
rem �ӳ���
rem   closeslp
rem       �ر�˯�� �رջ������
powercfg /h off
IF errorlevel 1 (
    color 47
    ECHO ����: ��û���㹻��Ȩ��, ��ʹ�ù���Ա�������!
    ECHO       �ر�˯�� �رջ���������� !
) ELSE (
    ECHO �ѹر�˯�ߺͻ������, �뵽�������\��Դѡ�������ý���˯��!
)
GOTO :eof

:cplnkico
rem �ӳ���
rem   cplnkico
rem       ����͸��ͼ�굽 Windows �ļ���, ���Ż�����ݷ�ʽ��С��ͷ
IF EXIST "%Windir%\Empty.ico" (
    DEL /f /q "%Windir%\Empty.ico"
)
XCOPY /q "%f_emp_pic%" "%Windir%\"
IF not EXIST "%Windir%\Empty.ico" (
    color 47
    ECHO ����: ��û���㹻��Ȩ��, ��ʹ�ù���Ա�������!
    ECHO       ����ʧ��,û��ȥ����ݷ�ʽͼ���ͷ!
    PAUSE > nul
)
GOTO :eof

:rebuild_icon_cache
rem �ӳ���
rem     rebuild_icon_cache
rem         �ؽ�����ͼ�껺��
ATTRIB -s -r -h "%userprofile%\AppData\Local\iconcache.db"
DEL "%userprofile%\AppData\Local\iconcache.db" /f /q
ie4uinit -show
goto :eof

:del_sdto
rem �ӳ���:
rem   del_sdto
rem       ȥ���Ҽ�"���͵�"����˵�
rem ����:
rem   docfile_en
rem       Ӣ��ϵͳ�е�"���͵�-�ĵ�"���ļ���
rem   docfile_cn
rem       ����ϵͳ�е�"���͵�-�ĵ�"���ļ���
rem   sendtodir
rem       �Ҽ�"���͵�"��Ӧ��·��
set docfile_en=Documents.mydoc
set docfile_cn=�ĵ�.mydocs
set sendtodir=%APPDATA%\Microsoft\Windows\SendTo
rem 115����
IF EXIST "%sendtodir%\115����.lnk" (
    DEL /f /q "%sendtodir%\115����.lnk"
)
rem Compressed (zipped) folder
IF EXIST "%sendtodir%\Compressed (zipped) Folder.ZFSendToTarget" (
    DEL /f /q "%sendtodir%\Compressed (zipped) Folder.ZFSendToTarget"
)
rem Documents
setlocal enabledelayedexpansion
IF EXIST "%sendtodir%\!docfile_%os_lang%!" (
    DEL /f /q "%sendtodir%\!docfile_%os_lang%!"
)
endlocal
rem Fax recipient
IF EXIST "%sendtodir%\Fax Recipient.lnk" (
    DEL /f /q "%sendtodir%\Fax Recipient.lnk"
)
rem Mail Recipient
IF EXIST "%sendtodir%\Mail Recipient.MAPIMail" (
    DEL /f /q "%sendtodir%\Mail Recipient.MAPIMail"
)
set sendtodir=
set docfile_en=
set docfile_cn=
GOTO :eof

rem ���ô���������������Ŀ(ע����Ѱ���)
::cleanmgr /sageset:99

rem ����ϵͳ�Զ���¼(��Ҫ������ܵ�¼�����)
::control userpassWords2

:opendefragui
rem �ӳ���:
rem   opendefragui
rem       ��"��Ƭ�����Ż���������"�����������Ż���������������ֻѡ���Ż���
rem       ̬Ӳ�̣����Ի�еӲ������Ƭ����
rem       ���������û�й�̬Ӳ�̣����԰ѡ����ƻ����С��Ĺ�ȥ�������üƻ�����
rem       Ҳ���Ե��ƻ���������á�\Microsoft\Windows\Defrag\ScheduledDefrag����
rem       ��
start dfrgui.exe /schedule
GOTO :eof

:opentaskbarprops
rem �ӳ���:
rem   opentaskbarprops
rem       ��"����������"
Rundll32.exe shell32.dll,Options_RunDLL 1
GOTO :eof

:openof
rem �ӳ���:
rem   openof
rem       ��"���û�ر� Windows ����"
start OptionalFeatures.exe
GOTO :eof

:opennotificationsystemiconsettings
rem �ӳ���:
rem   opennotificationsystemiconsettings
rem       �����û�ر�������֪ͨ��ϵͳͼ������
Rundll32.exe shell32.dll,Options_RunDLL 4
GOTO :eof

:openpowercfg
rem �ӳ���:
rem   openpowercfg
rem       ��"��Դѡ��"
control powercfg.cpl
GOTO :eof

:opentaskschd
rem �ӳ���:
rem   opentaskschd
rem       ��"����ƻ�����"
start taskschd.msc /s
GOTO :eof

:opensysdmadvace
rem �ӳ���:
rem   opensysdmadvace
rem       ��ϵͳ���Ը߼�ѡ�
control sysdm.cpl,,3
GOTO :eof

:openhelpdoc
rem �ӳ���:
rem   openhelpdoc
rem       ���Ż������ĵ�
start notepad "%f_help_doc%"
GOTO :eof

rem ���ҵĵ���ҳ��
:opensite
rem �ӳ���:
rem   opensite
rem       ���ҵĵ���ҳ��
START "%ProgramFiles%\Intern~1\iexplore.exe" "http://liray.github.io/"
GOTO :eof

:end
REM �ӳ���:
REM   end
REM       ����IE���ʵ�����ַ,���رճ���
::CALL :opensite
POPD
EXIT
