#!/bin/bash

# Affichage du nom du créateur en grand caractère
echo "================================================="
echo -e "\e[93m               By Malack_Key\e[0m"
echo "================================================="

# Fonction pour afficher les configurations actuelles du proxy
display_proxy_configurations() {
    echo -e "\e[92mConfiguration actuelle du proxy dans /etc/bash.bashrc :\e[0m"
    echo "---------------------------------"
    grep -E 'http_proxy|https_proxy|ftp_proxy' "/etc/bash.bashrc"
    echo -e "\e[94m####################################################\e[0m"
    echo -e "\e[92mConfiguration actuelle du gestionnaire de paquet apt dans /etc/apt/apt.conf :\e[0m"
    echo "---------------------------------"
    echo "---------------------------------"
    cat "/etc/apt/apt.conf"

}

# Fonction pour ajouter une nouvelle configuration de proxy
add_proxy_configuration() {
    read -p "Entrez l'adresse IP du serveur proxy : " proxy_ip
    read -p "Entrez le port du serveur proxy : " proxy_port

    export http_proxy="http://$proxy_ip:$proxy_port"
    export https_proxy="http://$proxy_ip:$proxy_port"
    export ftp_proxy="http://$proxy_ip:$proxy_port"

    echo "export http_proxy=\"http://$proxy_ip:$proxy_port\"" | sudo tee -a /etc/bash.bashrc
    echo "export ftp_proxy=\"http://$proxy_ip:$proxy_port\"" | sudo tee -a /etc/bash.bashrc
    echo "Acquire::http::Proxy \"http://$proxy_ip:$proxy_port\";" | sudo tee /etc/apt/apt.conf

    echo "La configuration du proxy a été ajoutée."
}

# Fonction pour supprimer la configuration actuelle du proxy
remove_proxy_configuration() {
    sudo sed -i '/http_proxy/d' /etc/bash.bashrc
    sudo sed -i '/https_proxy/d' /etc/bash.bashrc
    sudo sed -i '/ftp_proxy/d' /etc/bash.bashrc
    sudo sed -i '/Acquire::http::Proxy/d' /etc/apt/apt.conf

    unset http_proxy
    unset https_proxy
    unset ftp_proxy

    echo "La configuration du proxy a été supprimée."
}

# Affichage du menu des options avec coloration différente
echo "Menu des options :"
echo -e "1. \e[92mAfficher les configurations proxy existantes\e[0m"
echo -e "2. \e[94mAjouter un nouveau proxy et port\e[0m"
echo -e "3. \e[91mDésactiver ou supprimer les paramètres proxy et port présents\e[0m"
read -p "Choisissez une option : " option

# Traitement de l'option choisie
case $option in
    1)
        display_proxy_configurations
        ;;
    2)
        add_proxy_configuration
        ;;
    3)
        remove_proxy_configuration
        ;;
    *)
        echo "Option invalide. Quitter le script."
        ;;
esac
