@echo off
echo Installing....
timeout 1 /nobreak > nul
pip install praw
pip install discord
pip install discord-py-slash-commmand
pip install pickle
pip install requests
cls
echo Complete! Press any key to exit
pause > nul
exit /b
