<?php
//toujours vérifier la qualité d'admin
require 'src/php/utils/verifier_connexion.php';
$cat = new JeuxDB($cnx);
$liste = $cat->getAllJeux();
if(isset($_GET['recherche'])) {
    $liste = recherche($liste, $_GET['recherche']);
}
$nbr_cat = count($liste);

if(isset($_GET['id_jeu'])) {
    // Si oui, enregistrer le paramètre id_jeu dans une variable de session
    $_SESSION['id_jeu'] = $_GET['id_jeu'];
}
?>
<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for($i=0; $i < $nbr_cat; $i++){
                ?>
                <div class="col">
                    <div class="card shadow-sm">
                        <img class="bd-placeholder-img card-img-top" src="./public/images/<?php print $liste[$i]->image?>" alt="image de <?php print $liste[$i]->nom_jeu?>" width="100%" height="225">
                        <div class="card-body">
                            <p class="card-text">
                                <?php
                                print $liste[$i]->nom_jeu;
                                ?>
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="index_.php?id_jeu=<?php echo $liste[$i]->id_jeux; ?>&page=ajout_jeux.php" type="button" class="btn btn-sm btn-outline-secondary" value>Modifier</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</div>
<?php
//cree 2 fonction pour trier les jeux par prix et par nom
//fonction pour trier les jeux par prix
function trierJeuxParPrix($liste){
    $listeJeux = $liste;
    $listePrix = array();
    foreach($listeJeux as $jeu){
        $listePrix[] = $jeu->prix;
    }
    array_multisort($listePrix, SORT_ASC, $listeJeux);
    return $listeJeux;
}
//fonction pour trier les jeux par nom
function trierJeuxParNom($liste){
    $listeJeux = $liste;
    $listeNom = array();
    foreach($listeJeux as $jeu){
        $listeNom[] = $jeu->nom_jeu;
    }
    array_multisort($listeNom, SORT_ASC, $listeJeux);
    return $listeJeux;
}
function recherche($liste, $recherche){
    $listeJeux = $liste;
    $recherche = strtolower($recherche);
    $listeRecherche = array();
    foreach($listeJeux as $jeu){
        if(strpos(strtolower($jeu->nom_jeu), $recherche) !== false){
            $listeRecherche[] = $jeu;
        }
    }
    return $listeRecherche;
}
?>
