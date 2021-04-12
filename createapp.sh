#!/bin/bash


function getPathInfo(){
    echo "Enter fully qualified path to file"
    read info
    path="$(echo $info | rev | cut -d"/" -f2- | rev)/"
    app=$(echo $info | rev | cut -d"/" -f1 | rev)
    echo "==============================="
    echo "Path to file: $path"
    echo "Name of executable: $app"
    echo "==============================="
}   

function makeAppDir(){
    if [[ -d AppDir ]] 
        then
        rm -rf AppDir 
    fi
    echo "================"
    echo "Making AppDir..."
    echo "================"
    mkdir AppDir    
    mkdir AppDir/usr
    mkdir AppDir/usr/bin
    mkdir AppDir/usr/lib   
    mkdir AppDir/usr/share
    mkdir AppDir/usr/share/applications
    mkdir AppDir/usr/share/icons
    mkdir AppDir/usr/share/icons/hicolor
    mkdir AppDir/usr/share/icons/hicolor/16x16
    mkdir AppDir/usr/share/icons/hicolor/16x16/apps
    mkdir AppDir/usr/share/icons/hicolor/32x32
    mkdir AppDir/usr/share/icons/hicolor/32x32/apps
    mkdir AppDir/usr/share/icons/hicolor/64x64
    mkdir AppDir/usr/share/icons/hicolor/64x64/apps
    mkdir AppDir/usr/share/icons/hicolor/128x128
    mkdir AppDir/usr/share/icons/hicolor/128x128/apps
    mkdir AppDir/usr/share/icons/hicolor/256x256
    mkdir AppDir/usr/share/icons/hicolor/256x256/apps
    mkdir AppDir/usr/share/icons/hicolor/scalable
    mkdir AppDir/usr/share/icons/hicolor/scalable/apps
}

function makeCommonFiles(){
    echo "======================"
    echo "Making common files..."
    echo "======================"
    touch AppDir/$app.png
    touch AppDir/$app.desktop
    cat > AppDir/$app.desktop <<-EOF
		[Desktop Entry] 
		Name=$app
		Exec=$app
		Icon=$app
		Type=Application
		Categories=Science
	EOF
    cp AppDir/$app.desktop AppDir/usr/share/applications
    cp ~/Documents/resources/AppRun AppDir/AppRun    
}

#Begin script
getPathInfo
makeAppDir
makeCommonFiles
