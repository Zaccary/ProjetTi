<?php
$cat = new JeuxDB($cnx);
$liste = $cat->getAllJeux();
$nbr_cat = count($liste);

?>


<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for($i=0; $i < $nbr_cat; $i++){
            ?>
            <div class="col">
                <div class="card shadow-sm">
                    <img class="bd-placeholder-img card-img-top" src="./admin/public/images/<?php print $liste[$i]->image?>" alt="image de <?php print $liste[$i]->nom_jeu?>" width="100%" height="225">
                    <div class="card-body">
                        <p class="card-text">
                            <?php
                            print $liste[$i]->nom_jeu;
                            ?>
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="index_.php?id_jeu=<?php print $liste[$i]->id_jeux;?>&page=jeux_page.php" type="button" class="btn btn-sm btn-outline-secondary" >View</a>
                                <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
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