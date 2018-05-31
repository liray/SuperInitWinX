## SuperInitWinX

该批处理程序的初衷是为了能够简单的把Windows 10中的设置选项在安装好后就自动完成设置，免于手动设置的繁琐，达到自动配置的效果，节省系统初始化配置的时间。

批处理程序分为两大模块：

1. 自动配置模块
2. 手动设置模块

## 自动配置模块

**自动配置执行完后，系统将自动重启。**

自动配置模块包含5个子模块：

| 子模块 | 对应的配置文件 |
|:-------|:---------------|
| 服务设置 | .\cfg\services.ini |
| 任务计划设置 | .\cfg\schedules.ini |
| 注册表设置 | .\reg\readme.md |
| 注册表项提降权设置 | .\reg\grand_control.ini |
| 批处理 | .\Setup.bat |

### 服务设置

这部分的配置已经由批处理实现，只需要修改```.\cfg\services.ini```配置文件，在文本后面添加需要配置的服务，格式如下：

```
[服务名]
status=启动类型
```

例如禁用```Connected User Experiences and Telemetry```服务：

```
[DiagTrack]
status=disabled
```

服务的启动类型可以是以下值：

| 服务启动类型 | 服务启动类型的值 |
|:------------:|:----------------:|
| 自动 | auto |
| 手动 | demand |
| 禁用 | disabled |
| 自动（延迟启动） | delayed-auto |

**请勿禁用以下服务：**

| 服务 | 服务名称 | 简要说明 |
|:-----|:--------:|:---------|
| Cryptographic Services | CryptSvc | 加载服务 |
| DCOM Server Process Launcher | DcomLaunch | DCOM加载服务 |
| DHCP Client | Dhcp | DHCP客户端服务 |
| DNS Client | Dnscache | DNS客服段高速缓存服务 |
| Group Policy client | gpsvc | 组策略服务 |
| Local Session Manager | LSM | 本地会话信息管理服务 |
| Network Store Interface Service | nsi | 网络配置信息服务 |
| Remote Procedure Call | RpcSs | 远程过程调用协议 |
| RPC Endpoint Mapper | RpcEptMapper | 终结点映射服务 |
| Shell Hardware Detection | ShellHWDetection | 硬件探测服务 |
| Superfetch | SysMain | 超级预读取服务 |
| System Event Notification Service | SENS | 系统事件监视服务 |
| Task Scheduler | Schedule | 计划任务服务 |
| User Profile Service | ProfSvc | 用户配置文件服务 |
| WLAN AutoConfig | WlanSvc | 无线局域网配置服务 |
| Windows Audio | Audiosrv | 系统音频服务 |
| Windows Audio Endpoint Builder | AudioEndpointBuilder | 系统音频服务 |

### 任务计划设置

这部分的配置已经由批处理实现，只需要修改```.\cfg\schedules.ini```配置文件，在文本后面添加需要配置的任务计划，格式如下：

```
[服务名]
location=任务计划程序库中的位置+\+任务计划名称
status=任务计划状态
```

比如禁用“\Microsoft\Windows\Application Experience”位置下的“Microsoft Compatibility Appraiser”计划任务：

```
[服务名]
location=\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser
status=disable
```

计划任务的status值：

| 启用或禁用计划任务 | status值 |
|:------------------:|:--------:|
| 启用 | enable |
| 禁用 | disabled |

### 注册表设置

注册表的导入设置文件在```.\reg\readme.md```，只需要把修改的注册表项添加到文件底部即可，其内容跟reg注册表导入文件的内容格式相同即可，批处理会在执行自动导入时转换为Reg文件，再进行导入。

### 注册表项提降权设置

注册表项提降权设置文件为```.\reg\grand_control.ini```，该配置文件是为了使```.\reg\readme.md```文件中无法增删改的注册表项提升权限所用，只需要把注册表项一行行添加到配置文件中即可。

### 批处理

配置文件为```.\Setup.bat```，也是该项目的主程序，负责自动配置模块的所有处理过程，除了执行以上子模块中的配置，批处理中还包含了比如：“去除右键"发送到"多余菜单”、“重建桌面图标缓存”、“电源设置”、“卸载OneDrive”等配置选项，具体可以查看```.\Setup.bat```文件内的注释。

## 手动设置顺序建议

1. 开始菜单-删除不用的App
2. 任务栏-取消或固定应用程序
3. 任务栏属性```Rundll32.exe shell32.dll,Options_RunDLL 1```-自动隐藏任务栏
4. 通知区域图标-启用或关闭系统图标```Rundll32.exe shell32.dll,Options_RunDLL 4```-操作中心
5. 控制面板-电源选项```powercfg.cpl```
6. 控制面板-程序和功能-启用或关闭 windows 功能```OptionalFeatures```
7. Windows设置-网络和Internet-以太网-更改高级共享设置
8. 设置所有文件夹排列方式和查看方式,文件夹选项-查看```Rundll32.exe shell32.dll,Options_RunDLL 7```-"应用到文件夹"按钮
9. 系统属性```sysdm.cpl```-高级```control sysdm.cpl,,3```-性能-视觉效果
10. 系统属性-高级-性能-高级-虚拟内存

### 建议关闭以下视觉效果

| 视觉效果 | 英文名称 |
|:---------|:---------|
| 保存任务栏缩略图预览 |  |
| 窗口内的动画控件和元素 | Animate controls and elements inside windows |
| 淡入淡出或滑动菜单到视图 | Fade or slide menus into view |
| 滑动打开组合框 | Slide open combo boxes |
| 任务栏中的动画 | Animations in the taskbar |
| 在单击后淡出菜单 | Fade out menu items after clicking |
| 在视图中淡入淡出或滑动工具提示 | Fade or slide ToolTips into view |
| 在最大化和最小化时显示窗口动画 | Animate windows when minimizing and maximizing |

### 启用或关闭 Windows 功能

1. 关闭“远程差分压缩(Remote Differential Compression API Support)” 提高文件传输速度启用以下功能:
2. .Net Framework 3.5 (包括 .NET 2.0 和 3.0)

