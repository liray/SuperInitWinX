## SuperInitWinX

�����������ĳ�����Ϊ���ܹ��򵥵İ�Windows 10�е�����ѡ���ڰ�װ�ú���Զ�������ã������ֶ����õķ������ﵽ�Զ����õ�Ч������ʡϵͳ��ʼ�����õ�ʱ�䡣

����������Ϊ����ģ�飺

1. �Զ�����ģ��
2. �ֶ�����ģ��

## �Զ�����ģ��

**�Զ�����ִ�����ϵͳ���Զ�������**

�Զ�����ģ�����5����ģ�飺

| ��ģ�� | ��Ӧ�������ļ� |
|:-------|:---------------|
| �������� | .\cfg\services.ini |
| ����ƻ����� | .\cfg\schedules.ini |
| ע������� | .\reg\readme.md |
| ע������ήȨ���� | .\reg\grand_control.ini |
| ������ | .\Setup.bat |

### ��������

�ⲿ�ֵ������Ѿ���������ʵ�֣�ֻ��Ҫ�޸�```.\cfg\services.ini```�����ļ������ı����������Ҫ���õķ��񣬸�ʽ���£�

```
[������]
status=��������
```

�������```Connected User Experiences and Telemetry```����

```
[DiagTrack]
status=disabled
```

������������Ϳ���������ֵ��

| ������������ | �����������͵�ֵ |
|:------------:|:----------------:|
| �Զ� | auto |
| �ֶ� | demand |
| ���� | disabled |
| �Զ����ӳ������� | delayed-auto |

**����������·���**

| ���� | �������� | ��Ҫ˵�� |
|:-----|:--------:|:---------|
| Cryptographic Services | CryptSvc | ���ط��� |
| DCOM Server Process Launcher | DcomLaunch | DCOM���ط��� |
| DHCP Client | Dhcp | DHCP�ͻ��˷��� |
| DNS Client | Dnscache | DNS�ͷ��θ��ٻ������ |
| Group Policy client | gpsvc | ����Է��� |
| Local Session Manager | LSM | ���ػỰ��Ϣ������� |
| Network Store Interface Service | nsi | ����������Ϣ���� |
| Remote Procedure Call | RpcSs | Զ�̹��̵���Э�� |
| RPC Endpoint Mapper | RpcEptMapper | �ս��ӳ����� |
| Shell Hardware Detection | ShellHWDetection | Ӳ��̽����� |
| Superfetch | SysMain | ����Ԥ��ȡ���� |
| System Event Notification Service | SENS | ϵͳ�¼����ӷ��� |
| Task Scheduler | Schedule | �ƻ�������� |
| User Profile Service | ProfSvc | �û������ļ����� |
| WLAN AutoConfig | WlanSvc | ���߾��������÷��� |
| Windows Audio | Audiosrv | ϵͳ��Ƶ���� |
| Windows Audio Endpoint Builder | AudioEndpointBuilder | ϵͳ��Ƶ���� |

### ����ƻ�����

�ⲿ�ֵ������Ѿ���������ʵ�֣�ֻ��Ҫ�޸�```.\cfg\schedules.ini```�����ļ������ı����������Ҫ���õ�����ƻ�����ʽ���£�

```
[������]
location=����ƻ�������е�λ��+\+����ƻ�����
status=����ƻ�״̬
```

������á�\Microsoft\Windows\Application Experience��λ���µġ�Microsoft Compatibility Appraiser���ƻ�����

```
[������]
location=\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser
status=disable
```

�ƻ������statusֵ��

| ���û���üƻ����� | statusֵ |
|:------------------:|:--------:|
| ���� | enable |
| ���� | disabled |

### ע�������

ע���ĵ��������ļ���```.\reg\readme.md```��ֻ��Ҫ���޸ĵ�ע�������ӵ��ļ��ײ����ɣ������ݸ�regע������ļ������ݸ�ʽ��ͬ���ɣ����������ִ���Զ�����ʱת��ΪReg�ļ����ٽ��е��롣

### ע������ήȨ����

ע������ήȨ�����ļ�Ϊ```.\reg\grand_control.ini```���������ļ���Ϊ��ʹ```.\reg\readme.md```�ļ����޷���ɾ�ĵ�ע���������Ȩ�����ã�ֻ��Ҫ��ע�����һ������ӵ������ļ��м��ɡ�

### ������

�����ļ�Ϊ```.\Setup.bat```��Ҳ�Ǹ���Ŀ�������򣬸����Զ�����ģ������д�����̣�����ִ��������ģ���е����ã��������л������˱��磺��ȥ���Ҽ�"���͵�"����˵��������ؽ�����ͼ�껺�桱������Դ���á�����ж��OneDrive��������ѡ�������Բ鿴```.\Setup.bat```�ļ��ڵ�ע�͡�

## �ֶ�����˳����

1. ��ʼ�˵�-ɾ�����õ�App
2. ������-ȡ����̶�Ӧ�ó���
3. ����������```Rundll32.exe shell32.dll,Options_RunDLL 1```-�Զ�����������
4. ֪ͨ����ͼ��-���û�ر�ϵͳͼ��```Rundll32.exe shell32.dll,Options_RunDLL 4```-��������
5. �������-��Դѡ��```powercfg.cpl```
6. �������-����͹���-���û�ر� windows ����```OptionalFeatures```
7. Windows����-�����Internet-��̫��-���ĸ߼���������
8. ���������ļ������з�ʽ�Ͳ鿴��ʽ,�ļ���ѡ��-�鿴```Rundll32.exe shell32.dll,Options_RunDLL 7```-"Ӧ�õ��ļ���"��ť
9. ϵͳ����```sysdm.cpl```-�߼�```control sysdm.cpl,,3```-����-�Ӿ�Ч��
10. ϵͳ����-�߼�-����-�߼�-�����ڴ�

### ����ر������Ӿ�Ч��

| �Ӿ�Ч�� | Ӣ������ |
|:---------|:---------|
| ��������������ͼԤ�� |  |
| �����ڵĶ����ؼ���Ԫ�� | Animate controls and elements inside windows |
| ���뵭���򻬶��˵�����ͼ | Fade or slide menus into view |
| ��������Ͽ� | Slide open combo boxes |
| �������еĶ��� | Animations in the taskbar |
| �ڵ����󵭳��˵� | Fade out menu items after clicking |
| ����ͼ�е��뵭���򻬶�������ʾ | Fade or slide ToolTips into view |
| ����󻯺���С��ʱ��ʾ���ڶ��� | Animate windows when minimizing and maximizing |

### ���û�ر� Windows ����

1. �رա�Զ�̲��ѹ��(Remote Differential Compression API Support)�� ����ļ������ٶ��������¹���:
2. .Net Framework 3.5 (���� .NET 2.0 �� 3.0)

