<?php
header('Content-Type: application/json');
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Jeux.class.php';
require '../classes/JeuxDB.class.php';

$cnx = Connexion::getInstance($dsn, $user, $password);
$je = new JeuxDB($cnx);
$id_jeu = $_GET['id_jeu'];


$je->supp_jeux($id_jeu);