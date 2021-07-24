@echo off
if "%1"=="" goto loop
echo TEST
echo Test%1
copy bit%1.in bit.in >nul
time <enter
bit
time <enter
fc bit%1.out bit.out
pause
del bit.in
del bit.out
goto end
:loop
  for %%i in (0 1 2 3 4 5 6 7 8 9) do call %0 %%i
:end
