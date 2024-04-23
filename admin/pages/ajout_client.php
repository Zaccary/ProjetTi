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
        <div class="mb-3">
            <label for="config1" class="form-label">Configuration 1</label>
            <input type="text" class="form-control" id="config1" name="config1">
        </div>
        <div class="mb-3">
            <label for="config2" class="form-label">Configuration 2</label>
            <input type="text" class="form-control" id="config2" name="config2">
        </div>
        <button type="submit" id="texte_bouton_submit" value="Ajouter" class="btn btn-primary">
            Ajouter
        </button>
        <button class="btn btn-primary" type="reset" id="reset">Annuler</button>
    </form>
</div>