<?php
$procoDB = new ProcesseursDB($cnx);
$CGDB = new CarteGraphiqueDB($cnx);
$OSDB = new OSDB($cnx);
$ClassifDB = new ClassificationDB($cnx);
$processeurs = $procoDB->getAllProco();
$cartes_graphiques = $CGDB->getAllCG();
$OSDB = $OSDB->getAllOs();
$ClassifDB = $ClassifDB->getAllClassification();
$id_jeu = null;
if (isset($_GET['reset'])) {
    $_SESSION['id_jeu'] = null;
}
// Démarrer la session si elle n'est pas déjà démarrée
if(isset($_GET['id_jeu'])) {
    $id_jeu = $_GET['id_jeu'];
    // Sauvegarder id_jeu dans la session
    $_SESSION['id_jeu'] = $id_jeu;
} else {
    // Si non, vérifier si le paramètre id_jeu est défini dans la variable de session
    if(isset($_SESSION['id_jeu'])) {
        $id_jeu = $_SESSION['id_jeu'];
    }
}
if($id_jeu){
$cat = new jeuxDB($cnx);
$jeu = $cat->getJeuxById($id_jeu);
}
print $id_jeu;
?>
<div class="container">
    <h2>Ajouter un jeu</h2>
    <form id="form_ajout_jeu" method="post" action="">
        <!-- Champs pour les détails généraux du jeu -->
        <div class="mb-3">
            <label for="nom_jeu" class="form-label">Nom du jeu</label>
            <input type="text" class="form-control" id="nom_jeu" name="nom_jeu" value="<?= $id_jeu ? $jeu->nom_jeu : '' ?>">
        </div>
        <div class="mb-3">
            <label for="prix" class="form-label">Prix</label>
            <input type="number" class="form-control" id="prix" name="prix" value="<?= $id_jeu ? $jeu->prix : '' ?>">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"><?= $id_jeu ? $jeu->description : '' ?></textarea>
        </div>
        <div class="mb-3">
            <label for="classification" class="form-label">Classification</label>
            <select class="form-control" id="classification" name="classification">
                <?php foreach ($ClassifDB as $class): ?>
                    <option value="<?=  $class->pegi ?>" <?= $id_jeu && $jeu->pegi == $class->pegi ? 'selected' : '' ?>><?= $class->pegi ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">image</label>
            <input type="url" class="form-control" id="image" name="image" value="<?= $id_jeu ? $jeu->image : '' ?>">
        </div>
        <div class="mb-3">
            <label for="video" class="form-label">Lien de la vidéo</label>
            <input type="url" class="form-control" id="video" name="video" value="<?= $id_jeu ? $jeu->video : '' ?>">
        </div>

        <!-- -->
        <h2>Configuration minimale</h2>
        <div class="mb-3">
            <label for="processeur_config1" class="form-label">Processeur</label>
            <select class="form-control" id="processeur_config1" name="processeur_config1">
                <?php foreach ($processeurs as $processeur): ?>
                    <option value="<?=  $processeur->nom ?>" <?= $id_jeu && $jeu->nom_processeur_config1 == $processeur->nom ? 'selected' : '' ?>><?= $processeur->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="carte_graphique_config1" class="form-label">Carte graphique</label>
            <select class="form-control" id="carte_graphique_config1" name="carte_graphique_config1">
                <?php foreach ($cartes_graphiques as $carte_graphique): ?>
                    <option value="<?=  $carte_graphique->nom ?>" <?= $id_jeu && $jeu->nom_carte_graphique_config1 == $carte_graphique->nom ? 'selected' : '' ?>><?= $carte_graphique->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="stockage_config1" class="form-label">Stockage (GB)</label>
            <input type="number" class="form-control" id="stockage_config1" name="stockage_config1" value="<?= $id_jeu ? $jeu->stockage_config1 : '' ?>">
        </div>
        <div class="mb-3">
            <label for="ram_config1" class="form-label">RAM (GB)</label>
            <select class="form-control" id="ram_config1" name="ram_config1">
                <option value="2">2</option>
                <option value="4">4</option>
                <option value="8">8</option>
                <option value="16">16</option>
                <option value="32">32</option>
                <option value="64">64</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="os_config1" class="form-label">OS</label>
            <select class="form-control" id="os_config1" name="os_config1">
                <?php foreach ($OSDB as $os): ?>
                    <option value="<?= $os->nom ?>"><?= $os->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <!-- -->
        <h2>Configuration recommandée</h2>
        <div class="mb-3">
            <label for="processeur_config2" class="form-label">Processeur</label>
            <select class="form-control" id="processeur_config2" name="processeur_config2">
                <?php foreach ($processeurs as $processeur): ?>
                    <option value="<?=  $processeur->nom ?>"><?= $processeur->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="carte_graphique_config2" class="form-label">Carte graphique</label>
            <select class="form-control" id="carte_graphique_config2" name="carte_graphique_config2">
                <?php foreach ($cartes_graphiques as $carte_graphique): ?>
                    <option value="<?=  $carte_graphique->nom ?>"><?= $carte_graphique->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="mb-3">
            <label for="stockage_config2" class="form-label">Stockage (GB)</label>
            <input type="number" class="form-control" id="stockage_config2" name="stockage_config2">
        </div>
        <div class="mb-3">
            <label for="ram_config2" class="form-label">RAM (GB)</label>
            <select class="form-control" id="ram_config2" name="ram_config2">
                <option value="2">2</option>
                <option value="4">4</option>
                <option value="8">8</option>
                <option value="16">16</option>
                <option value="32">32</option>
                <option value="64">64</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="os_config2" class="form-label">OS</label>
            <select class="form-control" id="os_config2" name="os_config2">
                <?php foreach ($OSDB as $os): ?>
                    <option value="<?= $os->nom?>"><?= $os->nom ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <!-- Boutons d'envoi et d'annulation -->
        <button type="submit" id="texte_bouton_submit" value="Ajouter" class="btn btn-primary">
            Ajouter
        </button>
        <button class="btn btn-primary" type="reset" id="reset">Annuler</button>
    </form>
</div>
