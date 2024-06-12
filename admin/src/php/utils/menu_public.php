<?php
if(isset($_SESSION["idPersonne"])){
    $idPersonne=$_SESSION["idPersonne"];
    $Cli = new ClientDB($cnx);
    $Client = $Cli->getClientById($idPersonne);
}
?>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <img src="./admin/public/images/ps5-gamepad-on-hand-logo-FF1463D003-seeklogo.com.png" id="logoSite" alt="logo" width="40" height="40" style="border-radius: 50%;">
        <a class="navbar-brand" id="titreSite" href="#">Jeux2Fou</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index_.php?page=accueil.php">Accueil</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Recherche" aria-label="Search" name="recherche" id="recherche">
                <button class="btn btn-outline-success" type="submit">Recherche</button>
            </form>
            <a href="<?php if(isset($_SESSION["idPersonne"]))
            {
                print "index_.php?page=logout.php";
            }
            else
            {
                print "index_.php?page=login.php";
            }
            ?>" type="button" class="btn btn-outline-secondary"><?php if (isset($_SESSION["idPersonne"]))
            {
               print"Déconnexion";
            } else{
                print "Connexion";
            } ?> </a>
            <?php if(isset($_SESSION["idPersonne"])) {
                print '<img src="./admin/public/images/'.$Client->pp.'" alt="panier" width="40" height="40" style="border-radius: 50%;">';
            }
            ?>
        </div>
    </div>
</nav>
