@echo off
echo Installing....
timeout /t 1 /nobreak > nul
pip install praw > nul
pip install discord > nul
pip install discord-py-slash-commmand > nul
pip install pickle > nul
pip install requests > nul
cls
echo Complete! Press any key to exit
pause > nul
exit /b
