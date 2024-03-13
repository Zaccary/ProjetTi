<?php $dsn = "";
$user = "";
$password = ""; //pour intellij
require_once 'utils/dbPgConnect.php';
require_once 'models/Autoloader.class.php';
Autoloader::register();
$cnx = Connexion::getInstance($dsn, $user, $password);
$catController = new CategorieController($cnx);
$produitsController = new ProduitsController($cnx);
if (empty($_GET) || $_GET['page'] == "accueil") {
    $allCateg = $catController->afficherCategories();
    require "views/accueil.view.php";
} else if ($_GET['page'] == "categorie") {
    $id_cat = $_GET['id_cat'];
    $uneCat = $catController->afficherUneCategorie($_GET['id_cat']);
    $produitsCat = $produitsController->afficherProduitsParCategorie($id_cat);
    require "views/categorie.view.php";
} else if ($_GET['page'] == "detailProduit") {
    $id_produit = $_GET['id_produit'];
    $leProduit = $produitsController->detailproduitDemande($id_produit);
    require "views/detailProduit.view.php";
}