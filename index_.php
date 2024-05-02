<?php
session_start();
require './admin/src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <title>Demo 2023-2024</title>
    <meta charset="utf-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./admin/public/css/style.css" type="text/css">
    <link rel="stylesheet" href="./admin/public/css/custom.css" type="text/css">
    <script src="./admin/public/js/fonctions.js"></script>
</head>
<body>
<div class="container">
    <header id="header">
    </header>

    <nav id="menu">
        <?php
        if (file_exists('./admin/src/php/utils/menu_public.php')) {
            include './admin/src/php/utils/menu_public.php';
        }
        ?>
    </nav>
    <div id="contenu">
        <?php
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION['page'])) {
            $_SESSION['page'] = './pages/accueil.php';
        }

        if (isset($_GET['page'])) {
            $_SESSION['page'] = 'pages/'.$_GET['page'];
        }
        $current_url = strtok($_SERVER["REQUEST_URI"],'?');
        $url_with_page = $current_url . '?page=' . basename($_SESSION['page']);

        echo '<script>window.history.replaceState({}, document.title, "'.$url_with_page.'");</script>';
        //adaptation du code pour éviter que l'acceuil ne se charge pas correctement quand on retourne en arrière
        if (file_exists($_SESSION['page'])) {
            include $_SESSION['page'];
        } else {
            include './pages/page404.php';
        }
        ?>
    </div>

    <footer id="footer">&nbsp;</footer>
</div>
</body>

</html>
