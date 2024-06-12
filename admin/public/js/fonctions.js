$(document).ready(function () {



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
    $('#logoSite').click(    function () {
        width = $(this).width();
        height = $(this).height();
        text= $('#titreSite').text();
        width++;
        height++;
        $(this).css({
            'width': width,
            'height': height,
        });
        setTimeout(() => {
            $(this).css({
                'width':  '40px',
                'height': '40px'
            });
            $('#titreSite').text((width-40)/10+" cps");
            $(this).off('click');
        }, 10000);
    })
});