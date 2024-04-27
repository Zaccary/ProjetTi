$(document).ready(function () {

    $('#texte_bouton_submit').text("Insérer");


    //quand une balise contient des atttributs,
    //cette balise est un tableau
    $("td[id]").click(function () {
        //trim : supprimer les blancs avant et après
        let valeur1 = $.trim($(this).text());
        let id = $(this).attr('id');
        let name = $(this).attr('name');
        console.log(valeur1 + " id = " + id + " name = " + name);
        $(this).blur(function () {
            let valeur2 = $.trim($(this).text());
            if (valeur1 != valeur2) {
                let parametre = "id=" + id + "&name=" + name + "&valeur=" + valeur2;
                let retour = $.ajax({
                    type: 'get',
                    dataType: 'json',
                    data: parametre,
                    url: './src/php/ajax/ajaxUpdateClient.php',
                    success: function (data) {//data = retour du # php
                        console.log(data);
                    }
                })
            }
        })
    })


    $('#texte_bouton_submit').text("Ajouter");

    $('#reset').click(function () {
        $('#texte_bouton_submit').text("Ajouter");
    })


    $('#texte_bouton_submit').click(function (e) { //e = formulaire
        e.preventDefault(); //empêcher l'attribut action de form
        let nom_jeu = $('#nom_jeu').val();
        let prix = $('#prix').val();
        let description = $('#description').val();
        let image = $('#image').val();
        let video = $('#video').val();
        let ram_config1 = $('#ram_config1').val();
        let stockage_config1 = $('#stockage_config1').val();
        let ram_config2 = $('#ram_config2').val();
        let stockage_config2 = $('#stockage_config2').val();
        let processeur_config1 = $('#processeur_config1').val();
        let processeur_config2 = $('#processeur_config2').val();
        let carte_graphique_config1 = $('#carte_graphique_config1').val();
        let carte_graphique_config2 = $('#carte_graphique_config2').val();
        let os_config1 = $('#os_config1').val();
        let os_config2 = $('#os_config2').val();
        let pegi = $('#classification').val();
        let param = 'nom_jeu=' + nom_jeu + '&prix=' + prix + '&description=' + description + '&image=' + image + '&video=' + video + '&ram_config1=' + ram_config1 + '&stockage_config1=' + stockage_config1 + '&ram_config2=' + ram_config2 + '&stockage_config2=' + stockage_config2 + '&processeur_config1=' + processeur_config1 + '&processeur_config2=' + processeur_config2 + '&carte_graphique_config1=' + carte_graphique_config1 + '&carte_graphique_config2=' + carte_graphique_config2 + '&os_config1=' + os_config1 + '&os_config2=' + os_config2 + '&pegi=' + pegi;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxAjoutJeux.php',
            success: function (data) {//data = retour du # php
                console.log(data);
            }
        })
    })

    $('#email').blur(function () {
        let email = $(this).val();
        console.log("email : " + email);
        let parametre = 'email=' + email;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: parametre,
            url: './src/php/ajax/ajaxRechercheClient.php',
            success: function (data) {//data = retour du # php
                console.log(data);

                $('#nom').val(data[0].nom_client);
                $('#prenom').val(data[0].prenom_client);
                $('#adresse').val(data[0].adresse);
                $('#numero').val(data[0].numero);
                $('#texte_bouton_submit').text("Mettre à jour");

                let nom2 = $('#nom').val();
                if (nom2 === '') {
                    $('#texte_bouton_submit').text("Ajouter");
                }

            }
        })
    })


    $('#vie').hide();
    $('#para1').hide();
    $('#deuxieme').hide();
    $('#troisieme').hide();
    $('#quatrieme').hide();
    $('#cinquieme').hide();
    $('#cacher').hide();
    $('#montrer_image').hide();

    $('h1').click(function () {
        $('#vie').show();
        $(this).css('color', 'red');
    })

    $('#vie').mouseover(function () {
        $(this).css({
            'font-weight': 'bold',
            'font-style': 'italic',
            'color': '#0044AA'
        });
        $(this).mouseout(function () {
            $('#para1').show();
        })
    })

    $('#para1').click(function () {
        $('#deuxieme').slideDown('slow');
    })

    $('#para2').click(function () {
        $('#troisieme').fadeIn('slow');
    })

    $('#para3').click(function () {
        $('#quatrieme').fadeIn('fast');
    })

    $('#quatrieme').click(function () {
        $('#cinquieme').fadeIn(5000);
        $('#cacher').show();
    })

    $('#cacher').click(function () {
        $('#montrer_image').fadeIn(2000);
    })

});