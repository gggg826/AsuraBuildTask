echo 此窗口自动关闭前禁止人为关闭
echo.

rem UNITY_5_5_4目录
set "UNITY_5_5_4_HOME=E:\Program Files\Unity5.5.4\Editor"

rem 工程目录
set Client_Path=D:\Asura\trunk\Client
"%UNITY_5_5_4_HOME%"\Unity.exe -batchmode -buildTarget Android -projectPath %Client_Path% -executeMethod CommandBuild.ExecuteBuild
exit