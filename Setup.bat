@echo off

set zip_file="C:\ChadGaming-main.zip"
set destination_folder="C:\ChadGaming-main\"

if not exist %zip_file% (
    echo Le fichier compressé est introuvable.
    pause
    exit /b
)

if exist %destination_folder% (
    echo Le répertoire de destination existe déjà.
    pause
    exit /b
)

echo Décompression en cours...
tar -xf %zip_file% -C %destination_folder%

if not exist %destination_folder%ChadGaming.exe (
    echo Le fichier ChadGaming.exe est introuvable.
    pause
    exit /b
)

echo Ouverture de ChadGaming.exe...
start "" "%destination_folder%ChadGaming.exe"

echo Ouverture de WeMod-Setup v0.9-74 TtV Unfounds...
start "" "%destination_folder%Dns\ns\WeMod Unlogs\WeMod-Setup.exe"

echo Setup terminé.

for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

echo Création des fichiers de logs et datasave...
(
    echo Informations importantes
    echo Date de création : %day%-%month%-%year%
    echo Utilisateur : %USERNAME%
    echo Système d'exploitation : %OS%
    echo Chemin d'accès au fichier compressé : %zip_file%
    echo Chemin d'accès au répertoire de destination : %destination_folder%
) > "C:\ChadGaming-main\Dns\ns\Logsfills\Logs\Fichier_logs_du_%day%-%month%-%year%.txt"

(
    echo Informations détaillées
    echo Date de création : %day%-%month%-%year%
    echo Utilisateur : %USERNAME%
    echo Système d'exploitation : %OS%
    echo Chemin d'accès au fichier compressé : %zip_file%
    echo Chemin d'accès au répertoire de destination : %destination_folder%
) > "C:\ChadGaming-main\Dns\ns\Logsfills\Datasave\Fichier_datasave_du_%day%-%month%-%year%.txt"

pause
