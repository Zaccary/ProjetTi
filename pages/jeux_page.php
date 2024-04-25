<?php
$cat = new jeuxDB($cnx);
$id_jeu = $_GET['id_jeu'];
$jeu = $cat->getJeuxById($id_jeu);
?>

<div class="container mt-5 jeu-container">
    <div class="row">
        <div class="col-lg-8">
            <div class="video-container">
                <iframe src="<?php print $jeu->video ?>&autoplay=1&controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen width="640" height="360"></iframe>
            </div>
        </div>
        <div class="col-lg-4">
            <h2><?php print $jeu->nom_jeu; ?></h2>
            <h4>Prix : <?php print $jeu->prix; ?> € </h4>
            <img src="./admin/public/images/<?php print $jeu->icon; ?>" alt="<?php print $jeu->pegi; ?>" style="height: 75px; vertical-align: middle;">
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-12">
            <p><?php print $jeu->description; ?></p>
            <h5>Configuration minimale :</h5>
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
        </div>
    </div>
</div>