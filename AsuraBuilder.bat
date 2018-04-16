@echo off
cls
color 2f

rem Asura工程Trunk目录
set Client_Path=D:\Asura\trunk\

rem Table目录
set Table_Path=D:\Asura\trunk\Public\

rem Assetbundle目录
set Bundle_Path=D:\Asura\trunk\Client\Assets\StreamingAssets\

rem Apk目录
set BuildApk_Path=D:\Asura\trunk\Client\Build\Asura_ANDROID\

rem FTP目录
set FTP_Path=D:\

REM 强行退出Unity编译器
echo.
echo --------------------------  Try Exit Unity --------------------------------------------
start /wait %~dp0ForceQuitUnity.bat


echo.
echo --------------------------  SVN Cleanup -----------------------------------------------
svn cleanup %Client_Path%

echo.
echo --------------------------  SVN Update ------------------------------------------------
svn update %Client_Path%

echo.
echo --------------------------  SVN Revert ------------------------------------------------
svn revert --recursive %Client_Path%

echo.
echo --------------------------  Sync Table Data -------------------------------------------
cd /d %Table_Path%
start /wait %Table_Path%AysncForClientRun.bat

echo.
echo --------------------------  Start Build AssetBundles ----------------------------------
echo.
echo --------------------------  Please Wait -----------------------------------------------
start /wait %~dp0BuildAssetbundle.bat
echo --------------------------  Build Completed -------------------------------------------


echo.
echo --------------------------  SVN Add ---------------------------------------------------
cd /d %Bundle_Path%
svn add . --force
echo.
echo --------------------------  SVN Commit ------------------------------------------------
svn commit -m "##### Auto build Commit #####" *

xcopy %BuildApk_Path%*.apk %FTP_Path% /c /i /y

pause
