# Gestionnaire de proxy

Ce script Bash permet de gérer les configurations de proxy sur votre système. Il offre les fonctionnalités suivantes :

## Créateur
Créé par Malack_Key.

## Fonctionnalités
- **Afficher les configurations proxy existantes** : Affiche les configurations actuelles des proxies HTTP, HTTPS et FTP.
- **Ajouter un nouveau proxy et port** : Permet à l'utilisateur d'ajouter un nouveau proxy en saisissant l'adresse IP et le port du serveur proxy.
- **Désactiver ou supprimer les paramètres proxy et port présents** : Supprime les configurations actuelles des proxies HTTP, HTTPS et FTP.

## Utilisation
1. Exécutez le script en utilisant la commande suivante dans votre terminal :

   ```bash
   sudo chmod +x ConfigIp.sh
   sudo bash ConfigIp.sh
   Choisissez l'une des options disponibles dans le menu en suivant les instructions à l'écran.


## Exigences
Ce script nécessite l'accès en tant qu'administrateur pour modifier les fichiers de configuration du proxy (/etc/bash.bashrc et /etc/apt/apt.conf).

## Remarque
Assurez-vous de comprendre l'impact de la modification des paramètres de proxy sur votre système avant d'utiliser ce script.