# This script follows the LOVE distribution guidelines:
# https://love2d.org/wiki/Game_Distribution

Remove-Item ./build/ -Recurse
mkdir ./build/

echo "Creating .love file ..."
Compress-Archive -Path * -DestinationPath ./build/sokoban.zip
Move-Item ./build/sokoban.zip ./build/sokoban.love

echo "Copying Love dependencies ..."
cp ($env:LOVEPATH + "\love.exe") ./build/
cp ($env:LOVEPATH + "\*.dll") ./build/
cp ($env:LOVEPATH + "\license.txt") ./build/

echo "Fusing build ..."
cd ./build/
cmd /c copy /b love.exe+sokoban.love sokoban.exe
cd ../

echo "Build finished."
