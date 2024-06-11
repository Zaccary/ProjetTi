$(document).ready(function () {



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



    $('#reset').click(function () {
        $('#texte_bouton_submit').text("Ajouter");
    })

    $('body').on('click', '#text_button_supp', function (e) {
        e.preventDefault();
        let id_jeu = $(this).val();
        console.log(id_jeu+" id_jeu");
        let param = 'id_jeu=' + id_jeu;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxSuppJeux.php',
            success: function (data) {
                console.log(data);
            }
        });
    });
    $('#texte_bouton_submit').click(function (e) { //e = formulaire
        e.preventDefault(); //empêcher l'attribut action de form
        let id_jeu = $('#id_jeu').val();
        let typeDeSubmit = $('#texte_bouton_submit').val();
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
        let urll; // Declare urll here
        if (typeDeSubmit === "Ajouter") {
            urll = './src/php/ajax/ajaxAjoutJeux.php';
        }
        else {
            urll = './src/php/ajax/ajaxUpdateJeux.php';
        }
        console.log(id_jeu)
        let param = 'nom_jeu=' + nom_jeu + '&prix=' + prix + '&description=' + description + '&image=' + image + '&video=' + video + '&ram_config1=' + ram_config1 + '&stockage_config1=' + stockage_config1 + '&ram_config2=' + ram_config2 + '&stockage_config2=' + stockage_config2 + '&processeur_config1=' + processeur_config1 + '&processeur_config2=' + processeur_config2 + '&carte_graphique_config1=' + carte_graphique_config1 + '&carte_graphique_config2=' + carte_graphique_config2 + '&os_config1=' + os_config1 + '&os_config2=' + os_config2 + '&pegi=' + pegi+'&id_jeu='+id_jeu;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: urll,
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


    $('#configMin').hide();
    $('#configtit1').hide();
    $('#configtit2').hide();
    $('#configRec').hide();
    $('#config').click(function () {
        $('#configtit1').show();
        $('#configtit2').show();
        $('#config').hide();
    })
    $('#configtit1').click(function () {
        $('#configMin').show();
    })
    $('#configtit2').click(function () {
        $('#configRec').show();
    })
    $('#ram1').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#stock1').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#proco1').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#cg1').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#os1').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#ram2').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#stock2').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#proco2').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#cg2').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })
    $('#os2').mouseover(function () {
        $(this).css({
            'font-style': 'italic',
        });
        $(this).mouseout(function () {
            $(this).css({
                'font-style': 'normal',
            });
        })
    })

});