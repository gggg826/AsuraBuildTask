echo 此窗口自动关闭前禁止人为关闭
echo.
set Client_Path=F:\UnityProject\Commercail\Asura\trunk\Client
"%UNITY_5_5_4_HOME%"\Unity.exe -batchmode -buildTarget Android -projectPath %Client_Path% -executeMethod CommandBuild.ExecuteBuild
exit