<?php ob_start(); ?> <h3>Les produits de nos commerces</h3>
    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4"> <?php foreach ($allCateg as $cat) { ?>
                    <div class="col">
                        <div class="card shadow-sm">
                            <div class="card-body"><p class="card-text"><?= $cat->nom_categorie; ?>
                                    (<?= $cat->id_categorie; ?>)</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group"><a type="button" class="btn btn-sm btn-outline-secondary"
                                                              href="index_.php?page=categorie&id_cat=<?= $cat->id_categorie; ?>">Plus
                                            d'info</a></div>
                                </div>
                            </div>
                        </div>
                    </div> <?php }

                ?> </div>
        </div>
    </div> <?php $content = ob_get_clean();
require('template.php');