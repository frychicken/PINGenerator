@echo off
setlocal enableDelayedExpansion
:MAIN
echo Type in name_of_this_program.bat the_number_you_want
echo This program will generate all possible PIN combinations of the amount of number you typed in
echo exapmle: PiGen.bat 4 ---> this program will generate all possible combinations of 4 digits number
echo if "Character was unexpected at this time" is returned, you did not input any number
echo 
Set input=%*
if %input%== ( Character )
set first=0

set i=0
set x=0
set /a b= %input% - 1
set abc=0

:LOOP1
IF %x% ==%b% goto LOOP
set /a x = %x% + 1
echo "0" >> %userprofile%\Desktop\temp3.txt
goto LOOP1 

:LOOP
IF %i% ==%input% goto FIRST2
set /a i = %i% + 1
echo "9" >> %userprofile%\Desktop\temp.txt
goto LOOP

:FIRST2
set "vara="
setlocal enableDelayedExpansion
for /f "usebackq" %%A in ("%userprofile%\Desktop\temp3.txt") do @<nul set /p"=%%A ">>"%userprofile%\Desktop\temp3.txt">>"%userprofile%\Desktop\temp4.txt" echo.
for /f "usebackq" %%a in ("%userprofile%\Desktop\temp4.txt") do (
set vara=!vara!%%a
echo !vara!)

:FIRST1
set "var="
setlocal enableDelayedExpansion
for /f "usebackq" %%A in ("%userprofile%\Desktop\temp.txt") do @<nul set /p"=%%A ">>"%userprofile%\Desktop\temp.txt">>"%userprofile%\Desktop\temp1.txt" echo.
for /f "usebackq" %%a in ("%userprofile%\Desktop\temp1.txt") do (
set var=!var!%%a
echo !var!)
timeout 0 > nul
del %userprofile%\Desktop\temp.txt
del %userprofile%\Desktop\temp1.txt
del %userprofile%\Desktop\temp3.txt
del %userprofile%\Desktop\temp4.txt
timeout 0 > nul

echo You are about to generate !var! numbers in:!var! seconds

set f=1!vara!
set g=0
set st=0
set varaaa=!vara!
set varii=!vara!
:HOWMAN
if %f%==1 goto FIRST
set /a f = %f% / 10
set /a g = %g% + 1
goto HOWMAN

:FIRST
set vari=!vara!
set /a bcd = 1%vari% / 10
set /a bcd = %bcd% - 1
set /a def = 1%vari% / 100
set /a def = %def% - 1
IF %first%==!var! goto SECOND

set abc=%vari%

SET /A first = %first% + 1

set str=%abc%%first%

:TT
set len=0
set strLen=0
call :strLen_Loop str strLen
rem echo String is %strLen% characers long
goto FIRSTT

:strLen_Loop
 if not "!%1:~%len%!"=="" set /A len+=1 & goto strLen_Loop
(endlocal & set %2=%len%)
goto :eof

:HEHEHE
set str=%str:~1%
goto TT

:FIRSTT
set /a de = %strLen% - %input%
if %de% NEQ 0 goto HEHEHE

:COUTI
echo %str% >> "%userprofile%\Desktop\wordlist3.txt"
echo %str% / !var!
rem timeout 0 > nul
cls
goto FIRST


:SECOND
echo %vari% >> "%userprofile%\Desktop\wordlist3.txt"
echo Done!
pause
