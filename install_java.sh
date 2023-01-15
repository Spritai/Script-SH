#!/bin/bash

echo "Bienvenue dans le script d'installation automatique de Java"
echo "Quelle version de Java souhaitez-vous installer?"
echo "1) Java 8"
echo "2) Java 11"
echo "3) Java 14"

read -p "Saisissez votre choix: " choice

case $choice in
    1)
        version=8
        ;;
    2)
        version=11
        ;;
    3)
        version=14
        ;;
    *)
        echo "Choix non valide, veuillez réessayer."
        exit 1
        ;;
esac

# Téléchargement et installation de Java
if [ "$(uname)" == "Darwin" ]; then
    # MacOS
    echo "Téléchargement de Java pour MacOS"
    curl -L -o jdk.dmg "https://download.oracle.com/otn-pub/java/jdk/8u291-b08/jdk-8u291-macosx-x64.dmg"
    echo "Installation de Java pour MacOS"
    sudo hdiutil attach jdk.dmg
    sudo installer -pkg "/Volumes/JDK 8 Update 291/JDK 8 Update 291.pkg" -target "/"
    rm jdk.dmg
elif [ "$(uname)" == "Linux" ]; then
    # Linux
    echo "Téléchargement de Java pour Linux"
    curl -L -o jdk.tar.gz "https://download.oracle.com/otn-pub/java/jdk/8u291-b08/jdk-8u291-linux-x64.tar.gz"
    echo "Installation de Java pour Linux"
    tar xvf jdk.tar.gz -C /usr/local
    rm jdk.tar.gz
else
    echo "OS non pris en charge"
    exit 1
fi

# Configuration des variables d'environnement
echo "Configuration des variables d'environnement"
echo "export JAVA_HOME=/usr/local/jdk1.$version.0_291" >> ~/.bash_profile
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bash_profile
source ~/.bash_profile

echo "Java $version a été installé avec succès!"
