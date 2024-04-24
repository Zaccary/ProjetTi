<h2>Ajouter un jeu</h2>
<div class="container">
    <form id="form_ajout_jeu" method="post" action="">
        <div class="mb-3">
            <label for="nom_jeu" class="form-label">Nom du jeu</label>
            <input type="text" class="form-control" id="nom_jeu" name="nom_jeu">
        </div>
        <div class="mb-3">
            <label for="prix" class="form-label">Prix</label>
            <input type="number" class="form-control" id="prix" name="prix">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"></textarea>
        </div>

        <div class="mb-3">
            <label for="image" class="form-label">image</label>
            <input type="url" class="form-control" id="image" name="image">
        </div>
        <div class="mb-3">
            <label for="video" class="form-label">Lien de la vidéo</label>
            <input type="url" class="form-control" id="video" name="video">
        </div>
        <?php
        $procoDB = new ProcesseursDB($cnx);
        $CGDB = new CarteGraphiqueDB($cnx);
        $processeurs = $procoDB->getAllProco();
        $cartes_graphiques = $CGDB->getAllCG();
        //$oss = $jeuxDB->getAllOs();
        ?>



        <div class="mb-3">
            <label for="processeur_config1" class="form-label">Processeur Configuration minimale</label>
            <select class="form-control" id="processeur_config1" name="processeur_config1">
                <?php foreach($processeurs as $processeur): ?>
                    <option value="<?= $processeur->id ?>"><?= $processeur->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="carte_graphique_config1" class="form-label">Carte graphique Configuration minimale</label>
            <select class="form-control" id="carte_graphique_config1" name="carte_graphique_config1">
                <?php foreach($cartes_graphiques as $carte_graphique): ?>
                    <option value="<?= $carte_graphique->id ?>"><?= $carte_graphique->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="processeur_config1" class="form-label">Processeur Configuration recommandée</label>
            <select class="form-control" id="processeur_config1" name="processeur_config1">
                <?php foreach($processeurs as $processeur): ?>
                    <option value="<?= $processeur->id ?>"><?= $processeur->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="carte_graphique_config1" class="form-label">Carte graphique Configuration recommandée</label>
            <select class="form-control" id="carte_graphique_config1" name="carte_graphique_config1">
                <?php foreach($cartes_graphiques as $carte_graphique): ?>
                    <option value="<?= $carte_graphique->id ?>"><?= $carte_graphique->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <button type="submit" id="texte_bouton_submit" value="Ajouter" class="btn btn-primary">
            Ajouter
        </button>
        <button class="btn btn-primary" type="reset" id="reset">Annuler</button>
    </form>
</div>