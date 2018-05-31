@ECHO off

rem * File：Setup.bat
rem * Version：v0.0.1
rem * Encoding：ANSI
rem * Author：Ray Li
rem * Date：May 21st 2018
rem ********************************************************************
rem *                                                                  *
rem *     该批处理实现了用户按需初始化 Windows 10 系统, 部分不能由批处 *
rem * 理实现的功能由手动设置优化, 详细请看帮助文档( readme.md ), 优化  *
rem * 项目详细解读可以通过查看各 reg 文件了解.                         *
rem *                                                                  *
rem ********************************************************************

PUSHD %~dp0

MODE con cols=82 lines=25
COLOR 9f
CALL :detectos

:mainmenu
rem 子过程:
rem   mainmenu
rem       程序主菜单, 程序入口
COLOR 9f
CALL :initvars
REM 清空上次菜单选择
set choi=
cls
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.                      * ================================= *
ECHO.                      *                                   *
ECHO.                      *     Windows 10 系统初始化设置     *
ECHO.                      *                                   *
ECHO.                      * ================================= *
ECHO.
ECHO.
ECHO.    * ===================================================================== *
ECHO.    *                                                                       *
ECHO.    *          [1] 导入当前配置到当前系统                                   *
ECHO.    *                                                                       *
ECHO.    *          [2] 其它需要手动设置的地方                                   *
ECHO.    *                                                                       *
ECHO.    *          [0] 退出程序                                                 *
ECHO.    *                                                                       *
ECHO.    * ===================================================================== *
ECHO.
ECHO.
CALL :uibottom
set /p choi=-* 请选择优化选项 ( 0 - 2 ): 
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
rem 子过程:
rem   childmanualoptimizemenu
rem       主菜单选项3 ---- 子菜单 其它需要手动优化的地方
REM 清空上次菜单选择
set choi=
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.
ECHO.                              [1] 浏览 手动优化说明文档
ECHO.
ECHO.
ECHO.
ECHO.        [2] 打开 任务栏属性                   [5] 启用或关闭 Windows 功能
ECHO.
ECHO.        [3] 启用或关闭任务栏通知区系统图标    [6] 打开 优化驱动器设置
ECHO.
ECHO.        [4] 打开 电源选项                     [7] 打开 系统属性高级选项卡
ECHO.
ECHO.
ECHO.
CALL :uibacktomain
ECHO.
CALL :uibottom
set /p choi=-*请选择优化选项 ( 0 - 7 ): 
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
rem 子程序:
rem   uiopentaskbarprops
rem       UI ---- 打开任务栏属性, 并显示操作消息
CALL :opentaskbarprops
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    由于隐藏任务栏选项无法由注册表优化, 所以请需要隐藏任务栏的做手动设置.
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uinotificationsystemiconsettings
rem 子程序:
rem   uinotificationsystemiconsettings
rem       UI ---- 打开启用或关闭任务栏系统图标设置, 并显示操作消息
CALL :opennotificationsystemiconsettings
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    由于通知区域的系统图标暂时无法由注册表设置关闭或开启, 请需要禁用"操
ECHO.  作中心"等图标的做手动操作.
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uipowercfg
rem 子程序:
rem   uipowercfg
rem       UI ---- 打开电源选项, 并显示操作消息
CALL :openpowercfg
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    电源选项里的设置比较靠谱的还是手动设置, 按照你的需求:
ECHO.       1. 修改睡眠和屏幕关闭时间.
ECHO.       2. 禁用或启用睡眠, 等...
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopenof
rem 子程序:
rem   uiopenof
rem       UI ---- 打开"启用或关闭 Windows 功能", 并显示操作消息
CALL :openof
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    启动或关闭 一些 Windows 功能, 这个是可以通过命令行来操作的, 个人比较
ECHO.  喜欢手动, 例如:
ECHO.       1. 关闭 远程差分压缩
ECHO.       2. 添加 .Net Framework 3.5 (包括 .NET 2.0 和 3.0), 等...
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopentaskschd
rem 子程序:
rem   uiopentaskschd
rem       UI ---- 打开计划任务程序, 并显示操作消息
CALL :opentaskschd
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    现在计划任务可能无法通过注册表来修改, 而且需要优化的地方也比较多, 请
ECHO.  边看帮助文档(help_doc.txt), 边修改!
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopensysdmadvace
rem 子程序:
rem   uiopensysdmadvace
rem       UI ---- 打开系统属性高级选项卡, 并显示操作消息
CALL :opensysdmadvace
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    ^> 去掉一些 视觉效果(高级-视觉效果), 例如:
ECHO.       1. 窗口内的动画控件和元素
ECHO.       2. 淡入淡出或滑动菜单到视图
ECHO.       3. 滑动打开组合框
ECHO.       4. 任务栏中的动画
ECHO.       5. 在单击后淡出菜单
ECHO.       6. 在视图中淡入淡出或滑动工具提示
ECHO.       7. 在最大化和最小化时显示窗口动画
ECHO.
ECHO.    ^> 调整 虚拟内存 所在位置和大小, 建议使用系统托管!
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof

:uiopendefragui
rem 子程序:
rem   uiopendefragui
rem       UI ---- 打开优化驱动器（碎片整理）的设置界面
CALL :opendefragui
cls
ECHO.
CALL :uimanualoptimizetitle
ECHO.
ECHO.
ECHO.  操作提示:
ECHO.
ECHO.    现在优化驱动器无法通过命令来修改需要优化的硬盘类型，一般只对固态硬盘
ECHO.  的分区做定期优化（碎片整理），而机械硬盘的分区可以取消勾选，不做碎片整
ECHO.  理。
ECHO.
ECHO.
ECHO.
CALL :uiback
PAUSE>nul
GOTO :eof


:uimanualoptimizetitle
rem 子程序:
rem   uimanualoptimizetitle
rem       UI ---- 主菜单选项3的子菜单标题
ECHO.                      * ================================= *
ECHO.                      *              手动配置             *
ECHO.                      *                  -- Win10 配置    *
ECHO.                      * ================================= *
GOTO :eof

:uiback
REM 子程序:
REM   uiback
REM       UI ---- 显示按任意键返回
ECHO.                              ^>^> 按任意键返回 ^<^<
GOTO :eof

:uibacktomain
REM 子程序:
REM   uibacktomain
REM       UI ---- 显示回到主菜单选项
ECHO.                              [0] 返 回 主 菜 单
GOTO :eof

:uibottom
REM 子程序:
REM   uibottom
REM       UI ---- 显示底部内容
ECHO. ===============================================================================
GOTO :eof

:supportus
REM 子程序:
REM   supportus
REM       主菜单4 ---- 显示感谢支持我们消息.
CALL :opensite
cls
ECHO. * =========================================================================== *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                          ** Windows 10 系统配置 **                          *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                             感谢您的喜爱与支持!                             *
ECHO. *                                                                             *
ECHO. *                                 Thank you !                                 *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                         ^>^> 请按任意键回到主菜单 ^<^<                          *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. *                                                                             *
ECHO. * =========================================================================== *
PAUSE>nul
GOTO :mainmenu

rem ==================================== 变量 ====================================

:initvars
rem 子程序:
rem   initvars
rem       启动时初始化的变量
rem 变量:
rem   f_reg_com
rem       通用注册表优化文件路径，暂时废弃
rem   f_serv_cfg
rem       系统服务优化配置文件路径
rem   f_emp_pic
rem       快捷方式需要用到的透明图标的路径
rem   f_help_doc
rem       优化帮助文档的路径
rem   f_reg_readme
rem       注册表设置说明文档的路径，注册表源文档的可以互补个
rem   f_reg
rem       根据f_reg_readme指定的注册表设置说明文档，生成的注册表文件路径
rem   f_grand_control_4_reg
rem       记录了需要降权或提权的注册表项的文件的路径
rem   power_ac_monitor_timeout
rem       设置连接电源的情况下，几分钟关闭后关闭显示器；
rem       设置为0时为不关闭显示器
rem   power_ac_standby_timeout
rem       设置连接电源的情况下，几分钟进入睡眠状态；
rem       设置为0时为禁止进入睡眠
rem   power_dc_monitor_timeout
rem       设置使用电池的情况下，几分钟关闭后关闭显示器；
rem       设置为0时为不关闭显示器
rem   power_dc_standby_timeout
rem       设置使用电池的情况下，几分钟进入睡眠状态；
rem       设置为0时为禁止进入睡眠
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

rem ==================================== 逻辑 ====================================

:detectos
rem 子程序:
rem   detectos
rem       检测系统版本, 语言版本
rem 变量:
rem   os_lang
rem       获得系统语言, "cn" 或 "en"
rem   os_ver
rem       获得系统版本
rem   f_sysinfo
rem       设置SYSTEMINFO命令生成的临时文件路径和文件名
)
:: 检测批处理是否以管理员方式运行
set test_filename=C:\UAC_TEST.TXT
echo BAT TEST UAC IN TEMP.>%test_filename%
if exist %test_filename% (
    del /f /q %test_filename%
) else (
    cls
    color 47
    ECHO. 错误:
    ECHO.
    ECHO.   安装失败，没有足够的权限！
    ECHO.
    ECHO.   请关闭程序后，右键菜单中选择以管理员身份运行程序！
    ECHO.
    ECHO.                            ^>^> 按任意键关闭程序 ^<^<
    PAUSE>nul
    GOTO :end
)
ECHO. 正在检测你的系统, 请稍等...
set os_lang=
set os_ver=
set f_sysinfo=_sysinfo.tmp
SYSTEMINFO > %f_sysinfo%
rem 检测当前系统是否为简体中文语言或英文版
FOR /f "tokens=1" %%i IN ( 'FINDSTR /c:"主机名" %f_sysinfo%') DO (
    IF /i "%%i"=="主机名:" (
        set os_lang=cn
        set str_osver_cn=OS 版本
        set str_osname_cn=OS 名称
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
    ECHO. 错误:
    ECHO.
    ECHO.   程序不支持您的系统语言版本, 请使用简体中文版或英文版.
    ECHO.
    ECHO.                            ^>^> 按任意键关闭程序 ^<^<
    PAUSE>nul
    GOTO :end
)
setlocal enabledelayedexpansion
rem 检测当前系统版本
FOR /f "tokens=3" %%i IN ( 'FINDSTR /r /c:"^!str_osver_%os_lang%!" %f_sysinfo%') DO (
    IF not "%%i"=="10.0.16299" (
        color 47
        ECHO. 错误:
        ECHO.
        ECHO.   程序不支持你的系统版本, 该程序只支持 Windows 10 系统!
        ECHO.
        ECHO.                            ^>^> 按任意键关闭程序 ^<^<
        PAUSE>nul
        GOTO :end
    )
)
rem 检测当前系统名称
FOR /f "tokens=5" %%i IN ( 'FINDSTR /r /c:"^!str_osver_%os_lang%!" %f_sysinfo%' ) DO (
    IF not "%%i"=="10" (
        color 47
        ECHO. 错误:
        ECHO.
        ECHO.   程序优化暂不支持服务器版系统, 该程序只支持 Windows 10 系统!
        ECHO.
        ECHO.                            ^>^> 按任意键关闭程序 ^<^<
        PAUSE>nul
        GOTO :end
    )
)
endlocal
rem 移除临时文件
DEL /f /q ".\%f_sysinfo%"
set os_ver=
set f_sysinfo=
set str_osver_%os_lang%=
set str_osname_%os_lang%=
GOTO :eof

:reg_com
rem 子程序:
rem   reg_com
rem       自动初始化主程序
rem 复制快捷方式透明图标到Windows文件夹
taskkill /f /im explorer.exe
IF EXIST "%Windir%\Empty.ico" (
    DEL /f /q "%Windir%\Empty.ico"
    IF EXIST "%Windir%\Empty.ico" (
        color 47
        ECHO 错误: 你没做足够的权限, 请使用管理员身份运行!
        ECHO       操作失败,没有去除快捷方式图标箭头!
        GOTO :eof
    )
)
XCOPY /q "%f_emp_pic%" "%Windir%\"
IF not EXIST "%Windir%\Empty.ico" (
    color 47
    ECHO 错误: 你没做足够的权限, 请使用管理员身份运行!
    ECHO       操作失败,没有去除快捷方式图标箭头!
    GOTO :eof
)
rem 去除右键"发送到"多余菜单
CALL :del_sdto
rem 执行服务设置
CALL :servicestweaks
rem 执行任务计划设置
CALL :schedulestweaks
rem 重建桌面图标缓存
CALL :rebuild_icon_cache
rem 电源设置
CALL :monitor_and_standby_timeout_cfg %power_ac_monitor_timeout% %power_ac_standby_timeout% %power_dc_monitor_timeout% %power_dc_standby_timeout%
rem 卸载OneDrive
CALL :uninstall_onedrive
rem 导入注册表设置
call :regtweak
echo.
echo 正在重启电脑，请勿关闭......
shutdown -r -t 3
GOTO :eof

:servicestweaks
rem 子程序:
rem     servicestweaks
rem         优化系统服务
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
    ECHO 这些服务无法更改:%err_serv%
    GOTO :eof
)
GOTO :eof

:schedulestweaks
rem 子程序:
rem     schedulestweaks
rem         优化任务计划
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
    ECHO 这些任务计划无法更改:%err_scht%
    GOTO :eof
)
GOTO :eof

:regtweak
rem 子程序:
rem     tweaksreg
rem         导入注册表设置
call :ignorelines4reg "%f_reg_readme%" "%f_reg%"
if exist "%f_reg%" (
    call :grand_control_for_reg %f_grand_control_4_reg%
    reg import "%f_reg%" > nul
    IF errorlevel 1 (
        color 47
        ECHO 错误: 你没做足够的权限, 请检查注册表键是否有增删改权限!
        ECHO       注册表优化错误: "%f_reg%" !
    ) ELSE (
        ECHO 注册表优化成功!
    )
    call :grand_control_for_reg /d %f_grand_control_4_reg%
    del /f /q "%f_reg%"
) else (
    color 47
    ECHO 错误: 没有生成reg文件
    ECHO       注册表优化错误: 未找到文件 "%f_reg%" !
)
goto :eof

:grand_control_for_reg
rem 子程序:
rem     grand_control_for_reg [/d] filepath
rem         为注册表键值提权或降权,使可以修改或禁止修改注册表键值.
rem 参数:
rem     /d
rem         可选参数.
rem         使用该参数的时候是对注册表进行降权处理;
rem         不使用该参数时是对注册表进行提权处理.
rem     filepath
rem         记录了需要降权或提权的注册表项的文件的路径。
setlocal
set "f_grand_control_4_reg="
if "%~1"=="" (
    echo 无效的参数数量。
    endlocal & goto :eof
)

if not "%~3"=="" (
    echo 无效的参数数量。
    endlocal & goto :eof
)

if "%~1"=="/d" (
    if "%~2"=="" (
        echo 无效的参数数量。
        endlocal & goto :eof
    ) else (
        if not exist "%~2" (
            echo 找不到目标文件 - "%~2" 。
            endlocal & goto :eof
        ) else (
            set "f_grand_control_4_reg=%~2"
            set "control=[19 2]"
        )
    )
) else (
    if not exist "%~1" (
        echo 找不到目标文件 - "%~1" 。
        endlocal & goto :eof
    ) else (
        set "f_grand_control_4_reg=%~1"
        set "control=[1 7]"
    )
)

rem 生成符合regini使用的配置文件
set "f_regini=.\regset.ini"
(
    for /f "eol=; delims=" %%i in ('type "%f_grand_control_4_reg%"') do (
        echo.%%i %control%
    )
)>%f_regini%

rem 执行regini设置权限
if exist "%f_regini%" (
    rem 判断文件是否为空
    for %%a in ("%f_regini%") do (
        if not "%%~za" equ "0" (
            regini "%f_regini%"
        )
    )
    del /f /q "%f_regini%"
) else (
    color 47
    ECHO 不存在 %f_regini% 文件, 无法修改注册表键值权限!
    endlocal & GOTO :eof
)
endlocal
goto :eof

:inifile
rem 子程序:
rem     inifile [/gc] inifilepath [section] [key]
rem         解析INI文件,获取"节"和"值"
rem 参数:
rem     /gc
rem         可选, 手动进行垃圾回收
rem     inifilepath
rem         必选, 指定INI文件的路径
rem     section
rem         可选, 指定"节"
rem     key
rem         可选, 指定"键"
rem 变量:
rem     exit_code
rem         设置和影响ERRORLEVEL的值
rem 返回的变量和值:
rem     gc_key
rem         返回的"键"的值, 为了方便垃圾回收
rem     key_and_value
rem         返回"键=值"格式内容
rem     sections
rem         返回所有节，以空格分割每节
rem 示例:
rem     inifile services.ini
rem         获取当前路径services.ini里的所有"节", 可用sections变量获取
rem     inifile services.ini "[DiagTrack]" status
rem         获取当前路径services.ini里"节"为[DiagTrack]下"键"为status的值, 可用
rem         "键"做为变量名(这里的变量为status)获取值
rem     inifile /gc
rem         完成解析INI文件后, 进行垃圾回收

::初始化变量
:: out name of vars
::set out_nov_sections=
::set out_nov_key=
::set out_nov=

set exit_code=

:: 判断INI文件是否存在, 判断是否进行垃圾回收
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

:: 仅获得INI文件所有“节”
if "%~2"=="" (
    CALL :inifile_getsections
    GOTO :eof
)

:: 获取"键"的值
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
rem 子程序:
rem     inifile_gc
rem         清空inifile子程序生成的所有变量, 垃圾回收
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
rem 子程序:
rem     inifile_main
rem         解析INI文件, 获取指定“节”下“键”的“值”
rem 变量:
rem     start_line_no
rem         指定"节"所在文件中的开始行

set start_line_no=
:: 找出指定节所在第几行
for /f "usebackq delims=[] skip=2" %%i in (`find /i "%section%" /n %inifilepath%`) do (
    set start_line_no=%%i
)
:: 当没有找到指定的节所在行，就停止继续执行
if not defined start_line_no (
    GOTO :eof
) else (
    if "%start_line_no%"=="" (
        goto :eof
    )
)
:: 循环在指定行下获取“键”的“值”
for /f "eol=; usebackq tokens=1* skip=%start_line_no% delims==" %%i in (`type %inifilepath%`) do (
    call :inifile_getkeyandvalue "%%i" "%%j"
    ::强制退出，并返回一个退出代码
    if defined exit_code (
        exit /b %exit_code%
    )
)
goto :eof

:inifile_getkeyandvalue
rem 子程序:
rem     inifile_getkeyandvalue key value
rem         取得"键"的值
rem 参数:
rem     key
rem         必须, 指定需要查找的"键"
rem     value
rem         必须, "键"对应的值

set "cur_key=%~1"
:: 处理“键”前后的空格
setlocal EnableDelayedExpansion
call :trim cur_key
endlocal & set "cur_key=%cur_key%"
:: 如果获取到的第一个字符是"["，说明本节已经搜索完成。退出，返回0
if "%cur_key:~0,1%"=="[" (
    set exit_code=0&goto :eof
)
:: 因为INI文件一般“;”以后是注释符，这里去掉注释。
for /f "delims=;" %%x in ("%cur_key%=%~2") do (
    if not DEFINED key (
        echo %%x
    ) else (
        :: 判断是否已经找到了指定的"键"
        if /i "%cur_key%"=="%key%" (
            set exit_code=0
            set "key_and_value=%%x"
            set "gc_key=%cur_key%"
        )
    )
)
goto :eof

:inifile_getsections
rem 子程序:
rem     inifile_getsections
rem         获取INI文件里面所有的“节”
rem 返回变量和值:
rem     sections
rem         返回INI文件里面所有"节"
setlocal EnableDelayedExpansion
set sections=
set section_tmp=
for /f "eol=; usebackq delims== skip=2" %%a in (`find /i "[" %inifilepath%`) do (
    :: 去掉“节”前后中括号
    set section_tmp=%%a
    set section_tmp=!section_tmp:~1!
    set section_tmp=!section_tmp:~0,-1!
    :: 把所有的节放在一个字段中，以便调用
    if not defined sections (
        set sections=!section_tmp!
    ) else (
        set sections=!sections! !section_tmp!
    )
)
endlocal & set "sections=%sections%"
goto :eof

:trim
rem 子程序:
rem     trim str
rem         去掉字符串左右两边的空格和制表符
rem 参数:
rem     str
rem         必须, 需要去掉两边空格的字符串
rem 示例代码：
rem set "str=	   abcde    	  "
rem echo before: %str%
rem setlocal EnableDelayedExpansion :: 注意使用前先启用延迟变量！
rem call :trim str                  :: 这里传入的变量名，并不是变量的值!
rem endlocal & set str=%str%        :: 注意用完后获取的固定写法，请不要分开写！
rem echo after: %str%

:: 删除字符串前面所有空格
if "!%1:~0,1!"==" " (
    set %1=!%1:~1!
    goto :trim
)
:: 删除字符串前面所有制表符
if "!%1:~0,1!"=="	" (
    set %1=!%1:~1!
    goto :trim
)
:: 删除字符串后面所有空格
if "!%1:~-1!"==" " (
    set %1=!%1:~0,-1!
    goto :trim
)
:: 删除字符串后面所有制表符
if "!%1:~-1!"=="	" (
    set %1=!%1:~0,-1!
    goto :trim
)
goto :eof

:file_err
rem 子程序:
rem     file_err [filepath]
rem         提示错误, 没有找到指定的文件
rem 参数:
rem     filepath
rem         可选, 文件路径
echo.
echo %1文件未找到或未输入!
echo.
exit /b 100
goto :eof

:grand_admin_full_control_for_dir_and_files
rem 子程序:
rem     grand_admin_full_control_for_dir_and_files filepath
rem         设置文件夹或文件取得管理员所有权限
rem 参数:
rem     filepath
rem         文件夹或文件路径
takeown /f "%~1" /r /d y && icacls "%~1" /grant administrators:F /t
goto :eof

:ignorelines4reg
rem 子程序:
rem     ignorelines4reg 
rem         把.\reg\readme.md文件转换为reg文件
rem 参数:
rem     sc_filepath
rem         源文件，需要转换的文件的绝对或相对路径。
rem     tg_filepath
rem         目标文件，转换为reg文件的绝对或相对路径。
setlocal
if "%1"=="" (
    echo 无效的参数数量。
    exit /b 4
)

if not exist "%~1" (
    echo 找不到目标文件 - %~1 。
    exit /b 4
)

if /i "%~1"=="%~2" (
    echo 拷贝的目标文件名和目的文件名不可相同。
    exit /b 4
)

if exist "%~2" (
    del /f /q "%~2"
)

set "input_filepath=%~1"
set "output_filepath=%~2"

rem REG开头定义
echo Windows Registry Editor Version 5.00>%output_filepath%
echo.>>%output_filepath%

rem 逐行判断写入新文件
for /f "eol== skip=3 delims=" %%a in ('findstr /i /n .* "%input_filepath%"') do (
    setlocal enabledelayedexpansion
    set "line=%%a"
    set "line=!line:*:=!"

    rem 该行为空行，输出空行。
    if defined line (
        set "tmp=!line: =!"
        rem 该行全为空格的空行，输出空行。
        if /i not "!tmp!"=="" (
            set "first_char_of_line=!tmp:~0,1!"
            rem 该行首个字符为双引号时，输出到文本。
            if "!first_char_of_line!!first_char_of_line!"=="""" (
                echo !line!>>%output_filepath%
            ) else (
                rem 该行首个字符为"["时，输出到文本。
                if "!first_char_of_line!"=="[" (
                    echo !line!>>%output_filepath%
                ) else (
                    rem 该行首个字符为"["时，输出到文本。
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
rem 子程序:
rem     uninstall_onedrive [/a]
rem         卸载和清除系统自带的OneDrive
rem 参数:
rem     /a
rem         同时清除OneDrive所有文件和注册表项
if not "%~1"=="" (
    if not "%~1"=="/a" (
        echo 语法错误！
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

:: 使用OneDrive卸载程序
if not "%onedrive_dir%"=="" (
    "%onedrive_dir%" /uninstall
) else (
    echo 未找到OneDriveSetup.exe程序！
    goto :eof
)

:: 清除文件和注册表项
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
rem 子程序
rem     monitor_and_standby_timeout_cfg power_ac_monitor_timeout power_ac_standby_timeout power_dc_monitor_timeout power_dc_standby_timeout
rem         设置连接电源或使用电池时的屏幕关闭时间和自动进入睡眠状态的时间
rem 参数
rem     power_ac_monitor_timeout
rem         设置连接电源的情况下，几分钟关闭后关闭显示器；
rem         设置为0时为不关闭显示器
rem     power_ac_standby_timeout
rem         设置连接电源的情况下，几分钟进入睡眠状态；
rem         设置为0时为禁止进入睡眠
rem     power_dc_monitor_timeout
rem         设置使用电池的情况下，几分钟关闭后关闭显示器
rem         设置为0时为不关闭显示器
rem     power_dc_standby_timeout
rem         设置使用电池的情况下，几分钟进入睡眠状态；
rem         设置为0时为禁止进入睡眠
:: 连接电源（交流电）时，设置屏幕关闭时间和自动进入睡眠状态的时间(分钟)
powercfg /X monitor-timeout-ac %~1
powercfg /X standby-timeout-ac %~2
:: 使用电池（直流电）时，设置屏幕关闭时间和自动进入睡眠状态的时间(分钟)
powercfg /X monitor-timeout-dc %~3
powercfg /X standby-timeout-dc %~4
goto :eof

:closeslp
rem 子程序
rem   closeslp
rem       关闭睡眠 关闭混合启动
powercfg /h off
IF errorlevel 1 (
    color 47
    ECHO 错误: 你没做足够的权限, 请使用管理员身份运行!
    ECHO       关闭睡眠 关闭混合启动出错 !
) ELSE (
    ECHO 已关闭睡眠和混合启动, 请到控制面板\电源选项中设置禁用睡眠!
)
GOTO :eof

:cplnkico
rem 子程序
rem   cplnkico
rem       复制透明图标到 Windows 文件夹, 供优化掉快捷方式的小箭头
IF EXIST "%Windir%\Empty.ico" (
    DEL /f /q "%Windir%\Empty.ico"
)
XCOPY /q "%f_emp_pic%" "%Windir%\"
IF not EXIST "%Windir%\Empty.ico" (
    color 47
    ECHO 错误: 你没做足够的权限, 请使用管理员身份运行!
    ECHO       操作失败,没有去除快捷方式图标箭头!
    PAUSE > nul
)
GOTO :eof

:rebuild_icon_cache
rem 子程序
rem     rebuild_icon_cache
rem         重建桌面图标缓存
ATTRIB -s -r -h "%userprofile%\AppData\Local\iconcache.db"
DEL "%userprofile%\AppData\Local\iconcache.db" /f /q
ie4uinit -show
goto :eof

:del_sdto
rem 子程序:
rem   del_sdto
rem       去除右键"发送到"多余菜单
rem 变量:
rem   docfile_en
rem       英文系统中的"发送到-文档"的文件名
rem   docfile_cn
rem       简中系统中的"发送到-文档"的文件名
rem   sendtodir
rem       右键"发送到"对应的路径
set docfile_en=Documents.mydoc
set docfile_cn=文档.mydocs
set sendtodir=%APPDATA%\Microsoft\Windows\SendTo
rem 115网盘
IF EXIST "%sendtodir%\115网盘.lnk" (
    DEL /f /q "%sendtodir%\115网盘.lnk"
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

rem 设置磁盘清理工具清理项目(注册表已包含)
::cleanmgr /sageset:99

rem 设置系统自动登录(需要密码才能登录的情况)
::control userpassWords2

:opendefragui
rem 子程序:
rem   opendefragui
rem       打开"碎片整理（优化驱动器）"，可以设置优化的驱动器，比如只选择优化固
rem       态硬盘，不对机械硬盘做碎片整理。
rem       如果电脑上没有固态硬盘，可以把“按计划运行”的勾去掉，禁用计划任务。
rem       也可以到计划任务里禁用“\Microsoft\Windows\Defrag\ScheduledDefrag”任
rem       务。
start dfrgui.exe /schedule
GOTO :eof

:opentaskbarprops
rem 子程序:
rem   opentaskbarprops
rem       打开"任务栏属性"
Rundll32.exe shell32.dll,Options_RunDLL 1
GOTO :eof

:openof
rem 子程序:
rem   openof
rem       打开"启用或关闭 Windows 功能"
start OptionalFeatures.exe
GOTO :eof

:opennotificationsystemiconsettings
rem 子程序:
rem   opennotificationsystemiconsettings
rem       打开启用或关闭任务栏通知区系统图标设置
Rundll32.exe shell32.dll,Options_RunDLL 4
GOTO :eof

:openpowercfg
rem 子程序:
rem   openpowercfg
rem       打开"电源选项"
control powercfg.cpl
GOTO :eof

:opentaskschd
rem 子程序:
rem   opentaskschd
rem       打开"任务计划程序"
start taskschd.msc /s
GOTO :eof

:opensysdmadvace
rem 子程序:
rem   opensysdmadvace
rem       打开系统属性高级选项卡
control sysdm.cpl,,3
GOTO :eof

:openhelpdoc
rem 子程序:
rem   openhelpdoc
rem       打开优化帮助文档
start notepad "%f_help_doc%"
GOTO :eof

rem 打开我的导航页面
:opensite
rem 子程序:
rem   opensite
rem       打开我的导航页面
START "%ProgramFiles%\Intern~1\iexplore.exe" "http://liray.github.io/"
GOTO :eof

:end
REM 子程序:
REM   end
REM       调用IE访问导航网址,并关闭程序
::CALL :opensite
POPD
EXIT
