echo �˴����Զ��ر�ǰ��ֹ��Ϊ�ر�
echo.

rem UNITY_5_5_4Ŀ¼
set "UNITY_5_5_4_HOME=E:\Program Files\Unity5.5.4\Editor"

rem ����Ŀ¼
set Client_Path=D:\Asura\trunk\Client
"%UNITY_5_5_4_HOME%"\Unity.exe -batchmode -buildTarget Android -projectPath %Client_Path% -executeMethod CommandBuild.ExecuteBuild
exit