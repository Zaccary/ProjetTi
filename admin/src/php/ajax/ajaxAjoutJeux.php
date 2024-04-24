
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

//chemin d'accès depuis le fichier ajax php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Jeux.class.php';
require '../classes/JeuxDB.class.php';

$cnx = Connexion::getInstance($dsn,$user,$password);

// Etape 1 : Vérification de la connexion à la base de données
if ($cnx->connect_error) {
    die("Connection failed: " . $cnx->connect_error);
} else {
    echo "Connected successfully";
}

// Etape 2 : Vérification de la requête SQL
// Assurez-vous que la fonction ajout_jeux existe dans votre base de données

// Etape 3 : Vérification des données du formulaire
var_dump($_GET);

$Je = new JeuxDB($cnx);

// Etape 5 : Vérification de la fonction PHP
// Assurez-vous que la fonction ajout_jeux est correctement appelée
$data[] = $Je->ajout_jeux($_GET['nom_jeu'],$_GET['prix'],$_GET['description'],$_GET['image'],$_GET['video'],$_GET['ram_config1'],$_GET['stockage_config1'],$_GET['ram_config2'],$_GET['stockage_config2'],$_GET['processeur_config1'],$_GET['processeur_config2'],$_GET['carte_graphique_config1'],$_GET['carte_graphique_config2'],$_GET['os_config1'],$_GET['os_config2'],$_GET['classification']);
var_dump($data);

print json_encode($data);