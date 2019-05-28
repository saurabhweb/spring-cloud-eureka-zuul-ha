
REM **** Get curr dirname in variable CurrentD ****

FOR %%I IN (.) DO SET CurrentD=%%~nI%%~xI

echo "%CurrentD%"


call mvn clean package

call java -jar target\%CurrentD%-0.0.1-SNAPSHOT.jar