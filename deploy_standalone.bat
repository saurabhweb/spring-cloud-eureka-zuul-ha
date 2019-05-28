@echo off

REM **** Get curr dirname in variable CurrentD ****

set DOCLEAN=%1
IF /I "%DOCLEAN%"=="clean" (
    call mvn clean package -f configservice\pom.xml
)

REM call mvn clean package -f configservice\pom.xml
call java -jar configservice\target\configservice-0.0.1-SNAPSHOT.jar