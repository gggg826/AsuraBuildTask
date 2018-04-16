@echo off
cls
color 2f

rem Asura工程Trunk目录
set Client_Path=D:\Asura\trunk\

rem Table目录
set Table_Path=%Client_Path%Public\

rem Assetbundle目录
set Bundle_Path=%Client_Path%Client\Assets\StreamingAssets

rem UNITY_5_5_4目录
set "UNITY_5_5_4_HOME=E:\Program Files\Unity5.5.4f1\Editor"

REM 强行退出Unity编译器
echo.
echo --------------------------  Try Exit Unity --------------------------------------------
start /wait %~dp0ForceQuitUnity.bat


echo.
echo --------------------------  SVN Update ------------------------------------------------
svn update %Client_Path%

echo.
echo --------------------------  SVN Revert ------------------------------------------------
svn revert --recursive %Client_Path%

echo.
echo --------------------------  Sync Table Data -------------------------------------------
cd %Table_Path%
start /wait %~dp0AysncForClientRun.bat

echo.
echo --------------------------  Start Build AssetBundles ----------------------------------
echo.
echo --------------------------  Please Wait -----------------------------------------------
cd %0
start /wait %~dp0BuildAssetbundle.bat
echo --------------------------  Build Completed -------------------------------------------


echo.
echo --------------------------  SVN Add ---------------------------------------------------
cd %Bundle_Path%
svn add
echo.
echo --------------------------  SVN Commit ------------------------------------------------
svn Commit -m "##### Auto build Commit #####"

pause
