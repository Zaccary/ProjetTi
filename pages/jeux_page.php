<?php
$cat = new jeuxDB($cnx);
$id_jeu = $_GET['id_jeu'];
$jeu = $cat->getJeuxById($id_jeu);
?>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
    <div class="embed-responsive embed-responsive-16by9">
        <iframe width="560" height="315" src="<?php print $jeu->video ?>&autoplay=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
</div>
        <div class="col-md-6">
            <h2><?php print $jeu->nom_jeu; ?></h2>
            <p><?php print $jeu->description; ?></p>
            <h4>Prix : <?php print $jeu->prix; ?> €</h4>
            <h5>Classification PEGI : <?php print $jeu->pegi; ?></h5>
            <h5>Configuration minimal :</h5>
            <ul>
                <li>RAM : <?php print $jeu->ram_config1; ?> GB</li>
                <li>Stockage : <?php print $jeu->stockage_config1; ?> GB</li>
                <li>Processeur : <?php print $jeu->nom_processeur_config1; ?></li>
                <li>Carte Graphique : <?php print $jeu->nom_carte_graphique_config1; ?></li>
                <li>OS : <?php print $jeu->nom_os_config1; ?></li>
            </ul>
            <h5>Configuration recommandée :</h5>
            <ul>
                <li>RAM : <?php print $jeu->ram_config2; ?> GB</li>
                <li>Stockage : <?php print $jeu->stockage_config2; ?> GB</li>
                <li>Processeur : <?php print $jeu->nom_processeur_config2; ?></li>
                <li>Carte Graphique : <?php print $jeu->nom_carte_graphique_config2; ?></li>
                <li>OS : <?php print $jeu->nom_os_config2; ?></li>
            </ul>
            <button type="button" class="btn btn-primary">Acheter</button>
        </div>
    </div>
</div>