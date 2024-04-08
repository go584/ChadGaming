@echo off

rem Spécifiez le chemin d'accès au fichier compressé
set zip_file="C:\ChadGaming-main.zip"
rem Spécifiez le répertoire de destination pour l'extraction
set destination_folder="C:\ChadGaming-main\"

rem Vérifiez si le fichier compressé existe
if not exist %zip_file% (
    echo Le fichier compressé est introuvable.
    pause
    exit /b
)

rem Vérifiez si le répertoire de destination existe déjà
if exist %destination_folder% (
    echo Le répertoire de destination existe déjà.
    pause
    exit /b
)

rem Décompressez le fichier compressé dans le répertoire de destination
echo Décompression en cours...
tar -xf %zip_file% -C %destination_folder%

rem Vérifiez si ChadGaming.exe existe dans le répertoire spécifié
if not exist %destination_folder%ChadGaming.exe (
    echo Le fichier ChadGaming.exe est introuvable.
    pause
    exit /b
)

rem Ouvrir ChadGaming.exe
echo Ouverture de ChadGaming.exe...
start "" "%destination_folder%ChadGaming.exe"

echo Setup terminé.
pause
