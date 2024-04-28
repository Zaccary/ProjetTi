<?php

class JeuxDB extends Jeux
{

    private $_bd;
    private $_array = array();
    private $_jeu;

    public function __construct($cnx)
    {
        $this->_bd = $cnx;
    }

    public function getJeuxById($id_jeu)
{
    $query = "select * from vue_jeux_config";
    $query.= " where id_jeux = :id_jeu";
    try {
        //renvoie qu'un seul jeu
        $this->_bd->beginTransaction();
        $resultset = $this->_bd->prepare($query);
        $resultset->bindValue(':id_jeu', $id_jeu);
        $resultset->execute();
        $data = $resultset->fetch();
        $this->_jeu = new Jeux($data);
        $this->_bd->commit();
        return $this->_jeu; // retourne l'instance de Jeux
    } catch (PDOException $e) {
        $this->_bd->rollback();
        print "Echec de la requête " . $e->getMessage();
    }
}

    public function getAllJeux()
    {
        $query = "select * from vue_jeux_config";
        try {
            $this->_bd->beginTransaction();
            $resultset = $this->_bd->prepare($query);;
            $resultset->execute();
            $data = $resultset->fetchAll();
            //var_dump($data);
            foreach ($data as $d) {
                $_array[] = new Jeux($d);
            }
            $this->_bd->commit();
            return $_array;
        } catch (PDOException $e) {
            $this->_bd->rollback();
            print "Echec de la requête " . $e->getMessage();
        }
    }
    function ajout_jeux($nom_jeu, $prix, $description, $image, $video, $ram_config1, $stockage_config1, $ram_config2, $stockage_config2, $processeur_config1, $processeur_config2, $carte_graphique_config1, $carte_graphique_config2, $os_config1, $os_config2, $pegi){
        try{
            $query="select ajout_jeux(:nom_jeu,:prix,:description,:image,:video,:ram_config1,:stockage_config1,:ram_config2,:stockage_config2,:processeur_config1,:processeur_config2,:carte_graphique_config1,:carte_graphique_config2,:os_config1,:os_config2,:pegi)";
            $res = $this->_bd->prepare($query);
            $res->bindValue(':nom_jeu',$nom_jeu);
            $res->bindValue(':prix',$prix);
            $res->bindValue(':description',$description);
            $res->bindValue(':image',$image);
            $res->bindValue(':video',$video);
            $res->bindValue(':ram_config1',$ram_config1);
            $res->bindValue(':stockage_config1',$stockage_config1);
            $res->bindValue(':ram_config2',$ram_config2);
            $res->bindValue(':stockage_config2',$stockage_config2);
            $res->bindValue(':processeur_config1',$processeur_config1);
            $res->bindValue(':processeur_config2',$processeur_config2);
            $res->bindValue(':carte_graphique_config1',$carte_graphique_config1);
            $res->bindValue(':carte_graphique_config2',$carte_graphique_config2);
            $res->bindValue(':os_config1',$os_config1);
            $res->bindValue(':os_config2',$os_config2);
            $res->bindValue(':pegi',$pegi);
            $res->execute();
            $data = $res->fetch();
            return $data;
        }catch(PDOException $e){
            print "Echec ".$e->getMessage();
        }
    }
    function update_jeux($nom_jeu, $prix, $description, $image, $video, $ram_config1, $stockage_config1, $ram_config2, $stockage_config2, $processeur_config1, $processeur_config2, $carte_graphique_config1, $carte_graphique_config2, $os_config1, $os_config2, $pegi, $id_jeu){
        try{
            $query="select update_jeux(:nom_jeu,:prix,:description,:image,:video,:ram_config1,:stockage_config1,:ram_config2,:stockage_config2,:processeur_config1,:processeur_config2,:carte_graphique_config1,:carte_graphique_config2,:os_config1,:os_config2,:pegi,:id_jeu)";
            $res = $this->_bd->prepare($query);
            $res->bindValue(':nom_jeu',$nom_jeu);
            $res->bindValue(':prix',$prix);
            $res->bindValue(':description',$description);
            $res->bindValue(':image',$image);
            $res->bindValue(':video',$video);
            $res->bindValue(':ram_config1',$ram_config1);
            $res->bindValue(':stockage_config1',$stockage_config1);
            $res->bindValue(':ram_config2',$ram_config2);
            $res->bindValue(':stockage_config2',$stockage_config2);
            $res->bindValue(':processeur_config1',$processeur_config1);
            $res->bindValue(':processeur_config2',$processeur_config2);
            $res->bindValue(':carte_graphique_config1',$carte_graphique_config1);
            $res->bindValue(':carte_graphique_config2',$carte_graphique_config2);
            $res->bindValue(':os_config1',$os_config1);
            $res->bindValue(':os_config2',$os_config2);
            $res->bindValue(':pegi',$pegi);
            $res->bindValue(':id_jeu',$id_jeu);
            $res->execute();
            $data = $res->fetch();
            return $data;
        }catch(PDOException $e){
            print "Echec ".$e->getMessage();
        }
    }

}
