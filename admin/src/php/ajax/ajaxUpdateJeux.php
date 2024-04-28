<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json');

require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Jeux.class.php';
require '../classes/JeuxDB.class.php';

try {
    $cnx = Connexion::getInstance($dsn,$user,$password);
    echo "Connected successfully";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

var_dump($_GET);

$Je = new JeuxDB($cnx);



$data[] = $Je->update_jeux($_GET['nom_jeu'],$_GET['prix'],$_GET['description'],$_GET['image'],$_GET['video'],$_GET['ram_config1'],$_GET['stockage_config1'],$_GET['ram_config2'],$_GET['stockage_config2'],$_GET['processeur_config1'],$_GET['processeur_config2'],$_GET['carte_graphique_config1'],$_GET['carte_graphique_config2'],$_GET['os_config1'],$_GET['os_config2'],$_GET['pegi'],$_GET['id_jeu']);
var_dump($data);
print json_encode($data);