@echo off      
title vrtodox tool /gg/palescale                                                                                                                                                                                       
setlocal
:: User inputs
set /p token="Enter Token: "
set /p serverID="Enter the Discord server ID: "
set /p channelID="Enter the Discord channel ID: "
set /p message="Enter the message you want to send: "
set /p count="How many times do you want to send the message "

:: Loop to send the message the specified number of times
for /l %%x in (1, 1, %count%) do (
    echo Sending message %%x of %count%
    curl -H "Authorization: %token%" -H "Content-Type: application/json" -X POST -d "{\"content\": \"%message%\"}" https://discord.com/api/v9/channels/%channelID%/messages
    timeout /t 1 >nul
)

echo All messages sent.
pause