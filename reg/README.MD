
[TOC]

## 一、系统

### 1.1 Windows 更新后，显示或隐藏“欢迎使用Windows”体验

* Windows设置-系统-通知和操作-更新后向我显示“欢迎使用Windows”体验，并在我登录时突出显示新增内容和建议的内容

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 开 | dword:00000001 | 显示“欢迎使用Windows”体验 | |
| 关 | dword:00000000 | 隐藏“欢迎使用Windows”体验 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"SubscribedContent-310093Enabled"=dword:00000000
```

### 1.2 使用Windows时获取提示、技巧和建议

* Windows设置-系统-通知和操作-在使用Windows时获取提示、技巧和建议

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 开 | dword:00000001 | 允许使用Windows时获取提示、技巧和建议 | |
| 关 | dword:00000000 | 禁止使用Windows时获取提示、技巧和建议 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"SubscribedContent-338389Enabled"=dword:00000000
```

### 1.3 启用或禁用混合启动(快速启动)

* 控制面板-电源选项-选择电源按钮的功能-关机设置-启动快速启动

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 启用快速启动 | |
| 不勾选 | dword:00000000 | 禁用快速启动 | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power]
"HiberbootEnabled"=dword:00000001
```

* 计算机配置(Computer Configuration)-管理模板(Administrative Templates)-系统(System)-关机(Shutdown)-要求使用快速启动(Require use of fast startup)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 已启用 | dword:00000001 | 启用快速启动, "控制面板-电源选项-选择电源按钮的功能-关机设置-启动快速启动"被锁定, 无法修改, 显灰 | |
| 已禁用 | dword:00000000 | 禁用快速启动, "控制面板-电源选项-选择电源按钮的功能-关机设置-启动快速启动"被锁定, 无法修改, 显灰 | |
| 未配置 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"HiberbootEnabled"=-
```

### 1.4 显示或隐藏开始菜单的睡眠按钮

* 控制面板(Control Panel)-电源选项(Power Options)-选择电源按钮的功能(Choose what the power buttons do)-关机设置(Shutdown settings)-睡眠(Sleep)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 显示开始菜单的睡眠按钮 | |
| 不勾选 | dword:00000000 | 隐藏开始菜单的睡眠按钮 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]
"ShowSleepOption"=dword:00000001
```

### 1.5 显示或隐藏开始菜单中"锁定"按钮

* 控制面板(Control Panel)-电源选项(Power Options)-选择电源按钮的功能(Choose what the power buttons do)-关机设置(Shutdown settings)-锁定(Lock)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 |  显示开始菜单中"锁定"按钮 | |
| 不勾选 | dword:00000000 |  隐藏开始菜单中"锁定"按钮 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings]
"ShowLockOption"=dword:00000001
```

### 1.6 Windows 可以通过删除不需要的文件（例如临时文件和回收站中的内容）自动释放空间

* Windows设置-系统-存储-存储感知

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 开 | dword:00000001 | 自动释放空间 | |
| 关 | dword:00000000 | 不操作 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy]
"01"=dword:00000000
```

### 1.7 设置当我登陆时是使用桌面模式还是平板电脑模式

* Windows设置-系统-平板电脑模式-当我登录时

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"使用平板电脑模式" | dword:00000000 | 禁止其他设备远程到该电脑 | |
| 选择"使用桌面模式" | dword:00000001 | 允许其他设备远程连接到此计算机 | |
| 选择"根据我的硬件自动调整适当的模式" | dword:00000002 | 允许其他设备远程连接到此计算机 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]
"SignInMode"=dword:00000001
```

### 1.8 设置在平板电脑模式和桌面模式切换使用, 系统显示的模式

* Windows设置-系统-平板电脑模式-当设备自动将平板电脑模式切换为开或关时

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"不询问我,不进行切换" | dword:00000000 | 无论是使用平板电脑模式还是桌面模式,都不提醒切换 | |
| 选择"切换前始终询问我" | dword:00000001 | 无论是使用平板电脑模式还是桌面模式,都提示切换 | |
| 选择"不询问我,始终进行切换" | dword:00000002 | 无论是使用平板电脑模式还是桌面模式,直接切换都相应的模式,不提醒 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell]
"ConvertibleSlateModePromptPreference"=dword:00000000
```

### 1.9 设置远程桌面连接

* Windows设置-系统-远程桌面-启用远程桌面

> 系统属性-远程-远程桌面

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"不允许远程连接到此计算机" | dword:00000001 | 禁止其他设备远程到该电脑 | √ |
| 选择"允许远程连接到此计算机" | dword:00000000 | 允许其他设备远程连接到此计算机 | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server]
"fDenyTSConnections"=dword:00000001
```

* 当设置为允许桌面远程连接到此计算机时,可以设置是否"仅允许运行使用网络级别身份验证的远程桌面的计算机连接"

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 仅允许运行使用网络级别身份验证的远程桌面的计算机连接 | √ |
| 不勾选 | dword:00000000 | 允许所有验证身份验证级别的计算机远程连接 | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp]
"UserAuthentication"=dword:00000001
```

### 1.10 设置远程协助

* 系统属性(System Properties)-"远程"(Remote)选项卡-远程协助(Remote Assistance)-允许远程协助连接这台计算机(Allow Remote Assistance connections to this computer)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 允许远程协助连接这台计算机 | |
| 不勾选 | dword:00000000 | 禁止远程协助连接这台计算机 | √ |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance]
"fAllowToGetHelp"=dword:00000000
```

### 1.11 设置 chkdsk 自动检测硬盘的等待时间(3秒) - 不正常关机或硬盘有问题时，倒数 2 秒后自检

**注意:** 默认值为8秒.

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager]
"AutoChkTimeOut"=dword:00000002
```

### 1.12 设置预读 - 预读 Windows 系统文件和应用程序

> 值为3的时候，系统在显示登录界面前的时间段最短

| 对应注册表值 | 作用 | 建议 |
|:------------:|:-----|:----:|
| dword:00000000 | 取消预读 | |
| dword:00000001 | 只预读应用程序 | |
| dword:00000002 | 只预读系统文件 | |
| dword:00000003 | 预读系统文件和应用程序(系统默认值) | √ |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
"EnablePrefetcher"=dword:00000003
```

### 1.13 提升系统内核的性能

**注意:** 默认情况下, Windows会把系统内核写入硬盘, 这个设置就是通过禁用内存页面调度(Paging Executive), 让数据保留在内存中, 从而提升系统性能. 建议拥有很多内存的用户(256M以上)使用这个设置.

**注意:** 如果设置该注册表后, 系统频繁出现蓝屏或死机现象, 请还原设置!

> 参考MS知识库:

> * [DisablePagingExecutive: Core Services | Microsoft Docs](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc757875(v=ws.10))

> * [DisablePagingExecutive | Microsoft Docs](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc959492(v=technet.10))

```
;[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
;"DisablePagingExecutive"=dword:00000001
```

### 1.14 提升系统缓存

**注意:** 通常来说, 该优化会使系统性能得到相当的提升, 但也有可能会使某些应用程序性能降低. 需要注意的是必须有256M以上的内存, 激活LargeSystemCache才能起到正面作用.

> 参考MS知识库:

> * [LargeSystemCache: Core Services | Microsoft Docs](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc784562(v=ws.10))

> * [Optimizing Your Memory Configuration | Microsoft Docs](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc938581(v=technet.10))

```
;[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
;"LargeSystemCache"=dword:00000001
```

### 1.15 关闭会阻止或取消关机的应用程序的自动终止功能 [组策略方式]

* 计算机配置(Computer Configuration)-管理模板(Administative Templates)-系统(System)-关机选项(Shutdown Options)-关闭会阻止或取消关机的应用程序的自动终止功能(Turn off automatic termination of applications that block or cancel shutdown)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 关机时, 等待应用程序关闭, 或提示手动关闭应用程序, 或你可以取消关机 | |
| "Disabled" | dword:00000000 | 关机时, 直接关闭应用程序而不等待, 然后关机 | √ |
| "Not Configured" | 删除键值 | 关机时, 直接关闭应用程序而不等待, 然后关机 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"AllowBlockingAppsAtShutdown"=dword:00000000
```

### 1.16 优化 NTFS 性能，禁用更新最近访问日期标记

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
"NtfsDisableLastAccessUpdate"=dword:00000001
```

### 1.17 磁盘清理设置 (Disk Cleanup Settings)

> 命令: cleanmgr /sageset:99

**注意:** 应该删除"StateFlags"键

| 界面操作 | "StateFlags0099"对应的值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 使用命令"cleanmgr /sagerun:99"时清理的项目 | √ |
| 不勾选 | 删除键 | 使用命令"cleanmgr /sagerun:99"时不做清理的项目 | |

* Temporary Setup Files

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Temporary Setup Files"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Temporary Setup Files"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* BranchCache

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"BranchCache"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"BranchCache"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* DirectX着色器缓存

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"BranchCache"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"BranchCache"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\D3D Shader Cache]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 已下载的程序文件(Downloaded Program Files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"BranchCache"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"BranchCache"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* Internet 临时文件(Temporary Internet Files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Internet 临时文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Internet 临时文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* (Offiline web pages)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Offiline web pages"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Offiline web pages"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Offline Pages Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 旧的 Chkdsk 文件(Old Chkdsk Files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"旧的 Chkdsk 文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"旧的 Chkdsk 文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 以前的 Windows 安装(Previous Windows installation(s))

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"以前的 Windows 安装"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"以前的 Windows 安装"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 回收站(Recysle Bin)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"回收站"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"回收站"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* RetailDemo Offline Content

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"RetailDemo Offline Content"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"RetailDemo Offline Content"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\RetailDemo Offline Content]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 更新程序包备份文件(Update package Backup Files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"更新程序包备份文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"更新程序包备份文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 设置日志文件(Setup Log Files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"设置日志文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"设置日志文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 系统错误内存转储文件(System error memory dump files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"系统错误内存转储文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"系统错误内存转储文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 系统错误小型转储文件(System error minidump files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"系统错误小型转储文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"系统错误小型转储文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 临时文件(Temporary files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"临时文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"临时文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 临时 Windows 安装文件(Temporary Windows installation files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"临时 Windows 安装文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"临时 Windows 安装文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 缩略图(Thumbnails)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"缩略图"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"缩略图"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* Windows 更新清理(Windows Upadate Cleanup)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Windows 更新清理"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Windows 更新清理"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* Windows 升级舍弃的文件(Files discarded by Windows upgrade)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Windows 升级舍弃的文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Windows 升级舍弃的文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 用户文件历史记录(User file history)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"用户文件历史记录"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"用户文件历史记录"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* Windows Defender 防病毒

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Windows Defender 防病毒"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Windows Defender 防病毒"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* 系统创建的Windows错误报告文件

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"系统创建的Windows错误报告文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"系统创建的Windows错误报告文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* Windows ESD 安装文件(Windows ESD installation files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Windows ESD 安装文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Windows ESD 安装文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

* Windows 升级日志文件(Windows upgrade log files)

| 界面操作 | 对应注册表键值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选| dword:00000002 | 选择清除"Windows 升级日志文件"相关文件 | √ |
| 不勾选 | 删除键 | 选择保留"Windows 升级日志文件"相关文件 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files]
"StateFlags"=-
"StateFlags0099"=dword:00000002
```

### 1.18 在单独的进程中打开文件夹窗口

* 控制面板-文件资源管理器选项-查看-高级设置-文件和文件夹-在单独的进程中打开文件夹窗口

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 避免在窗口奔溃时桌面一同崩溃 | √ |
| 不勾选 | dword:00000000 | 同用一个进程[默认] | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"SeparateProcess"=dword:00000001
```

### 1.19 Windows 启动和故障恢复设置

**提醒:** 下面是系统崩溃后不自动重启,不写入系统日志,不写入调试信息的设置

* 系统属性(System Properies)-高级(Advanced)-启动和故障恢复(Startup and Recovery)-系统失败(System failure)

| 界面操作 | 键 | 键值 | 作用 | 建议 |
|:---------|:---|:----:|:-----|:----:|
| 勾选"将事件写入系统日志" | LogEvent | dword:00000001 |  | √ |
| 不勾选"将事件写入系统日志" | LogEvent | dword:00000000 |  | |
| 勾选"自动重新启动" | AutoReboot | dword:00000001 | 自动重启电脑 | |
| 不勾选"自动重新启动" | AutoReboot | dword:00000000 | 手动重启电脑 | √ |
| 勾选"写入调试信息-覆盖任何现有文件" | Overwrite | dword:00000001 |  | √ |
| 不勾选"写入调试信息-覆盖任何现有文件" | Overwrite | dword:00000000 |  | |
| 勾选"写入调试信息-禁止在磁盘空间不足时自动删除内存转存" | AlwaysKeepMemoryDump | dword:00000001 |  | |
| 不勾选"写入调试信息-禁止在磁盘空间不足时自动删除内存转存" | AlwaysKeepMemoryDump | dword:00000000 |  | √ |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
"LogEvent"=dword:00000001
"AutoReboot"=dword:00000000
"Overwrite"=dword:00000001
"AlwaysKeepMemoryDump"=dword:00000000
```

* 写入调试信息的大小设置

| 界面操作 | "CrashDumpEnabled"的键 | "FilterPages"的值 | 作用 | 建议 |
|:---------|:----------------------:|:-----------------:|:-----|:----:|
| 选择"无" | dword:00000000 | 删除键 | | √ |
| 选择"小内存转储(128KB)" | dword:00000003 | 删除键 | | |
| 选择"核心内存转储" | dword:00000002 | 删除键 | | |
| 选择"完全内存转储" | dword:00000001 | 删除键 | | |
| 选择"自动内存转储" | dword:00000007 | 删除键 | | |
| 选择"活动内存转储" | dword:00000001 | dword:00000001 | | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
"CrashDumpEnabled"=dword:00000000
"FilterPages"=-
```

### 1.20 在文件夹中搜索系统文件时不使用索引

* 文件夹选项(Folder Options)-搜索(Search)-搜索方式(How to search)-在文件夹中搜索系统文件时不使用索引(Dont't use the index when searching in file folders for system files)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000001 | 搜索系统文件时不使用索引 | |
| 不勾选 | dword:00000000 | 搜索系统文件时使用索引 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]
"WholeFileSystem"=dword:00000001
```

### 1.21 在搜索建立索引的位置时, 包括系统目录

* 文件夹选项(Folder Options)-搜索(Search)-在搜索未建立索引的位置时(When searching non-indexed locations)-包括系统目录(Include system directories)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000001 | 在搜索建立索引的位置时, 包括系统目录 [默认] | |
| 不勾选 | dword:00000000 | 在搜索建立索引的位置时, 不包括系统目录 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\Preferences]
"SystemFolders"=dword:00000000
```

### 1.22 在搜索建立索引的位置时, 始终搜索文件名和内容

* 文件夹选项(Folder Options)-搜索(Search)-在搜索未建立索引的位置时(When searching non-indexed locations)-始终搜索文件名和内容(Always search file names and contents)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000000 | 在搜索建立索引的位置时, 始终搜索文件名和内容 [默认] | |
| 不勾选 | dword:000000001 | 在搜索建立索引的位置时, 只搜索文件名 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations]
"SearchOnly"=dword:00000001
```

### 1.23 在文件资源管理器搜索框中关闭最近搜索条目的显示

* 用户配置(User Configuration)-管理模板(Administrative Templates)-Windows组件(Windows Components)-文件资源管理器(File  Explorer)-在文件资源管理器搜索框中关闭最近搜索条目的显示(Turn off display of recent search entries in the File Explorer search box)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 已启用 | dword:00000001 | 在文件资源管理器搜索框中不显示最近搜索的条目 | √ |
| 已禁用 | dword:00000000 | 在文件资源管理器搜索框中显示最近搜索的条目 | |
| 未配置 | 删除键值 | 在文件资源管理器搜索框中显示最近搜索的条目 | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]
"DisableSearchBoxSuggestions"=dword:00000001
```

### 1.24 文件资源管理器出错时系统自动重新启动外壳程序(Explorer.exe)

| 对应注册表值 | 作用 | 建议 |
|:-------------|:-----|:----:|
| dword:00000001 | 文件资源管理器出错时系统自动重新启动Explorer.exe | √ |
| dword:00000000 | 文件资源管理器出错时, 需要手动强制关闭Explorer.exe, 并重新运行Explorer.exe | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon]
"AutoRestartShell"=dword:00000001
```

### 1.25 删除Ctrl+Alt+Del选项中的"更改密码"

* 用户配置(User Configuration)-管理模块(Administrative Templates)-系统(System)-Ctrl+Alt+Del选项(Ctrl+Alt+Del Options)-删除"更改密码"(Remove Change Password)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "已启用" | dword:00000001 | 在Ctrl+Alt+Del选项中不显示"更改密码" | √ |
| "已禁用" 或 "未配置" | 删除键值 | 在Ctrl+Alt+Del选项中显示"更改密码" | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableChangePassword"=dword:00000001
```

### 1.26 删除Ctrl+Alt+Del选项中的"锁定计算机"

* 用户配置(User Configuration)-管理模块(Administrative Templates)-系统(System)-Ctrl+Alt+Del选项(Ctrl+Alt+Del Options)-删除"锁定计算机"(Remove Lock Computer)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "已启用" | dword:00000001 | 在Ctrl+Alt+Del选项中不显示"锁定计算机" | |
| "已禁用" 或 "未配置" | 删除键值 | 在Ctrl+Alt+Del选项中显示"锁定计算机" | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableLockWorkstation"=-
```

### 1.27 关机时,清除虚拟内存页面文件

**提醒:** 经过测试, 在睡眠功能禁用的情况下关机, 或是在重启电脑的时候, 如果设置启用该功能, 将会使得关机速度冗慢, 难以忍受, 建议保持默认, 设置为0!

* 计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-关机:清除虚拟内存页面文件(Shutdown: Clear virtual memory pagefile)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "已启用" | dword:00000001 | 关机时,清除虚拟内存页面文件 | |
| "已禁用" | dword:00000000 | 关机时,保留虚拟内存页面文件 | √ |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"ClearPageFileAtShutdown"=dword:00000000
```

### 1.28 允许系统在未登录的情况下关闭

* 计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-关机:允许系统在未登录的情况下关闭(Shutdown: Allow system to be shut down without having to log on)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "已启用" | dword:00000001 | 允许系统在未登录的情况下关闭, 登陆界面显示电源按钮 | |
| "已禁用" | dword:00000000 | 禁止系统在未登录的情况下关闭, 登陆界面隐藏电源按钮 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"shutdownwithoutlogon"=dword:00000000
```

### 1.29 登录时,无须按 Ctrl+Alt+Del

* 计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-交互式登录:无须按 Ctrl+Alt+Del(Interative logon: Do not require CTRL+ALT+DEL)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "已启用" | dword:00000001 | 登录时,无须按 Ctrl+Alt+Del, 而是直接进入登陆界面 | √ |
| "已禁用" | dword:00000000 | 登录时,需要按 Ctrl+Alt+Del才能直接进入登陆界面 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"DisableCAD"=dword:00000001
```

### 1.30 禁用或启用兼容性助理

**提醒:** 同时可以禁用"Program Compatibility Assistant Service"服务!

* 计算机管理(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-应用程序兼容性(Application Compatibility)-关闭程序兼容性助理(Turn off Program Compatibility Assistant)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "已启用" | dword:00000001 | 禁用兼容性助理 | √ |
| "已禁用" | dword:00000000 | 启用兼容性助理 | |
| "未配置" | 删除键值 |  | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat]
"DisablePCA"=dword:00000001
```










## 二、设备

### 2.1 当系统检测到有通信时，是否自动降低音量

* Windows设置-设备-蓝牙和其他设备-声音设置-通信

> 控制面板-声音-通信

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 将所有其他声音设置为静音(Mute all other sounds) | dword:00000000 | 当有电话接入, 其他声音设置为静音 | |
| 将其他声音的音量减少 80%(Reduce the volume of other sounds by 80%) | dword:00000001 | 当有电话接入, 其他声音设置为当前音量的80% | |
| 将其他声音的音量减少 50%(Reduce the volume of other sounds by 50%) | dword:00000002 | 当有电话接入, 其他声音设置为当前音量的50% | |
| 不执行任何操作(Do nothing) | dword:00000003 | 当有电话接入, 不降低系统音量 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Multimedia\Audio]
"UserDuckingPreference"=dword:00000003
```

### 2.9 显示或隐藏笔和Windows Ink推荐使用的应用

* Windows 设置-设备-笔和Windows Ink-显示推荐使用的应用

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 开 | dword:00000001 | 允许在所有媒体和设备上使用自动播放| |
| 关 | dword:00000000 | 禁止在所有媒体和设备上使用自动播放 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]
"PenWorkspaceAppSuggestionsEnabled"=dword:00000000
```

### 2.2 设置自动播放

* Windows设置-设备-自动播放-在所有媒体和设备上使用自动播放

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 开 | 删除键 | 允许在所有媒体和设备上使用自动播放| |
| 关 | dword:00000001 | 禁止在所有媒体和设备上使用自动播放 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]
"DisableAutoplay"=dword:00000001
```

* Windows设置-设备-自动播放-选择自动播放默认设置-可移动驱动器

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"导入照片和视频(照片)" | "dsd9eksajf9re3669zh5z2jykhws2jy42gypaqjh1qe66nyek1hg!content!importcontent" | 不执行任何操作 | |
| 选择"播放(Windows Media Player)" | "MSPlayMediaOnArrival" | 立刻用资源管理器打开 | |
| 选择"不执行操作" | "MSTakeNoAction" | 提示你打开方式 | |
| 选择"打开文件夹以查看文件(文件资源管理器)" | "MSOpenFolder" |  | |
| 选择"每次询问" | "MSPromptEachTime" |  | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\StorageOnArrival]
@="MSTakeNoAction"

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\StorageOnArrival]
@="MSTakeNoAction"
```

* Windows设置-设备-自动播放-选择自动播放默认设置-内存卡

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"不执行" | "MSTakeNoAction" | 不执行任何操作 | |
| 选择"打开文件夹以查看文件(文件资源管理器)" | "MSOpenFolder" | 立刻用资源管理器打开 | |
| 选择"每次都询问" | "MSPromptEachTime" | 提示你打开方式 | |
| 选择"配置此驱动器进行备份(文件历史记录)" | "MSFhConfigBackup" |  | |
| 选择"配置存储设置(设置)" | "MSStorageSense" |  | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\EventHandlersDefaultSelection\CameraAlternate\ShowPicturesOnArrival]
@="MSTakeNoAction"

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\UserChosenExecuteHandlers\CameraAlternate\ShowPicturesOnArrival]
@="MSTakeNoAction"
```

### 2.3 为所有媒体和设备使用自动播放

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-自动播放策略(AutoPlay Policies)-关闭自动播放(Turn off Autoplay)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" and select "All drivers" | 值为255(10进制),ff(16进制) | √ |
| "Enabled" and select "CD-ROM and removable media drivers" | 值为181(10进制),b5(16进制) | |
| "Disabled" or "Not Configured" | 删除键值; | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-自动播放策略(AutoPlay Policies)-关闭自动播放(Turn off Autoplay)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" and select "All drivers" | 值为255(10进制),ff(16进制) | √ |
| "Enabled" and select "CD-ROM and removable media drivers" | 值为181(10进制),b5(16进制) | |
| "Disabled" | 删除键值 | |
| "Not Configured" | 值为145(10进制),91(16进制) | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoDriveTypeAutoRun"=dword:000000ff
```

* 控制面板(Control Panel)-自动播放(AutoPlay)-为所有媒体和设备使用自动播放(Use AutoPlay for all media and devices)

> 控制面板-默认程序-更改“自动播放”设置-为所有媒体和设备使用自动播放

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000001 | 禁用自动播放| √ |
| 勾选 | dword:00000000、删除"DisableAutoplay"键 | 还原默认状态(即开启) | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]
"DisableAutoplay"=dword:00000001
```

### 2.4 阻止自动播放记住用户选择

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-自动播放策略(AutoPlay Policies)-阻止自动播放记住用户选择(Prevent AutoPlay from remembering user choises)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| Enabled | dword:00000001 | √ |
| Disabled | dword:00000000 | |
| Not Configured | 删除键值 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"DontSetAutoplayCheckbox"=dword:00000001
```

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-自动播放策略(AutoPlay Policies)-阻止自动播放记住用户选择(Prevent AutoPlay from remembering user choises)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| Enabled | dword:00000001 | √ |
| Disabled | dword:00000000 | |
| Not Configured | 删除键值 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"DontSetAutoplayCheckbox"=dword:00000001
```

### 2.5 设置自动运行的默认行为(可以理解为"是否执行AutoRun.inf文件"!)

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-自动播放策略(AutoPlay Policies)-设置自动运行的默认行为(Set the defualt behavior for AutoRun)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" and select "Do not execute any autorun commands" | dword:00000001 | √ |
| "Enabled" and select "Automatically execute autorun commands" | dword:00000002 | |
| "Disabled" or "Not Configured" | 删除键值 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoAutorun"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-自动播放策略(AutoPlay Policies)-设置自动运行的默认行为(Set the defualt behavior for AutoRun)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" and select "Do not execute any autorun commands" | dword:00000001 | √ |
| "Enabled" and select "Automatically execute autorun commands" | dword:00000002 | |
| "Disabled" or "Not Configured" | 删除键值 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoAutorun"=dword:00000001
```

### 2.6 优化手指触控操作

> 让触控Windows 8设备更适合手指操作,和增加续航时间

> 参考:

> * [(MOD) make touch more responsive | Windows 8, RT Development and Hacking](http://forum.xda-developers.com/showthread.php?t=2091867)

> 原值为8

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TouchPrediction]
"SampleTime"=dword:00000002
"Latency"=dword:00000002
```

### 2.7 删除系统自带的CD刻录功能

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-文件资源管理器(File Explorer)-删除CD刻录功能(Remove CD Burning features)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁用CD刻录功能 | |
| "Disabled" or "Not Configured" | 删除键值 | 使用CD刻录功能 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoCDBurning"=dword:00000001
```

### 2.8 设置开机后数字（Num Lock）键盘状态

| 对应注册表值 | 作用 | 建议 |
|:-------------|:-----|:----:|
| "2" | 开启自动开启数字键盘 | |
| "0" | 不使用数字键盘, 数字键盘为方向键 | |

```
[HKEY_CURRENT_USER\Control Panel\Keyboard]
"InitialKeyboardIndicators"="2"
```







## 三、网络和共享中心

### 3.1 是否使用文件共享向导

* 控制面板-文件资源管理器选项-查看-高级设置-文件和文件夹-使用共享向导（推荐）

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 禁用文件共享向导 | √ |
| 勾选 | dword:00000001 | 使用文件共享向导 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"SharingWizardOn"=dword:00000000
```

### 3.2 禁用各分区的默认共享和$Admin远程管理默认共享

* 关闭管理默认共享和所有分区的默认共享(Admin$ 和 $C $D ...)

| "AutoShareWks"对应的值 | 作用 | 建议 |
|:------------:|:-----|:----:|
| dword:00000000 | 禁用管理默认共享和所有分区的默认共享(Admin$ 和 $C $D ...) | √ |
| dword:00000001 | 使用文件共享向导 | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters]
"AutoShareWks"=dword:00000000
;提醒:以下键值为旧版Windows关闭所有分区默认共享($C $D ...)的设置方法, 已测下面的键值在win8.1中无效, 该键值可能用在服务器系统上起作用, 所以无须设置下面值, 保留只做提醒!
;"AutoShareServer"=dword:00000000
```

### 3.3 关闭 IPC$ 默认共享,禁止匿名用户连接

* 计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policy)-安全选项(Security Options)-网络访问:不允许 SAM 帐户和共享的匿名枚举(Network access: Do not allow anonymous enumeration of SAM accounts and shares)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| Enabled | dword:00000001 | 关闭 IPC$ 默认共享,禁止匿名用户连接 | √ |
| Disabled | dword:00000000 | 允许 IPC$ 默认共享,允许匿名用户连接（不安全） | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
"restrictanonymous"=dword:00000001
```

* 计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policy)-安全选项(Security Options)-网络访问:不允许 SAM 帐户的匿名枚举(Network access: Do not allow anonymous enumeration of SAM accounts)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| Enabled | dword:00000001 | 关闭 IPC$ 默认共享,禁止匿名用户连接 | √ |
| Disabled | dword:00000000 | 允许 IPC$ 默认共享,允许匿名用户连接（不安全） | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
"restrictanonymoussam"=dword:00000001
```

### 3.4 本地账户的共享-经典或来宾

* 组策略(Group Policy)-计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-网络访问: 本地账户的共享和安全模型(Network access: Sharing and security model for local accounts)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择“经典 - 对本地用户进行身份验证,不改变其本来身份(Classic - local users authenticate as themselves)” | dword:00000000 |  | √ |
| 选择“仅来宾 - 对本地用户进行身份验证,其身份为来宾(Guest only - local users authenticate as Guest)” | dword:00000001 |  | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
"forceguest"=dword:00000000
```

### 3.5 启用"使用空白密码的本地帐户只允许进行控制台登录"

* 组策略(Group Policy)-计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-禁用"帐户: 使用空白密码的本地帐户只允许进行控制台登录(Accounts: Limit local account use of blank passwords to console logon only)"

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| Enabled | dword:00000001 | 使用空白密码的本地账号只允许进行控制台登录 | √ |
| Disabled | dword:00000000 | 使用空白密码的本地账号允许任何方式的登陆（不安全） | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
"LimitBlankPasswordUse"=dword:00000001
```










## 四、个性化

### 4.1 设置主题色

* Windows设置-个性化-颜色-从我的背景自动选取一种主题色

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 从桌面图片背景自动选取一种主题色 | |
| 不勾选 | dword:00000000 | 使用指定的主题颜色 | |

```
[HKEY_CURRENT_USER\Control Panel\Desktop]
"AutoColorization"=dword:00000001
```

### 4.2 设置开始菜单\任务栏使用透明效果

* Windows设置-个性化-颜色-透明效果

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 开 | dword:00000001 | 使得开始菜单\任务栏有透明效果 | |
| 关 | dword:00000000 | 开始菜单\任务栏不使用透明效果 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"EnableTransparency"=dword:00000001
```

### 4.3 设置“开始”菜单、任务栏和操作中心使用主题色

* Windows设置-个性化-颜色-在以下页面显示主题色-“开始”菜单、任务栏和操作中心

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | “开始”菜单、任务栏和操作中心使用主题色 | |
| 不勾选 | dword:00000000 | “开始”菜单、任务栏和操作中心为默认的主题色 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"ColorPrevalence"=dword:00000001
```

### 4.4 设置"标题栏"使用主题色

* Windows设置-个性化-颜色-在以下页面显示主题色-标题栏

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 使得开始菜单\任务栏有透明效果 | |
| 不勾选 | dword:00000000 | 开始菜单\任务栏不使用透明效果 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM]
"ColorPrevalence"=dword:00000001
```

### 4.5 设置锁屏界面的背景

* Windows设置-个性化-锁屏界面-背景

**提醒:** 网上流传使用"Windows聚焦"作为锁屏背景会造成CPU运行100%的情况，这里只做参考！

| 界面操作 | "LockScreenAutoLockActive"对应的值 | "DelayLockInterval"对应的值 | "RotatingLockScreenEnabled"对应的值 | "SlideshowEnabled"对应的值 | "SubscriptionContext"对应的值 | 作用 | 建议 |
|:---------|:----------------------------------:|:---------------------------:|:-----------------------------------:|:---------------------------:|:-----------------------------:|:-----|:----:|
| 选择"Windows聚焦" | "0" | 删除键 | dword:00000001 | dword:00000000 | "sc-mode=0" |  | |
| 选择"图片" | "0" | 删除键 | dword:00000000 | dword:00000000 | "sc-mode=1" |  | |
| 选择"幻灯片放映" | "1" | dword:00000000 | dword:00000000 | dword:00000001 | "sc-mode=1" |  | |

如下示例是选择"图片"作为锁屏背景的设置：

```
[HKEY_CURRENT_USER\Control Panel\Desktop]
"LockScreenAutoLockActive"="0"

[HKEY_CURRENT_USER\Control Panel\Desktop]
"DelayLockInterval"=-

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"RotatingLockScreenEnabled"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lock Screen]
"SlideshowEnabled"=dword:00000000

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions\338387]
"SubscriptionContext"="sc-mode=1"
```

### 4.6 是否在锁屏界面上获取花絮、提示、技巧等

* Windows设置-个性化-锁屏界面-在锁屏界面上获取花絮、提示、技巧等

| 界面操作 | "SubscribedContent-338387Enabled"对应的值 | "RotatingLockScreenOverlayEnabled"对应的值 | 作用 | 建议 |
|:---------|:-----------------------------------------:|:------------------------------------------:|:-----|:----:|
| 开 | dword:00000001 | dword:00000001 | 在锁屏界面上获取花絮、提示、技巧等 | |
| 关 | dword:00000000 | dword:00000000 | 禁止在锁屏界面上获取花絮、提示、技巧等 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"SubscribedContent-338387Enabled"=dword:00000000
"RotatingLockScreenOverlayEnabled"=dword:00000000
```

### 4.7 桌面系统图标的显示和隐藏

* Windows设置-个性化-主题-桌面图标设置

| 对应键名 | 对应注册表值 | 界面操作 | 作用 | 建议 |
|:---------|:------------:|:---------|:-----|:----:|
| {20D04FE0-3AEA-1069-A2D8-08002B30309D} | dword:00000000 | 勾选 | 在桌面显示“此电脑” | |
| {20D04FE0-3AEA-1069-A2D8-08002B30309D} | dword:00000001 | 不勾选 | 隐藏桌面的“此电脑” [默认] | √ |
| {645FF040-5081-101B-9F08-00AA002F954E} | dword:00000000 | 勾选 | 在桌面显示“回收站” [默认] | |
| {645FF040-5081-101B-9F08-00AA002F954E} | dword:00000001 | 不勾选 | 隐藏桌面的“回收站” | √ |
| {F02C1A0D-BE21-4350-88B0-7367FC96EF3C} | dword:00000000 | 勾选 | 在桌面显示“网络” | |
| {F02C1A0D-BE21-4350-88B0-7367FC96EF3C} | dword:00000001 | 不勾选 | 隐藏桌面的“网络” [默认] | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]
"{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000     ;网络
"{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000     ;回收站
"{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000     ;此电脑

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]
"{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"=dword:00000000     ;网络
"{645FF040-5081-101B-9F08-00AA002F954E}"=dword:00000000     ;回收站
"{20D04FE0-3AEA-1069-A2D8-08002B30309D}"=dword:00000000     ;此电脑
```
* 在桌面显示或隐藏 Internet Explorer
    * 显示的方法

```
[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}]
@="Internet Explorer"
"InfoTip"="@C:\\Windows\\System32\\ieframe.dll,-881"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\DefaultIcon]
@="C:\\Windows\\System32\\ieframe.dll,-190"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\InProcServer32]
@="C:\\Windows\\System32\\ieframe.dll"
"ThreadingModel"="Apartment"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell]
@="OpenHomePage"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\NoAddOns]
@="Start Without Add-ons"
"LegacyDisable"=""

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\NoAddOns\Command]
@="\"C:\\Program Files\\Internet Explorer\\iexplore.exe\" -extoff"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\OpenHomePage]
@="打开主页(&H)"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\OpenHomePage\Command]
@="\"C:\\Program Files\\Internet Explorer\\iexplore.exe\""

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Private]
@="开始InPrivate浏览(&I)"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Private\Command]
@="\"C:\\Program Files\\Internet Explorer\\iexplore.exe\" -private"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties]
@="属性(&R)"
"Position"="bottom"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties\Command]
@="control.exe inetcpl.cpl"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\Shellex\ContextMenuHandlers\ieframe]
@="{871C5380-42A0-1069-A2EA-08002B30309D}"

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\Shellex\MayChangeDefaultMenu]
@=""

[HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\ShellFolder]
@="C:\\Windows\\System32\\ieframe.dll,-190"
"HideAsDeletePerUser"=""
"Attributes"=dword:00000024
"HideFolderVerbs"=""
"WantsParseDisplayName"=""
"HideOnDesktopPerUser"=""

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu]
"{871C5380-42A0-1069-A2EA-08002B30301D}"=-
"{871C5380-42A0-1069-A2EA-08002B30309D}"=-

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel]
"{871C5380-42A0-1069-A2EA-08002B30301D}"=-
"{871C5380-42A0-1069-A2EA-08002B30309D}"=-

[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30301D}]
```

* 隐藏的方法

```
;[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30301D}]
```

* 删除方法如下

```
;[-HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}]
;[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30301D}]
```

### 4.8 允许或禁止在“开始”屏幕中显示建议

* Windows设置-个性化-开始-偶尔在“开始”屏幕中显示建议

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 开 | dword:00000001 | 允许在“开始”屏幕中显示建议 | |
| 关 | dword:00000000 | 禁止在“开始”屏幕中显示建议 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"SubscribedContent-338388Enabled"=dword:00000000
```

### 4.9 在“开始”菜单或任务栏的跳转列表中显示或隐藏最近打开的项

**提醒:** 跳转列表即你右键任务栏中的程序图标,弹出的菜单上显示的历史文件或历史文件夹

* Windows设置-个性化-开始-在“开始”菜单或任务栏的跳转列表中显示最近打开的项

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 开 | dword:00000001 | 在“开始”菜单或任务栏的跳转列表中显示最近打开的项 | √ |
| 关 | dword:00000000 | 在“开始”菜单或任务栏的跳转列表中隐藏最近打开的项 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"Start_TrackDocs"=dword:00000001
```

### 4.10 在“快速访问”中显示或隐藏最近使用的文件

* 控制面板-文件资源管理器选项-常规-私隐-在“快速访问”中显示最近使用的文件

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000001 | 在“快速访问”中显示最近使用的文件 | |
| 不勾选 | dword:00000000 | 在“快速访问”中隐藏最近使用的文件 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]
"ShowRecent"=dword:00000000
```

### 4.11 在“快速访问”中显示或隐藏常用文件夹

* 控制面板-文件资源管理器选项-常规-私隐-在“快速访问”中显示常用文件夹

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000001 | 在“快速访问”中显示常用文件夹 | |
| 不勾选 | dword:00000000 | 在“快速访问”中隐藏常用文件夹 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]
"ShowFrequent"=dword:00000000
```

### 4.12 退出系统时清除最近打开的文档的历史 [组策略方式]

* 用户配置(User Configuration)-管理模板(Administrative Templates)-"开始"菜单和任务栏(Start Menu and Taskbar)-退出系统时清除最近打开的文档的历史(Clear history recently opened documents on exit)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 退出系统时清除最近打开的文档的历史 | √ |
| "Disabled" or "Not Configured" | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"ClearRecentDocsOnExit"=dword:00000001
```

### 4.13 锁定或解锁任务栏

* Windows设置-个性化-任务栏-锁定任务栏

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000001 | 不锁定任务栏| √ |
| 开 | dword:00000000 | 锁定任务栏 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"TaskbarSizeMove"=dword:00000000
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-"开始"菜单和任务栏(Start Menu and Taskbar)-锁定任务栏(Lock the Taskbar)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" | dword:00000001 | |
| "Disabled" or "Not Configured" | 删除键值 | √ |

**注意：** 如果启用该设置，"Windows设置-个性化-任务栏-锁定任务栏"的开关设置将变成灰，无法设置！

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"LockTaskbar"=-
```

### 4.14 在平板模式下自动显示或隐藏任务栏

* Windows设置-个性化-任务栏-在平板模式下自动隐藏任务栏

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000000 | 在平板模式下自动显示任务栏| √ |
| 开 | dword:00000001 | 在平板模式下自动隐藏任务栏 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"TaskbarAutoHideInTabletMode"=dword:00000000
```

### 4.15 切换大小任务栏按钮

* Windows设置-个性化-任务栏-使用小任务栏按钮

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000000 | 任务栏显示大按钮| √ |
| 开 | dword:00000001 | 任务栏显示小按钮 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"TaskbarSmallIcons"=dword:00000000
```

### 4.16 启用或禁用桌面Peek预览功能

* Windows设置-个性化-任务栏-当你将鼠标移动到任务栏末端的“显示桌面”按钮时，使用“速览”预览桌面

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000001 | 禁用桌面Peek预览功能| √ |
| 开 | dword:00000000 | 启用桌面Peek预览功能 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"DisablePreviewDesktop"=dword:00000001
```

### 4.17 Win+X菜单中显示PowerShell或命令提示符

* Windows设置-个性化-任务栏-当我右键单击“开始”按钮或按下Windows键+X时，在菜单中将命令提示符替换为Windows PowerShell

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000001 | Win+X菜单中显示命令提示符,而不显示PowerShell | √ |
| 开 | dword:00000000 | Win+X菜单中不显示命令提示符,而显示PowerShell | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"DontUsePowerShellOnWinX"=dword:00000001
```

### 4.18 在任务栏上开启或关闭人脉

Windows设置-个性化-任务栏-人脉-在任务栏上显示联系人

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000000 | 在任务栏上关闭人脉 | √ |
| 开 | dword:00000001 | 在任务栏上开启人脉 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People]
"PeopleBand"=dword:00000000
```

### 4.19 在任务栏设置搜索框的显示方式

* 右键任务栏-Cortana\搜索-显示Cortana\搜索图标

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 隐藏 | dword:00000000 | 在任务栏不显示搜索框 | |
| 显示搜索图标 | dword:00000001 | 在任务栏显示搜索图标按钮 | √ |
| 显示搜索框 | dword:00000002 | 在任务栏显示搜索框 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]
"SearchboxTaskbarMode"=dword:00000001
```

### 4.20 在任务栏显示或隐藏"Windows Ink工作区"按钮

* 右键任务栏-显示"Windows Ink 工作区"按钮

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 取消勾选 | dword:00000000 | 在任务栏隐藏"Windows Ink 工作区"按钮 | |
| 勾选 | dword:00000001 | 在任务栏显示"Windows Ink 工作区"按钮 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace]
"PenWorkspaceButtonDesiredVisibility"=dword:00000001
```

### 4.21 打开文件资源管理器时打开"此电脑"或"快速访问"

* 控制面板-文件资源管理器选项-常规-打开文件资源管理器时打开

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"此电脑" | dword:00000001 | 打开文件资源管理器时打开此电脑 | √ |
| 选择"快速访问" | dword:00000002 | 打开文件资源管理器时打开快速访问 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"LaunchTo"=dword:00000001
```

### 4.22 显示\隐藏此电脑的OneDrive

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 在此电脑显示OneDrive [默认] | |
| 不勾选 | dword:00000000 | 禁用库文件夹 | √ |

```
[HKEY_CURRENT_USER\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}]
"System.IsPinnedToNameSpaceTree"=dword:00000000
```

* 当勾选'''导航窗格显示所有文件夹'''时，还需要删除这个项

```
[-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{018D5C66-4533-4307-9B53-224DE2ED1FE6}]
```

### 4.23 显示\隐藏此电脑的库文件夹

* 控制面板-文件资源管理器选项-查看-高级设置-导航窗格-显示库

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 在此电脑显示库文件夹 | |
| 不勾选 | dword:00000000 | 禁用库文件夹 [默认] | √ |

```
[HKEY_CURRENT_USER\Software\Classes\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}]
"System.IsPinnedToNameSpaceTree"=dword:00000000
```

### 4.24 导航窗格显示所有文件夹

* 控制面板-文件资源管理器选项-查看-高级设置-导航窗格-显示所有文件夹

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 显示所有文件夹 | √ |
| 不勾选 | dword:00000000 | 不显示显示所有文件夹 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"NavPaneShowAllFolders"=dword:00000001
```

### 4.25 导航窗格自动展开到当前文件夹

* 控制面板-文件资源管理器选项-查看-高级设置-导航窗格-展开到打开的文件夹

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 自动展开到当前文件夹 | √ |
| 不勾选 | dword:00000000 | 不展开[默认] | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"NavPaneExpandToCurrentFolder"=dword:00000001
```

### 4.26 是否使用复选框以选择项

* 控制面板-文件资源管理器选项-查看-高级设置-文件和文件夹-使用复选框以选择项

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 使用复选框以选择项 | |
| 不勾选 | dword:00000000 | 禁用复选框以选择项 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"AutoCheckSelect"=dword:00000000
```

### 4.27 隐藏此电脑里的文件夹分类

| "ThisPCPolicy"对应的值 | 作用 | 建议 |
|:------------:|:-----|:----:|
| Show | 设置该分类文件夹的显示 | √ |
| Hide | 禁用该分类文件夹（不显示） | |

**注意：** 除了"3D对象"和"桌面"文件夹分类通过删除NameSpace项有效，其他的文件夹分类只能通过修改ThisPCPolicy的键值为"Hide"实现隐藏，所以下面某些注册表项修改是可以注释掉的，但是早期的win10版本是可以通过删除NameSpace项来隐藏所有分类文件夹。

* 3D 对象分类文件夹

```
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}]
```

* 音乐(Music)分类文件夹

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag]
"ThisPCPolicy"="Hide"
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}]
```

* 下载(Downloads)分类文件夹

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag]
"ThisPCPolicy"="Hide"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}]
```

* 图片(Pictures)分类文件夹

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag]
"ThisPCPolicy"="Hide"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}]
```

* 视频(Videos)分类文件夹

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag]
"ThisPCPolicy"="Hide"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}]
```

* 文档(Documents)分类文件夹

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag]
"ThisPCPolicy"="Hide"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}]
```

* 桌面(Desktop)分类文件夹

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag]
"ThisPCPolicy"="Hide"

[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}]

[-HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}]
```

### 4.28 图标个性化

* 去除快捷方式图标的箭头

> 原理:先把一张透明的ICO图片复制到%Windir%目录中,再在注册表对应的键值中指定该透明图标所在的位置.其实就是把那个箭头图片替换成透明图片而已.

**注意:** 批处理Setup.bat脚本中处理了把透明图片拷贝到指定路径的相关操作。

| 对应注册表值 | 作用 | 建议 |
|:------------:|:-----|:----:|
| "%Systemroot%\\Empty.ico,0" | 不显示快捷方式图标的箭头 | √ |
| 删除键值 | 显示快捷方式的箭头 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]
"29"="%Systemroot%\\Empty.ico,0"
```

* 去除"快捷方式"字样

```
[HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer]
"Link"=hex:00,00,00,00
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]
"link"=hex:00,00,00,00
```

* 去除"快捷方式"字样后还原默认的方法

```
;[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer]
;"link"=hex:1e,00,00,00
;[HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer]
;"link"=-
```

### 4.29 设置图标缓存

> 增加图标缓存

**Benefit:** Increases the icon cache from 500KB (default, if present) to 8192KB to help prevent icons from redrawing or that are corrupt.

**注意:** "Max Cached Icons"的值最大为8M(8192K), 设置更大的值无效!

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
"Max Cached Icons"="8192"
```

### 4.30 显示或隐藏文件的设置

* 控制面板-文件资源管理器选项-查看-高级设置-文件和文件夹-隐藏受保护的操作系统文件（推荐）

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 显示隐藏的系统文件 | √ |
| 不勾选 | dword:00000000 | 隐藏系统文件[默认] | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"ShowSuperHidden"=dword:00000001
```

* 控制面板-文件资源管理器选项-查看-高级设置-文件和文件夹-隐藏文件和文件夹
| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"不显示隐藏的文件、文件夹或驱动器" | dword:00000002 | | √ |
| 选择"显示隐藏的文件、文件夹或驱动器" | dword:00000001 | | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"Hidden"=dword:00000002
```

### 4.31 显示或隐藏已知文件类型的扩展名

* 控制面板-文件资源管理器选项-查看-高级设置-文件和文件夹-隐藏已知文件类型的扩展名

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 隐藏已知文件类型的扩展名 | √ |
| 不勾选 | dword:00000000 | 显示已知文件类型的扩展名 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"HideFileExt"=dword:00000001
```

### 4.32 禁止\允许使用跟踪和搜索来解析损坏的快捷方式

* 用户配置(User Configuration)-管理模块(Administrative Templates)-"开始"菜单和任务栏(Start Menu and Taskbar)-解析外壳程序快捷方式时不要使用基于跟踪的方法(Do not use the tracking-based method when resolving shell shortcuts)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| "Enabled" | dword:00000001 | 不要使用基于跟踪的方法 | √ |
| "Disabled" or "Not Configured" | dword:00000000 | 使用基于跟踪的方法 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoResolveTrack"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-"开始"菜单和任务栏(Start Menu and Taskbar)-解析外壳程序快捷方式时不要使用基于搜索的方法(Do not use the search-based method when resolving shell shortcuts)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| "Enabled" | dword:00000001 | 不要使用基于跟踪的方法 | √ |
| "Disabled" or "Not Configured" | dword:00000000 | 使用基于跟踪的方法 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoResolveSearch"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-文件资源管理器(File Explorer)-漫游时不跟踪外壳程序快捷方式(Do not track Shell shortcuts during roaming)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| "Enabled" | dword:00000001 | 不要使用基于跟踪的方法 | √ |
| "Disabled" or "Not Configured" | dword:00000000 | 使用基于跟踪的方法 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"LinkResolveIgnoreLinkInfo"=dword:00000001
```

### 4.33 减少了鼠标移至"任务栏"或"显示桌面"出现预览画面所需的延迟时间

> 这里设置为100毫秒.

**注意:** 请不要设置为0, 这样反而弹出开始菜单的时间更长了!

```
[HKEY_CURRENT_USER\Control Panel\Mouse]
"MouseHoverTime"="100"
```

### 4.34 减少打开开始菜单的延迟时间

> 这里设置打开开始菜单的延迟时间时20毫秒.

**注意:** 请不要设置为0, 这样反而弹出开始菜单的时间更长了!

```
[HKEY_CURRENT_USER\Control Panel\Desktop]
"MenuShowDelay"="20"
[HKEY_USERS\.DEFAULT\Control Panel\Desktop]
"MenuShowDelay"="20"
```

### 4.35 控制面版显示方式

* 控制面板(Control Panel)-查看方式(View by)

| 界面操作 | "StartupPage"对应的值 | "AllItemsIconView"对应的值 | 作用 | 建议 |
|:---------|:---------------------:|:--------------------------:|:-----|:----:|
| 选择"大图标"视图模式(Large icons) | dword:00000001 | dword:00000000 | 控制面板显示"大图标"模式 | √ |
| 选择"小图标"视图模式(Small icons) | dword:00000001 | dword:00000001 | 控制面板显示"小图标"模式 | |
| 选择"类别"视图模式(Category) | dword:00000000 | dword:00000000 | 分类显示控制面板 | |

> "AllItemsIconView"的值主要服务于图标视图模式,与类别视图模式无关.值为0时,显示大图标.值为1时,显示小图标;

> "StartupPage"的值为控制图标和类别视图模式的开关.值为1时,图标视图模式显示.值为0时,类别视图模式显示;

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel]
"AllItemsIconView"=dword:00000000
"StartupPage"=dword:00000001
```

### 4.36 设置"桌面自动排列图标"和"将图标与网格对齐"

* 桌面右键菜单-查看

> 桌面自动排列图标(Auto Arrange icons)

> 2进制值为0000 0001(即16进制0x01)时,自动排列;

> 2进制值为0000 0000(即16进制0x00)时,不自动;

> 将图标与网格对齐(Align icons to grid)

> 2进制值为0000 0100(即16进制0x04)时,对齐;

> 2进制值为0000 0000(即16进制0x00)时,不对齐;

> 由于"桌面自动排列图标"和"将图标与网格对齐"的选择同时由"FFlags"这个值决定,可由下面计算公式得:

> 计算公式: "FFlags"的值 = 0x40200220 | "桌面自动排列图标"的值 | "将图标与网格对齐"的值 (位与运算)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 仅勾选"桌面自动排列图标", 不勾选"将图标与网格对齐" | dword:40200221 | | |
| 不勾选"桌面自动排列图标", 仅勾选"将图标与网格对齐" | dword:40200224 | | |
| 勾选"桌面自动排列图标", 并勾选"将图标与网格对齐" | dword:40200225 | | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags\1\Desktop]
"FFlags"=dword:40200225
```

### 4.37 设置文件夹查看方式的图标大小

* 桌面右键菜单-查看

**提示:** 当然除了以上的值外,其16进制取值范围可以小于等于100,大于等于10;即10进制的小于等于256,大于等于16.

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"大图标" | dword:00000060 | 显示为大图标 | |
| 选择"中等图标" | dword:00000030 | 显示为中等图标 | |
| 选择"小图标" | dword:00000020 | 显示为小图标 | |
| 自定义大小 | dword:00000100~dword:00000010 | 自定义图标大小, 取值范围可以小于等于100,大于等于10;即10进制的小于等于256,大于等于16 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags\1\Desktop]
"IconSize"=dword:00000030
```

### 4.38 设置文件夹文件排序方式

**注意：** 我这里使用的排列方式为"项目类型", 这个设置需要重启电脑才生效.

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags\1\Desktop]
;* 选择"名称(Name)",值为;
;"Sort"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,30,f1,25,b7,ef,47,1a,10,a5,f1,02,60,8c,9e,eb,ac,0a,00,00,00,01,00,00,00
;* 选择"大小(Size)",值为;
;"Sort"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,30,f1,25,b7,ef,47,1a,10,a5,f1,02,60,8c,9e,eb,ac,0c,00,00,00,ff,ff,ff,ff
;* 选择"项目类型(Item type)",值为;
"Sort"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,a6,6a,63,28,3d,95,d2,11,b5,d6,00,c0,4f,d9,18,d0,0b,00,00,00,01,00,00,00
;* 选择"修改日期(Date modified)",值为;
;"Sort"=hex:00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,01,00,00,00,30,f1,25,b7,ef,47,1a,10,a5,f1,02,60,8c,9e,eb,ac,0e,00,00,00,ff,ff,ff,ff
```

### 4.39 折叠或展开文件资源管理器菜单栏功能区（Ribbon菜单） [非组策略方式]

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 文件资源管理器Ribbon菜单点击右边向上箭头，折叠 | dword:00000001 | 折叠Ribbon菜单 | √ |
| 文件资源管理器Ribbon菜单点击右边向下箭头，展开 | dword:00000000 | 展开Ribbon菜单 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Ribbon]
"MinimizedStateTabletModeOff"=dword:00000001
```

### 4.40 启用或禁用锁屏功能

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-控制面板(Control Panel)-个性化(Personalization)-不显示锁屏(Do not diskplay the lock sreen)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| "Enabled" | dword:00000001 | 禁用锁屏功能 | |
| "Disabled" or "Not Configured" | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]
"NoLockScreen"=dword:00000001
```











## 五、应用

### 5.1 文件没有关联的打开程序时，禁止访问应用商店搜索打开类型.

* 计算机配置(Computer Configuration)-管理模板(Administrative Templates)-系统(System)-Internet 通信管理(Internet Communication Manager)-Internet 通信设置(Internet Communication settings)-关闭访问应用商店(Turn off access to the Store)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 文件没有关联的打开程序时，禁止访问应用商店搜索打开类型 | √ |
| "Disabled" | dword:00000000 | 文件没有关联的打开程序时，允许选择访问应用商店搜索打开类型 | |
| "Not Configured" | 删除键值 | 文件没有关联的打开程序时，允许选择访问应用商店搜索打开类型 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer]
"NoUseStoreOpenWith"=dword:00000001
```

* 用户配置(User Configuration)-管理模板(Administrative Templates)-系统(System)-Internet 通信管理(Internet Communication Manager)-Internet 通信设置(Internet Communication settings)-关闭访问应用商店(Turn off access to the Store)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 文件没有关联的打开程序时，禁止访问应用商店搜索打开类型 | √ |
| "Disabled" | dword:00000000 | 文件没有关联的打开程序时，允许选择访问应用商店搜索打开类型 | |
| "Not Configured" | 删除键值 | 文件没有关联的打开程序时，允许选择访问应用商店搜索打开类型 | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer]
"NoUseStoreOpenWith"=dword:00000001
```

### 5.2 内置Administrator管理员帐户使用应用商店

* 计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-用户帐户控制: 用于内置管理员帐户的管理员批准模式(User Account Control: Admin Approval Mode for the Built-in Administrator account)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 使Administrator账号能够使用应用商城 | √ |
| "Disabled" | dword:00000000 | 禁止Administrator账号使用应用商城 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"FilterAdministratorToken"=dword:00000001
```

### 图片的打开方式中增加Windows照片查看器

```
[HKEY_CURRENT_USER\Software\Classes\.jpg]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_CURRENT_USER\Software\Classes\.jpeg]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_CURRENT_USER\Software\Classes\.gif]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_CURRENT_USER\Software\Classes\.png]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_CURRENT_USER\Software\Classes\.bmp]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_CURRENT_USER\Software\Classes\.tiff]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_CURRENT_USER\Software\Classes\.ico]
@="PhotoViewer.FileAssoc.Tiff"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations]
".jpg"="PhotoViewer.FileAssoc.Tiff"
".jpeg"="PhotoViewer.FileAssoc.Tiff"
".gif"="PhotoViewer.FileAssoc.Tiff"
".png"="PhotoViewer.FileAssoc.Tiff"
".bmp"="PhotoViewer.FileAssoc.Tiff"
".ico"="PhotoViewer.FileAssoc.Tiff"
".tiff"="PhotoViewer.FileAssoc.Tiff"
```









## 六、账户

### 6.1同步设置

#### 6.1.1 不同步 [同步设置总开关]

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步(Do not sync)

> 与其关联的： Windows设置-账户-同步你的设置-同步设置

| 界面操作 | "DisableSettingSync"对应的值 | "DisableSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:----------------------------:|:----------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableSettingSync"=dword:00000002
"DisableSettingSyncUserOverride"=dword:00000001
```

#### 6.1.2 不同步应用设置

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步应用设置(Do not sync app settings)

| 界面操作 | "DisableApplicationSettingSync"对应的值 | "DisableApplicationSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:---------------------------------------:|:---------------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"应用设置"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"应用设置"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableApplicationSettingSync"=dword:00000002
"DisableApplicationSettingSyncUserOverride"=dword:00000001
```

#### 6.1.3 不同步密码

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步密码(Do not sync passwords)

| 界面操作 | "DisableCredentialsSettingSync"对应的值 | "DisableCredentialsSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:---------------------------------------:|:---------------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"密码"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"密码"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableCredentialsSettingSync"=dword:00000002
"DisableCredentialsSettingSyncUserOverride"=dword:00000001
```

#### 6.1.4 不同步桌面个性化

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步桌面个性化(Do not sync desktop personalization)

| 界面操作 | "DisableDesktopThemeSettingSync"对应的值 | "DisableDesktopThemeSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:----------------------------------------:|:----------------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"桌面个性化"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"桌面个性化"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableDesktopThemeSettingSync"=dword:00000002
"DisableDesktopThemeSettingSyncUserOverride"=dword:00000001
```

#### 6.1.5 不同步个性化

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步个性化(Do not sync personalize)

| 界面操作 | "DisablePersonalizationSettingSync"对应的值 | "DisablePersonalizationSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:-------------------------------------------:|:-------------------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"个性化"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"个性化"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisablePersonalizationSettingSync"=dword:00000002
"DisablePersonalizationSettingSyncUserOverride"=dword:00000001
```

#### 6.1.6 不同步浏览器设置

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步浏览器设置(Do not sync browser settings)

| 界面操作 | "DisableWebBrowserSettingSync"对应的值 | "DisableWebBrowserSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:--------------------------------------:|:--------------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"浏览器"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"浏览器"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableWebBrowserSettingSync"=dword:00000002
"DisableWebBrowserSettingSyncUserOverride"=dword:00000001
```

#### 6.1.7 不同步其他 Windows 设置

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步其他 Windows 设置(Do not sync other Windows settings)

| 界面操作 | "DisableWindowsSettingSync"对应的值 | "DisableWindowsSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:-----------------------------------:|:-----------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"其他 Windows 设置"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"其他 Windows 设置"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableWindowsSettingSync"=dword:00000002
"DisableWindowsSettingSyncUserOverride"=dword:00000001
```

#### 6.1.8 不同步应用

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步应用(Do not sync Apps)

| 界面操作 | "DisableAppSyncSettingSync"对应的值 | "DisableAppSyncSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:-----------------------------------:|:-----------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"其他 Windows 设置"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"其他 Windows 设置"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableAppSyncSettingSync"=dword:00000002
"DisableAppSyncSettingSyncUserOverride"=dword:00000001
```

#### 6.1.9 不同步开始设置

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不同步开始设置(Do not sync Do not sync start settings)

| 界面操作 | "DisableStartLayoutSettingSync"对应的值 | "DisableStartLayoutSettingSyncUserOverride"对应的值 | 作用 | 建议 |
|:---------|:---------------------------------------:|:---------------------------------------------------:|:-----|:----:|
| "Enabled", 不勾选"允许用户启用"开始布局"同步" | dword:00000002 | dword:00000001 | 禁用同步，并且不允许用户设置Windows设置里对应的同步设置 | |
| "Enabled", 勾选"允许用户启用"开始布局"同步" | dword:00000002 | dword:00000000 | 禁用同步，但允许用户设置Windows设置里对应的同步设置 | |
| "Disabled" | dword:00000001 | dword:00000001 | 允许同步，但不允许用户设置Windows设置里对应的同步设置 | |
| "Not Configured" | 删除键值 | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableStartLayoutSettingSync"=dword:00000002
"DisableStartLayoutSettingSyncUserOverride"=dword:00000001
```

#### 6.1.10 不在按流量计费的连接上同步

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-同步你的设置(Sync your settings)-不在按流量计费的连接上同步(Do not sync on metered connections)

| 界面操作 | "DisableStartLayoutSettingSync"对应的值 | 作用 | 建议 |
|:---------|:---------------------------------------:|:-----|:----:|
| "Enabled" | dword:00000001 | 当使用流量计费上网时, 不做同步 | |
| "Disabled" | dword:00000000 | 当使用流量计费上网时, 可以同步 | |
| "Not Configured" | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync]
"DisableSyncOnPaidNetwork"=dword:00000001
```










## 七、时间和语言

### 7.1 微软输入法设置默认为英文输入

* Windows设置-时间和语言-区域和语言-语言-中文（中华人民共和国）-选项-键盘-微软拼音-选项-常规-选择输入法默认模式

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"中文" | dword:00000000 | 默认使用中文 | |
| 选择"英文" | dword:00000001 | 默认使用英文 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS]
"Default Mode"=dword:00000001
```

### 7.2 是否需要与Internet时间服务器同步

* 控制面板-日期和时间-Internet时间-更改设置-与Internet时间服务器同步

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | "NTP" | 与Internet时间服务器同步,需要设置"Windows Time"服务为自动或手动 | |
| 不勾选 | "NoSync" | 不使用Internet时间服务器同步, 同时可以把"Windows Time"服务禁用 | |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters]
"Type"="NoSync"
```

### 7.3 修改任务栏时间与日期显示格式

* Windows设置-时间和语言-更改日期和时间格式

> 控制面板(Control Panel)-日期和时间(Date and Time)-更改日期和时间...(Change date and time...)-更改日历设置(Change calendar settings)-区域(Region)-格式(Formats)-其他设置...(Additional settings...)-时间(Time)

> 在任务栏的时间显示格式为"tt h:mm"(如:A.M. 9:06)

| 符号 (区分大小写) | 代表意义 |
|:----:|:---------|
| h | 小时, 12小时制, 个位数前面不补零 |
| hh | 小时, 12小时制, 个位数前面补零 |
| H | 小时, 24小时制, 个位数前面不补零 |
| HH | 小时, 24小时制, 个位数前面补零 |
| m | 分钟, 个位数前面不补零 |
| mm | 分钟, 个位数前面补零 |
| s | 秒, 个位数前面不补零 |
| ss | 秒, 个位数前面补零 |
| tt | 上午或下午 |
| yy | 年, 仅显示年度后2位 |
| yyyy | 年, 显示4位完整年度 |
| M | 月份 |
| d | 日, 与dd相同 |
| dd | 日, 与d相同 |
| ddd | 周几 |
| dddd | 星期几 |

```
[HKEY_CURRENT_USER\Control Panel\International]
"s1159"="A.M."
"s2359"="P.M."
"sShortTime"="tt h:mm"
"sTimeFormat"="tt h:mm:ss"
```

* 控制面板(Control Panel)-日期和时间(Date and Time)-更改日期和时间...(Change date and time...)-更改日历设置(Change calendar settings)-区域(Region)-格式(Formats)-其他设置...(Additional settings...)-日期(Date)

> 在任务栏的同时显示“周几”

```
[HKEY_CURRENT_USER\Control Panel\International]
"sShortDate"="yyyy/M/d ddd"
"sLongDate"="yyyy'年'M'月'd'日' ddd"
"sYearMonth"="yyyy'年'M'月'"
```











## 八、隐私

### 8.1 基于id给你投放广告

* Windows设置-隐私-常规-允许应用使用广告ID，以便基于你的应用使用情况投放你投放你更感兴趣的广告（关闭该模式将会重置你的ID）

| 界面操作 | "Enabled"对应的值 | "id"对应的值 | 作用 | 建议 |
|:---------|:-----------------:|:------------:|:-----|:----:|
| 开 | dword:00000001 | 系统自动生成id值 | 投放广告 | |
| 关 | dword:00000000 | 删除键值 | 禁止投放广告和发送使用情况到MS服务器 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo]
"Enabled"=dword:00000000
"id"=-
```

### 8.2 允许或禁止网站通过访问我的语言列表来提供本地相关内容

* Windows设置-隐私-常规-允许网站通过访问我的语言列表来提供本地相关内容

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:--------:|:------------:|:-----|:----:|
| 开 | 删除键 | 允许网站通过访问我的语言列表来提供本地相关内容 | |
| 关 | dword:00000001 | 禁止网站通过访问我的语言列表来提供本地相关内容 | √ |

```
[HKEY_CURRENT_USER\Control Panel\International\User Profile]
"HttpAcceptLanguageOptOut"=dword:00000001
```

### 8.3 允许或禁止Windows跟踪应用启动，以改进开始和搜索结果

* Windows设置-隐私-常规-允许Windows跟踪应用启动，以改进开始和搜索结果

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:--------:|:------------:|:-----|:----:|
| 开 | dword:00000001 | 允许Windows跟踪应用启动，以改进开始和搜索结果 | |
| 关 | dword:00000000 | 禁止Windows跟踪应用启动，以改进开始和搜索结果 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"Start_TrackProgs"=dword:00000000
```

### 8.4 在设置应用中为我显示建议的内容

* Windows设置-隐私-常规-在设置应用中为我显示建议的内容

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:--------:|:------------:|:-----|:----:|
| 开 | dword:00000001 | 在设置应用中为我显示建议的内容 | |
| 关 | dword:00000000 | 不要在设置应用中为我显示建议的内容 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"SubscribedContent-353694Enabled"=dword:00000000
"SubscribedContent-338393Enabled"=dword:00000000
```

### 8.5 是否让应用使用定位服务权限

* Windows设置-隐私-位置-定位服务

| 界面操作 | "Value"对应值 | "SensorPermissionState"对应值 | 作用 | 建议 |
|:--------:|:-------------:|:-----------------------------:|:-----|:----:|
| 开 | "Allow" | dword:00000001 | 开启定位服务 | |
| 关 | "Deny" | dword:00000000 | 关闭定位服务 | |

```
;[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}]
;"Value"="Deny"

;[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E6AD100E-5F4E-44CD-BE0F-2265D88D14F5}]
;"Value"="Deny"

;[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}]
;"SensorPermissionState"=dword:00000000
```

### 8.6 允许或禁止应用访问我的联系人

* Windows设置-隐私-联系人-允许应用访问我的联系人

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "Deny" | 禁止所有应用访问我的联系人 | |
| 开 | "Allow" | 允许应用访问我的联系人 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts]
"Value"="Deny"
```

### 8.7 允许或禁止应用访问我的通话记录

* Windows设置-隐私-通话记录-允许应用访问我的通话记录

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "Deny" | 禁止应用访问我的通话记录 | |
| 开 | "Allow" | 允许应用访问我的通话记录 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory]
"Value"="Deny"
```

### 8.8 允许或禁止应用访问和发送电子邮件

* Windows设置-隐私-电子邮件-允许应用访问和发送电子邮件

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "Deny" | 禁止应用访问和发送电子邮件 | |
| 开 | "Allow" | 允许应用访问和发送电子邮件 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email]
"Value"="Allow"
```

### 8.9 允许或禁止应用读取或发送消息

* Windows设置-隐私-消息传送-允许应用读取或发送消息

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "Deny" | 禁止应用读取或发送消息 | |
| 开 | "Allow" | 允许应用读取或发送消息 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat]
"Value"="Deny"
```

### 8.10 允许或禁止应用控制无线电收发器

* Windows设置-隐私-无线电收发器-让应用控制无线电收发器

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "Deny" | 禁止应用控制无线电收发器 | |
| 开 | "Allow" | 允许应用控制无线电收发器 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}]
"Value"="Deny"
```

### 8.11 设置向Microsoft发送多少数据

* Windows设置-隐私-反馈和诊断-选择你向Microsoft发送多少数据

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"基本：发送所需数据以便保持Windows最新并且安全" | dword:00000001 | | √ |
| 选择"完全：帮助我们解决问题并且改进Microsoft产品和服务。将附加诊断数据（包括浏览器、应用和功能使用情况，以及墨迹书写和键入的数据）发送给Microsoft" | dword:00000003 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection]
"AllowTelemetry"=dword:00000001
```

### 8.12 是否向Microsoft发送墨迹书写和键入数据，以便增强在Windows上运行的应用和服务的语音和建议功能

* Windows设置-隐私-反馈和诊断-改进墨迹书写和键入识别

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000000 | 不向Microsoft发送信息 | |
| 开 | dword:00000001 | 向Microsoft发送信息  | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC]
"Enabled"=dword:00000000
```

### 8.13 是否让Microsoft提供更多量身定制的相关提示和建议

* Windows设置-隐私-反馈和诊断-量身定制的体验

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | dword:00000000 | 不需要Microsoft提供更多量身定制的相关提示和建议 | |
| 开 | dword:00000001 | 需要Microsoft提供更多量身定制的相关提示和建议 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy]
"TailoredExperiencesWithDiagnosticDataEnabled"=dword:00000000
```

### 8.14 Windows应询问我的意见的频率

* Windows设置-隐私-反馈和诊断-反馈频率

| 界面操作 | "NumberOfSIUFInPeriod"对应的值 | "PeriodInNanoSeconds"对应的值 | 作用 | 建议 |
|:---------|:------------------------------:|:-----------------------------:|:-----|:----:|
| 选择"自动(推荐)" | 删除键 | 删除键 | | |
| 选择"始终" | 删除键 | hex(b):00,e1,f5,05,00,00,00,00 | | |
| 选择"每天一次" | dword:00000001 | hex(b):00,c0,69,2a,c9,00,00,00 | |
| 选择"每周一次" | dword:00000001 | hex(b):00,40,e4,28,80,05,00,00 | |
| 选择"从不" | dword:00000000 | 删除键 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Siuf\Rules]
"PeriodInNanoSeconds"=-
"NumberOfSIUFInPeriod"=dword:00000000
```

### 8.15 允许或禁止应用访问诊断信息

* Windows设置-隐私-应用诊断-让应用访问诊断信息

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "Deny" | 禁止应用控制无线电收发器 | |
| 开 | "Allow" | 允许应用控制无线电收发器 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}]
"Value"="Deny"
```

### 8.16 关闭客户体验改善计划

* 计算机配置-管理模板-系统-App-V-CEIP-Microsoft客户体验改善计划(CEIP)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 允许收集有关计算机硬件以及你如何使用 Microsoft Application Virtualization 的信息 | |
| "Disabled" | dword:00000000 | 禁止收集有关计算机硬件以及你如何使用 Microsoft Application Virtualization 的信息 | √ |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppV\CEIP]
"CEIPEnable"=dword:00000000
```

* 计算机配置-管理模板-系统-Internet通信管理-Internet通信设置-关闭Windows客户体验改善计划

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000000 | 禁止收集你的硬件配置以及你如何使用我们的软件和服务的相关信息 | √ |
| "Disabled" | dword:00000001 | 将收集你的硬件配置以及你如何使用我们的软件和服务的相关信息，以确定你的使用习惯与使用模式 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]
"CEIPEnable"=dword:00000000
```

* 计算机配置-管理模板-系统-Internet通信管理-Internet通信设置-关闭Windows Messenger客户体验改善计划

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000002| 禁止 Microsoft 收集有关如何使用产品的匿名信息 | √ |
| "Disabled" | dword:00000001 | 允许 Microsoft 收集有关如何使用产品的匿名信息 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client]
"CEIP"=dword:00000002
```

* 计算机配置-管理模板-Windows 组件-云内容-关闭 Microsoft 用户体验

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001| 禁止 Microsoft 提供的个性化建议以及有关其 Microsoft 帐户的通知 | √ |
| "Disabled" | dword:00000000 | 允许 Microsoft 提供的个性化建议以及有关其 Microsoft 帐户的通知 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent]
"DisableWindowsConsumerFeatures"=dword:00000001
```






## 九、更新和安全

### 9.1 允许或禁止从其他电脑上下载更新，或将下载的部分更新和引用发送到链接本地网络或Internet的电脑

* Windows设置-更新和安全-Windows更新-高级选项-传递优化-允许从其他电脑下载

**注意:** 该功能有可能导致CPU使用100%的情况。

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 关 | "0" | 关闭优化传递 | |
| 开 | "1" | 启动优化传递 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings]
"DownloadMode"="0"
```

### 9.2 配置Windows更新

* 计算机属性(System Properties)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows更新-配置自动更新

| 界面操作 | "NoAutoUpdate"对应的值 | "AUOptions"对应的值 | 作用 | 建议 |
|:---------|:----------------------:|:-------------------:|:-----|:-----|
| 选择“已启用”，并且选择“通知下载和自动更新” | dword:00000000 | dword:00000002 | 当系统需要更新时，提示是否下载，并当下载完后，提示是否安装 | √ |
| 选择“已启用”，并且选择“自动下载并通知安装” | dword:00000000 | dword:00000003 | 当系统需要更新时，自动下载更新，并当下载完后，提示是否安装 | |
| 选择“已启用”，并且选择“自动下载并计划安装” | dword:00000000 | dword:00000004 | 当系统需要更新时，自动下载更新，并当下载完后，提示是否安装 | |
| 选择“已启用”，并且选择“允许本地管理员选择设置” | dword:00000000 | dword:00000005 | | |
| 选择“已禁用” | dword:00000001 | 删除键| 禁用系统更新功能 | |
| 选择“未配置” | 删除键 | 删除键 | 默认自动更新系统 | |

当选择“已启用”，并且选择“自动下载并计划安装”，即"NoAutoUpdate"对应的值为0，"AUOptions"对应的值为4时，就可以设置计划安装的日期时间和、更新频率和是否在系统维护期间自动安装更新：

    * 设置系统自动维护期间是否自动安装更新
    
| 界面操作 | "AutomaticMaintenanceEnabled"对应的值 | 作用 | 建议 |
|:---------|:-------------------------------------:|:-----|:-----|
| 勾选 | dword:00000001 | 在系统自动维护期间安装系统更新，而可以不按照下面设定的计划时间安装更新 | |
| 不勾选 | 删除键 | 按照下面设定的计划时间安装更新 | |

    * 设定的计划时间安装更新
    
| 界面 | 注册表对应的键 | 说明 |
|:-----|:--------------:|:-----|
| 计划安装日期 | ScheduledInstallDay | “星期一”至“星期日” |
| 计划安装时间 | ScheduledInstallTime | 几点 |
| 每周 | ScheduledInstallEveryWeek | 每周 |
| 一月中的第一周 | ScheduledInstallEveryWeek | 每月中的第一周 |
| 一月中的第二周 | ScheduledInstallSecondWeek | 每月中的第二周 |
| 一月中的第三周 | ScheduledInstallThirdWeek | 每月中的第三周 |
| 一月中的第四周 | ScheduledInstallFourthWeek | 每月中的第四周 |

      计划安装日期可以设置的值：
      
| 界面操作 | "ScheduledInstallDay"对应的值 | 作用 |
|:---------|:-----------------------------:|:-----|
| 每天 | dword:00000000 | 每天均可进行安装 |
| 每星期日 | dword:00000001 | 每个星期日可以进行安装 |
| 每星期一 | dword:00000002 | 每个星期一可以进行安装 |
| 每星期二 | dword:00000003 | 每个星期二可以进行安装 |
| 每星期三 | dword:00000004 | 每个星期三可以进行安装 |
| 每星期四 | dword:00000005 | 每个星期四可以进行安装 |
| 每星期五 | dword:00000006 | 每个星期五可以进行安装 |
| 每星期六 | dword:00000007 | 每个星期六可以进行安装 |

      计划安装时间可以设置的值：
      
| 界面操作 | "ScheduledInstallDay"对应的值 | 作用 |
|:---------|:-----------------------------:|:-----|
| 00:00 | dword:00000000 | 零点  |
| 01:00 | dword:00000001 | 1点 |
| 02:00 | dword:00000002 | 2点 |
| 03:00 | dword:00000003 | 3点 |
| 04:00 | dword:00000004 | 4点 |
| 05:00 | dword:00000005 | 5点 |
| 06:00 | dword:00000006 | 6点 |
| 07:00 | dword:00000007 | 7点 |
| 08:00 | dword:00000008 | 8点 |
| 09:00 | dword:00000009 | 9点 |
| 10:00 | dword:0000000a | 10点 |
| 11:00 | dword:0000000b | 11点 |
| 12:00 | dword:0000000c | 12点 |
| 13:00 | dword:0000000d | 13点 |
| 14:00 | dword:0000000e | 14点 |
| 15:00 | dword:0000000f | 15点 |
| 16:00 | dword:00000010 | 16点 |
| 17:00 | dword:00000011 | 17点 |
| 18:00 | dword:00000012 | 18点 |
| 19:00 | dword:00000013 | 19点 |
| 20:00 | dword:00000014 | 20点 |
| 21:00 | dword:00000015 | 21点 |
| 22:00 | dword:00000016 | 22点 |
| 23:00 | dword:00000017 | 23点 |

      举例：
      
| 界面操作 | "ScheduledInstallDay"对应的值 | "ScheduledInstallTime"对应的值 | "ScheduledInstallEveryWeek"对应的值 | "ScheduledInstallFirstWeek"对应的值 | "ScheduledInstallSecondWeek"对应的值 | "ScheduledInstallFourthWeek"对应的值 | 说明 |
|:---------|:-----------------------------:|:------------------------------:|:-----------------------------------:|:-----------------------------------:|:------------------------------------:|:------------------------------------:|:-----|
| 选择计划安装日期为周日，选择计划安装时间为13:00，勾选一月中的第三周 | dword:00000001 | dword:0000000d | 删除键 | 删除键 | dword:00000001 | 删除键 | 每个月的第三个星期的星期日13点安装下载好的更新 |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoUpdate"=dword:00000000
"AUOptions"=dword:00000002
"AutomaticMaintenanceEnabled"=-
"ScheduledInstallDay"=dword:00000001                  ;周日
"ScheduledInstallTime"=dword:0000000d                 ;13点
"ScheduledInstallEveryWeek"=-
"ScheduledInstallFirstWeek"=-
"ScheduledInstallSecondWeek"=-
"ScheduledInstallThirdWeek"=dword:00000001        ;每个月的第三周
"ScheduledInstallFourthWeek"=-
```

### 9.3 关闭Windows Defender 防病毒程序 [组策略方式]

* 计算机属性(System Properties)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Defeder 防病毒程序-关闭 Windows Defender防病毒程序

**注意：** 这里只涉及到Windows Defender防病毒程序，不包括Windows Defender SmartScreen和Windows Defender防火墙

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 关闭Windows Defender 防病毒程序 | √ |
| "Disabled" | dword:00000000 | 启用Windows Defender 防病毒程序 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableAntiSpyware"=dword:00000001
```

### 9.4 启用或关闭"病毒和威胁保护"通知

* Windows设置-更新和安全-Windows安全-打开Windows Defender安全中心-病毒和威胁防护-"病毒和威胁防护"设置-通知-更改通知设置-获取信息通知

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 开 | dword:00000000 | 启用"病毒和威胁保护"通知 | |
| 关 | dword:00000001 | 关闭"病毒和威胁保护"通知 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications]
"DisableEnhancedNotifications"=dword:00000001
```

### 9.4 设置开启或关闭Windows Defender SmartScreen通过检查Web中无法识别的应用和文件

* Windows设置-更新和安全-Windows安全-打开Windows Defender安全中心-应用和浏览器控制-检查应用和文件

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 选择"阻止" | "Block" | 阻止打开无法识别的应用和文件 | |
| 选择"警告" | "Warn" | 提示用户是否打开无法识别的应用和文件 | |
| 选择"关闭" | "Off" | 遇到无法识别的应用和文件, 不做任何提示, 并加载 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
"SmartScreenEnabled"="Off"
```

### 9.5 设置开启或关闭应用于Windows Egde的Windows Defender SmartScreen筛选器

* Windows设置-更新和安全-Windows安全-打开Windows Defender安全中心-应用和浏览器控制-适用于 Microsoft Edge的SmartScreen

| 界面操作 | "EnabledV9"对应值 | "PreventOverride"对应值 | 作用 | 建议 |
|:---------|:-----------------:|:-----------------------:|:-----|:----:|
| 选择"阻止" | dword:00000001 | dword:00000001 | 阻止恶意网站和有害的下载 | |
| 选择"警告" | dword:00000001 | dword:00000000 | 提示用户网站或下载的文件为恶意网站和有害的下载 | |
| 选择"关闭" | dword:00000000 | dword:00000000 | 遇到恶意网站和有害的下载, 不做任何提示, 并加载 | √ |

```
[HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter]
"EnabledV9"=dword:00000000
"PreventOverride"=dword:00000000
```

### 9.6 设置开启或关闭适用于Microsoft Store应用的SmartScreen

* Windows设置-更新和安全-Windows安全-打开Windows Defender安全中心-应用和浏览器控制-适用于Microsoft Store应用的SmartScreen

| 界面操作 | "EnableWebContentEvaluation"对应值 | "PreventOverride"对应值 | 作用 | 建议 |
|:---------|:----------------------------------:|:-----------------------:|:-----|:----:|
| 选择"警告" | dword:00000001 | dword:00000000 | 提示用户应用商城中应用的Web内容有害 | |
| 选择"关闭" | dword:00000000 | dword:00000000 | 遇到应用商城中应用的Web内容有害时, 不做任何提示, 并加载 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost]
"EnableWebContentEvaluation"=dword:00000000
"PreventOverride"=dword:00000000
```

### 9.7 禁用Windows错误报告 [组策略方式]

**提醒:** 同样是解决方案功能、问题报告功能

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows 错误报告(Windows Error Reporting)-禁用 Windows 错误报告(Disabled Windows Error Reporting)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁用 Windows 错误报告 | √ |
| "Disabled" | dword:00000000 | 启用 Windows 错误报告 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"Disabled"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows 错误报告(Windows Error Reporting)-禁用 Windows 错误报告(Disabled Windows Error Reporting)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁用 Windows 错误报告 | √ |
| "Disabled" | dword:00000000 | 启用 Windows 错误报告 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Windows Error Reporting]
"Disabled"=dword:00000001
```

### 9.8 阻止显示严重错误的用户界面 [组策略方式]

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows 错误报告(Windows Error Reporting)-阻止显示严重错误的用户界面(Prevent display of the user interface for critical errors)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 不显示严重错误的用户界面 | √ |
| "Disabled" | dword:00000000 | 显示严重错误的用户界面 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"DontShowUI"=dword:00000001
```

### 9.9 自动拒绝 MS 为相应 Windows 错误报告时间而请求任何额外数据

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows 错误报告(Windows Error Reporting)-不发送额外的数据(Do not send additional data)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 自动拒绝 MS 为相应 Windows 错误报告时间而请求任何额外数据 | √ |
| "Disabled" | dword:00000000 | 允许 MS 为相应 Windows 错误报告时间而请求任何额外数据 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting]
"DontSendAdditionalData"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows 错误报告(Windows Error Reporting)-不发送额外的数据(Do not send additional data)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 自动拒绝 MS 为相应 Windows 错误报告时间而请求任何额外数据 | √ |
| "Disabled" | dword:00000000 | 允许 MS 为相应 Windows 错误报告时间而请求任何额外数据 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Windows Error Reporting]
"DontSendAdditionalData"=dword:00000001
```

### 9.10 启用或禁用疑难解答

* 控制面板(Control Panel)-疑难解答(Troubleshooting)-左边"更改设置(Change settings)"-计算机维护(Computer Maintenance)

**提醒:** 如果禁用了, 就可禁用任务计划中的 \Microsoft\Windows\Diagnosis , 和Diagnostic Policy Service, Diagnostic Service Host, Diagnostic System Host 3个服务

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"启用" | dword:00000001 | 启用疑难解答 | |
| 选择"禁用" | dword:00000000 | 禁用疑难解答 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics]
"EnabledExecution"=dword:00000000
```

* 控制面板(Control Panel)-疑难解答(Troubleshooting)-左边"更改设置(Change settings)"-其他设置(Other settings)-允许在启动时立即开始排除故障(Allow troubleshooting to begin immediately when started)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 在系统启动时立即开始排除故障 | |
| 不勾选 | dword:00000000 | 禁止在系统启动时立即开始排除故障 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\MSDT]
"AllowSkipFirstPage"=dword:00000000
```

### 9.11 启用或禁用帮助提示
* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-边缘 UI(Edge UI)-禁用帮助提示(Disable help tips)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁用帮助提示 | √ |
| "Disabled" | dword:00000000 | 启用帮助提示 | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI]
"DisableHelpSticker"=dword:00000001
```

### 9.12 关闭所有驱动器的自动创建还原点

* 系统属性(System Properties)-系统保护(System Protection)

```
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients]
[-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Leases]
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients]
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Leases]
```

### 9.13 关闭系统还原

* 系统属性(System Properties)-系统保护(System Protection)

**注意:** 只有当所有驱动器的的系统保护被禁用了,值才会是0!

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"启用系统保护" | dword:00000001 | 当有一个或以上的磁盘驱动器启用了系统保护,该值才会是1 | |
| 选择"禁用系统保护" | dword:00000000 | 当禁用所有磁盘驱动器的系统保护后,该值才会是0 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore]
"RPSessionInterval"=dword:00000000
```

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-系统(System)-系统还原(System Restore)-关闭系统还原(Turn off System Restore)

> 与其对应的: 系统属性-系统保护, 将会锁定, 显灰, 无法设置.

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 关闭系统还原 | |
| "Disabled" | dword:00000000 | 启用系统还原 | |
| "Not Configured" | 删除键值 | 使用非组策略设置项设置 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]
"DisableSR"=-
```

### 9.14 开启或关闭系统还原配置(去除配置页面)

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-系统(System)-系统还原(System Restore)-关闭配置(Turn off Configuration)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 隐藏"系统属性-系统保护"选项卡 | |
| "Disabled" | dword:00000000 | 显示"系统属性-系统保护"选项卡 | |
| "Not Configured" | 删除键值 | 显示"系统属性-系统保护"选项卡 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore]
"DisableConfig"=-
```

### 9.15 关闭Windows Installer创建系统还原检查点

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Installer-关闭创建系统还原检查点(Turn off creation fo System Restore checkpoints)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁止Windows Installer创建系统还原检查点 | √ |
| "Disabled" or "Not Configured" | 删除键值 | 允许Windows Installer创建系统还原检查点 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer]
"LimitSystemRestoreCheckpointing"=dword:00000001
```

### 9.16 开启UAC情况下不提示授权,直接提升权限

* 组策略(Group Policy)-计算机配置(Computer Configuration)-Windows 设置(Windows Settings)-安全设置(Security Settings)-本地策略(Local Policies)-安全选项(Security Options)-用户帐户控制: 管理员批准模式中管理员的提升权限提示的行为(User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 选择"不提示,直接提升(Elevate without prompting)" | dword:00000000 | 关闭UAC,直接提升权限 | √ |
| 选择"在安全桌面上提示凭据(Prompt for credential on the secure desktop)" | dword:00000001 |  | |
| 选择"在安全桌面上同意提示(Prompt for consent on the secure desktop)" | dword:00000002 |  | |
| 选择"提示凭据(Prompt for credentials)" | dword:00000003 |  | |
| 选择"同意提示(Prompt for consent)" | dword:00000004 |  | |
| 选择"非 Windows 二进制文件的同意提示(Prompt for consent for non-Windows binaries)" | dword:00000005 |  | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"ConsentPromptBehaviorAdmin"=dword:00000000
```















## 十、Internet Explorer

### 10.1 打开IE浏览器为空白选项卡页

* Internet 选项(Internet Properties)-常规(General)-主页(Home page)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 打开空白页 | "about:Tabs" | 打开IE后为空白页 | |
| 填入"http://www.baidu.com" | "http://www.baidu.com" | 打开IE后浏览百度 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"Start Page"="about:Tabs"
```

### 10.2 启动 Internet Explorer时显示上次浏览会话中的选项卡

* Internet 选项(Internet Properties)-常规(General)-启动(Startup)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 从上次会话中的选项卡开始(Start with tabs from the last session) | dword:00000001 | 打开IE后加载上次会话中的选项卡 | |
| 从主页开始(Start with home page) | dword:00000000 | 打开IE后浏览上面设置的主页 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\ContinuousBrowsing]
"Enabled"=dword:00000001
```

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-Internet 控制面板(Internet Control Panel)-常规页(General Page)-启动 Internet Explorer时显示上次浏览会话中的选项卡(Start Internet Explorer with tabs from last browsing session)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" | dword:00000001 | 开启后显灰,锁定,无法修改 |
| "Disabled" | dword:00000000 | |
| "Not Configured" | 删除键值 | √ |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\ContinuousBrowsing]
"Enabled"=-
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-Internet 控制面板(Internet Control Panel)-常规页(General Page)-启动 Internet Explorer时显示上次浏览会话中的选项卡(Start Internet Explorer with tabs from last browsing session)

| 界面操作 | 对应注册表值 | 建议 |
|:---------|:-------------|:----:|
| "Enabled" | dword:00000001 | 开启后显灰,锁定,无法修改 |
| "Disabled" | dword:00000000 | |
| "Not Configured" | 删除键值 | √ |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\ContinuousBrowsing]
"Enabled"=-
```

### 10.3 退出IE时删除浏览历史记录
* Internet 选项(Internet Properties)-常规(General)-浏览历史记录(Browsing history)-退出IE时删除浏览历史记录(Delete browsing history on exit)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 关闭IE后不删除浏览历史记录 | √ |
| 勾选 | dword:00000001 | 关闭IE后删除浏览历史记录 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Privacy]
"ClearBrowsingHistoryOnExit"=dword:00000000
```

* Internet 选项(Internet Properties)-常规(General)-浏览历史记录(Browsing history)-删除(Delete)-下载历史记录(Download History)

| 对应键名 | 对应注册表值 | 界面操作 | 作用 | 建议 |
|:---------|:------------:|:---------|:-----|:----:|
| UseAllowList | dword:00000000 | 不勾选"保留收藏夹网站数据(Preserve Favorites website data)" | 删除收藏夹网站数据 | |
| UseAllowList | dword:00000001 | 勾选"保留收藏夹网站数据(Preserve Favorites website data)" | 保留收藏夹网站数据 | √ |
| CleanTIF | dword:00000000 | 不勾选"临时 Internet 文件和网站文件(Temporary Internet files and website files)" | 保留临时 Internet 文件和网站文件 | |
| CleanTIF | dword:00000001 | 勾选"临时 Internet 文件和网站文件(Temporary Internet files and website files)" | 清除临时 Internet 文件和网站文件 | √ |
| CleanCookies | dword:00000000 | 不勾选"Cookie 和网站数据(Cookies and website data)" | 保留Cookie 和网站数据 | |
| CleanCookies | dword:00000001 | 勾选"Cookie 和网站数据(Cookies and website data)" | 保留Cookie 和网站数据 | √ |
| CleanHistory | dword:00000000 | 不勾选"历史记录(History)" | 保留历史记录 | |
| CleanHistory | dword:00000001 | 勾选"历史记录(History)" | 清除Cookie 和网站数据 | √ |
| CleanDownloadHistory | dword:00000000 | 不勾选"下载历史记录" | 保留下载历史记录 | |
| CleanDownloadHistory | dword:00000001 | 勾选"下载历史记录" | 清除下载历史记录 | √ |
| CleanForms | dword:00000000 | 不勾选"表单数据(Form data)" | 保留表单数据 | |
| CleanForms | dword:00000001 | 勾选"表单数据(Form data)" | 清除表单数据 | √ |
| CleanPassword | dword:00000000 | 不勾选"密码(Passwords)" | 保留密码 | |
| CleanPassword | dword:00000001 | 勾选"密码(Passwords)" | 清除密码 | √ |
| CleanTrackingProtection | dword:00000000 | 不勾选"跟踪保护"、"ActiveX筛选"和"请勿跟踪"数据 | 保留"跟踪保护"、"ActiveX筛选"和"请勿跟踪"数据 | |
| CleanTrackingProtection | dword:00000001 | 勾选"跟踪保护"、"ActiveX筛选"和"请勿跟踪"数据 | 清除"跟踪保护"、"ActiveX筛选"和"请勿跟踪"数据 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Privacy]
"CleanDownloadHistory"=dword:00000001
"CleanForms"=dword:00000001
"CleanPassword"=dword:00000001
"CleanTrackingProtection"=dword:00000001
"CleanHistory"=dword:00000001
"CleanTIF"=dword:00000001
"CleanCookies"=dword:00000001
"UseAllowList"=dword:00000001
```

### 10.4 关闭多个选项卡时发出警告

* Internet选项(Internet Properties)-常规(General)-标签页(Tabs)-关闭多个标签页时发出警告(Warn me when closing multiple tabs)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 无提示关闭所有标签 | √ |
| 勾选 | dword:00000001 | 提醒用户选择是否关闭所有标签 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]
"WarnOnClose"=dword:00000001
```

### 10.5 设置在打开新标签页后,跳转到的页面

* Internet选项(Internet Properties)-常规(General)-标签页(Tabs)-在打开新选项卡后, 打开(When a new tab is opened,open)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 空白页(A blank page) | dword:00000000 | 打开一个空白页面 | √ |
| 你的第一个主页(Your first home page) | dword:00000001 | 打开主页面 | |
| 新标签页页(The new tab page) | dword:00000002 | 打开新标签页面 | |
| 带有我的新闻提要的新标签页页面 | dword:00000003 | 打开带新闻提要的新标签页页面 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]
"NewTabPageShow"=dword:00000000
```

### 10.6 设置遇到弹出窗口时,弹出的窗口打开的方式
* Internet选项(Internet Properties)-常规(General)-标签页(Tabs)-遇到弹出窗口时(When a pop-up is encountered)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 由 Internet Explorer 决定如何打开弹出窗口(Let Internet Explorer decide how pop-ups should open) | dword:00000000 | | |
| 始终在新窗口中打开弹出窗口(Always open pop-ups in a new window) | dword:00000001 | | |
| 始终在新标签页中打开弹出窗口(Always open pop-ups in a new tab) | dword:00000002 | | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]
"PopupsUseNewWindow"=dword:00000002
```

### 10.7 设置在那个位置打开来自其他程序的链接

* Internet 选项(Internet Properties)-常规(General)-标签页(Tabs)-在以下位置打开来自其他程序的链接(Open links from other programs in)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 新窗口(A new window) | dword:00000000 | 当打开来自其他程序的链接时，从新的IE窗口打开 | |
| 当前窗口中的新标签页(A new tab in the current window) | dword:00000001 | 当打开来自其他程序的链接时，从当前IE窗口的新标签页中 | √ |
| 当前标签页或窗口(The current tab or window) | dword:00000002 | 当打开来自其他程序的链接时，从当前IE窗口的标签页中打开 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\TabbedBrowsing]
"ShortcutBehavior"=dword:00000001
```

### 10.8 弹出窗口阻止程序设置

* Internet 选项(Internet Properties)-私隐(Privacy)-弹出窗口阻止程序(Pop-up Blocker)-启用弹出窗口阻止程序(Turn on Pop-up Blocker)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 允许所有的网站弹出窗口 | |
| 勾选 | dword:00000001 | 阻止网站弹出窗口 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows]
"PopupMgr"=dword:00000001
```

* Internet 选项(Internet Properties)-私隐(Privacy)-弹出窗口阻止程序设置(Pop-up Blocker Settings)-阻止级别(Blocking level)

| 界面操作 | "BlockUserInit"对应的值 | "UseTimerMethod"对应的值 | "UseHooks"对应的值 | "AllowHTTPS"对应的值 | "BlockControls"对应的值 | 作用 | 建议 |
|:---------|:-----------------------:|:------------------------:|:------------------:|:--------------------:|:-----------------------:|:-----|:----:|
| 选择"高:阻止所有弹出窗口(High: Block all pop-ups)" | dword:00000001 | dword:00000000 | dword:00000000 | dword:00000000 | dword:00000001 | | |
| 选择"中:阻止大多数自动弹出窗口(Medium: Block most automatic pop-ups)" | dword:00000000 | dword:00000000 | dword:00000001 | dword:00000000 | dword:00000000 | | √ |
| 选择"低:允许来自安全站点的弹出窗口(Low: Allow pop-ups from secure sites)" | dword:00000000 | dword:00000001 | dword:00000001 | dword:00000001 | dword:00000000 | | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows]
"BlockUserInit"=dword:00000000
"UseTimerMethod"=dword:00000000
"UseHooks"=dword:00000001
"AllowHTTPS"=dword:00000000
"BlockControls"=dword:00000000
```

* Internet 选项(Internet Properties)-私隐(Privacy)-弹出窗口阻止程序设置(Pop-up Blocker Settings)-通知和阻止级别(Notifications and blocking level)-阻止弹出窗口时显示通知栏(Show Notification bar when a pop-up is blocked)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 阻止弹出窗口时不提示 | |
| 勾选 | dword:00000001 | 阻止弹出窗口时显示通知栏 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows]
"UseSecBand"=dword:00000001
```

### 10.9 设置将自动完成功能应用于"地址栏(Address bar)"、"浏览历史记录(Brownsing history)"、"收藏夹(Favorities)"、"使用 Windows Search 获得更好的结果(Use Windows Search for better results)"、"URL 输入联想(Suggesting URLs)"、"表单上的用户名和密码(User name and passwords on forms)"（"在保存密码之前询问我(Ask me before saving passwords)"）

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-地址栏(Address bar)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 不会自动补全输入的地址 | |
| 勾选 | yes | 自动补全输入的地址 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete]
"AutoSuggest"="yes"
```

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-浏览历史记录(Brownsing history)
    * 2进制值为0000 0001时(即16进制为0x01时),应用自动完成功能;
    * 2进制值为0000 0000时(即16进制为0x00时),取消应用;
* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-收藏夹(Favorities)
    * 2进制值为0000 0100时(即16进制为0x04时),应用自动完成功能;
    * 2进制值为0000 0000时(即16进制为0x00时),取消应用;

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选"浏览历史记录"，并且不勾选"收藏夹" | dword:00000000 | 地址栏不使用"浏览历史记录"和"收藏夹"的记录自动补全输入的地址 | |
| 勾选"浏览历史记录"，但不勾选"收藏夹" | dword:00000001 | 地址栏只使用"浏览历史记录"的记录自动补全输入的地址，不使用"收藏夹"的记录自动补全 | |
| 不勾选"浏览历史记录"，但勾选"收藏夹" | dword:00000004 | 地址栏只使用"收藏夹"的记录自动补全输入的地址，不使用"浏览历史记录"的记录自动补全 | |
| 不勾选"浏览历史记录"，并且不勾选"收藏夹" | dword:00000005 | 地址栏使用"浏览历史记录"和"收藏夹"的记录自动补全输入的地址 | √ |

> [计算公式: "AutoCompleteGroups"的值 = 浏览历史记录的值 | 收藏夹的值 ] - 位或运算

> 所以当同时启用"浏览历史记录"和"收藏夹"的自动完成功能时,需要用以上公式计算得出"AutoCompleteGroups"的值(2进制值为0000 0101,即16进制的值为0x05)

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\WindowsSearch]
"AutoCompleteGroups"=dword:00000005
```

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-使用 Windows Search 获得更好的结果(Use Windows Search for better results)

| 界面操作 | "ConfiguredScopes"对应的值 | "EnabledScopes"对应的值 | 作用 | 建议 |
|:---------|:--------------------------:|:------------------------|:-----|:----:|
| 不勾选 | dword:00000000 | dword:00000000 | 不使用 Windows Search 获得更好的结果 | |
| 勾选 | 值与"AutoCompleteGroups"的值一样 | 值与"AutoCompleteGroups"的值一样 | 使用 Windows Search 获得更好的结果 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\WindowsSearch]
"ConfiguredScopes"=dword:00000005
"EnabledScopes"=dword:00000005
```

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-URL 输入联想(Suggesting URLs)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 禁止通过URL 输入联想自动补全输入的地址 | |
| 勾选 | dword:00000001 | 通过URL 输入联想自动补全输入的地址 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\DomainSuggestion]
"Enabled"=dword:00000001
```

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-表单和搜索

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 禁止表单和搜索自动补全 | |
| 勾选 | dword:00000001 | 允许表单和搜索自动补全 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"Use FormSuggest"="yes"
```

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-表单上的用户名和密码(User name and passwords on forms)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 禁止在表单上的用户名和密码自动补全 | |
| 勾选 | yes | 在表单上的用户名和密码自动补全 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"FormSuggest Passwords"="yes"
```

* Internet 选项(Internet Properties)-内容(Content)-自动完成设置(AutoComplete Settings)-在保存密码之前询问我(Ask me before saving passwords)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 在表单上的用户名和密码自动补全时，不要询问我保存密码 | |
| 勾选 | yes | 在表单上的用户名和密码自动补全时，询问我保存密码，让我决定是否保存密码 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"FormSuggest PW Ask"="yes"
```

### 10.10 启用或禁用IE代理

* Intertet选项-"连接"选项卡-局域网设置-代理服务器-为LAN使用代理服务器（这些设置不用于拨号或VPN连接）

**注意:** 这里不含启用IE代理时的配置! 不勾选的情况下会使得IE浏览速度加快.

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 勾选 | dword:00000001 | 启用代理服务器 | |
| 不勾选 | dword:00000000 | 禁用代理服务器 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
"ProxyEnable"=dword:00000000
```

### 10.11 在遇到需要打开链接时，决定使用的打开链接方式设置

* Internet 选项(Internet Properties)-程序(Programs)-打开Internet Explorer(Opening Internet Explorer)-选择打开链接方式(Choose how you open links)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 选择"让 Internet Explorer 决定(Let Internet Explorer decide)" | dword:00000000 | | √ |
| 选择"始终在 Internet Explorer 中(Always in Internet Explorer)" | dword:00000001 | |  |
| 选择"始终在桌面上的 Internet Explorer 中(Always in Internet Explorer on the desktop)" | dword:00000002 | |  |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"AssociationActivationMode"=dword:00000000
```

### 10.12 打开 IE 磁贴时,使用桌面版的 IE 打开

* Internet 选项(Internet Properties)-程序(Programs)-打开Internet Explorer(Opening Internet Explorer)- IE 磁贴用于打开桌面上的 Internet Explorer(Open Internet Explorer tiles on the desktop)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000001 | 打开IE磁贴 | √ |
| 勾选 | dword:00000000 | 打开桌面版的 IE  | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"ApplicationTileImmersiveActivation"=dword:00000000
```

### 10.13 设置 HTML 默认编辑器

* Internet 选项(Internet Properties)-程序(Programs)-HTML 编辑(HTML editing)

**注意：** 这里选择“记事本”作为默认编辑器

```
[-HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Default HTML Editor]

[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Default HTML Editor]
"Description"="记事本"
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Default HTML Editor\shell\edit\command]
@="%SystemRoot%\\system32\\NOTEPAD.EXE %1"
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\View Source Editor\Editor Name]
@="C:\\Windows\\system32\\NOTEPAD.EXE"
```

### 10.14 设置浏览器关闭时是否清空"Internet 临时文件"文件夹

* Internet 选项(Internet Properties)-高级(Advanced)-安全(Security)-关闭浏览器时清空"Internet 临时文件"文件夹(Empty Temporary Internet Files folder when browser is closed)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000001 | 浏览器关闭时保留"Internet 临时文件"文件夹里的文件 | √ |
| 勾选 | dword:00000000 | 浏览器关闭时清空"Internet 临时文件"文件夹里的文件 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\CACHE]
"Persistent"=dword:00000001
```

### 10.15 设置启用或禁用 Windows Defender SmartScreen

* Internet 选项(Internet Properties)-高级(Advanced)-安全(Security)-启用 Windows Defender SmartScreen
| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 禁用 Windows Defender SmartScreen | √ |
| 勾选 | dword:00000001 | 启用 Windows Defender SmartScreen | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PhishingFilter]
"EnabledV9"=dword:00000000
```

### 10.16 是否向你在 Internet Explorer 中访问的站点发送"请勿跟踪"请求

* Internet 选项(Internet Properties)-高级(Advanced)-安全(Security)-向你在 Internet Explorer 中访问的站点发送"请勿跟踪"请求

**提醒：** IE10中的 始终发送"请勿跟踪"(Do Not Track)标头(Always send Do Not Track header) 选项已在IE11中改名为'向你在 Internet Explorer 中访问的站点发送"请勿跟踪"请求'

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 不发送"请勿跟踪"请求 | |
| 勾选 | dword:00000001 | 发送"请勿跟踪"请求 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"DoNotTrack"=dword:00000001
```

### 10.17 是否启用在安全和非安全模式之间切换时发出警告

* Internet 选项(Internet Properties)-高级(Advanced)-安全(Security)-在安全和非安全模式之间切换时发出警告(Warm if changing between secure and not secure mode)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | dword:00000000 | 不予警告 | |
| 勾选 | dword:00000001 | 在安全和非安全模式之间切换时发出警告 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
"WarnonZoneCrossing"=dword:00000001
```

### 10.18 禁用脚本调试

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-禁用脚本调试(Disable script debugging)(Internet Explorer)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 启用Internet Explorer的脚本调试 | |
| 勾选 | yes | 禁用Internet Explorer的脚本调试 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"DisableScriptDebuggerIE"="yes"
```

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-禁用脚本调试(Disable script debugging)(Other)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 启用其他程序的脚本调试 | |
| 勾选 | yes | 禁用其他程序的脚本调试 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"Disable Script Debugger"="yes"
```

### 10.19 启用 FTP 文件夹视图(在 Internet Explorer 之外)

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-启用 FTP 文件夹视图(在 Internet Explorer 之外)(Enable FTP folder view (outside of Internet Explorer))

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | yes | 在浏览器中打开FTP文件夹 | |
| 勾选 | no | 在文件资源管理器中打开FTP文件夹 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\FTP]
"Use Web Based FTP"="no"
```

### 10.20 每次打开IE时,检测IE是否为默认的 Web 浏览器

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-如果 Internet Explorer 不是默认的 Web 浏览器则告诉我(Tell me if Internet Explorer is not the default web browser)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 不做任何提示 | √ |
| 勾选 | yes | 提示用户IE不是默认浏览器 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"Check_Associations"="no"
```

### 10.21 设置下载完成后是否发出通知
* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-下载完成后发出通知(Notify when downloads complete)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 下载完后关闭下载窗口，不做提示 | |
| 勾选 | yes | 下载完后不关闭下载窗口 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"NotifyDownloadComplete"="yes"
```

### 10.22 显示友好 HTTP 错误消息

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-显示友好 HTTP 错误消息(Show friendly HTTP error messages)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 不显示HTTP 错误消息 | √ |
| 勾选 | yes | 显示HTTP 错误消息 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
"Friendly http errors"="no"
```

### 10.23 在 Internet Explorer 地址栏和"打开"对话框中使用直接插入自动完成功能(Use inline AutoComplete in the Internet Explorer Address Bar and Open Dialog)

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-在 Internet Explorer 地址栏和"打开"对话框中使用直接插入自动完成功能(Use inline AutoComplete in the Internet Explorer Address Bar and Open Dialog)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 对IE地址栏和“打开”对话框输入的信息不会自动补全 | |
| 勾选 | yes | 自动补全IE地址栏和“打开”对话框输入的信息 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\AutoComplete]
"Append Completion"="yes"
```

### 10.24 在文件资源管理器和"运行"对话框中使用直接插入自动完成功能

* Internet 选项(Internet Properties)-高级(Advanced)-浏览(Browsing)-在文件资源管理器和"运行"对话框中使用直接插入自动完成功能(Use inline AutoComplete in File Explorer and Run Dialog)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:------------:|:-----|:----:|
| 不勾选 | no | 对文件资源管理器和"运行"对话框输入的信息不会自动补全 | |
| 勾选 | yes | 自动补全文件资源管理器和"运行"对话框输入的信息 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete]
"Append Completion"="yes"
```

### 10.25 显示/关闭收藏夹栏 (非组策略)

| 对应注册表值 | 作用 | 建议 |
|:------------:|:-----|:----:|
| dword:00000001 | 显示收藏夹栏 | |
| dword:00000000 | 隐藏收藏夹栏 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE]
"LinksBandEnabled"=dword:00000000
```

### 10.26 让 IE 可以 10 线程下载

**提醒：** Win8.1中IE11默认为10线程(即16进制0x0a)

```
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
"MaxConnectionsPerServer"=dword:0000000a
"MaxConnectionsPer1_0Server"=dword:0000000a
```

### 10.27 IE自动搜索字符串

可以自行增删，左边的数字递增即可。

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\UrlTemplate]
"1"="www.%s.com"
"2"="www.%s.com.cn"
"3"="www.%s.cn"
"4"="www.%s.net"
"5"="www.%s.org"
"6"="www.%s.edu"
"7"="www.%s.tk"
"8"="www.%s.cc"
"9"="bbs.%s.com"
"10"="bbs.%s.cn"
"11"="bbs.%s.com.cn"
"12"="bbs.%s.org"
"13"="bbs.%s.net"
"14"="bbs.%s.edu"
"15"="bbs.%s.edu.cn"
```

### 10.28 关闭加载项性能通知

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-关闭加载项性能通知(Turn off add-on performance notifications)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 不在提示加载项性能通知 | √ |
| "Disabled" | dword:00000000 | 提示加载项性能通知 | | |
| "Not Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext]
"DisableAddonLoadTimePerformanceNotifications"=dword:00000001
```

### 10.29 禁止"打开建议网站"

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-打开建议网站(Turn on Suggested Sites)

> 对应的设置：Internet选项-高级-浏览-启用建议网站

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁止打开建议网站，锁定IE属性中设置的选项，不可修改 | √ |
| "Disabled" | dword:00000000 | 允许打开建议网站，锁定IE属性中设置的选项，不可修改 | | |
| "Not Configured" | 删除键值 | IE属性中设置的选项可修改 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites]
"Enabled"=dword:00000000
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-打开建议网站(Turn on Suggested Sites)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁止打开建议网站，锁定IE属性中设置的选项，不可修改 | √ |
| "Disabled" | dword:00000000 | 允许打开建议网站，锁定IE属性中设置的选项，不可修改 | | |
| "Not Configured" | 删除键值 | IE属性中设置的选项可修改 | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Suggested Sites]
"Enabled"=dword:00000000
```

### 10.30 阻止运行"首次运行"向导

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-阻止运行"首次运行"向导(Prevent running First Run wizard)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" and select "直接转到主页(Go directly to home page)" | dword:00000001 | 首次打开IE直接转到主页 | √ |
| "Enabled" and select "直接转到"欢迎适用IE"页面(Go directly to "Welcome to IE" page)" | dword:00000002 | 首次打开IE转到"欢迎适用IE"页面 | | |
| "Disabled" or "No Configured" | 删除键值 | 首次打开IE运行"首次运行"向导 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Main]
"DisableFirstRunCustomize"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-阻止运行"首次运行"向导(Prevent running First Run wizard)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" and select "直接转到主页(Go directly to home page)" | dword:00000001 | 首次打开IE直接转到主页 | √ |
| "Enabled" and select "直接转到"欢迎适用IE"页面(Go directly to "Welcome to IE" page)" | dword:00000002 | 首次打开IE转到"欢迎适用IE"页面 | | |
| "Disabled" or "No Configured" | 删除键值 | 首次打开IE运行"首次运行"向导 | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main]
"DisableFirstRunCustomize"=dword:00000001
```

### 10.31 阻止参与"客户体验改善计划"

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Internet Explorer-阻止参与"客户体验改善计划"(Prevent participation in the Customer Experience Improvement Program)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000000 | 不参与"客户体验改善计划"（不给微软收集电脑或个人信息） | √ |
| "Disabled" | dword:00000001 | 参与"客户体验改善计划" | | |
| "No Configured" | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM]
"DisableCustomerImprovementProgram"=dword:00000000
```
















## 十一、Windows Media Player 设置

### 11.1 播放后将本地媒体文件添加到库中

* 选项(Option)-播放机(Player)-播放后将本地媒体文件添加到库中(Add local media files to library when played)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 不勾选 | dword:00000000 | 自动添加媒体文件到库中 | |
| 勾选 | dword:00000001 | 需手动添加媒体文件到库中 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"AutoAddMusicToLibrary"=dword:00000000
```

### 11.2 播放时向库添加远程媒体文件

* 选项(Option)-播放机(Player)-播放时向库添加远程媒体文件(Add remote media files to library when played)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 不勾选 | dword:00000000 | 不向库添加远程媒体文件 | |
| 勾选 | dword:00000001 | 自动向库添加远程媒体文件 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"AutoAddUNC"=dword:00000000
```

### 11.3 阻止音乐文件媒体信息检索(从 Internet 检索其他信息) [非组策略方式]

* 选项(Option)-媒体库(Library)-为文件自动更新媒体信息(Automatic media information updates for files)-从 Internet 检索其他信息(Retrieve additional information from the Internet)

| 界面操作 | "MetadataRetrieval"对应的值 | "AutoMetadataUpdate"对应的值 | 作用 | 建议 |
|:---------|:---------------------------:|:----------------------------:|:-----|:-----|
| 不勾选 | dword:00000000 | 值无效 | 不向媒体文件更新信息,比如:封面等 | √ |
| 勾选,选择"仅添加缺少的信息" | dword:00000002 | dword:00000001 | 更新媒体文件,但仅更新缺少的信息 | |
| 勾选,选择"覆盖所有媒体信息" | dword:00000002 | dword:00000000 | 更新媒体文件,覆盖所有信息 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"MetadataRetrieval"=dword:00000000
"AutoMetadataUpdate"=dword:00000001
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Media Player-阻止音乐文件媒体信息检索(Prevent Music File Media Information Retrieval)

> 与之关联的: 选项-媒体库-为文件自动更新媒体信息-从 Internet 检索其他信息, 将会锁定, 显灰, 无法修改设置.

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | dword:00000001 | 阻止音乐文件媒体信息检索, 锁定, 显灰, 无法修改设置 | √ |
| Disabled | dword:00000000 | 允许音乐文件媒体信息检索, 锁定, 显灰, 无法修改设置 | |
| Not Configured | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\WindowsMediaPlayer]
"PreventMusicFileMetadataRetrieval"=dword:00000001
```

### 11.4 阻止 CD 和 DVD 媒体信息检索(显示 Internet 上的媒体信息) [非组策略方式]

* 选项(Option)-隐私(Privacy)-更精彩的播放和设备使用体验(Enhanced Playback and Device Experience)-显示 Internet 上的媒体信息(Display media information from the Internet)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000001 | 不显示Internet上的媒体信息 | |
| 不勾选 | dword:00000000 | 显示Internet上的媒体信息 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"MetadataRetrieval"=dword:00000000
```

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows Media Player-阻止 CD 和 DVD 媒体信息检索（Prevent CD and DVD Media Information Retrieval）

> 与之关联的: 选项-隐私-更精彩的播放和设备使用体验-显示 Internet 上的媒体信息, 将会锁定, 显灰, 无法修改设置.

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | dword:00000001 | 阻止 CD 和 DVD 媒体信息检索, 锁定, 显灰, 无法修改设置 | |
| Disabled | dword:00000000 | 允许 CD 和 DVD 媒体信息检索, 锁定, 显灰, 无法修改设置 | |
| Not Configured | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\WindowsMediaPlayer]
"PreventCDDVDMetadataRetrieval"=dword:00000001
```

### 11.5 通过检索 Internet 的媒体信息来更新音乐文件 [非组策略方式]

> 与"显示 Internet 上的媒体信息"选项作用于同一个注册表键值.

**注意:** 这个是6.3.1和6.3.3的一个补充说明, 以该说明为主!

* 选项(Option)-隐私(Privacy)-更精彩的播放和设备使用体验(Enhanced Playback and Device Experience)-通过检索 Internet 的媒体信息来更新音乐文件(Update music files by retrieving media info from the Internet)

由于MetadataRetrieval的值同时由"显示 Internet 上的媒体信息"选项和"通过检索 Internet 的媒体信息来更新音乐文件"选项来决定.

> [计算公式: MetadataRetrieval的值 = 是否启用"显示 Internet 上的媒体信息"的值 | 是否启用"通过检索 Internet 的媒体信息来更新音乐文件"的值 ] -位或运算

单独启用"显示 Internet 上的媒体信息"选项后,MetadataRetrieval的值为0000 0001,即16进制的0x01.

单独启用"通过检索 Internet 的媒体信息来更新音乐文件"选项,MetadataRetrieval的值为0000 0010,即16进制的0x02.

而同时启用这两个选项,MetadataRetrieval的值为0000 0011,即16进制的0x03.

而同时关闭这两个选项,MetadataRetrieval的值为0000 0000,即16进制的0x00.

### 11.6 播放或同步文件时自动下载使用权限

* 选项(Option)-隐私(Privacy)-更精彩的播放和设备使用体验(Enhanced Playback and Device Experience)-播放或同步文件时自动下载使用权限(Download usage rights automatically when I play or sync a file)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000001 | 自动下载 | |
| 不勾选 | dword:00000000 | 不下载, 需手动 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"SilentAcquisition"=dword:00000000
```

### 11.7 自动检查是否需要刷新受保护的文件

* 选项(Option)-隐私(Privacy)-更精彩的播放和设备使用体验(Enhanced Playback and Device Experience)-自动检查是否需要刷新受保护的文件(Automatically check if protected files need to be refreshed)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 勾选 | dword:00000000 | 自动刷新受保护的文件 | |
| 不勾选 | dword:00000001 | 不检查, 需手动 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"DisableLicenseRefresh"=dword:00000001
```

### 11.8 将播放机的唯一标识发送给内容提供商

* 选项(Option)-隐私(Privacy)-增强的内容提供商服务(Enhanced Content Provider Services)-将播放机的唯一标识发送给内容提供商(Send unique Player ID to content providers)
| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 不勾选 | hex:00 | 禁止将播放机的唯一标识发送给内容提供商 | √ |
| 勾选 | hex:01 | 将播放机的唯一标识发送给内容提供商 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"SendUserGUID"=hex:00
```

### 11.9 我希望通过向 Microsoft 发送播放机使用的数据,帮助 Microsoft 提高软件和服务质量

* 选项(Option)-隐私(Privacy)-Windows Media Player 客户体验改善计划(Windows Media Player Customer Experience Improvement Program)-我希望通过向 Microsoft 发送播放机使用的数据,帮助 Microsoft 提高软件和服务质量(I want to help make Microsoft software and services even better by sending Player usage data to Microsoft)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 不勾选 | dword:00000000 | 禁止向 Microsoft 发送播放机使用的数据 | √ |
| 勾选 | dword:00000001 | 向 Microsoft 发送播放机使用的数据 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"UsageTracking"=dword:00000000
```

### 11.10 是否保存历史记录-音乐\图片\视频\播放列表

* 选项(Option)-隐私(Privacy)-历史记录(History)

| 界面操作 | 对用的键 | 对应注册表值 | 作用 | 建议 |
|:---------|:---------|:------------:|:-----|:----:|
| 不勾选"音乐" | DisableMRUMusic | dword:00000000 | 不保存音乐历史记录 | √ |
| 不勾选"图片" | DisableMRUPictures | dword:00000000 | 不保存图片历史记录 | √ |
| 不勾选"视频" | DisableMRUVideo | dword:00000000 | 不保存视频历史记录 | √ |
| 不勾选"播放列表" | DisableMRUPlaylists | dword:00000000 | 不保存播放列表历史记录 | √ |
| 勾选"音乐"  | DisableMRUMusic | dword:00000001 | 保存音乐历史记录 | |
| 勾选"图片" | DisableMRUPictures | dword:00000001 | 保存图片历史记录 | |
| 勾选"视频" | DisableMRUVideo | dword:00000001 | 保存视频历史记录 | |
| 勾选"播放列表" | DisableMRUPlaylists | dword:00000001 | 保存播放列表历史记录 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"DisableMRUMusic"=dword:00000001
"DisableMRUPictures"=dword:00000001
"DisableMRUVideo"=dword:00000001
"DisableMRUPlaylists"=dword:00000001
```

### 11.11 关闭首次打开 WMP 出现的授权窗口(接受用户协议) [组策略方式]

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Media Player-不显示首次使用对话框(Do not Show First Use Dialog Boxes)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | dword:00000001 | 当第一次运行Windows Media Player时,自动接受"我同意",直接进入Windows Media Player播放器 | √ |
| Disabled | dword:00000000 | 当第一次运行Windows Media Player时,显示首次使用对话框 | |
| Not Configured | 删除键值 | 使用非组策略设置项设置 | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer]
"GroupPrivacyAcceptance"=dword:00000001
```

### 11.12 关闭首次打开 WMP 出现的授权窗口(接受用户协议) [非组策略方式]

| 对应注册表值 | 作用 | 建议 |
|:-------------|:-----|:----:|
| dword:00000000 | 当第一次运行Windows Media Player时,自动接受"我同意",直接进入Windows Media Player播放器 | √ |
| dword:00000001 | 当第一次运行Windows Media Player时,显示首次使用对话框 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"FirstRun"=dword:00000000
```

### 11.13 无可视化效果

| 对应注册表值 | 作用 | 建议 |
|:-------------|:-----|:----:|
| dword:00000000 | 不使用可视化效果 | √ |
| dword:00000001 | 使用可视化效果 | |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Preferences]
"ShowEffects"=dword:00000000
```

### 11.14 启用或禁用 WMP 的 DVD 播放功能

| 对应注册表值 | 作用 | 建议 |
|:-------------|:-----|:----:|
| 删除键 | 禁用 WMP 的 DVD 播放功能 | |
| yes | 启用 WMP 的 DVD 播放功能 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Player\Settings]
"EnableDVDUI"="yes"
```

### 11.15 阻止媒体共享

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Media Playe-阻止媒体共享(Prevent Media Sharing)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | dword:00000001 | 阻止媒体共享 | |
| Disabled | dword:00000000 | 允许媒体共享 | |
| Not Configured | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer]
"PreventLibrarySharing"=dword:00000001
```

### 11.16 阻止WMP创建"快速启动"工具栏快捷方式

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Media Playe-阻止创建"快速启动"工具栏快捷方式(Prevent Quick Launch Toolbar Shortcut Create)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | no | 阻止WMP创建"快速启动"工具栏快捷方式 | |
| Disabled | yes | 允许WMP创建"快速启动"工具栏快捷方式 | |
| Not Configured | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer]
"QuickLaunchShortcut"="no"
```

### 11.17 阻止创建桌面快捷方式

* 计算机配置(Computer Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-Windows Media Playe-阻止创建桌面快捷方式(Prevent Desktop Shortcut Create)

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | no | 阻止WMP创建桌面快捷方式 | |
| Disabled | yes | 允许WMP创建桌面快捷方式 | |
| Not Configured | 删除键值 | | |

```
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer]
"DesktopShortcut"="no"
```

### 11.18 阻止电台预置检索

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows Media Player-阻止电台预置检索（Prevent Radio Station Preset Retrieval）

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| Enabled | dword:00000001 | 阻止电台预置检索 | |
| Disabled | dword:00000000 | 允许电台预置检索 | |
| Not Configured | 删除键值 | | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\WindowsMediaPlayer]
"PreventRadioPresetsRetrieval"=dword:00000001
```














## 十二、右键菜单设置（优化或增强）

### 12.1 去掉右键菜单中不常用的菜单

* 新建-BMP 图像(.bmp)

```
[-HKEY_CLASSES_ROOT\.bmp\ShellNew]
```

* 新建-联系人

```
[-HKEY_CLASSES_ROOT\.contact\ShellNew]
```

* 新建-RTF 文档(.rtf)

```
[-HKEY_CLASSES_ROOT\.rtf\ShellNew]
```

* 新建-WinRAR ZIP 压缩文件(.zip)

```
[-HKEY_CLASSES_ROOT\.zip\ShellNew]
[-HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew]
```

* 新建-WinRAR 压缩文件(.rar)

```
[-HKEY_CLASSES_ROOT\.rar\ShellNew]
```

* 去掉N卡相关的菜单

```
[-HKEY_CLASSES_ROOT\Directory\background\shellex\ContextMenuHandlers\NvCplDesktopContext]
```

* 去掉桌面右键菜单Intel核显菜单"英特尔显卡设置"

```
[-HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\igfxcui]
[-HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\igfxDTCM]
```

### 12.2 添加右键菜单项目

* 添加"管理员获得所有权(Grant Admin Full Control)"

```
[HKEY_CLASSES_ROOT\*\shell\grantadmin]
@="管理员获得所有权"
"NoWorkingDirectory"=""
"icon"="%SystemRoot%\\system32\\SHELL32.dll,303"

[HKEY_CLASSES_ROOT\*\shell\grantadmin\command]
@="cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F"
"IsolatedCommand"="cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /grant administrators:F"

[HKEY_CLASSES_ROOT\Directory\shell\grantadmin]
@="管理员获得所有权"
"NoWorkingDirectory"=""
"icon"="%SystemRoot%\\system32\\SHELL32.dll,303"

[HKEY_CLASSES_ROOT\Directory\shell\grantadmin\command]
@="cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t"
"IsolatedCommand"="cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /grant administrators:F /t"
```

* 添加"恢复原始权限"

**注意:** 这是"管理员获得所有权限"的逆操作，还原文件权限。

```
;[HKEY_CLASSES_ROOT\*\shell\ReAuth]
;@="恢复文件权限"
;"NoWorkingDirectory"=""
;"icon"="%SystemRoot%\\system32\\imageres.dll,101"

;[HKEY_CLASSES_ROOT\*\shell\ReAuth\command]
;@="cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /reset && cacls \"%1\" /e /r \"%%USERNAME%%\""
;"IsolatedCommand"="cmd.exe /c takeown /f \"%1\" && icacls \"%1\" /reset && cacls \"%1\" /e /r \"%%USERNAME%%\""

;[HKEY_CLASSES_ROOT\Directory\shell\ReAuth]
;@="恢复文件权限"
;"NoWorkingDirectory"=""
;"icon"="%SystemRoot%\\system32\\imageres.dll,101"

;[HKEY_CLASSES_ROOT\Directory\shell\ReAuth\command]
;@="cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /reset && cacls \"%1\" /e /r \"%%USERNAME%%\""
;"IsolatedCommand"="cmd.exe /c takeown /f \"%1\" /r /d y && icacls \"%1\" /reset && cacls \"%1\" /e /r \"%%USERNAME%%\""
```

* 右键点击任意文件显示的菜单中加入"使用记事本打开(Open With Notepad)"

```
[HKEY_CLASSES_ROOT\*\shell]
@="usenote"

[HKEY_CLASSES_ROOT\*\shell\usenote]
@="使用记事本打开(&W)"
"icon"="%SystemRoot%\\system32\\SHELL32.dll,70"

[HKEY_CLASSES_ROOT\*\shell\usenote\command]
@="notepad.exe \"%1\""
```

* DLL文件的右键菜单添加"注册动态库"

```
[HKEY_CLASSES_ROOT\dllfile\shell\regsvr]
@="注册动态库"

[HKEY_CLASSES_ROOT\dllfile\shell\regsvr\command]
@="regsvr32.exe \"%1\""
```

* DLL文件的右键菜单添加"解除注册动态库"

```
[HKEY_CLASSES_ROOT\dllfile\shell\unregsvr]
@="解除注册动态库"

[HKEY_CLASSES_ROOT\dllfile\shell\unregsvr\command]
@="regsvr32.exe /u \"%1\""
```

* OCX文件的右键菜单添加"注册动态库"

```
[HKEY_CLASSES_ROOT\ocxfile\shell\regsvr]
@="注册动态库"

[HKEY_CLASSES_ROOT\ocxfile\shell\regsvr\Command]
@="regsvr32 %1"
```

* DLL文件的右键菜单添加"解除注册动态库"

```
[HKEY_CLASSES_ROOT\ocxfile\shell\unregsvr]
@="解除注册动态库"

[HKEY_CLASSES_ROOT\ocxfile\shell\unregsvr\Command]
@="regsvr32 /u %1"
```

* 右键点击任意文件显示的菜单中加入"CAB 最大压缩(CAB The Maximum Compression)"

```
[HKEY_CLASSES_ROOT\*\shell\usecabcompress]
@="使用 CAB 最大压缩"

[HKEY_CLASSES_ROOT\*\shell\usecabcompress\command]
@="makecab /v3 /D CompressionType=LZX /D CompressionMemory=21 \"%1\""

[HKEY_CLASSES_ROOT\Directory\shell\usecabcompress]
@="使用 CAB 最大压缩"

[HKEY_CLASSES_ROOT\Directory\shell\usecabcompress\command]
@="makecab /v3 /D CompressionType=LZX /D CompressionMemory=21 \"%1\""

[HKEY_CLASSES_ROOT\Drive\shell\usecabcompress]
@="使用 CAB 最大压缩"

[HKEY_CLASSES_ROOT\Drive\shell\usecabcompress\command]
@="makecab /v3 /D CompressionType=LZX /D CompressionMemory=21 \"%1\""
```

* 在文件夹右键菜单添加"在此处打开CMD"

```
;[HKEY_CLASSES_ROOT\Folder\shell\OpenCMD]
;@="在此处打开CMD"
;"icon"="%windir%\\system32\\cmd.exe,0"

;[HKEY_CLASSES_ROOT\Folder\shell\OpenCMD\Command]
;@="CMD.EXE /K CD %1"
```

* 在文件夹背景右键菜单添加"在此处打开CMD"

```
[HKEY_CLASSES_ROOT\Directory\Background\shell\OpenCMD]
@="在此处打开CMD"
"icon"="%windir%\\system32\\cmd.exe,0"

[HKEY_CLASSES_ROOT\Directory\Background\shell\OpenCMD\command]
@="cmd.exe /s /k pushd \"%V\""
```

* 在文件夹背景右键菜单添加"锁定屏幕"

```
[HKEY_CLASSES_ROOT\Directory\Background\shell\lockpc]
@="锁定屏幕"
"icon"="shell32.dll,47"

[HKEY_CLASSES_ROOT\Directory\Background\shell\lockpc\command]
@="Rundll32 User32.dll,LockWorkStation"
```

* 在桌面右键菜单中添加"锁定屏幕"

```
[HKEY_CLASSES_ROOT\DesktopBackground\Shell\lockpc]
@="锁定屏幕"
"icon"="shell32.dll,47"

[HKEY_CLASSES_ROOT\DesktopBackground\Shell\lockpc\Command]
@="Rundll32 User32.dll,LockWorkStation"
```

* 计算机右键菜单添加"上帝模式(God Mode)"

**注意：** 默认情况下，该注册表项的所有者为SYSTEM，所以无法使用regini命令来修改注册表的权限，Administrators组账号也没有权限修改这个注册表项，需要修改Administrators组的权限为完全控制，才能修改注册表项，所以为了避免导入时报错，注释掉该注册表项。

```
;[HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\godmode]
;@="上帝模式(&G)"
;"icon"="control.exe"

;[HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\godmode\command]
;@="explorer shell:::{ED7BA470-8E54-465E-825C-99712043E01C}"
```

* 计算机右键菜单添加"自动磁盘清理"

**注意：** 需要先设置，命令: cleanmgr /sageset:99，请看1.17小节。

**注意：** 默认情况下，该注册表项的所有者为SYSTEM，所以无法使用regini命令来修改注册表的权限，Administrators组账号也没有权限修改这个注册表项，需要修改Administrators组的权限为完全控制，才能修改注册表项，所以为了避免导入时报错，注释掉该注册表项。

```
;[HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\autoclnmgr]
;@="自动磁盘清理(&U)"
;"icon"="%SystemRoot%\\System32\\cleanmgr.exe,0"

;[HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\autoclnmgr\command]
;@="cleanmgr /sagerun:99"
```

* "新建"中添加注册表项 - Registration Entries(.reg)

```
[HKEY_CLASSES_ROOT\.reg\ShellNew]
"ItemName"="@%SystemRoot%\\system32\\notepad.exe,-470"
"NullFile"=""
```

* "新建"中添加Windows 批处理文件 - Windows Batch File(.bat)

```
[HKEY_CLASSES_ROOT\.bat\ShellNew]
"NullFile"=""
"ItemName"="@%SystemRoot%\\system32\\notepad.exe,-470"
```












## 十三、设置记事本

### 13.1 设置自动换行

* 菜单栏"格式"-自动换行

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 不勾选 | dword:00000000 | 不换行 | |
| 勾选 | dword:00000001 | 一行文字超过记事本的窗口, 自动换行, 多行显示 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Notepad]
"fWrap"=dword:00000001
```

### 13.2 显示或隐藏状态栏

* 菜单栏"查看"-状态栏

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| 不勾选 | dword:00000000 | 隐藏状态栏 | |
| 勾选 | dword:00000001 | 显示状态栏 | √ |

```
[HKEY_CURRENT_USER\Software\Microsoft\Notepad]
"StatusBar"=dword:00000001
```











## 十四、VHD 和 Windows To Go 优化

### 14.1 VHD系统启动时, 阻止动态扩展VHD扩展到完整大小 (Prevent the VHD from expanding to its full size)

**注意:** 该优化对固定VHD硬盘文件大小的系统不起作用.

> MS 技术文档:

> * [Scenario 3: Performing an Advanced Deployment of Native Boot VHD](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-7/gg318055(v=ws.10))

| 对应注册表值 | 作用 | 建议 |
|:-------------|:-----|:----:|
| dword:00000001 | 允许动态扩展 VHD 扩展到完整大小 (默认) | |
| dword:00000004 | 阻止动态扩展 VHD 扩展到完整大小, 而是随着使用的增大而增加 | √ |

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters]
"VirtualDiskExpandOnMount"=dword:00000004
```

### 14.2 关闭应用商店应用程序

* 用户配置(User Configuration)-管理模块(Administrative Templates)-Windows 组件(Windows Components)-应用商店(Store)-关闭应用商店应用程序(Turn off the Store application)

> win8中名为: 允许应用商店在 Windows To Go 工作区上安装应用

| 界面操作 | 对应注册表值 | 作用 | 建议 |
|:---------|:-------------|:-----|:----:|
| "Enabled" | dword:00000001 | 禁用应用商店应用程序 | |
| "Disabled" | dword:00000000 | 启用应用商店应用程序 | √ |
| "Not Configured" | 删除键值 | | |

```
[HKEY_CURRENT_USER\Software\Policies\Microsoft\WindowsStore]
"RemoveWindowsStore"=dword:00000000
```







## TODOs
- [x] 设备
    - [x] 笔和Windows Ink-显示推荐使用的应用
- [ ] 私隐
    - [x] 诊断和反馈-改进墨迹书写和键入识别
    - [x] 诊断和反馈-量身定制的体验
    - [ ] 活动历史记录-允许Windows从此电脑中收集我的活动
    - [ ] 活动历史记录-允许Windows将我的活动从此电脑同步到云
- [ ] 视觉效果
    - [ ] 系统属性-高级-性能设置-视觉效果
- [ ] 网络与共享高级设置
    - [ ] 控制面板-网络和共享中心-更改高级共享设置-专用-网络发现
    - [ ] 控制面板-网络和共享中心-更改高级共享设置-专用-文件和打印共享
    - [ ] 控制面板-网络和共享中心-更改高级共享设置-专用-家庭组连接
    - [ ] 控制面板-网络和共享中心-更改高级共享设置-来宾或公用-网络发现
    - [ ] 控制面板-网络和共享中心-更改高级共享设置-来宾或公用-文件和打印共享
    - [ ] 控制面板-网络和共享中心-更改高级共享设置-所有网络-密码保护的共享
- [ ] Windows设置的个性化设置里有关开始菜单和任务栏的选项
    - [ ] Windows设置-个性化-开始-在“开始”屏幕上显示更多磁贴
    - [ ] Windows设置-个性化-开始-在“开始”菜单中显示应用列表
    - [ ] Windows设置-个性化-开始-显示最近添加的应用
    - [ ] Windows设置-个性化-开始-显示最常用的应用
    - [ ] Windows设置-个性化-开始-使用全屏“开始”屏幕
    - [ ] Windows设置-个性化-开始-选择哪些文件夹显示在“开始”菜单上
    - [ ] Windows设置-个性化-任务栏-在桌面模式下自动隐藏任务栏
          **PS:** 每一部电脑注册表里的值均不相同, 暂时无法通过注册表设置。
- [ ] 右键菜单项设置
    - [ ] 在右键菜单添加以管理员方式打开cmd
    - [x] 在右键菜单添加锁定菜单
    - [x] 在右键菜单添加"恢复文件权限"
    - [x] 在文件夹背景右键菜单添加"在此处打开CMD"
    - [x] 去掉桌面右键菜单Intel核显菜单"英特尔显卡设置"
    - [x] 在桌面右键菜单中添加"锁定屏幕"
