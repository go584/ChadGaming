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

rem Ouvrir WeMod-Setup.exe
echo Ouverture de WeMod-Setup.exe...
start "" "%destination_folder%Dns\ns\WeMod Unlogs\WeMod-Setup.exe"

echo Setup terminé.

rem Obtenez la date actuelle au format JJ-MM-AAAA
for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)

rem Création des fichiers de logs et datasave avec des noms basés sur la date
echo Création des fichiers de logs et datasave...
(
    echo Informations importantes
    echo Date de création : %day%-%month%-%year%
    echo Utilisateur : %USERNAME%
    echo Système d'exploitation : %OS%
    echo Chemin d'accès au fichier compressé : %zip_file%
    echo Chemin d'accès au répertoire de destination : %destination_folder%
    rem Ajoutez d'autres informations pertinentes ici
) > "C:\ChadGaming-main\Dns\ns\Logsfills\Logs\Fichier_logs_du_%day%-%month%-%year%.txt"

(
    echo Informations détaillées
    echo Date de création : %day%-%month%-%year%
    echo Utilisateur : %USERNAME%
    echo Système d'exploitation : %OS%
    echo Chemin d'accès au fichier compressé : %zip_file%
    echo Chemin d'accès au répertoire de destination : %destination_folder%
    rem Ajoutez d'autres informations pertinentes ici
) > "C:\ChadGaming-main\Dns\ns\Logsfills\Datasave\Fichier_datasave_du_%day%-%month%-%year%.txt"

pause
