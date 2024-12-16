@echo off
:: Simulating suspicious file creation and deletion
for /L %%x in (1, 1, 5) do (
    echo Creating file %%x > testfile%%x.txt
    timeout /t 1 >nul
    del testfile%%x.txt
)

:: Simulating the opening of multiple processes (harmless)
start notepad.exe
start calc.exe
start mspaint.exe

:: Creating dummy registry key (no actual harm)
reg add "HKCU\Software\TestKey" /v "TestValue" /t REG_SZ /d "TestData" /f

:: Creating and deleting a folder
mkdir C:\TestFolder
timeout /t 2 >nul
rmdir /s /q C:\TestFolder

:: Endless loop to simulate resource hogging (this won't cause any harm but can be suspicious)
:loop
echo Looping...
goto loop
