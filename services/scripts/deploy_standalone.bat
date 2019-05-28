@echo off

set SERVICE=%1
set INSTANCE=%2
set DOCLEAN=%3

REM ****** Runs the specified SERVICE on a PORT built using specified INSTANCE.
REM ****** gatewayservice[900X], accountservice[910X], customerservice[920X], orderservice[930X]
REM ****** If 3rd param is clean, then runs mvn clean package on the specified service.
REM ****** Uses SERVICE to construct jar file name

set PP=
IF /I "%SERVICE%"=="gatewayservice" (
    set PP=900
)

IF /I "%SERVICE%"=="accountservice" (
    set PP=910
)

IF /I "%SERVICE%"=="customerservice" (
    set PP=920
)

IF /I "%SERVICE%"=="orderservice" (
    set PP=930
)

if [%PP%]==[]  (
    goto :USAGE
) else (
    goto :DORUN
)

:DORUN
set PORT=%PP%%INSTANCE%
echo %PORT%

REM **** Get curr dirname in variable CurrentD ****

REM FOR %%I IN (.) DO SET CurrentD=%%~nI%%~xI

REM echo "%CurrentD%"

IF /I "%DOCLEAN%"=="clean" (
    call mvn clean package -f %SERVICE%\pom.xml
)
REM call mvn clean package -f %SERVICE%\pom.xml
REM uncomment to start in background
REM call START /B "%SERVICE%-%PORT%" java -jar -DPORT=%PORT% %SERVICE%\target\%SERVICE%-0.0.1-SNAPSHOT.jar

@echo on
java -jar -Dservice.port=%PORT% %SERVICE%\target\%SERVICE%-0.0.1-SNAPSHOT.jar

goto :EOF




:USAGE
echo "ERROR: Invalid service name"
echo "-------------------------------------------------------------------------------------"
echo "Usage: services$ scripts\deploy_standalone.bat SVC_NAME INSTANCE_NUM                 "
echo "Where:  									     	   "
echo "  SVC_NAME is one of [gatewayservice, accountservice, customerservice, orderservice] "
echo "  INSTANCE_NUM = an integer 1 to n					    	   "
echo "example: services>scripts\deploy_standalone.bat gatewayservice 1		     	   "
echo "-------------------------------------------------------------------------------------"
goto :EOF