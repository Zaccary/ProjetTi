<h2>Gestion des clients</h2>

<a href="index_.php?page=ajout_jeux.php&reset=true"><button class="btn btn-secondary">ajout jeux</button></a><br>


<?php
//récupération des clients et affichage dans table bootstrap
$jeux = new JeuxDB($cnx);
$liste = $jeux->getAllJeux();
//var_dump($liste);
$nbr = count($liste);

if($nbr == 0){
    print "<br>Aucun Jeux<br>";
}
else{
    ?>
    <table class="table table-striped">
        <thead>

        <tr>
            <th scope="col">Id</th>
            <th scope="col">Nom</th>
        </tr>

        </thead>
        <tbody>
        <?php
        for($i=0; $i < $nbr; $i++){
        ?>
        <tr>
            <th><?= $liste[$i]->id_jeux;?></th>
            <td contenteditable="true" id="<?= $liste[$i]->id_jeux;?>" name="nom_jeu"><?= $liste[$i]->nom_jeu;?></td>
            <td contenteditable="true"><img src="public/images/delete.jpg" alt="Effacer" id="delete"></td>
        </tr>
            <?php
        }
        ?>

        </tbody>
    </table>
<?php
}


//affichage des clients existants
